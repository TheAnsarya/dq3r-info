;==============================================================================
; Dragon Quest III - Bank $3C
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $DE0000-$DE7FFF
; Instructions: 11216
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_3C"

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_000
; Address: $DE8000
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_000:
	ROL $4E11,X		  ; 3E 11 4E | Rotate left (absolute,X)
	ORA $2D92			; 0D 92 2D | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $01			  ; 26 01 | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_001
; Address: $DE8015
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_001:
	JSR $600F			; 20 0F 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $0120			; 0E 20 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY $00			  ; A4 00 | Load from zero page into Y register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_002
; Address: $DE8029
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_002:
	BPL $22			  ; 10 22 | Branch if positive
	CPY #$14			 ; C0 14 | Compare Y register (immediate)
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_003
; Address: $DE8032
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_003:
	JSR $5800			; 20 00 58 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	STY $F400			; 8C 00 F4 | Store Y register to absolute address
	BPL $98			  ; 10 98 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_004
; Address: $DE8048
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_004:
	LSR $8BD0			; 4E D0 8B | Logical shift right (absolute)
	BMI $F7			  ; 30 F7 | Branch if negative
	STX $DE			  ; 86 DE | Store X register to zero page
	BPL $08			  ; 10 08 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_006
; Address: $DE8055
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_006:
	PLA				  ; 68 | Pull accumulator from stack
	BMI $00			  ; 30 00 | Branch if negative
	BVS $06			  ; 70 06 | Branch if overflow set
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BPL $70			  ; 10 70 | Branch if positive
	BIT $00FC			; 2C FC 00 | Test bits in accumulator (absolute)
	CPX #$52			 ; E0 52 | Compare X register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $6A			  ; B0 6A | Branch if carry set
	BCC $EC			  ; 90 EC | Branch if carry clear
	BMI $98			  ; 30 98 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_007
; Address: $DE8073
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_007:
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_008
; Address: $DE807A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_008:
	BEQ $04			  ; F0 04 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	BCS $E0			  ; B0 E0 | Game work RAM access
	ORA $013F,X		  ; 1D 3F 01 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_009
; Address: $DE8085
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_009:
	JSR $6D9F			; 20 9F 6D | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDX $9F27,Y		  ; BE 27 9F | Load from absolute,Y into X register
	BRA $00			  ; 80 00 | Branch always
	CPX $2C40			; EC 40 2C | Compare X register (absolute)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_00A
; Address: $DE80A0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_00A:
	ROR $4E11,X		  ; 7E 11 4E | Rotate right (absolute,X)
	LDA $6F12			; AD 12 6F | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $1017,Y		  ; 19 17 10 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_00B
; Address: $DE80B5
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_00B:
	JSR $400F			; 20 0F 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	STZ $F600			; 9C 00 F6 | Store zero to absolute
	ROR $8B90			; 6E 90 8B | Rotate right (absolute)
	BMI $F7			  ; 30 F7 | Branch if negative
	STX $DE			  ; 86 DE | Store X register to zero page
	BPL $08			  ; 10 08 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	BVS $06			  ; 70 06 | Branch if overflow set
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BPL $70			  ; 10 70 | Branch if positive
	BIT $00FC			; 2C FC 00 | Test bits in accumulator (absolute)
	CPX #$92			 ; E0 92 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_00C
; Address: $DE80E9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_00C:
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PEA #$C8A0		   ; F4 A0 C8 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_00D
; Address: $DE80F0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_00D:
	JSR $0060			; 20 60 00 | Jump to subroutine
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	JMP $7B27			; 4C 27 7B | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $2F			  ; 10 2F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_00F
; Address: $DE8115
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_00F:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $08			  ; 30 08 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ORA #$25			 ; 09 25 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BPL $15			  ; 10 15 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $040F			; 0D 0F 04 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $44			  ; 80 44 | Branch always
	CPY #$8A			 ; C0 8A | Compare Y register (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLV				  ; B8 | Clear overflow flag
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_010
; Address: $DE8154
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_010:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BPL $80			  ; 10 80 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	BRA $34			  ; 80 34 | Branch always
	DEC				  ; 3A | Decrement accumulator
	BPL $74			  ; 10 74 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY $80			  ; C4 80 | Compare Y register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_011
; Address: $DE816E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_011:
	SEI				  ; 78 | Set interrupt disable flag
	BRA $10			  ; 80 10 | Branch always
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	BRA $B8			  ; 80 B8 | Branch always
	BRA $3C			  ; 80 3C | Branch always
	BRA $3C			  ; 80 3C | Branch always
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	ORA $3616,Y		  ; 19 16 36 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_012
; Address: $DE8185
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_012:
	ORA ($54,X)		  ; 01 54 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $2D			  ; 10 2D | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_013
; Address: $DE8192
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_013:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	DEC				  ; 3A | Decrement accumulator
	BPL $74			  ; 10 74 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY $80			  ; C4 80 | Compare Y register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	RTI				  ; 40 | Return from interrupt
	CPY #$42			 ; C0 42 | Hardware register operation
	CPX #$A4			 ; E0 A4 | Compare X register (immediate)
	BVS $B8			  ; 70 B8 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BPL $D4			  ; 10 D4 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	BRA $B8			  ; 80 B8 | Branch always
	BRA $3C			  ; 80 3C | Branch always
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_014
; Address: $DE81DD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_014:
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $1F07			; 0E 07 1F | Arithmetic shift left (absolute)
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_015
; Address: $DE81F8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_015:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 5E B7 6D | Load from absolute long,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $44			  ; 05 44 | Logical OR with accumulator (zero page)
	EOR ($EE,X)		  ; 41 EE | Exclusive OR with accumulator ((zero page,X))
	CMP $0DAF			; CD AF 0D | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_016
; Address: $DE820F
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_016:
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LSR $6500,X		  ; 5E 00 65 | Logical shift right (absolute,X)
	BPL $11			  ; 10 11 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	AND $5DDC,Y		  ; 39 DC 5D | Logical AND with accumulator (absolute,Y)
	EOR $6E2E,X		  ; 5D 2E 6E | Exclusive OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	ROR $26			  ; 66 26 | Rotate right (zero page)
	BMI $10			  ; 30 10 | Branch if negative
	AND $1F08,Y		  ; 39 08 1F | Logical AND with accumulator (absolute,Y)
	ORA $0702			; 0D 02 07 | Logical OR with accumulator (absolute)
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $0606			; 0E 06 06 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $40			  ; B0 40 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	BVS $04			  ; 70 04 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $FCF8			; EC F8 FC | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INC $DDB6			; EE B6 DD | Increment (absolute)
	LDA $8EAF			; AD AF 8E | Load from absolute address into accumulator
	CLV				  ; B8 | Clear overflow flag
	BVS $ED			  ; 70 ED | Branch if overflow set
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $A0			  ; 06 A0 | Arithmetic shift left (zero page)
	STX $965E			; 8E 5E 96 | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	BEQ $F2			  ; F0 F2 | Branch if equal
	ASL $06FF			; 0E FF 06 | Arithmetic shift left (absolute)
	ROR $60			  ; 66 60 | Rotate right (zero page)
	INC $8CFC,X		  ; FE FC 8C | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_019
; Address: $DE829C
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_019:
	JSR $0020			; 20 20 00 | Jump to subroutine
	LDA				  ; BF 5E B7 6D | Load from absolute long,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $C4			  ; 05 C4 | Logical OR with accumulator (zero page)
	CMP ($AE,X)		  ; C1 AE | Compare accumulator ((zero page,X))
	ORA $0DAF			; 0D AF 0D | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $6500,X		  ; 5E 00 65 | Logical shift right (absolute,X)
	BPL $11			  ; 10 11 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	ADC $5D1C,Y		  ; 79 1C 5D | Add with carry (absolute,Y)
	EOR $2E0E,X		  ; 5D 0E 2E | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ROR $26			  ; 66 26 | Rotate right (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $063F,Y		  ; 19 3F 06 | Logical OR with accumulator (absolute,Y)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CPX $FCF8			; EC F8 FC | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $DAB4			; EC B4 DA | Compare X register (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $FF8C			; AD 8C FF | Load from absolute address into accumulator
	LDX $72F7,Y		  ; BE F7 72 | Load from absolute,Y into X register
	SBC $00E4			; ED E4 00 | Subtract with carry (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$0E			 ; A0 0E | Load immediate value into Y register
	STY $965E			; 8C 5E 96 | Store Y register to absolute address
	ROL $7AB6,X		  ; 3E B6 7A | Rotate left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	BEQ $F2			  ; F0 F2 | Branch if equal
	ORA $FF0C,X		  ; 1D 0C FF | Logical OR with accumulator (absolute,X)
	ASL $66			  ; 06 66 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_01A
; Address: $DE8306
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_01A:
	INC $0CFC,X		  ; FE FC 0C | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STZ $F810			; 9C 10 F8 | Store zero to absolute
	BCS $40			  ; B0 40 | Branch if carry set
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_01D
; Address: $DE8338
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_01D:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ROL $7C1E,X		  ; 3E 1E 7C | Rotate left (absolute,X)
	AND $43DE			; 2D DE 43 | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	EOR #$DF			 ; 49 DF | Exclusive OR with accumulator (immediate)
	ASL $1859,X		  ; 1E 59 18 | Arithmetic shift left (absolute,X)
	EOR ($11),Y		  ; 51 11 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BIT $4020			; 2C 20 40 | Test bits in accumulator (absolute)
	JMP $3A3E3E		  ; 5C 3E 3E 3A | Jump to address long
	ROL $3E30,X		  ; 3E 30 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_01E
; Address: $DE8360
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_01E:
	JSL $053E03		  ; 22 03 3E 05 | Jump to subroutine long
	ROL $7C			  ; 26 7C | Rotate left (zero page)
	BMI $4B			  ; 30 4B | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ASL $1000,X		  ; 1E 00 10 | Arithmetic shift left (absolute,X)
	BMI $16			  ; 30 16 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BMI $3C			  ; 30 3C | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	ROL $1818,X		  ; 3E 18 18 | Rotate left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BMI $B8			  ; 30 B8 | Branch if negative
	BRA $88			  ; 80 88 | Branch always
	STY $A8			  ; 84 A8 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_01F
; Address: $DE8395
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_01F:
	BRA $18			  ; 80 18 | Branch always
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	BVC $88			  ; 50 88 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BVS $28			  ; 70 28 | Branch if overflow set
	BVS $2E			  ; 70 2E | Branch if overflow set
	BNE $0A			  ; D0 0A | Branch if not equal
	TXS				  ; 9A | Transfer X register to stack pointer
	CPX $D0EC			; EC EC D0 | Compare X register (absolute)
	LDY $98			  ; A4 98 | Load from zero page into Y register
	LDX $8024,Y		  ; BE 24 80 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_020
; Address: $DE83B2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_020:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BIT $72			  ; 24 72 | Test bits in accumulator (zero page)
	BNE $7C			  ; D0 7C | Branch if not equal
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	BVC $64			  ; 50 64 | Branch if overflow clear
	LDY #$CC			 ; A0 CC | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	INC $38			  ; E6 38 | Increment (zero page)
	LSR $7030			; 4E 30 70 | Logical shift right (absolute)
	JMP $104000		  ; 5C 00 40 10 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	ROL $7C1E,X		  ; 3E 1E 7C | Rotate left (absolute,X)
	AND $43CE			; 2D CE 43 | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	EOR #$DF			 ; 49 DF | Exclusive OR with accumulator (immediate)
	ASL $1859,X		  ; 1E 59 18 | Arithmetic shift left (absolute,X)
	EOR ($10),Y		  ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BIT $4030			; 2C 30 40 | Test bits in accumulator (absolute)
	JMP $3A3E3E		  ; 5C 3E 3E 3A | Jump to address long
	ROL $3E30,X		  ; 3E 30 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_021
; Address: $DE8400
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_021:
	JSR $1C03			; 20 03 1C | Jump to subroutine
	BIT $23			  ; 24 23 | Test bits in accumulator (zero page)
	ASL $0C0E,X		  ; 1E 0E 0C | Arithmetic shift left (absolute,X)
	BPL $1C			  ; 10 1C | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	SEC				  ; 38 | Set carry flag
	ASL $0303			; 0E 03 03 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BVS $28			  ; 70 28 | Branch if overflow set
	BVS $2E			  ; 70 2E | Branch if overflow set
	BNE $0A			  ; D0 0A | Branch if not equal
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	LDX $8024,Y		  ; BE 24 80 | Load from absolute,Y into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BIT $F2			  ; 24 F2 | Test bits in accumulator (zero page)
	BVC $FC			  ; 50 FC | Branch if overflow clear
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_022
; Address: $DE8445
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_022:
	BNE $48			  ; D0 48 | Branch if not equal
	BRA $98			  ; 80 98 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_023
; Address: $DE844B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_023:
	RTI				  ; 40 | Return from interrupt
	BMI $C0			  ; 30 C0 | Branch if negative
	BCS $40			  ; B0 40 | Branch if carry set
	JMP $10C000		  ; 5C 00 C0 10 | Jump to address long
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BCS $60			  ; B0 60 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_024
; Address: $DE845A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_024:
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_025
; Address: $DE846A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_025:
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_026
; Address: $DE8478
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_026:
	JSR $221F			; 20 1F 22 | Jump to subroutine
	ORA $1827,X		  ; 1D 27 18 | Logical OR with accumulator (absolute,X)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	BMI $17			  ; 30 17 | Branch if negative
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $9698			; 6D 98 96 | Add with carry (absolute)
	STX $8303			; 8E 03 83 | Store X register to absolute address
	SEC				  ; 38 | Set carry flag
	DEC $ED37,X		  ; DE 37 ED | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $12			  ; 10 12 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_027
; Address: $DE8496
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_027:
	BEQ $71			  ; F0 71 | Branch if equal
	BPL $70			  ; 10 70 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	SBC $FA66,X		  ; FD 66 FA | Subtract with carry (absolute,X)
	LSR $3A			  ; 46 3A | Logical shift right (zero page)
	AND $1101,Y		  ; 39 01 11 | Logical AND with accumulator (absolute,Y)
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)
	AND $0601,Y		  ; 39 01 06 | Logical AND with accumulator (absolute,Y)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BMI $F8			  ; 30 F8 | Branch if negative
	BRA $D8			  ; 80 D8 | Branch always
	STY $8EDC			; 8C DC 8E | Store Y register to absolute address
	LDY $0000			; AC 00 00 | Load from absolute address into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_029
; Address: $DE84DC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_029:
	JSL $8C50DC		  ; 22 DC 50 8C | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	EOR $5DF6,Y		  ; 59 F6 5D | Exclusive OR with accumulator (absolute,Y)
	LDX $3E			  ; A6 3E | Load from zero page into X register
	BNE $E6			  ; D0 E6 | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	AND #$DD			 ; 29 DD | Logical AND with accumulator (immediate)
	CMP ($8C),Y		  ; D1 8C | Compare accumulator ((zero page),Y)
	CMP $4C			  ; C5 4C | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_02C
; Address: $DE8503
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_02C:
	JSR $1C3C			; 20 3C 1C | Jump to subroutine
	CPX $0C			  ; E4 0C | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	STZ $F810			; 9C 10 F8 | Store zero to absolute
	BCS $40			  ; B0 40 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_02D
; Address: $DE8511
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_02D:
	JMP ($B030)		  ; 6C 30 B0 | Jump to address (absolute indirect)
	CLD				  ; D8 | Clear decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_02E
; Address: $DE8520
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_02E:
	BMI $17			  ; 30 17 | Branch if negative
	ROL				  ; 2A | Rotate left (accumulator)
	AND $4648			; 2D 48 46 | Logical AND with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	LDX $3B			  ; A6 3B | Load from zero page into X register
	CMP $0836			; CD 36 08 | Compare accumulator (absolute)
	BPL $12			  ; 10 12 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_02F
; Address: $DE8534
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_02F:
	JSR $7000			; 20 00 70 | Jump to subroutine
	AND ($F8),Y		  ; 31 F8 | Logical AND with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	SBC $FA56			; ED 56 FA | Subtract with carry (absolute)
	JMP ($3844)		  ; 6C 44 38 | Jump to address (absolute indirect)
	BMI $10			  ; 30 10 | Branch if negative
	AND $1F08,Y		  ; 39 08 1F | Logical AND with accumulator (absolute,Y)
	ORA $0002			; 0D 02 00 | Logical OR with accumulator (absolute)
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_030
; Address: $DE855D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_030:
	ASL $0606			; 0E 06 06 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	EOR $5DF6,Y		  ; 59 F6 5D | Exclusive OR with accumulator (absolute,Y)
	LDX $26			  ; A6 26 | Load from zero page into X register
	CLD				  ; D8 | Clear decimal mode flag
	INC $3A			  ; E6 3A | Increment (zero page)
	AND $D1DD,Y		  ; 39 DD D1 | Logical AND with accumulator (absolute,Y)
	STY $4CC5			; 8C C5 4C | Store Y register to absolute address
	BCC $08			  ; 90 08 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_033
; Address: $DE8583
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_033:
	JSR $5C7C			; 20 7C 5C | Jump to subroutine
	STZ $8884			; 9C 84 88 | Store zero to absolute
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $20			  ; D0 20 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_034
; Address: $DE8591
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_034:
	JMP ($B030)		  ; 6C 30 B0 | Jump to address (absolute indirect)
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $60			  ; 84 60 | Store Y register to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_035
; Address: $DE859C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_035:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BPL $0E			  ; 10 0E | Branch if positive
	ASL $0B14			; 0E 14 0B | Arithmetic shift left (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	BIT $1914			; 2C 14 19 | Test bits in accumulator (absolute)
	ASL $1E31			; 0E 31 1E | Arithmetic shift left (absolute)
	ORA $031F,X		  ; 1D 1F 03 | Logical OR with accumulator (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $0306			; 0D 06 03 | Logical OR with accumulator (absolute)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $BBB4,X		  ; 3E B4 BB | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_036
; Address: $DE85E7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_036:
	JSL $37C22F		  ; 22 2F C2 37 | Jump to subroutine long
	LDX $CA68			; AE 68 CA | Load from absolute address into X register
	PHA				  ; 48 | Push accumulator to stack
	BRA $78			  ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_038
; Address: $DE85F7
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_038:
	JSL $181210		  ; 22 10 12 18 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BVC $4C			  ; 50 4C | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY #$CC			 ; C0 CC | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	CPX $7CEC			; EC EC 7C | Compare X register (absolute)
	BVS $30			  ; 70 30 | Branch if overflow set
	CPY #$E0			 ; C0 E0 | Game work RAM access
	JMP $B0B87C		  ; 5C 7C B8 B0 | Jump to address long
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal
	BPL $70			  ; 10 70 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $0E			  ; 10 0E | Branch if positive
	ASL $0B14			; 0E 14 0B | Arithmetic shift left (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $5934			; 4D 34 59 | Exclusive OR with accumulator (absolute)
	ROL $1E31			; 2E 31 1E | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_039
; Address: $DE8646
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_039:
	JSL $023F1C		  ; 22 1C 3F 02 | Jump to subroutine long
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	INC $7CFC,X		  ; FE FC 7C | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	LSR $BB94,X		  ; 5E 94 BB | Logical shift right (absolute,X)
	WDM #$97			 ; 42 97 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_03A
; Address: $DE866C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_03A:
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $78			  ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_03B
; Address: $DE8674
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_03B:
	JSR $0414			; 20 14 04 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $DC3C			; 4C 3C DC | Jump to address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_03C
; Address: $DE8681
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_03C:
	BVS $CC			  ; 70 CC | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CPY $4C			  ; C4 4C | Compare Y register (zero page)
	JMP $0CCA			; 4C CA 0C | Jump to address
	JMP $781864		  ; 5C 64 18 78 | Jump to address long
	SEC				  ; 38 | Set carry flag
	BMI $C4			  ; 30 C4 | Branch if negative
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	JMP $18187C		  ; 5C 7C 18 18 | Jump to address long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_03D
; Address: $DE869E
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_03D:
	JSR $0220			; 20 20 02 | Jump to subroutine
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ROL $0E33,X		  ; 3E 33 0E | Rotate left (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $1904,Y		  ; 19 04 19 | Logical OR with accumulator (absolute,Y)
	STZ $1B			  ; 64 1B | Store zero to zero page
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	ROL $1D6A			; 2E 6A 1D | Rotate left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $67			  ; B0 67 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	BPL $67			  ; 10 67 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BVS $07			  ; 70 07 | Branch if overflow set
	LDY $9F00			; AC 00 9F | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	EOR $5726,X		  ; 5D 26 57 | Exclusive OR with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ADC $3510,Y		  ; 79 10 35 | Add with carry (absolute,Y)
	BPL $16			  ; 10 16 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BRA $F0			  ; 80 F0 | Branch always
	BMI $CA			  ; 30 CA | Branch if negative
	SEC				  ; 38 | Set carry flag
	CMP $DD2A,X		  ; DD 2A DD | Compare accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $CA6E,X		  ; DD 6E CA | Compare accumulator (absolute,X)
	DEC $A070			; CE 70 A0 | Decrement (absolute)
	BCC $20			  ; 90 20 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_041
; Address: $DE8724
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_041:
	DEC				  ; 3A | Decrement accumulator
	PEA #$EAF5		   ; F4 F5 EA | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	BIT $08D4			; 2C D4 08 | Test bits in accumulator (absolute)
	CPX $EC			  ; E4 EC | Compare X register (zero page)
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPX $10			  ; E4 10 | Compare X register (zero page)
	ASL $3EE0			; 0E E0 3E | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEP #$10			 ; E2 10 | Set processor status bits
	BPL $08			  ; 10 08 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	JMP ($DC6A)		  ; 6C 6A DC | Jump to address (absolute indirect)
	DEX				  ; CA | Decrement X register
	PHA				  ; 48 | Push accumulator to stack
	LDX #$20			 ; A2 20 | Load immediate value into X register
	STY $0E00			; 8C 00 0E | Store Y register to absolute address
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	JMP $5C78			; 4C 78 5C | Jump to address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_042
; Address: $DE875D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_042:
	JSR $2050			; 20 50 20 | Jump to subroutine
	ROL $1D2A			; 2E 2A 1D | Rotate left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $137F			; 4C 7F 13 | Jump to address
	BVC $07			  ; 50 07 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BPL $27			  ; 10 27 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BVS $07			  ; 70 07 | Branch if overflow set
	CPX $9F00			; EC 00 9F | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	EOR $5626,X		  ; 5D 26 56 | Exclusive OR with accumulator (absolute,X)
	ADC $3300			; 6D 00 33 | Add with carry (absolute)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $1E12,X		  ; 1E 12 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	BRA $F0			  ; 80 F0 | Branch always
	BMI $CA			  ; 30 CA | Branch if negative
	SEC				  ; 38 | Set carry flag
	CMP $DD2A,X		  ; DD 2A DD | Compare accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $CB6E,X		  ; DD 6E CB | Compare accumulator (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $20			  ; 90 20 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_046
; Address: $DE87BF
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_046:
	JSL $5774AD		  ; 22 AD 74 57 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	AND $F7F6,Y		  ; 39 F6 F7 | Logical AND with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register
	BIT $08D4			; 2C D4 08 | Test bits in accumulator (absolute)
	CPX #$EC			 ; E0 EC | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	ASL $3CE0			; 0E E0 3C | Arithmetic shift left (absolute)
	SBC $F300,Y		  ; F9 00 F3 | Subtract with carry (absolute,Y)
	SBC $12			  ; E5 12 | Subtract with carry (zero page)
	BPL $0A			  ; 10 0A | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	JMP ($5CEB)		  ; 6C EB 5C | Jump to address (absolute indirect)
	STA $AD0A,X		  ; 9D 0A AD | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_047
; Address: $DE87EB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_047:
	JSL $0202CD		  ; 22 CD 02 02 | Jump to subroutine long
	ORA $FAE0			; 0D E0 FA | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	BVC $20			  ; 50 20 | Branch if overflow clear
	BPL $20			  ; 10 20 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $733A,X		  ; 3D 3A 73 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($14,X)		  ; 21 14 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_048
; Address: $DE8818
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_048:
	JSR $2014			; 20 14 20 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	JMP $726D20		  ; 5C 20 6D 72 | Jump to address long
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_049
; Address: $DE8824
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_049:
	ADC ($3E,X)		  ; 61 3E | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_04A
; Address: $DE8835
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_04A:
	JSL $061C00		  ; 22 00 1C 06 | Jump to subroutine long
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BIT $0A			  ; 24 0A | Test bits in accumulator (zero page)
	BPL $17			  ; 10 17 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND $471E,Y		  ; 39 1E 47 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_04B
; Address: $DE884A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_04B:
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	BPL $0C			  ; 10 0C | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0200,X		  ; 1E 00 02 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BVS $1E			  ; 70 1E | Branch if overflow set
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	BEQ $94			  ; F0 94 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	JMP ($5038)		  ; 6C 38 50 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_04D
; Address: $DE8875
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_04D:
	JSR $2058			; 20 58 20 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BCC $28			  ; 90 28 | Branch if carry clear
	BCC $04			  ; 90 04 | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag
	BRA $F0			  ; 80 F0 | Branch always
	BPL $48			  ; 10 48 | Branch if positive
	BCC $48			  ; 90 48 | Branch if carry clear
	BCS $50			  ; B0 50 | Branch if carry set
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BRA $50			  ; 80 50 | Branch always
	BRA $48			  ; 80 48 | Branch always
	LDY #$48			 ; A0 48 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_050
; Address: $DE889B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_050:
	JSR $1020			; 20 20 10 | Jump to subroutine
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	BMI $80			  ; 30 80 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPY #$58			 ; C0 58 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_051
; Address: $DE88A5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_051:
	JSR $B0FC			; 20 FC B0 | Jump to subroutine
	JMP ($5AA0)		  ; 6C A0 5A | Jump to address (absolute indirect)
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $00B090		  ; 5C 90 B0 00 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_054
; Address: $DE88C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_054:
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $7238,X		  ; 3E 38 72 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_056
; Address: $DE88DA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_056:
	JSR $2815			; 20 15 28 | Jump to subroutine
	ORA ($5C),Y		  ; 11 5C | Logical OR with accumulator ((zero page),Y)
	AND ($6F,X)		  ; 21 6F | Logical AND with accumulator ((zero page,X))
	BVS $6A			  ; 70 6A | Branch if overflow set
	AND $1D3A,X		  ; 3D 3A 1D | Logical AND with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA $0C36			; 0D 36 0C | Logical OR with accumulator (absolute)
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_057
; Address: $DE88F5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_057:
	JSR $1C00			; 20 00 1C | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA $26			  ; 05 26 | Logical OR with accumulator (zero page)
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	ORA $0D16,X		  ; 1D 16 0D | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $1C00			; 0D 00 1C | Logical OR with accumulator (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $14			  ; F0 14 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	LDY $9078			; AC 78 90 | Load from absolute address into Y register
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$E074		   ; F4 74 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_059
; Address: $DE8935
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_059:
	JSR $20D8			; 20 D8 20 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BPL $68			  ; 10 68 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BCS $50			  ; B0 50 | Branch if carry set
	DEY				  ; 88 | Decrement Y register
	BVC $88			  ; 50 88 | Branch if overflow clear
	BMI $90			  ; 30 90 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_05B
; Address: $DE894A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_05B:
	BNE $00			  ; D0 00 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_05D
; Address: $DE8952
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_05D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_05F
; Address: $DE895F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_05F:
	BPL $5A			  ; 10 5A | Branch if positive
	BRA $D8			  ; 80 D8 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_061
; Address: $DE896A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_061:
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_062
; Address: $DE897B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_062:
	RTI				  ; 40 | Return from interrupt
	BRA $0A			  ; 80 0A | Branch always
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ASL $52			  ; 06 52 | Arithmetic shift left (zero page)
	ORA $1900			; 0D 00 19 | Logical OR with accumulator (absolute)
	ORA $0904,Y		  ; 19 04 09 | Logical OR with accumulator (absolute,Y)
	BIT $0B			  ; 24 0B | Test bits in accumulator (zero page)
	BIT $0B			  ; 24 0B | Test bits in accumulator (zero page)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_063
; Address: $DE899F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_063:
	JSR $2D5B			; 20 5B 2D | Jump to subroutine
	BVC $25			  ; 50 25 | Branch if overflow clear
	BVC $27			  ; 50 27 | Branch if overflow clear
	CMP ($E8),Y		  ; D1 E8 | Compare accumulator ((zero page),Y)
	CMP $8481,X		  ; DD 81 84 | Compare accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $26			  ; 80 26 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BVC $04			  ; 50 04 | Branch if overflow clear
	DEX				  ; CA | Decrement X register
	LDY $5E02			; AC 02 5E | Load from absolute address into Y register
	AND ($56,X)		  ; 21 56 | Logical AND with accumulator ((zero page,X))
	ORA #$59			 ; 09 59 | Logical OR with accumulator (immediate)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_065
; Address: $DE89C8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_065:
	EOR $5520,X		  ; 5D 20 55 | Exclusive OR with accumulator (absolute,X)
	BIT $2B			  ; 24 2B | Test bits in accumulator (zero page)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $90			  ; 50 90 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	CMP $DD2A,X		  ; DD 2A DD | Compare accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR $2AF6			; 4D F6 2A | Exclusive OR with accumulator (absolute)
	BEQ $B0			  ; F0 B0 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_067
; Address: $DE89F7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_067:
	JSL $D822D8		  ; 22 D8 22 D8 | Jump to subroutine long
	ROL $28			  ; 26 28 | Rotate left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	BCS $06			  ; B0 06 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $3762			; 0D 62 37 | Logical OR with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	STX $BA12			; 8E 12 BA | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register
	AND $0D5A			; 2D 5A 0D | Logical AND with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_068
; Address: $DE8A10
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_068:
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $0C			  ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_069
; Address: $DE8A17
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_069:
	JSR $2051			; 20 51 20 | Jump to subroutine
	AND $7840,X		  ; 3D 40 78 | Logical AND with accumulator (absolute,X)
	BRA $60			  ; 80 60 | Branch always
	STZ $F48C,X		  ; 9E 8C F4 | Store zero to absolute,X
	JMP $9C6A			; 4C 6A 9C | Jump to address
	CPY $A448			; CC 48 A4 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_06A
; Address: $DE8A2D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_06A:
	JSR $0088			; 20 88 00 | Jump to subroutine
	STY $DC60			; 8C 60 DC | Store Y register to absolute address
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_06B
; Address: $DE8A3D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_06B:
	JSR $2050			; 20 50 20 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	LDA				  ; BF 0F 0D 00 | Load from absolute long,X into accumulator
	ORA $1904,Y		  ; 19 04 19 | Logical OR with accumulator (absolute,Y)
	ORA $1B04,Y		  ; 19 04 1B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_06C
; Address: $DE8A5F
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_06C:
	RTI				  ; 40 | Return from interrupt
	ORA $55A0			; 0D A0 55 | Logical OR with accumulator (absolute)
	BCS $47			  ; B0 47 | Branch if carry set
	LDY $B173			; AC 73 B1 | Load from absolute address into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $B451			; AD 51 B4 | Load from absolute address into accumulator
	INC				  ; 1A | Increment accumulator
	BPL $06			  ; 10 06 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	BMI $04			  ; 30 04 | Branch if negative
	INC				  ; 1A | Increment accumulator
	LSR $A601,X		  ; 5E 01 A6 | Logical shift right (absolute,X)
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	EOR ($AF),Y		  ; 51 AF | Exclusive OR with accumulator ((zero page),Y)
	BPL $ED			  ; 10 ED | Branch if positive
	EOR $40AD,Y		  ; 59 AD 40 | Exclusive OR with accumulator (absolute,Y)
	LDA $44			  ; A5 44 | Load from zero page into accumulator
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	LDA ($06),Y		  ; B1 06 | Load from (zero page),Y into accumulator
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	ASL $1E12,X		  ; 1E 12 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCS $06			  ; B0 06 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $3562			; 0D 62 35 | Logical OR with accumulator (absolute)
	DEX				  ; CA | Decrement X register
	STX $BE10			; 8E 10 BE | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$66			 ; 09 66 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	JMP $801200		  ; 5C 00 12 80 | Jump to address long
	ASL $5520			; 0E 20 55 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_06D
; Address: $DE8AB9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_06D:
	JSR $4039			; 20 39 40 | Jump to subroutine
	ADC $6080,X		  ; 7D 80 60 | Add with carry (absolute,X)
	BCC $99			  ; 90 99 | Branch if carry clear
	STY $F6			  ; 84 F6 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	NOP				  ; EA | No operation
	LDY $A808,X		  ; BC 08 A8 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_06E
; Address: $DE8ACB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_06E:
	JSR $00D0			; 20 D0 00 | Jump to subroutine
	BRA $62			  ; 80 62 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	STZ $0800			; 9C 00 08 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_070
; Address: $DE8ADD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_070:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	AND #$1E			 ; 29 1E | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ROR $072F			; 6E 2F 07 | Rotate right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ROL $6C01,X		  ; 3E 01 6C | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $2B			  ; 50 2B | Branch if overflow clear
	BVC $2D			  ; 50 2D | Branch if overflow clear
	EOR $5427,Y		  ; 59 27 54 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_071
; Address: $DE8B09
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_071:
	JSR $204B			; 20 4B 20 | Jump to subroutine
	EOR $0206,Y		  ; 59 06 02 | Exclusive OR with accumulator (absolute,Y)
	ORA ($20),Y		  ; 11 20 | Logical OR with accumulator ((zero page),Y)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND ($5C,X)		  ; 21 5C | Logical AND with accumulator ((zero page,X))
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	ASL $0577			; 0E 77 05 | Arithmetic shift left (absolute)
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BIT $5000			; 2C 00 50 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	BIT $AC54			; 2C 54 AC | Test bits in accumulator (absolute)
	JMP ($5CBC)		  ; 6C BC 5C | Jump to address (absolute indirect)
	LSR $E0BE			; 4E BE E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BPL $84			  ; 10 84 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	STY $28			  ; 84 28 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	TSX				  ; BA | Transfer stack pointer to X register
	DEC $6C56			; CE 56 6C | Decrement (absolute)
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_072
; Address: $DE8B66
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_072:
	JMP $20D838		  ; 5C 38 D8 20 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	BPL $88			  ; 10 88 | Branch if positive
	BNE $94			  ; D0 94 | Branch if not equal
	INX				  ; E8 | Increment X register
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BRA $38			  ; 80 38 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BIT $50			  ; 24 50 | Test bits in accumulator (zero page)
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	BPL $9C			  ; 10 9C | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$88			 ; C0 88 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	BCC $08			  ; 90 08 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	BMI $D0			  ; 30 D0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	ASL $2478			; 0E 78 24 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	DEY				  ; 88 | Decrement Y register
	INC $072F			; EE 2F 07 | Increment (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	AND ($5E,X)		  ; 21 5E | Logical AND with accumulator ((zero page,X))
	ROL $AC41,X		  ; 3E 41 AC | Rotate left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $4B			  ; B0 4B | Branch if carry set
	BCS $4D			  ; B0 4D | Branch if carry set
	LDA #$47			 ; A9 47 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	EOR ($04),Y		  ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	LDX $08			  ; A6 08 | Load from zero page into X register
	TAX				  ; AA | Transfer accumulator to X register
	INC $BB41,X		  ; FE 41 BB | Increment (absolute,X)
	LSR $BD			  ; 46 BD | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_073
; Address: $DE8BE7
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_073:
	LSR $47BA			; 4E BA 47 | Logical shift right (absolute)
	LDY $4240			; AC 40 42 | Hardware register operation
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($B6,X)		  ; 01 B6 | Logical OR with accumulator ((zero page,X))
	DEC $6C56			; CE 56 6C | Decrement (absolute)
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)
	JMP $20D838		  ; 5C 38 D8 20 | Jump to address long
	DEY				  ; 88 | Decrement Y register
	BPL $48			  ; 10 48 | Branch if positive
	BVS $AC			  ; 70 AC | Branch if overflow set
	BMI $FE			  ; 30 FE | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	BRA $38			  ; 80 38 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$64			 ; A0 64 | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $C4			  ; 70 C4 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	BEQ $90			  ; F0 90 | Branch if equal
	BRA $B0			  ; 80 B0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $70			  ; 10 70 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BVC $03			  ; 50 03 | Branch if overflow clear
	BVC $05			  ; 50 05 | Branch if overflow clear
	BVC $1F			  ; 50 1F | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	ASL $0C2C			; 0E 2C 0C | Arithmetic shift left (absolute)
	ROR $162E			; 6E 2E 16 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_074
; Address: $DE8C51
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_074:
	JSR $7304			; 20 04 73 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_075
; Address: $DE8C5E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_075:
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHY				  ; 5A | Push Y register to stack
	ROL $B16E			; 2E 6E B1 | Rotate left (absolute)
	ADC ($9D),Y		  ; 71 9D | Add with carry ((zero page),Y)
	BIT #$57			 ; 89 57 | Test bits in accumulator (immediate)
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	STA ($0E),Y		  ; 91 0E | Store accumulator to (zero page),Y
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_076
; Address: $DE8C79
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_076:
	JSR $0008			; 20 08 00 | Jump to subroutine
	ROR $3F			  ; 66 3F | Rotate right (zero page)
	ADC $323C,Y		  ; 79 3C 32 | Add with carry (absolute,Y)
	BPL $22			  ; 10 22 | Branch if positive
	DEX				  ; CA | Decrement X register
	CPY #$6A			 ; C0 6A | Compare Y register (immediate)
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $34			  ; 70 34 | Branch if overflow set
	BMI $76			  ; 30 76 | Branch if negative
	JMP ($C06C)		  ; 6C 6C C0 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_077
; Address: $DE8CB2
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_077:
	JSR $10CE			; 20 CE 10 | Jump to subroutine
	INC $FE00			; EE 00 FE | Increment (absolute)
	BRA $7C			  ; 80 7C | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $88			  ; F0 88 | Branch if equal
	CPX $5A5A			; EC 5A 5A | Compare X register (absolute)
	STA $C6			  ; 85 C6 | Store accumulator to zero page
	PEA #$FCB4		   ; F4 B4 FC | Push effective address to stack
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	LDA $58			  ; A5 58 | Load from zero page into accumulator
	EOR #$30			 ; 49 30 | Exclusive OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ROL $5EFC,X		  ; 3E FC 5E | Rotate left (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	CLV				  ; B8 | Clear overflow flag
	LSR $6C			  ; 46 6C | Logical shift right (zero page)
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BRA $10			  ; 80 10 | Branch always
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_079
; Address: $DE8D00
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_079:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $05			  ; 50 05 | Branch if overflow clear
	BVC $1F			  ; 50 1F | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	ASL $0C2C			; 0E 2C 0C | Arithmetic shift left (absolute)
	ROR $162E			; 6E 2E 16 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_07A
; Address: $DE8D11
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_07A:
	JSR $7304			; 20 04 73 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	ADC $A16D			; 6D 6D A1 | Add with carry (absolute)
	CMP #$6F			 ; C9 6F | Compare accumulator (immediate)
	ADC #$2F			 ; 69 2F | Add with carry (immediate)
	AND $233F			; 2D 3F 23 | Logical AND with accumulator (absolute)
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register
	CPY #$6A			 ; C0 6A | Compare Y register (immediate)
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $34			  ; 70 34 | Branch if overflow set
	BMI $76			  ; 30 76 | Branch if negative
	JMP ($C06C)		  ; 6C 6C C0 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_07B
; Address: $DE8D52
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_07B:
	JSR $10CE			; 20 CE 10 | Jump to subroutine
	INC $FE00			; EE 00 FE | Increment (absolute)
	BRA $7C			  ; 80 7C | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $88			  ; F0 88 | Branch if equal
	CPX $5A58			; EC 58 5A | Compare X register (absolute)
	STA $B98E			; 8D 8E B9 | Store accumulator to absolute address
	INC $EA91			; EE 91 EA | Increment (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	PEA #$F8C4		   ; F4 C4 F8 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	LDA $58			  ; A5 58 | Load from zero page into accumulator
	BIT #$70			 ; 89 70 | Test bits in accumulator (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $0F0C			; 0E 0C 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_07C
; Address: $DE8D8C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_07C:
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $020F,Y		  ; 19 0F 02 | Logical OR with accumulator (absolute,Y)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND $1019,Y		  ; 39 19 10 | Logical AND with accumulator (absolute,Y)
	BIT $2F			  ; 24 2F | Test bits in accumulator (zero page)
	WDM #$1E			 ; 42 1E | Reserved instruction
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_07D
; Address: $DE8DAA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_07D:
	JSR $250F			; 20 0F 25 | Jump to subroutine
	PHY				  ; 5A | Push Y register to stack
	ADC $1906,X		  ; 7D 06 19 | Add with carry (absolute,X)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	ROL $6400,X		  ; 3E 00 64 | Rotate left (absolute,X)
	ROR $3F70,X		  ; 7E 70 3F | Rotate right (absolute,X)
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	CMP ($5E),Y		  ; D1 5E | Compare accumulator ((zero page),Y)
	STY $00			  ; 84 00 | Store Y register to zero page
	JMP $003C18		  ; 5C 18 3C 00 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_07E
; Address: $DE8DD4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_07E:
	JSR $2004			; 20 04 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_07F
; Address: $DE8DDC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_07F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BCC $70			  ; 90 70 | Branch if carry clear
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BEQ $78			  ; F0 78 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	STZ $5CF8			; 9C F8 5C | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BIT $C8			  ; 24 C8 | Test bits in accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BRA $78			  ; 80 78 | Branch always
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_080
; Address: $DE8E01
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_080:
	BCS $90			  ; B0 90 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $80			  ; 30 80 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BCS $30			  ; B0 30 | Branch if carry set
	BCC $30			  ; 90 30 | Branch if carry clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	BCS $20			  ; B0 20 | Branch if carry set
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	BMI $38			  ; 30 38 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $40			  ; 10 40 | Branch if positive
	BPL $80			  ; 10 80 | Branch if positive
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_081
; Address: $DE8E23
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_081:
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $A8			  ; F0 A8 | Branch if equal
	CPX #$CC			 ; E0 CC | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	JMP $006000		  ; 5C 00 60 00 | Jump to address long
	BMI $00			  ; 30 00 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_082
; Address: $DE8E3C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_082:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND $2011,Y		  ; 39 11 20 | Logical AND with accumulator (absolute,Y)
	ROL $1B00			; 2E 00 1B | Rotate left (absolute)
	EOR #$7F			 ; 49 7F | Exclusive OR with accumulator (immediate)
	STA ($59,X)		  ; 81 59 | Store accumulator to (zero page,X)
	STX $7B			  ; 86 7B | Store X register to zero page
	AND $1522,Y		  ; 39 22 15 | Logical AND with accumulator (absolute,Y)
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	EOR ($20),Y		  ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_083
; Address: $DE8E56
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_083:
	BRA $00			  ; 80 00 | Branch always
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_084
; Address: $DE8E5C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_084:
	JSR $4104			; 20 04 41 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	JMP $7F4863		  ; 5C 63 48 7F | Jump to address long
	ROL $2E2F			; 2E 2F 2E | Rotate left (absolute)
	ASL $0906			; 0E 06 09 | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_086
; Address: $DE8E76
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_086:
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLV				  ; B8 | Clear overflow flag
	BCS $90			  ; B0 90 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BEQ $64			  ; F0 64 | Branch if equal
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCS $20			  ; B0 20 | Branch if carry set
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	BMI $B8			  ; 30 B8 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_087
; Address: $DE8E9E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_087:
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_088
; Address: $DE8EA3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_088:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_089
; Address: $DE8EA7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_089:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_08B
; Address: $DE8EC0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_08B:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $05			  ; 50 05 | Branch if overflow clear
	EOR ($1F),Y		  ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
	AND ($07),Y		  ; 31 07 | Logical AND with accumulator ((zero page),Y)
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_08C
; Address: $DE8ED1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_08C:
	JSR $7304			; 20 04 73 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	INC $77			  ; E6 77 | Increment (zero page)
	STA $7E9939		  ; 8F 39 99 7E | Store accumulator to absolute long address
	EOR ($38),Y		  ; 51 38 | Exclusive OR with accumulator ((zero page),Y)
	AND #$3D			 ; 29 3D | Logical AND with accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_08D
; Address: $DE8EFA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_08D:
	BMI $06			  ; 30 06 | Branch if negative
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	ADC $6F3D			; 6D 3D 6F | Add with carry (absolute)
	AND $1C36,X		  ; 3D 36 1C | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_08E
; Address: $DE8F08
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_08E:
	JSL $105400		  ; 22 00 54 10 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY #$EA			 ; C0 EA | Compare Y register (immediate)
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX $D4E0			; EC E0 D4 | Compare X register (absolute)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PEA #$ECED		   ; F4 ED EC | Push effective address to stack
	CPY #$04			 ; C0 04 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_08F
; Address: $DE8F32
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_08F:
	JSR $10CE			; 20 CE 10 | Jump to subroutine
	INC $FE00			; EE 00 FE | Increment (absolute)
	BPL $EC			  ; 10 EC | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BCC $08			  ; 90 08 | Branch if carry clear
	PEA #$EC12		   ; F4 12 EC | Push effective address to stack
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	AND ($E7,X)		  ; 21 E7 | Logical AND with accumulator ((zero page,X))
	CPX $98F8			; EC F8 98 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	EOR #$B0			 ; 49 B0 | Exclusive OR with accumulator (immediate)
	CPX #$6E			 ; E0 6E | Compare X register (immediate)
	BRA $88			  ; 80 88 | Branch always
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$2080		   ; F4 80 20 | Push effective address to stack
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SEP #$E4			 ; E2 E4 | Set processor status bits
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ROL $E200,X		  ; 3E 00 E2 | Rotate left (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	BRA $18			  ; 80 18 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_091
; Address: $DE8F80
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_091:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $05			  ; 50 05 | Branch if overflow clear
	EOR ($1F),Y		  ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
	AND ($07),Y		  ; 31 07 | Logical AND with accumulator ((zero page),Y)
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_093
; Address: $DE8F98
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_093:
	PHP				  ; 08 | Push processor status to stack
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY #$EA			 ; C0 EA | Compare Y register (immediate)
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX $D4E0			; EC E0 D4 | Compare X register (absolute)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PEA #$EAEB		   ; F4 EB EA | Push effective address to stack
	CPY #$04			 ; C0 04 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_094
; Address: $DE8FB2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_094:
	JSR $10CE			; 20 CE 10 | Jump to subroutine
	INC $FE00			; EE 00 FE | Increment (absolute)
	BPL $EC			  ; 10 EC | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BCC $08			  ; 90 08 | Branch if carry clear
	PEA #$EA14		   ; F4 14 EA | Push effective address to stack
	ORA $0600			; 0D 00 06 | Logical OR with accumulator (absolute)
	BPL $FF			  ; 10 FF | Branch if positive
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC $BF41,X		  ; FD 41 BF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_096
; Address: $DE8FED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_096:
	JSR $0078			; 20 78 00 | Jump to subroutine
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	WDM #$4C			 ; 42 4C | Reserved instruction

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_099
; Address: $DE9001
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_099:
	JSL $7F41FF		  ; 22 FF 41 7F | Jump to subroutine long
	ASL $163F,X		  ; 1E 3F 16 | Arithmetic shift left (absolute,X)
	ROL $1C08,X		  ; 3E 08 1C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_09A
; Address: $DE9010
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_09A:
	JSL $6B4177		  ; 22 77 41 6B | Jump to subroutine long
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $90			  ; 80 90 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_09B
; Address: $DE903B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_09B:
	RTI				  ; 40 | Return from interrupt
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	INC $BD30,X		  ; FE 30 BD | Increment (absolute,X)
	STY $FF			  ; 84 FF | Store Y register to zero page
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	ASL $0804,X		  ; 1E 04 08 | Arithmetic shift left (absolute,X)
	ASL $1810			; 0E 10 18 | Arithmetic shift left (absolute)
	DEC $02			  ; C6 02 | Decrement (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	BCS $E4			  ; B0 E4 | Branch if carry set
	WDM #$FF			 ; 42 FF | Reserved instruction
	BRA $EE			  ; 80 EE | Branch always
	BMI $C6			  ; 30 C6 | Branch if negative
	JMP ($7884)		  ; 6C 84 78 | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	BMI $78			  ; 30 78 | Branch if negative
	WDM #$EE			 ; 42 EE | Reserved instruction
	BRA $D6			  ; 80 D6 | Branch always
	DEY				  ; 88 | Decrement Y register
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BMI $78			  ; 30 78 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_09E
; Address: $DE90A0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_09E:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $90			  ; 80 90 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BPL $3F			  ; 10 3F | Branch if positive
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	ORA $061F			; 0D 1F 06 | Logical OR with accumulator (absolute)
	ASL $2300,X		  ; 1E 00 23 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_09F
; Address: $DE90F3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_09F:
	ASL $1910			; 0E 10 19 | Arithmetic shift left (absolute)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA $060F			; 0D 0F 06 | Logical OR with accumulator (absolute)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ROL $6C09			; 2E 09 6C | Rotate left (absolute)
	ADC ($1E),Y		  ; 71 1E | Add with carry ((zero page),Y)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	ROL $0C18			; 2E 18 0C | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0A0
; Address: $DE9119
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0A0:
	JSR $3C00			; 20 00 3C | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE08,X		  ; FE 08 FE | Increment (absolute,X)
	STZ $0CF0,X		  ; 9E F0 0C | Store zero to absolute,X
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0A2
; Address: $DE913A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0A2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $18			  ; F0 18 | Branch if equal
	BVS $D0			  ; 70 D0 | Branch if overflow set
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0A3
; Address: $DE9147
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0A3:
	JSR $1078			; 20 78 10 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BMI $A0			  ; 30 A0 | Branch if negative
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0A6
; Address: $DE915D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0A6:
	JSR $4000			; 20 00 40 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0A7
; Address: $DE9164
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0A7:
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX $7E10			; EC 10 7E | Compare X register (absolute)
	BIT $3E			  ; 24 3E | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	STZ $F0			  ; 64 F0 | Store zero to zero page
	BIT $60			  ; 24 60 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0A9
; Address: $DE918A
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0A9:
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ASL $0003,X		  ; 1E 03 00 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $041F,Y		  ; 19 1F 04 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	BIT $2073			; 2C 73 20 | Test bits in accumulator (absolute)
	AND #$0C			 ; 29 0C | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ASL $3D2C,X		  ; 1E 2C 3D | Arithmetic shift left (absolute,X)
	BIT $1031			; 2C 31 10 | Test bits in accumulator (absolute)
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $18			  ; F0 18 | Branch if equal
	BVS $D0			  ; 70 D0 | Branch if overflow set
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0AA
; Address: $DE91E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0AA:
	JSR $10FC			; 20 FC 10 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0AC
; Address: $DE91F8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0AC:
	BPL $70			  ; 10 70 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BPL $F8			  ; 10 F8 | Branch if positive
	BEQ $60			  ; F0 60 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	BRA $30			  ; 80 30 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $60			  ; 10 60 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0AD
; Address: $DE9214
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0AD:
	JSR $0030			; 20 30 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0AE
; Address: $DE922D
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0AE:
	ORA $0F7C			; 0D 7C 0F | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $FE			  ; 10 FE | Branch if positive
	ADC $B710,X		  ; 7D 10 B7 | Add with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	ADC $2863			; 6D 63 28 | Add with carry (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	ADC ($61),Y		  ; 71 61 | Add with carry ((zero page),Y)
	BMI $24			  ; 30 24 | Branch if negative
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	EOR #$6F			 ; 49 6F | Exclusive OR with accumulator (immediate)
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	BPL $78			  ; 10 78 | Branch if positive
	AND $73			  ; 25 73 | Logical AND with accumulator (zero page)
	EOR ($63,X)		  ; 41 63 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $38			  ; 10 38 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0AF
; Address: $DE9287
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0AF:
	JSR $6098			; 20 98 60 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BNE $4E			  ; D0 4E | Branch if not equal
	BCS $3F			  ; B0 3F | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0B0
; Address: $DE929A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0B0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	ROL $BDD0,X		  ; 3E D0 BD | Rotate left (absolute,X)
	WDM #$FD			 ; 42 FD | Reserved instruction
	BRA $FA			  ; 80 FA | Branch always
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $1811			; 0E 11 18 | Arithmetic shift left (absolute)
	WDM #$C6			 ; 42 C6 | Reserved instruction
	CLV				  ; B8 | Clear overflow flag
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BNE $40			  ; D0 40 | Branch if not equal
	INX				  ; E8 | Increment X register
	BCC $E6			  ; 90 E6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0B3
; Address: $DE92D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0B3:
	JSR $3800			; 20 00 38 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA $6FFC			; 0D FC 6F | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0B5
; Address: $DE9300
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0B5:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0B6
; Address: $DE9307
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0B6:
	JSR $6098			; 20 98 60 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BNE $48			  ; D0 48 | Branch if not equal
	BCS $3E			  ; B0 3E | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0B7
; Address: $DE931A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0B7:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C04			; 0E 04 0C | Arithmetic shift left (absolute)
	ASL $0710			; 0E 10 07 | Arithmetic shift left (absolute)
	BPL $17			  ; 10 17 | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	ORA ($B5,X)		  ; 01 B5 | Logical OR with accumulator ((zero page,X))
	STZ $9A			  ; 64 9A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0B9
; Address: $DE9357
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0B9:
	JSR $1048			; 20 48 10 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0BC
; Address: $DE9367
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0BC:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	ROL $1701,X		  ; 3E 01 17 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $4800			; 0D 00 48 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0BD
; Address: $DE9371
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0BD:
	JSR $600C			; 20 0C 60 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$0E			 ; A0 0E | Load immediate value into Y register
	BPL $07			  ; 10 07 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0BE
; Address: $DE9387
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0BE:
	WDM #$FF			 ; 42 FF | Reserved instruction
	SBC $FD21,X		  ; FD 21 FD | Subtract with carry (absolute,X)
	ADC ($F5,X)		  ; 61 F5 | Add with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$42			 ; C0 42 | Hardware register operation
	BVS $23			  ; 70 23 | Branch if overflow set
	AND ($7A,X)		  ; 21 7A | Logical AND with accumulator ((zero page,X))
	ADC ($F2,X)		  ; 61 F2 | Add with carry ((zero page,X))
	ORA #$62			 ; 09 62 | Logical OR with accumulator (immediate)
	SBC $ED09			; ED 09 ED | Subtract with carry (absolute)
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	ORA ($DD,X)		  ; 01 DD | Logical OR with accumulator ((zero page,X))
	EOR $6D			  ; 45 6D | Exclusive OR with accumulator (zero page)
	STA $AF			  ; 85 AF | Store accumulator to zero page
	EOR ($4A),Y		  ; 51 4A | Exclusive OR with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	DEC $BCC0			; CE C0 BC | Decrement (absolute)
	BRA $FC			  ; 80 FC | Branch always
	CPX $18			  ; E4 18 | Compare X register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0BF
; Address: $DE93D8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0BF:
	CLC				  ; 18 | Clear carry flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $17			  ; 10 17 | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	ORA ($F5,X)		  ; 01 F5 | Logical OR with accumulator ((zero page,X))
	CPY $2A			  ; C4 2A | Compare Y register (zero page)
	LDX #$28			 ; A2 28 | Load immediate value into X register
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $0A			  ; 30 0A | Branch if negative
	BMI $0B			  ; 30 0B | Branch if negative
	CPY #$55			 ; C0 55 | Compare Y register (immediate)
	BRA $17			  ; 80 17 | Branch always
	BVS $13			  ; 70 13 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C0
; Address: $DE9404
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C0:
	ADC $9F81,X		  ; 7D 81 9F | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	ASL $0101,X		  ; 1E 01 01 | Arithmetic shift left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STY $0200			; 8C 00 02 | Store Y register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C1
; Address: $DE9416
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C1:
	JSR $1846			; 20 46 18 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $FD21,X		  ; FD 21 FD | Subtract with carry (absolute,X)
	AND ($FD,X)		  ; 21 FD | Logical AND with accumulator ((zero page,X))
	ADC ($F5,X)		  ; 61 F5 | Add with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$47			 ; C0 47 | Compare Y register (immediate)
	AND ($32,X)		  ; 21 32 | Logical AND with accumulator ((zero page,X))
	AND ($7A,X)		  ; 21 7A | Logical AND with accumulator ((zero page,X))
	ADC ($F2,X)		  ; 61 F2 | Add with carry ((zero page,X))
	ORA #$62			 ; 09 62 | Logical OR with accumulator (immediate)
	SBC $ED09			; ED 09 ED | Subtract with carry (absolute)
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	ORA ($DD,X)		  ; 01 DD | Logical OR with accumulator ((zero page,X))
	EOR $6F			  ; 45 6F | Exclusive OR with accumulator (zero page)
	LDA $23392F		  ; AF 2F 39 23 | Load from absolute long address into accumulator
	EOR $1146,Y		  ; 59 46 11 | Exclusive OR with accumulator (absolute,Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	INC $CC00			; EE 00 CC | Increment (absolute)
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	CPX $18			  ; E4 18 | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $E8			  ; 80 E8 | Branch always
	BPL $B0			  ; 10 B0 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C2
; Address: $DE9478
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C2:
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $3D05,X		  ; 3D 05 3D | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C3
; Address: $DE948F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C3:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $0A07			; 0D 07 0A | Logical OR with accumulator (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	AND $1D05,X		  ; 3D 05 1D | Logical AND with accumulator (absolute,X)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	ORA $7D			  ; 05 7D | Logical OR with accumulator (zero page)
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	AND $16			  ; 25 16 | Logical AND with accumulator (zero page)
	AND $1F0E,Y		  ; 39 0E 1F | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	AND $3C1E,Y		  ; 39 1E 3C | Logical AND with accumulator (absolute,Y)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C4
; Address: $DE94E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C4:
	JSR $20F8			; 20 F8 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY $0040,X		  ; BC 40 00 | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C5
; Address: $DE94F6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C5:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	LDY $3860,X		  ; BC 60 38 | Load from absolute,X into Y register
	BNE $08			  ; D0 08 | Branch if not equal
	BNE $08			  ; D0 08 | Branch if not equal
	BCS $10			  ; B0 10 | Branch if carry set
	CPX #$76			 ; E0 76 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	ADC $0076			; 6D 76 00 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C6
; Address: $DE9514
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C6:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C7
; Address: $DE951C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C7:
	BVC $06			  ; 50 06 | Branch if overflow clear
	BRA $06			  ; 80 06 | Branch always
	LDA $1132,Y		  ; B9 32 11 | Load from absolute,Y into accumulator
	LDA $A226			; AD 26 A2 | Load from absolute address into accumulator
	BNE $B8			  ; D0 B8 | Branch if not equal
	BVS $D0			  ; 70 D0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C8
; Address: $DE952D
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C8:
	JSR $0038			; 20 38 00 | Jump to subroutine
	CPX $5002			; EC 02 50 | Compare X register (absolute)
	ASL $48			  ; 06 48 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $1F01			; 0D 01 1F | Logical OR with accumulator (absolute)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	ORA $0F16			; 0D 16 0F | Logical OR with accumulator (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	BPL $3B			  ; 10 3B | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $06			  ; 10 06 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0C9
; Address: $DE95BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0C9:
	BCS $40			  ; B0 40 | Branch if carry set
	BCC $40			  ; 90 40 | Branch if carry clear
	BRA $7C			  ; 80 7C | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0CA
; Address: $DE95C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0CA:
	SEI				  ; 78 | Set interrupt disable flag
	BVC $48			  ; 50 48 | Branch if overflow clear
	BVC $48			  ; 50 48 | Branch if overflow clear
	BVS $5C			  ; 70 5C | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0CB
; Address: $DE95CB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0CB:
	JMP $ECEA			; 4C EA EC | Jump to address
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	STY $8CD0			; 8C D0 8C | Store Y register to absolute address
	STY $7A			  ; 84 7A | Store Y register to zero page
	PHY				  ; 5A | Push Y register to stack
	STY $28A4			; 8C A4 28 | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	BMI $08			  ; 30 08 | Branch if negative
	BNE $B8			  ; D0 B8 | Branch if not equal
	BVS $78			  ; 70 78 | Branch if overflow set
	BRA $F0			  ; 80 F0 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0CC
; Address: $DE95F2
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0CC:
	JSR $500C			; 20 0C 50 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $10			  ; 80 10 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA				  ; BF 81 BF 80 | Load from absolute long,X into accumulator
	LDA				  ; BF 80 00 00 | Load from absolute long,X into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA ($5F,X)		  ; 81 5F | Store accumulator to (zero page,X)
	BRA $4D			  ; 80 4D | Branch always
	BRA $48			  ; 80 48 | Branch always
	LDA $AA92			; AD 92 AA | Load from absolute address into accumulator
	BCC $8D			  ; 90 8D | Branch if carry clear
	BCS $A7			  ; B0 A7 | Branch if carry set
	LDY $EB			  ; A4 EB | Load from zero page into Y register
	ROR $80			  ; 66 80 | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	LDX #$40			 ; A2 40 | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0CD
; Address: $DE9639
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0CD:
	BVC $AA			  ; 50 AA | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BEQ $40			  ; F0 40 | Branch if equal
	ORA #$60			 ; 09 60 | Logical OR with accumulator (immediate)
	LDA ($61),Y		  ; B1 61 | Load from (zero page),Y into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	SEI				  ; 78 | Set interrupt disable flag
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	ORA $021A,Y		  ; 19 1A 02 | Logical OR with accumulator (absolute,Y)
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ROL $04			  ; 26 04 | Rotate left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0CE
; Address: $DE9664
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0CE:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D1
; Address: $DE9678
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D1:
	JSR $60B0			; 20 B0 60 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $0E			  ; B0 0E | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D2
; Address: $DE9688
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D2:
	ADC $A9C0			; 6D C0 A9 | Add with carry (absolute)
	ROL $DB			  ; 26 DB | Rotate left (zero page)
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack
	BPL $84			  ; 10 84 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BVC $06			  ; 50 06 | Branch if overflow clear
	ASL $92			  ; 06 92 | Arithmetic shift left (zero page)
	BIT #$84			 ; 89 84 | Test bits in accumulator (immediate)
	LSR $5D			  ; 46 5D | Logical shift right (zero page)
	REP #$BE			 ; C2 BE | Reset processor status bits
	STY $84			  ; 84 84 | Store Y register to zero page
	LDY $1068,X		  ; BC 68 10 | Load from absolute,X into Y register
	INX				  ; E8 | Increment X register
	BPL $B0			  ; 10 B0 | Branch if positive
	LDY #$06			 ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D4
; Address: $DE96B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D4:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D5
; Address: $DE96C5
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D5:
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	LDA				  ; BF 87 BF 81 | Load from absolute long,X into accumulator
	LDA				  ; BF 80 BF 80 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	STA ($5F,X)		  ; 81 5F | Store accumulator to (zero page,X)
	BRA $4D			  ; 80 4D | Branch always
	BRA $48			  ; 80 48 | Branch always
	LDA $AA92			; AD 92 AA | Load from absolute address into accumulator
	BCC $8D			  ; 90 8D | Branch if carry clear
	BCS $A7			  ; B0 A7 | Branch if carry set
	CPX $EB			  ; E4 EB | Compare X register (zero page)
	ROR $80			  ; 66 80 | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	LDX #$40			 ; A2 40 | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $EA			  ; 50 EA | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BPL $60			  ; 10 60 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($61),Y		  ; 91 61 | Store accumulator to (zero page),Y
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	AND $2125,X		  ; 3D 25 21 | PPU graphics register access
	AND $0816,X		  ; 3D 16 08 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0E00			; 0D 00 0E | Logical OR with accumulator (absolute)
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ROL $0F00,X		  ; 3E 00 0F | Rotate left (absolute,X)
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $0E			  ; B0 0E | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D7
; Address: $DE972B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D7:
	JSR $EED1			; 20 D1 EE | Jump to subroutine
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BPL $80			  ; 10 80 | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	ASL $0E80			; 0E 80 0E | Arithmetic shift left (absolute)
	STA ($8A),Y		  ; 91 8A | Store accumulator to (zero page),Y
	EOR ($4A),Y		  ; 51 4A | Exclusive OR with accumulator ((zero page),Y)
	DEC $843A			; CE 3A 84 | Decrement (absolute)
	LDY $98			  ; A4 98 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D8
; Address: $DE974A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D8:
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	STZ $0A			  ; 64 0A | Store zero to zero page
	LDY $0A			  ; A4 0A | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0D9
; Address: $DE9754
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0D9:
	JSR $401E			; 20 1E 40 | Jump to subroutine
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX $BF			  ; E4 BF | Compare X register (zero page)
	LDA				  ; BF 80 BD 82 | Load from absolute long,X into accumulator
	CPX $4E			  ; E4 4E | Compare X register (zero page)
	LSR $4880			; 4E 80 48 | Logical shift right (absolute)
	BRA $40			  ; 80 40 | Branch always
	LDA $BC86,X		  ; BD 86 BC | Load from absolute,X into accumulator
	PLB				  ; AB | Pull data bank register from stack
	BCS $AB			  ; B0 AB | Branch if carry set
	BCS $AD			  ; B0 AD | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $F5A2			; AE A2 F5 | Load from absolute address into X register
	CPX $E6			  ; E4 E6 | Compare X register (zero page)
	ROR $4080			; 6E 80 40 | Rotate right (absolute)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY $40			  ; A4 40 | Load from zero page into Y register
	LDY #$42			 ; A0 42 | Hardware register operation
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDA ($40,X)		  ; A1 40 | Load from (zero page,X) into accumulator
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	ORA ($60),Y		  ; 11 60 | Logical OR with accumulator ((zero page),Y)
	LDY $996C			; AC 6C 99 | Load from absolute address into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0DA
; Address: $DE97A4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0DA:
	ADC $04			  ; 65 04 | Add with carry (zero page)
	ORA $0B10			; 0D 10 0B | Logical OR with accumulator (absolute)
	ORA $0B0E,X		  ; 1D 0E 0B | Logical OR with accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0DC
; Address: $DE97C7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0DC:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0DD
; Address: $DE97D6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0DD:
	JSR $4060			; 20 60 40 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0DF
; Address: $DE97E3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0DF:
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	BRA $3E			  ; 80 3E | Branch always
	ASL $6CF0			; 0E F0 6C | Arithmetic shift left (absolute)
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E0
; Address: $DE97F6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E0:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BMI $C0			  ; 30 C0 | Branch if negative
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal
	ROL $6CBC			; 2E BC 6C | Rotate left (absolute)
	BEQ $98			  ; F0 98 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E1
; Address: $DE9809
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E1:
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $3C78			; 9C 78 3C | Store zero to absolute
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	WDM #$B0			 ; 42 B0 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E2
; Address: $DE9818
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E2:
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E3
; Address: $DE9825
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E3:
	JSR $647F			; 20 7F 64 | Jump to subroutine
	WDM #$7F			 ; 42 7F | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ADC $0042,X		  ; 7D 42 00 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E4
; Address: $DE9834
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E4:
	JSR $6402			; 20 02 64 | Jump to subroutine
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	ROL $0E42			; 2E 42 0E | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	ADC $7C46,X		  ; 7D 46 7C | Add with carry (absolute,X)
	BVC $4B			  ; 50 4B | Branch if overflow clear
	BVC $4D			  ; 50 4D | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $7572,X		  ; 7E 72 75 | Rotate right (absolute,X)
	BIT $46			  ; 24 46 | Test bits in accumulator (zero page)
	AND $0040			; 2D 40 00 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E8
; Address: $DE9860
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E8:
	LSR $3A2D			; 4E 2D 3A | Logical shift right (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $0A11			; 0D 11 0A | Logical OR with accumulator (absolute)
	ORA $1E0E,X		  ; 1D 0E 1E | Logical OR with accumulator (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BRA $D8			  ; 80 D8 | Branch always
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	BRA $BC			  ; 80 BC | Branch always
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0E9
; Address: $DE9896
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0E9:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	BRA $18			  ; 80 18 | Branch always
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	BVC $78			  ; 50 78 | Branch if overflow clear
	JMP $E0D878		  ; 5C 78 D8 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY $3030			; CC 30 30 | Compare Y register (absolute)
	CPX #$84			 ; E0 84 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0EA
; Address: $DE98B4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0EA:
	BRA $60			  ; 80 60 | Branch always
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0EB
; Address: $DE98E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0EB:
	JSR $7010			; 20 10 70 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	ROR $6E			  ; 66 6E | Rotate right (zero page)
	LDY #$33			 ; A0 33 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0EC
; Address: $DE98F2
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0EC:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0ED
; Address: $DE98F8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0ED:
	LDX $A713			; AE 13 A7 | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP $49B0			; 4C B0 49 | Jump to address
	BVS $0C			  ; 70 0C | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0EE
; Address: $DE9906
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0EE:
	SEI				  ; 78 | Set interrupt disable flag
	AND ($1B),Y		  ; 31 1B | Logical AND with accumulator ((zero page),Y)
	ROL $111F			; 2E 1F 11 | Rotate left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $3C06,Y		  ; 19 06 3C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0EF
; Address: $DE9915
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0EF:
	JSR $3807			; 20 07 38 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F0
; Address: $DE9925
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F0:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BEQ $B0			  ; F0 B0 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $BC			  ; F0 BC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	JMP ($04E8)		  ; 6C E8 04 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	JMP ($EA7C)		  ; 6C 7C EA | Jump to address (absolute indirect)
	DEC $8A70,X		  ; DE 70 8A | Decrement (absolute,X)
	BPL $E8			  ; 10 E8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BPL $E8			  ; 10 E8 | Branch if positive
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$7A			 ; E0 7A | Compare X register (immediate)
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	SBC $F904,Y		  ; F9 04 F9 | Subtract with carry (absolute,Y)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PEA #$7806		   ; F4 06 78 | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	DEC $2E23,X		  ; DE 23 2E | Decrement (absolute,X)
	STX $70			  ; 86 70 | Store X register to zero page
	CLD				  ; D8 | Clear decimal mode flag
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F1
; Address: $DE9972
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F1:
	SEI				  ; 78 | Set interrupt disable flag
	BRA $1B			  ; 80 1B | Branch always
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	ASL $2ED0,X		  ; 1E D0 2E | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BVC $20			  ; 50 20 | Branch if overflow clear
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F2
; Address: $DE9984
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F2:
	JSR $3010			; 20 10 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	ORA $1F00,Y		  ; 19 00 1F | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F3
; Address: $DE9996
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F3:
	JSR $5607			; 20 07 56 | Jump to subroutine
	BIT $99			  ; 24 99 | Test bits in accumulator (zero page)
	ROR $90			  ; 66 90 | Rotate right (zero page)
	BIT $1A64			; 2C 64 1A | Test bits in accumulator (absolute)
	BIT $1813			; 2C 13 18 | Test bits in accumulator (absolute)
	BIT $210C			; 2C 0C 21 | PPU graphics register access
	ASL $0A1B			; 0E 1B 0A | Arithmetic shift left (absolute)
	JMP $1E03			; 4C 03 1E | Jump to address
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $0A00,X		  ; 1E 00 0A | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	JMP ($04E8)		  ; 6C E8 04 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ASL $661E			; 0E 1E 66 | Arithmetic shift left (absolute)
	ROR $CEF4,X		  ; 7E F4 CE | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $15			  ; 84 15 | Store Y register to zero page
	CPX $F800			; EC 00 F8 | Compare X register (absolute)
	BPL $E8			  ; 10 E8 | Branch if positive
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	ASL $E0			  ; 06 E0 | Game work RAM access
	ADC $FDC0,X		  ; 7D C0 FD | Add with carry (absolute,X)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	STY $EE00			; 8C 00 EE | Store Y register to absolute address
	CMP ($EE,X)		  ; C1 EE | Compare accumulator ((zero page,X))
	STX $D0			  ; 86 D0 | Store X register to zero page
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	CPY #$8B			 ; C0 8B | Compare Y register (immediate)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	BPL $EE			  ; 10 EE | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F4
; Address: $DE99FB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F4:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	BVC $20			  ; 50 20 | Branch if overflow clear
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F5
; Address: $DE9A0E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F5:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F7
; Address: $DE9A1A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F7:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $2001,Y		  ; 19 01 20 | Logical OR with accumulator (absolute,Y)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BPL $11			  ; 10 11 | Branch if positive
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	ROL $19			  ; 26 19 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0F9
; Address: $DE9A38
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0F9:
	JSL $00360C		  ; 22 0C 36 00 | Jump to subroutine long
	AND ($40),Y		  ; 31 40 | Logical AND with accumulator ((zero page),Y)
	BPL $07			  ; 10 07 | Branch if positive
	WDM #$58			 ; 42 58 | Reserved instruction
	STZ $08			  ; 64 08 | Store zero to zero page
	ROL $68			  ; 26 68 | Rotate left (zero page)
	BPL $3F			  ; 10 3F | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	BPL $20			  ; 10 20 | Branch if positive
	BPL $27			  ; 10 27 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $02			  ; 10 02 | Branch if positive
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0FA
; Address: $DE9A74
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0FA:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $E8			  ; F0 E8 | Branch if equal
	BPL $C0			  ; 10 C0 | Branch if positive
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BPL $60			  ; 10 60 | Branch if positive
	BVC $20			  ; 50 20 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	BCC $42			  ; 90 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0FB
; Address: $DE9A91
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0FB:
	BMI $08			  ; 30 08 | Branch if negative
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BRA $24			  ; 80 24 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0FC
; Address: $DE9AA1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0FC:
	ROR $01			  ; 66 01 | Rotate right (zero page)
	DEX				  ; CA | Decrement X register
	ASL $7C98,X		  ; 1E 98 7C | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $28			  ; 70 28 | Branch if overflow set
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$58			 ; E0 58 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0FD
; Address: $DE9AAF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0FD:
	JSR $1088			; 20 88 10 | Jump to subroutine
	STY $30			  ; 84 30 | Store Y register to zero page
	BRA $60			  ; 80 60 | Branch always
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BVS $10			  ; 70 10 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_0FE
; Address: $DE9ABF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_0FE:
	BRA $18			  ; 80 18 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA $2001,Y		  ; 19 01 20 | Logical OR with accumulator (absolute,Y)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BPL $11			  ; 10 11 | Branch if positive
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	ORA $36			  ; 05 36 | Logical OR with accumulator (zero page)
	ROL $19			  ; 26 19 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_100
; Address: $DE9AD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_100:
	JSL $00360C		  ; 22 0C 36 00 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_101
; Address: $DE9AE9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_101:
	ROL $112F			; 2E 2F 11 | Rotate left (absolute)
	AND ($1E),Y		  ; 31 1E | Logical AND with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	ORA #$38			 ; 09 38 | Logical OR with accumulator (immediate)
	EOR ($1C,X)		  ; 41 1C | Exclusive OR with accumulator ((zero page,X))
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	BMI $31			  ; 30 31 | Branch if negative
	ASL $2E11			; 0E 11 2E | Arithmetic shift left (absolute)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_102
; Address: $DE9B05
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_102:
	BVC $20			  ; 50 20 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	BCC $40			  ; 90 40 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BRA $24			  ; 80 24 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_104
; Address: $DE9B22
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_104:
	JSR $3C98			; 20 98 3C | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	CPX $D828			; EC 28 D8 | Compare X register (absolute)
	BNE $88			  ; D0 88 | Branch if not equal
	BRA $7C			  ; 80 7C | Branch always
	BPL $80			  ; 10 80 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $04			  ; 10 04 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $28			  ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_105
; Address: $DE9B38
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_105:
	JSR $70D0			; 20 D0 70 | Jump to subroutine
	BRA $98			  ; 80 98 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $1F32			; 0D 32 1F | Logical OR with accumulator (absolute)
	BMI $38			  ; 30 38 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_106
; Address: $DE9B72
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_106:
	JSR $0018			; 20 18 00 | Jump to subroutine
	BPL $02			  ; 10 02 | Branch if positive
	BVC $07			  ; 50 07 | Branch if overflow clear
	BCC $0D			  ; 90 0D | Branch if carry clear
	LDY $9B00,X		  ; BC 00 9B | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_107
; Address: $DE9B80
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_107:
	ORA #$37			 ; 09 37 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	EOR ($79,X)		  ; 41 79 | Exclusive OR with accumulator ((zero page,X))
	CPY $74			  ; C4 74 | Compare Y register (zero page)
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $40			  ; 84 40 | Store Y register to zero page
	ORA ($C8),Y		  ; 11 C8 | Logical OR with accumulator ((zero page),Y)
	STX $79			  ; 86 79 | Store X register to zero page
	ASL $0A00,X		  ; 1E 00 0A | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_108
; Address: $DE9BA5
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_108:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BEQ $B0			  ; F0 B0 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $E4			  ; F0 E4 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT $E0			  ; 24 E0 | Game work RAM access
	BCS $4E			  ; B0 4E | Branch if carry set
	INC $1E0A,X		  ; FE 0A 1E | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LSR $DC10			; 4E 10 DC | Logical shift right (absolute)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA $0DE0			; 0D E0 0D | Logical OR with accumulator (absolute)
	BCS $3F			  ; B0 3F | Branch if carry set
	CPY $8D32			; CC 32 8D | Compare Y register (absolute)
	ROL $C630			; 2E 30 C6 | Rotate left (absolute)
	PLX				  ; FA | Pull X register from stack
	INC $0CFC,X		  ; FE FC 0C | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP ($9898)		  ; 6C 98 98 | Jump to address (absolute indirect)
	BVC $18			  ; 50 18 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_10B
; Address: $DE9BFC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_10B:
	SED				  ; F8 | Set decimal mode flag
	BVC $20			  ; 50 20 | Branch if overflow clear
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $7F72			; 0D 72 7F | Logical OR with accumulator (absolute)
	BVC $78			  ; 50 78 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	LDY #$3C			 ; A0 3C | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BPL $62			  ; 10 62 | Branch if positive
	BCS $07			  ; B0 07 | Branch if carry set
	BCS $0D			  ; B0 0D | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	LDA ($4F),Y		  ; B1 4F | Load from (zero page),Y into accumulator
	EOR ($71,X)		  ; 41 71 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_10C
; Address: $DE9C2B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_10C:
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	ORA $0A19,Y		  ; 19 19 0A | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BVS $0E			  ; 70 0E | Branch if overflow set
	STY $0873			; 8C 73 08 | Store Y register to absolute address
	BPL $06			  ; 10 06 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_10D
; Address: $DE9C42
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_10D:
	JSR $54E0			; 20 E0 54 | Jump to subroutine
	BCS $4C			  ; B0 4C | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $DE10			; 4E 10 DE | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	BCS $3D			  ; B0 3D | Branch if carry set
	CMP $1026,Y		  ; D9 26 10 | Compare accumulator (absolute,Y)
	BIT $6452			; 2C 52 64 | Test bits in accumulator (absolute)
	DEC $84F2			; CE F2 84 | Decrement (absolute)
	STZ $3838			; 9C 38 38 | Store zero to absolute
	STY $70			  ; 84 70 | Store Y register to zero page
	CLD				  ; D8 | Clear decimal mode flag
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_10F
; Address: $DE9C72
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_10F:
	JSR $3288			; 20 88 32 | Jump to subroutine
	BRA $C4			  ; 80 C4 | Branch always
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY #$6C			 ; C0 6C | Compare Y register (immediate)
	BRA $59			  ; 80 59 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_110
; Address: $DE9C88
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_110:
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $04			  ; 80 04 | Branch always
	BRA $04			  ; 80 04 | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BMI $E8			  ; 30 E8 | Branch if negative
	STZ $98			  ; 64 98 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_112
; Address: $DE9CB6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_112:
	JSR $4418			; 20 18 44 | Jump to subroutine
	BMI $6C			  ; 30 6C | Branch if negative
	BEQ $0C			  ; F0 0C | Branch if equal
	DEY				  ; 88 | Decrement Y register
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	CPX $44			  ; E4 44 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $D0			  ; 26 D0 | Rotate left (zero page)
	ASL $F6E4,X		  ; 1E E4 F6 | Arithmetic shift left (absolute,X)
	PEA #$C8CE		   ; F4 CE C8 | Push effective address to stack
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BRA $22			  ; 80 22 | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PEA #$C830		   ; F4 30 C8 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_113
; Address: $DE9CE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_113:
	ORA ($24),Y		  ; 11 24 | Logical OR with accumulator ((zero page),Y)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ROL $0108,X		  ; 3E 08 01 | Rotate left (absolute,X)
	BPL $04			  ; 10 04 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_114
; Address: $DE9CF2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_114:
	JSR $000A			; 20 0A 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $1901			; 0E 01 19 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $04			  ; 80 04 | Branch always
	BRA $04			  ; 80 04 | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BCC $F0			  ; 90 F0 | Branch if carry clear
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	STZ $98			  ; 64 98 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_116
; Address: $DE9D16
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_116:
	JSR $4418			; 20 18 44 | Jump to subroutine
	BMI $6C			  ; 30 6C | Branch if negative
	BEQ $0C			  ; F0 0C | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($5408)		  ; 6C 08 54 | Jump to address (absolute indirect)
	STX $4630			; 8E 30 46 | Store X register to absolute address
	INC $A4FC,X		  ; FE FC A4 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STY $5878			; 8C 78 58 | Store Y register to absolute address
	BCC $1C			  ; 90 1C | Branch if carry clear
	LDY $0040,X		  ; BC 40 00 | Load from absolute,X into Y register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	BMI $2F			  ; 30 2F | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_117
; Address: $DE9D49
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_117:
	JSR $427D			; 20 7D 42 | Hardware register operation
	ADC $7846,Y		  ; 79 46 78 | Add with carry (absolute,Y)
	BPL $7F			  ; 10 7F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	LDA				  ; BF 60 3F 00 | Load from absolute long,X into accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_118
; Address: $DE9D87
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_118:
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $5A41,X		  ; 7E 41 5A | Rotate right (absolute,X)
	ADC $24			  ; 65 24 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_119
; Address: $DE9D90
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_119:
	LDA				  ; BF 00 7F 00 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	PEA #$F20C		   ; F4 0C F2 | Push effective address to stack
	ASL $0EF2			; 0E F2 0E | Arithmetic shift left (absolute)
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CPY $18E4			; CC E4 18 | Compare Y register (absolute)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPX $12F4			; EC F4 12 | Compare X register (absolute)
	DEC $3601			; CE 01 36 | Decrement (absolute)
	SBC $FC0E,X		  ; FD 0E FC | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ASL $3F00			; 0E 00 3F | Arithmetic shift left (absolute)
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	ASL $EA			  ; 06 EA | Arithmetic shift left (zero page)
	STX $24AC			; 8E AC 24 | Store X register to absolute address
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	ASL $FE00,X		  ; 1E 00 FE | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $6C			  ; 80 6C | Branch always
	LDA				  ; BF 70 3F 00 | Load from absolute long,X into accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY $18E4			; CC E4 18 | Compare Y register (absolute)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPX $12F4			; EC F4 12 | Compare X register (absolute)
	DEX				  ; CA | Decrement X register
	AND $FDC6,X		  ; 3D C6 FD | Logical AND with accumulator (absolute,X)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ASL $3F00			; 0E 00 3F | Arithmetic shift left (absolute)
	BPL $2F			  ; 10 2F | Branch if positive
	BMI $5E			  ; 30 5E | Branch if negative
	ADC ($5C,X)		  ; 61 5C | Add with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($7D,X)		  ; 81 7D | Store accumulator to (zero page,X)
	STX $7B			  ; 86 7B | Store X register to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_11A
; Address: $DE9E64
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_11A:
	JMP $3C33			; 4C 33 3C | Jump to address
	ASL $0E03,X		  ; 1E 03 0E | Arithmetic shift left (absolute,X)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	JMP $047E			; 4C 7E 04 | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	AND $3F00,Y		  ; 39 00 3F | Logical AND with accumulator (absolute,Y)
	ADC $7900,X		  ; 7D 00 79 | Add with carry (absolute,X)
	JMP $6679			; 4C 79 66 | Jump to address
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	JMP ($203C)		  ; 6C 3C 20 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	AND $5F00,Y		  ; 39 00 5F | Logical AND with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_11C
; Address: $DE9EA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_11C:
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BMI $E8			  ; 30 E8 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_11D
; Address: $DE9EAB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_11D:
	BEQ $06			  ; F0 06 | Branch if equal
	JMP ($0060)		  ; 6C 60 00 | Jump to address (absolute indirect)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	BVS $8C			  ; 70 8C | Branch if overflow set
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BNE $10			  ; D0 10 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCS $30			  ; B0 30 | Branch if carry set
	LDY #$28			 ; A0 28 | Load immediate value into Y register
	CLD				  ; D8 | Clear decimal mode flag
	BNE $38			  ; D0 38 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BRA $30			  ; 80 30 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_11E
; Address: $DE9EDF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_11E:
	BPL $20			  ; 10 20 | Branch if positive
	CPY $F4			  ; C4 F4 | Compare Y register (zero page)
	PEA #$D808		   ; F4 08 D8 | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BCS $D0			  ; B0 D0 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $30			  ; D0 30 | Branch if not equal
	INY				  ; C8 | Increment Y register
	PEA #$C008		   ; F4 08 C0 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_11F
; Address: $DE9EFB
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_11F:
	JSR $0010			; 20 10 00 | Jump to subroutine
	STA ($7D,X)		  ; 81 7D | Store accumulator to (zero page,X)
	STX $7B			  ; 86 7B | Store X register to zero page
	JMP $3C33			; 4C 33 3C | Jump to address
	ASL $0E03,X		  ; 1E 03 0E | Arithmetic shift left (absolute,X)
	AND ($19),Y		  ; 31 19 | Logical AND with accumulator ((zero page),Y)
	ROL $1A			  ; 26 1A | Rotate left (zero page)
	ADC $7E			  ; 65 7E | Add with carry (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	AND $3F00,Y		  ; 39 00 3F | Logical AND with accumulator (absolute,Y)
	EOR ($77),Y		  ; 51 77 | Exclusive OR with accumulator ((zero page),Y)
	JMP $077B			; 4C 7B 07 | Jump to address
	RTI				  ; 40 | Return from interrupt
	BVC $5D			  ; 50 5D | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_120
; Address: $DE9F2B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_120:
	JSL $3F0D6A		  ; 22 6A 0D 3F | Jump to subroutine long
	ROR $3F00,X		  ; 7E 00 3F | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	AND $1102,X		  ; 3D 02 11 | Logical AND with accumulator (absolute,X)
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BNE $10			  ; D0 10 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCS $30			  ; B0 30 | Branch if carry set
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BRA $30			  ; 80 30 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_121
; Address: $DE9F5E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_121:
	CLV				  ; B8 | Clear overflow flag
	BPL $20			  ; 10 20 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	CPY $F4			  ; C4 F4 | Compare Y register (zero page)
	PEA #$F408		   ; F4 08 F4 | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BCC $70			  ; 90 70 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	BMI $2E			  ; 30 2E | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_122
; Address: $DE9F89
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_122:
	JSL $604778		  ; 22 78 47 60 | Jump to subroutine long
	JMP $000B63		  ; 5C 63 0B 00 | Jump to address long
	ROL $7C13			; 2E 13 7C | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $0D20			; 2D 20 0D | Logical AND with accumulator (absolute)
	BPL $1E			  ; 10 1E | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	STA ($75),Y		  ; 91 75 | Store accumulator to (zero page),Y
	NOP				  ; EA | No operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_124
; Address: $DE9FB4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_124:
	JSR $2301			; 20 01 23 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA $4C92			; 0D 92 4C | Logical OR with accumulator (absolute)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LSR $6E61,X		  ; 5E 61 6E | Logical shift right (absolute,X)
	ADC ($35),Y		  ; 71 35 | Add with carry ((zero page),Y)
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	AND $011E			; 2D 1E 01 | Logical AND with accumulator (absolute)
	LSR $7001			; 4E 01 70 | Logical shift right (absolute)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	PEA #$540C		   ; F4 0C 54 | Push effective address to stack
	JMP ($FEC2)		  ; 6C C2 FE | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_125
; Address: $DE9FEC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_125:
	JSL $D4C23E		  ; 22 3E C2 D4 | Jump to subroutine long
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_126
; Address: $DE9FF9
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_126:
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPX #$DE			 ; E0 DE | Compare X register (immediate)
	BMI $3C			  ; 30 3C | Branch if negative
	BPL $52			  ; 10 52 | Branch if positive
	BCS $08			  ; B0 08 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	BIT $543E			; 2C 3E 54 | Test bits in accumulator (absolute)
	SEP #$8F			 ; E2 8F | Set processor status bits
	LDA $4D46,X		  ; BD 46 4D | Load from absolute,X into accumulator
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $1F00			; 2E 00 1F | Rotate left (absolute)
	JMP $4EB0			; 4C B0 4E | Jump to address
	BMI $7E			  ; 30 7E | Branch if negative
	ROR $5A92			; 6E 92 5A | Rotate right (absolute)
	LDX $24			  ; A6 24 | Load from zero page into X register
	BMI $F8			  ; 30 F8 | Branch if negative
	JMP $7CB0			; 4C B0 7C | Jump to address
	BRA $72			  ; 80 72 | Branch always
	BRA $0E			  ; 80 0E | Branch always
	BRA $EE			  ; 80 EE | Branch always
	BPL $DE			  ; 10 DE | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_127
; Address: $DEA03B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_127:
	JSR $00C8			; 20 C8 00 | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $0D20			; 2D 20 0D | Logical AND with accumulator (absolute)
	BPL $1E			  ; 10 1E | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	SBC ($BD),Y		  ; F1 BD | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_129
; Address: $DEA054
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_129:
	JSR $6301			; 20 01 63 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ROL $3200,X		  ; 3E 00 32 | Rotate left (absolute,X)
	ORA $B452			; 0D 52 B4 | Logical OR with accumulator (absolute)
	BCS $08			  ; B0 08 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	BIT $543C			; 2C 3C 54 | Test bits in accumulator (absolute)
	INC $89			  ; E6 89 | Increment (zero page)
	LDX $4957			; AE 57 49 | Load from absolute address into X register
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ROL $1F00			; 2E 00 1F | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	BIT $3900			; 2C 00 39 | Test bits in accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_12A
; Address: $DEA0A1
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_12A:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($11,X)		  ; 41 11 | Exclusive OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BPL $13			  ; 10 13 | Branch if positive
	ORA $2E0F,Y		  ; 19 0F 2E | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $116E			; 0E 6E 11 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY $1C00			; CC 00 1C | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_12B
; Address: $DEA0FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_12B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BPL $68			  ; 10 68 | Branch if positive
	BPL $50			  ; 10 50 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_12C
; Address: $DEA106
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_12C:
	BEQ $20			  ; F0 20 | Branch if equal
	WDM #$40			 ; 42 40 | Reserved instruction
	REP #$C0			 ; C2 C0 | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	PEA #$F8F8		   ; F4 F8 F8 | Push effective address to stack
	BEQ $FC			  ; F0 FC | Branch if equal
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	INX				  ; E8 | Increment X register
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $9C			  ; F0 9C | Branch if equal
	BMI $64			  ; 30 64 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_12D
; Address: $DEA12F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_12D:
	JSR $F0F8			; 20 F8 F0 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_12E
; Address: $DEA138
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_12E:
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	WDM #$02			 ; 42 02 | Reserved instruction
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BIT $2F1B			; 2C 1B 2F | Test bits in accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $68			  ; 10 68 | Branch if positive
	BPL $50			  ; 10 50 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_12F
; Address: $DEA166
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_12F:
	BEQ $20			  ; F0 20 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	PEA #$00F4		   ; F4 F4 00 | Push effective address to stack
	AND $2600,X		  ; 3D 00 26 | Logical AND with accumulator (absolute,X)
	ORA $0001,X		  ; 1D 01 00 | Logical OR with accumulator (absolute,X)
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	ORA $1805,X		  ; 1D 05 18 | Logical OR with accumulator (absolute,X)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	BVC $10			  ; 50 10 | Branch if overflow clear
	EOR $0211,Y		  ; 59 11 02 | Exclusive OR with accumulator (absolute,Y)
	ASL $1F07			; 0E 07 1F | Arithmetic shift left (absolute)
	EOR $2301			; 4D 01 23 | Exclusive OR with accumulator (absolute)
	ORA $0C12			; 0D 12 0C | Logical OR with accumulator (absolute)
	ORA $0406			; 0D 06 04 | Logical OR with accumulator (absolute)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_130
; Address: $DEA1EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_130:
	CLD				  ; D8 | Clear decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_131
; Address: $DEA1FC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_131:
	JSR $1000			; 20 00 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	BCS $10			  ; B0 10 | Branch if carry set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $90			  ; 80 90 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_132
; Address: $DEA20C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_132:
	JSR $1060			; 20 60 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_133
; Address: $DEA214
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_133:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BRA $14			  ; 80 14 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BEQ $20			  ; F0 20 | Branch if equal
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_134
; Address: $DEA22F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_134:
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $1805,X		  ; 1D 05 18 | Logical OR with accumulator (absolute,X)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0F13			; 0E 13 0F | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $1011,X		  ; 1E 11 10 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_135
; Address: $DEA26A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_135:
	JSL $00271D		  ; 22 1D 27 00 | Jump to subroutine long
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $110E			; 0E 0E 11 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_136
; Address: $DEA280
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_136:
	RTI				  ; 40 | Return from interrupt
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	BCS $10			  ; B0 10 | Branch if carry set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $90			  ; 80 90 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_137
; Address: $DEA294
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_137:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_138
; Address: $DEA2A0
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_138:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BMI $E8			  ; 30 E8 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY $7670			; CC 70 76 | Compare Y register (absolute)
	JMP $1800			; 4C 00 18 | Jump to address
	BPL $08			  ; 10 08 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ROL $150C,X		  ; 3E 0C 15 | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0100,Y		  ; 19 00 01 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $0608			; 0D 08 06 | Logical OR with accumulator (absolute)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	EOR $1F3F			; 4D 3F 1F | Exclusive OR with accumulator (absolute)
	STY $04			  ; 84 04 | Store Y register to zero page
	BPL $3C			  ; 10 3C | Branch if positive
	ORA $2E0F,Y		  ; 19 0F 2E | Logical OR with accumulator (absolute,Y)
	ROL $0E4F,X		  ; 3E 4F 0E | Rotate left (absolute,X)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_139
; Address: $DEA324
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_139:
	SED				  ; F8 | Set decimal mode flag
	CPY $BC00			; CC 00 BC | Compare Y register (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	BMI $A8			  ; 30 A8 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	BPL $00			  ; 10 00 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $58			  ; F0 58 | Branch if equal
	BCS $10			  ; B0 10 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_13B
; Address: $DEA349
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_13B:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	AND $22			  ; 25 22 | Logical AND with accumulator (zero page)
	BPL $C8			  ; 10 C8 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	BEQ $98			  ; F0 98 | Branch if equal
	INX				  ; E8 | Increment X register
	BMI $54			  ; 30 54 | Branch if negative
	BMI $78			  ; 30 78 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BMI $30			  ; 30 30 | Branch if negative
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $0608			; 0D 08 06 | Logical OR with accumulator (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	BVC $13			  ; 50 13 | Branch if overflow clear
	CPY $46			  ; C4 46 | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_13C
; Address: $DEA396
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_13C:
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	ROL $211F			; 2E 1F 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_13D
; Address: $DEA3A1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_13D:
	JSR $0C0A			; 20 0A 0C | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $74			  ; F0 74 | Branch if equal
	BMI $38			  ; 30 38 | Branch if negative
	BVS $E0			  ; 70 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_13E
; Address: $DEA3B4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_13E:
	JSR $C024			; 20 24 C0 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $083F			; 0E 3F 08 | Arithmetic shift left (absolute)
	BPL $7F			  ; 10 7F | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	STA ($6F),Y		  ; 91 6F | Store accumulator to (zero page),Y
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BPL $04			  ; 10 04 | Branch if positive
	BMI $01			  ; 30 01 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	STA				  ; 9F 27 57 23 | Store accumulator to absolute long,X
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_13F
; Address: $DEA410
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_13F:
	JSR $4000			; 20 00 40 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_140
; Address: $DEA429
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_140:
	JSR $10F8			; 20 F8 10 | Jump to subroutine
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BCS $10			  ; B0 10 | Branch if carry set
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_142
; Address: $DEA442
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_142:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$D60C		   ; F4 0C D6 | Push effective address to stack
	BIT $B6C1			; 2C C1 B6 | Test bits in accumulator (absolute)
	STA $00FA			; 8D FA 00 | Store accumulator to absolute address
	BMI $00			  ; 30 00 | Branch if negative
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	CMP $FEF6,X		  ; DD F6 FE | Compare accumulator (absolute,X)
	PEA #$C0F4		   ; F4 F4 C0 | Push effective address to stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_143
; Address: $DEA46F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_143:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_144
; Address: $DEA47E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_144:
	JSR $3F70			; 20 70 3F | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $2F			  ; 10 2F | Branch if positive
	BMI $6B			  ; 30 6B | Branch if negative
	ADC $5FB1			; 6D B1 5F | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_145
; Address: $DEA496
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_145:
	JSR $4001			; 20 01 40 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	INC $A25C,X		  ; FE 5C A2 | Increment (absolute,X)
	BIT #$F6			 ; 89 F6 | Test bits in accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BCC $08			  ; 90 08 | Branch if carry clear
	LDY #$0C			 ; A0 0C | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_146
; Address: $DEA4E9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_146:
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $1B			  ; 06 1B | Arithmetic shift left (zero page)
	ORA $0C15			; 0D 15 0C | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_147
; Address: $DEA527
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_147:
	JSR $10FC			; 20 FC 10 | Jump to subroutine
	BRA $FE			  ; 80 FE | Branch always
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_148
; Address: $DEA536
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_148:
	JSR $1060			; 20 60 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BRA $C8			  ; 80 C8 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY $D034			; CC 34 D0 | Compare Y register (absolute)
	STZ $C6			  ; 64 C6 | Store zero to zero page
	CPX $FC30			; EC 30 FC | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BRA $7C			  ; 80 7C | Branch always
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $EA74,X		  ; 9E 74 EA | Store zero to absolute,X
	STZ $1C			  ; 64 1C | Store zero to zero page
	BPL $C8			  ; 10 C8 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_14A
; Address: $DEA56C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_14A:
	JSR $E000			; 20 00 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_14B
; Address: $DEA57A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_14B:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_14C
; Address: $DEA591
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_14C:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $2707,Y		  ; 19 07 27 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_14D
; Address: $DEA5A8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_14D:
	JSR $4D00			; 20 00 4D | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPY $D034			; CC 34 D0 | Compare Y register (absolute)
	STZ $C6			  ; 64 C6 | Store zero to zero page
	CPX $FC30			; EC 30 FC | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BRA $7C			  ; 80 7C | Branch always
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_14E
; Address: $DEA5CF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_14E:
	JSR $0002			; 20 02 00 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_151
; Address: $DEA5E9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_151:
	JSR $6068			; 20 68 60 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_152
; Address: $DEA5F8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_152:
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_153
; Address: $DEA5FE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_153:
	BPL $30			  ; 10 30 | Branch if positive
	AND $0006,X		  ; 3D 06 00 | Logical AND with accumulator (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $3B			  ; 10 3B | Branch if positive
	ORA $091C			; 0D 1C 09 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $3F06			; 0D 06 3F | Logical OR with accumulator (absolute)
	ORA ($6F),Y		  ; 11 6F | Logical OR with accumulator ((zero page),Y)
	BMI $4F			  ; 30 4F | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_154
; Address: $DEA63C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_154:
	BPL $00			  ; 10 00 | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR $358D			; 4E 8D 35 | Logical shift right (absolute)
	BIT $210C			; 2C 0C 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_156
; Address: $DEA669
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_156:
	JSR $80F8			; 20 F8 80 | Jump to subroutine
	LDY $0060,X		  ; BC 60 00 | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_157
; Address: $DEA678
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_157:
	JSR $80A0			; 20 A0 80 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	BCC $00			  ; 90 00 | Branch if carry clear
	BCS $38			  ; B0 38 | Branch if carry set
	BCC $18			  ; 90 18 | Branch if carry clear
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$F68C		   ; F4 8C F6 | Push effective address to stack
	SBC ($16,X)		  ; E1 16 | Subtract with carry ((zero page,X))
	CMP $007A			; CD 7A 00 | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	EOR $BE76			; 4D 76 BE | Exclusive OR with accumulator (absolute)
	PEA #$C4C0		   ; F4 C0 C4 | Push effective address to stack
	BMI $64			  ; 30 64 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_159
; Address: $DEA6AF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_159:
	JSR $0080			; 20 80 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_15A
; Address: $DEA6BE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_15A:
	JSR $0670			; 20 70 06 | Jump to subroutine
	BPL $3F			  ; 10 3F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $32			  ; 10 32 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $031F			; 0D 1F 03 | Logical OR with accumulator (absolute)
	BVC $03			  ; 50 03 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_15B
; Address: $DEA6EA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_15B:
	BRA $48			  ; 80 48 | Branch always
	BIT $0898			; 2C 98 08 | Test bits in accumulator (absolute)
	BIT $3748			; 2C 48 37 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	LDY #$27			 ; A0 27 | Load immediate value into Y register
	BVC $20			  ; 50 20 | Branch if overflow clear
	ROR $FF01,X		  ; 7E 01 FF | Rotate right (absolute,X)
	SBC $FD6B,X		  ; FD 6B FD | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SBC $7820,X		  ; FD 20 78 | Subtract with carry (absolute,X)
	BMI $6B			  ; 30 6B | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$70			 ; 42 70 | Reserved instruction

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_15D
; Address: $DEA722
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_15D:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_15F
; Address: $DEA73B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_15F:
	STY $1808			; 8C 08 18 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register
	ASL $C8			  ; 06 C8 | Arithmetic shift left (zero page)
	BPL $CD			  ; 10 CD | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_160
; Address: $DEA753
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_160:
	JSR $4000			; 20 00 40 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPY $1230			; CC 30 12 | Compare Y register (absolute)
	CPX $08FA			; EC FA 08 | Compare X register (absolute)
	BEQ $04			  ; F0 04 | Branch if equal
	STZ $98			  ; 64 98 | Store zero to zero page
	JMP ($D4A8)		  ; 6C A8 D4 | Jump to address (absolute indirect)
	INY				  ; C8 | Increment Y register
	STZ $90			  ; 64 90 | Store zero to zero page
	BMI $88			  ; 30 88 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_161
; Address: $DEA76F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_161:
	JSR $10F8			; 20 F8 10 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_162
; Address: $DEA779
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_162:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_163
; Address: $DEA78A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_163:
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	JMP $0348F8		  ; 5C F8 48 03 | Jump to address long
	BPL $33			  ; 10 33 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	BPL $48			  ; 10 48 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_164
; Address: $DEA7A2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_164:
	JSR $3E00			; 20 00 3E | Jump to subroutine
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA $357F,Y		  ; 19 7F 35 | Logical OR with accumulator (absolute,Y)
	ROR $7F21,X		  ; 7E 21 7F | Rotate right (absolute,X)
	BPL $3D			  ; 10 3D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $3518,Y		  ; 19 18 35 | Logical OR with accumulator (absolute,Y)
	AND ($38,X)		  ; 21 38 | Logical AND with accumulator ((zero page,X))
	BPL $14			  ; 10 14 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA $4010,Y		  ; 19 10 40 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_165
; Address: $DEA7D3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_165:
	JSR $4000			; 20 00 40 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CPX $00F6			; EC F6 00 | Compare X register (absolute)
	ORA $E4			  ; 05 E4 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEY				  ; 88 | Decrement Y register
	CPX $B4E8			; EC E8 B4 | Compare X register (absolute)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_166
; Address: $DEA7EB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_166:
	JSR $2088			; 20 88 20 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $1300			; 0E 00 13 | Arithmetic shift left (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_167
; Address: $DEA821
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_167:
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	PEA #$FB78		   ; F4 78 FB | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_168
; Address: $DEA84D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_168:
	JSL $0C0079		  ; 22 79 00 0C | Jump to subroutine long
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_16A
; Address: $DEA862
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_16A:
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $C818,X		  ; FE 18 C8 | Increment (absolute,X)
	STZ $00			  ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_16C
; Address: $DEA87B
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_16C:
	JSL $120000		  ; 22 00 00 12 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INC $3C			  ; E6 3C | Increment (zero page)
	INC $BC10,X		  ; FE 10 BC | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	JMP $3C5480		  ; 5C 80 54 3C | Jump to address long
	CPY $F44C			; CC 4C F4 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	CPY $C400			; CC 00 C4 | Compare Y register (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	BVS $3C			  ; 70 3C | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CPY $76B6			; CC B6 76 | Compare Y register (absolute)
	SEP #$E6			 ; E2 E6 | Set processor status bits
	LDX $A6B2			; AE B2 A6 | Load from absolute address into X register
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $98			  ; E6 98 | Increment (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	CLC				  ; 18 | Clear carry flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_16D
; Address: $DEA8C7
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_16D:
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0B			  ; 10 0B | Branch if positive
	ASL $000B			; 0E 0B 00 | Arithmetic shift left (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $050D			; 0E 0D 05 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	ADC $7E1C,X		  ; 7D 1C 7E | Add with carry (absolute,X)
	ADC $7E26,X		  ; 7D 26 7E | Add with carry (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	ORA $3616,X		  ; 1D 16 36 | Logical OR with accumulator (absolute,X)
	AND $3827,Y		  ; 39 27 38 | Logical AND with accumulator (absolute,Y)
	ORA ($14),Y		  ; 11 14 | Logical OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	INC $3C			  ; E6 3C | Increment (zero page)
	INC $BC10,X		  ; FE 10 BC | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	STX $3C			  ; 86 3C | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_16E
; Address: $DEA91A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_16E:
	STZ $00			  ; 64 00 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BMI $E5			  ; 30 E5 | Branch if negative
	LDX #$8E			 ; A2 8E | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	CPY $180C			; CC 0C 18 | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	BNE $30			  ; D0 30 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_170
; Address: $DEA930
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_170:
	JSR $7038			; 20 38 70 | Jump to subroutine
	CPY $1838			; CC 38 18 | Compare Y register (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $3B06,X		  ; 3D 06 3B | Logical AND with accumulator (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BPL $04			  ; 10 04 | Branch if positive
	ORA $1D07,Y		  ; 19 07 1D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_171
; Address: $DEA965
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_171:
	ASL $4F			  ; 06 4F | Arithmetic shift left (zero page)
	AND ($67,X)		  ; 21 67 | Logical AND with accumulator ((zero page,X))
	BPL $C2			  ; 10 C2 | Branch if positive
	EOR $64B3			; 4D B3 64 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_172
; Address: $DEA976
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_172:
	JSR $3010			; 20 10 30 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $0710			; 4E 10 07 | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ORA ($29),Y		  ; 11 29 | Logical OR with accumulator ((zero page),Y)
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)
	ORA #$2D			 ; 09 2D | Logical OR with accumulator (immediate)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	ORA $1F07,Y		  ; 19 07 1F | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_173
; Address: $DEA9A2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_173:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_174
; Address: $DEA9AF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_174:
	BCC $00			  ; 90 00 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_176
; Address: $DEA9BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_176:
	JSR $4800			; 20 00 48 | Jump to subroutine
	BEQ $98			  ; F0 98 | Branch if equal
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_177
; Address: $DEA9C6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_177:
	PEA #$EA88		   ; F4 88 EA | Push effective address to stack
	EOR ($D2,X)		  ; 41 D2 | Exclusive OR with accumulator ((zero page,X))
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $0076			; 2C 76 00 | Test bits in accumulator (absolute)
	CPX $12			  ; E4 12 | Compare X register (zero page)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	STY $807E			; 8C 7E 80 | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	LDA $208F20		  ; AF 20 8F 20 | Load from absolute long address into accumulator
	ASL $0200,X		  ; 1E 00 02 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_178
; Address: $DEA9F1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_178:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	BVC $04			  ; 50 04 | Branch if overflow clear
	BVC $02			  ; 50 02 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	BMI $59			  ; 30 59 | Branch if negative
	AND ($3E),Y		  ; 31 3E | Logical AND with accumulator ((zero page),Y)
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	AND $1513			; 2D 13 15 | Logical AND with accumulator (absolute)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $001F,X		  ; 1E 1F 00 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $80			  ; 84 80 | Store Y register to zero page
	STZ $98			  ; 64 98 | Store zero to zero page
	LSR $9688			; 4E 88 96 | Logical shift right (absolute)
	DEY				  ; 88 | Decrement Y register
	ROR $90			  ; 66 90 | Rotate right (zero page)
	BMI $8C			  ; 30 8C | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_179
; Address: $DEAA2F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_179:
	JSR $F018			; 20 18 F0 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $0620			; 0E 20 06 | Arithmetic shift left (absolute)
	BPL $2E			  ; 10 2E | Branch if positive
	ORA ($1D),Y		  ; 11 1D | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $33			  ; 30 33 | Branch if negative
	ADC ($5E),Y		  ; 71 5E | Add with carry ((zero page),Y)
	LDA ($2E),Y		  ; B1 2E | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_17A
; Address: $DEAA70
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_17A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BPL $8C			  ; 10 8C | Branch if positive
	STX $4E0E			; 8E 0E 4E | Store X register to absolute address
	ASL $4790			; 0E 90 47 | Arithmetic shift left (absolute)
	STZ $60			  ; 64 60 | Store zero to zero page
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	ORA $060B			; 0D 0B 06 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_17B
; Address: $DEAA94
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_17B:
	CLC				  ; 18 | Clear carry flag
	ORA $0D0D,X		  ; 1D 0D 0D | Logical OR with accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_17C
; Address: $DEAAA9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_17C:
	JSR $20F8			; 20 F8 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_17D
; Address: $DEAAB8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_17D:
	JSR $2070			; 20 70 20 | Jump to subroutine
	BMI $40			  ; 30 40 | Branch if negative
	BVS $04			  ; 70 04 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_17E
; Address: $DEAAC0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_17E:
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	LDY $D454,X		  ; BC 54 D4 | Load from absolute,X into Y register
	ASL $3ACA			; 0E CA 3A | Arithmetic shift left (absolute)
	STA ($70,X)		  ; 81 70 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $02			  ; 80 02 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND #$88			 ; 29 88 | Logical AND with accumulator (immediate)
	BCS $7E			  ; B0 7E | Branch if carry set
	BVS $78			  ; 70 78 | Branch if overflow set
	BVS $0A			  ; 70 0A | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	PEA #$6808		   ; F4 08 68 | Push effective address to stack
	BCC $68			  ; 90 68 | Branch if carry clear
	BVS $90			  ; 70 90 | Branch if overflow set
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPX #$CC			 ; E0 CC | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BCC $70			  ; 90 70 | Branch if carry clear
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BPL $2E			  ; 10 2E | Branch if positive
	ORA ($3D),Y		  ; 11 3D | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_17F
; Address: $DEAB07
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_17F:
	ROL				  ; 2A | Rotate left (accumulator)
	BVS $53			  ; 70 53 | Branch if overflow set
	JMP $E10E81		  ; 5C 81 0E E1 | Jump to address long
	ROR $0020			; 6E 20 00 | Rotate right (absolute)
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	BPL $AC			  ; 10 AC | Branch if positive
	ROR $1E0E,X		  ; 7E 0E 1E | Rotate right (absolute,X)
	ASL $00F8			; 0E F8 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	CPY $8E3E			; CC 3E 8E | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	STA $0474			; 8D 74 04 | Store accumulator to absolute address
	BRA $00			  ; 80 00 | Branch always
	BRA $04			  ; 80 04 | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	DEY				  ; 88 | Decrement Y register
	AND ($B0),Y		  ; 31 B0 | Logical AND with accumulator ((zero page),Y)
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0E02			; 0E 02 0E | Arithmetic shift left (absolute)
	ORA #$3E			 ; 09 3E | Logical OR with accumulator (immediate)
	AND ($07,X)		  ; 21 07 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_180
; Address: $DEAB7E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_180:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	BPL $0D			  ; 10 0D | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA $0401			; 0D 01 04 | Logical OR with accumulator (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_186
; Address: $DEABC0
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_186:
	JSR $10F8			; 20 F8 10 | Jump to subroutine
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $30			  ; F0 30 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BPL $40			  ; 10 40 | Branch if positive
	INY				  ; C8 | Increment Y register
	CPX #$EA			 ; E0 EA | Compare X register (immediate)
	BVS $8C			  ; 70 8C | Branch if overflow set
	CMP $8646			; CD 46 86 | Compare accumulator (absolute)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SEC				  ; 38 | Set carry flag
	STZ $98			  ; 64 98 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BCC $DC			  ; 90 DC | Branch if carry clear
	BVS $61			  ; 70 61 | Branch if overflow set
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BVS $F4			  ; 70 F4 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BVS $1F			  ; 70 1F | Branch if overflow set
	ASL $0E02			; 0E 02 0E | Arithmetic shift left (absolute)
	ORA #$3E			 ; 09 3E | Logical OR with accumulator (immediate)
	BMI $03			  ; 30 03 | Branch if negative
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	ASL $0C13			; 0E 13 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_187
; Address: $DEAC2C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_187:
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	ASL $1103			; 0E 03 11 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $0F06			; 0E 06 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_188
; Address: $DEAC40
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_188:
	JSR $10F8			; 20 F8 10 | Jump to subroutine
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BVS $30			  ; 70 30 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $04			  ; 70 04 | Branch if overflow set
	BPL $40			  ; 10 40 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_189
; Address: $DEAC5E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_189:
	CPX $0870			; EC 70 08 | Compare X register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	BMI $C0			  ; 30 C0 | Branch if negative
	BMI $80			  ; 30 80 | Branch if negative
	BVC $28			  ; 50 28 | Branch if overflow clear
	BCC $D4			  ; 90 D4 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	SEP #$30			 ; E2 30 | Set processor status bits
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BVC $34			  ; 50 34 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	PEA #$F8F8		   ; F4 F8 F8 | Push effective address to stack
	BNE $D0			  ; D0 D0 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_18A
; Address: $DEAC9E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_18A:
	JSR $1400			; 20 00 14 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	ORA $1530,X		  ; 1D 30 15 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $3308			; 0E 08 33 | Arithmetic shift left (absolute)
	AND ($7C),Y		  ; 31 7C | Logical AND with accumulator ((zero page),Y)
	AND ($5E),Y		  ; 31 5E | Logical AND with accumulator ((zero page),Y)
	AND $0020			; 2D 20 00 | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_18C
; Address: $DEACBC
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_18C:
	STX $4C0E			; 8E 0E 4C | Store X register to absolute address
	ORA $6592			; 0D 92 65 | Logical OR with accumulator (absolute)
	EOR $60			  ; 45 60 | Exclusive OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $1528,Y		  ; 19 28 15 | Logical OR with accumulator (absolute,Y)
	ORA $060B			; 0D 0B 06 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	AND $1718			; 2D 18 17 | Logical AND with accumulator (absolute)
	AND $1F1B,X		  ; 3D 1B 1F | Logical AND with accumulator (absolute,X)
	ORA $0D0D,X		  ; 1D 0D 0D | Logical OR with accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_18F
; Address: $DEACFB
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_18F:
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	BEQ $5C			  ; F0 5C | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	PEA #$CE14		   ; F4 14 CE | Push effective address to stack
	TXA				  ; 8A | Transfer X register to accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BVC $00			  ; 50 00 | Branch if overflow clear
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BMI $7E			  ; 30 7E | Branch if negative
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $0A			  ; F0 0A | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	PEA #$E808		   ; F4 08 E8 | Push effective address to stack
	BPL $48			  ; 10 48 | Branch if positive
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPX #$CC			 ; E0 CC | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_190
; Address: $DEAD37
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_190:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	ORA $1530,X		  ; 1D 30 15 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $7328			; 2E 28 73 | Rotate left (absolute)
	EOR ($5C),Y		  ; 51 5C | Exclusive OR with accumulator ((zero page),Y)
	STA ($0E,X)		  ; 81 0E | Store accumulator to (zero page,X)
	REP #$6D			 ; C2 6D | Reset processor status bits

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_191
; Address: $DEAD50
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_191:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	ORA ($94,X)		  ; 01 94 | Logical OR with accumulator ((zero page,X))
	BPL $AE			  ; 10 AE | Branch if positive
	ROR $1C0E,X		  ; 7E 0E 1C | Rotate right (absolute,X)
	ORA $0552			; 0D 52 05 | Logical OR with accumulator (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BIT $2F11			; 2C 11 2F | Test bits in accumulator (absolute)
	BPL $17			  ; 10 17 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $070D			; 0D 0D 07 | Logical OR with accumulator (absolute)
	BIT $3005			; 2C 05 30 | Test bits in accumulator (absolute)
	ORA $1F38,X		  ; 1D 38 1F | Logical OR with accumulator (absolute,X)
	ORA $1F1F,X		  ; 1D 1F 1F | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BEQ $5C			  ; F0 5C | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	BEQ $10			  ; F0 10 | Branch if equal
	CPY $3E8C			; CC 8C 3E | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack
	ORA $04F4			; 0D F4 04 | Logical OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ADC ($30),Y		  ; 71 30 | Add with carry ((zero page),Y)
	ADC ($F0),Y		  ; 71 F0 | Add with carry ((zero page),Y)
	BEQ $09			  ; F0 09 | Branch if equal
	INC $29			  ; E6 29 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_192
; Address: $DEADA3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_192:
	JSL $000806		  ; 22 06 08 00 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	BCS $D0			  ; B0 D0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_194
; Address: $DEADAE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_194:
	BRA $00			  ; 80 00 | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	LDY $F8D8,X		  ; BC D8 F8 | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	BCS $B0			  ; B0 B0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_195
; Address: $DEADC0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_195:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	AND $7E0E,Y		  ; 39 0E 7E | Logical AND with accumulator (absolute,Y)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDY $FA03,X		  ; BC 03 FA | Load from absolute,X into Y register
	ORA $F1			  ; 05 F1 | Logical OR with accumulator (zero page)
	ASL $0D72			; 0E 72 0D | Arithmetic shift left (absolute)
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BVC $75			  ; 50 75 | Branch if overflow clear
	ROR $2D00			; 6E 00 2D | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $AA			  ; 10 AA | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $331D			; 6E 1D 33 | Rotate right (absolute)
	ASL $142A,X		  ; 1E 2A 14 | Arithmetic shift left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_196
; Address: $DEAE16
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_196:
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BNE $30			  ; D0 30 | Branch if not equal
	BRA $70			  ; 80 70 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_197
; Address: $DEAE34
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_197:
	JSR $1080			; 20 80 10 | Jump to subroutine
	BRA $10			  ; 80 10 | Branch always
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $1E			  ; 80 1E | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_198
; Address: $DEAE41
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_198:
	BEQ $79			  ; F0 79 | Branch if equal
	INC $F7			  ; E6 F7 | Increment (zero page)
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	BMI $3B			  ; 30 3B | Branch if negative
	CPY $47			  ; C4 47 | Compare Y register (zero page)
	CLV				  ; B8 | Clear overflow flag
	STX $4C70			; 8E 70 4C | Store X register to absolute address
	BCS $04			  ; B0 04 | Branch if carry set
	ASL $1900			; 0E 00 19 | Arithmetic shift left (absolute)
	PEA #$C602		   ; F4 02 C6 | Push effective address to stack
	TSX				  ; BA | Transfer stack pointer to X register
	BCS $00			  ; B0 00 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	LDY $56A9			; AC A9 56 | Load from absolute address into Y register
	ROR $B8			  ; 66 B8 | Rotate right (zero page)
	DEC $6C			  ; C6 6C | Decrement (zero page)
	CPY $78			  ; C4 78 | Compare Y register (zero page)
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	DEY				  ; 88 | Decrement Y register
	BPL $38			  ; 10 38 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ADC $9E0E,Y		  ; 79 0E 9E | Add with carry (absolute,Y)
	BCS $0C			  ; B0 0C | Branch if carry set
	SEP #$1D			 ; E2 1D | Set processor status bits
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	ORA $0120			; 0D 20 01 | Logical OR with accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	EOR $2E00,X		  ; 5D 00 2E | Exclusive OR with accumulator (absolute,X)
	ORA $8000			; 0D 00 80 | Logical OR with accumulator (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BNE $30			  ; D0 30 | Branch if not equal
	BRA $70			  ; 80 70 | Branch always
	BCC $70			  ; 90 70 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_19A
; Address: $DEAED7
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_19A:
	BRA $10			  ; 80 10 | Branch always
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $1C			  ; 80 1C | Branch always
	BEQ $7E			  ; F0 7E | Branch if equal
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPY $300F			; CC 0F 30 | Compare Y register (absolute)
	AND $5FC0,X		  ; 3D C0 5F | Logical AND with accumulator (absolute,X)
	LDY #$8F			 ; A0 8F | Load immediate value into Y register
	BVS $4E			  ; 70 4E | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	CPY $0A			  ; C4 0A | Compare Y register (zero page)
	LDX $7600			; AE 00 76 | Load from absolute address into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	BPL $1D			  ; 10 1D | Branch if positive
	ASL $1401,X		  ; 1E 01 14 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1900			; 0E 00 19 | Arithmetic shift left (absolute)
	ORA $0702			; 0D 02 07 | Logical OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $6C			  ; 05 6C | Logical OR with accumulator (zero page)
	EOR ($3E),Y		  ; 51 3E | Exclusive OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	ROL $1C00			; 2E 00 1C | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_19B
; Address: $DEAF5A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_19B:
	JSR $1C00			; 20 00 1C | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_19C
; Address: $DEAF6C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_19C:
	CLC				  ; 18 | Clear carry flag
	BEQ $40			  ; F0 40 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	BMI $00			  ; 30 00 | Branch if negative
	LDY $1800			; AC 00 18 | Load from absolute address into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_19F
; Address: $DEAF86
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_19F:
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	BVC $78			  ; 50 78 | Branch if overflow clear
	BVS $90			  ; 70 90 | Branch if overflow set
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A0
; Address: $DEAF9F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A0:
	JSR $A030			; 20 30 A0 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	BCC $B0			  ; 90 B0 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	BCC $68			  ; 90 68 | Branch if carry clear
	CPX $18			  ; E4 18 | Compare X register (zero page)
	ROL $18			  ; 26 18 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	PEA #$6400		   ; F4 00 64 | Push effective address to stack
	STZ $00			  ; 64 00 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $3C03,Y		  ; 19 03 3C | Logical OR with accumulator (absolute,Y)
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $3B11			; 2E 11 3B | Rotate left (absolute)
	ROR $6201			; 6E 01 62 | Rotate right (absolute)
	ORA ($29),Y		  ; 11 29 | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	ASL $2D00,X		  ; 1E 00 2D | Arithmetic shift left (absolute,X)
	BPL $3D			  ; 10 3D | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $2A12			; 2C 12 2A | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A1
; Address: $DEB000
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A1:
	JSR $D0D0			; 20 D0 D0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A2
; Address: $DEB006
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A2:
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A3
; Address: $DEB00B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A3:
	BVC $7A			  ; 50 7A | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	CPY $0008			; CC 08 00 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	BPL $F0			  ; 10 F0 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BCC $48			  ; 90 48 | Branch if carry clear
	BCS $30			  ; B0 30 | Branch if carry set
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A4
; Address: $DEB036
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A4:
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $02			  ; 10 02 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	ORA $077E			; 0D 7E 07 | Logical OR with accumulator (absolute)
	SBC $A6			  ; E5 A6 | Subtract with carry (zero page)
	STY $D7			  ; 84 D7 | Store Y register to zero page
	INC				  ; 1A | Increment accumulator
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6340,X		  ; BD 40 63 | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	LSR $AD35,X		  ; 5E 35 AD | Logical shift right (absolute,X)
	CMP $6E2A,X		  ; DD 2A 6E | Compare accumulator (absolute,X)
	ORA $1C37,X		  ; 1D 37 1C | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A5
; Address: $DEB0A2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A5:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $70			  ; 90 70 | Branch if carry clear
	BEQ $F4			  ; F0 F4 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A6
; Address: $DEB0B4
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A6:
	JSR $1080			; 20 80 10 | Jump to subroutine
	BRA $10			  ; 80 10 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $7980,X		  ; 7E 80 79 | Rotate right (absolute,X)
	INC $37			  ; E6 37 | Increment (zero page)
	AND $7BB1			; 2D B1 7B | Logical AND with accumulator (absolute)
	BIT $78E5			; 2C E5 78 | Test bits in accumulator (absolute)
	DEX				  ; CA | Decrement X register
	SBC #$36			 ; E9 36 | Subtract with carry (immediate)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	LDX $FA00			; AE 00 FA | Load from absolute address into X register
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP ($56A9)		  ; 6C A9 56 | Jump to address (absolute indirect)
	ROR $A0			  ; 66 A0 | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $E800,X		  ; 3E 00 E8 | Rotate left (absolute,X)
	INC $C600			; EE 00 C6 | Increment (absolute)
	BRA $18			  ; 80 18 | Branch always
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	BIT $000B			; 2C 0B 00 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $02			  ; 10 02 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	ORA $679E			; 0D 9E 67 | Logical OR with accumulator (absolute)
	CPX $B4F3			; EC F3 B4 | Compare X register (absolute)
	STA $34DE			; 8D DE 34 | Store accumulator to absolute address
	ASL $6F53,X		  ; 1E 53 6F | Arithmetic shift left (absolute,X)
	JMP ($0020)		  ; 6C 20 00 | Jump to address (absolute indirect)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	LDX $7540			; AE 40 75 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A7
; Address: $DEB13C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A7:
	STA $000C00		  ; 8F 00 0C 00 | Store accumulator to absolute long address
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $70			  ; 90 70 | Branch if carry clear
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A8
; Address: $DEB154
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A8:
	JSR $1080			; 20 80 10 | Jump to subroutine
	BRA $10			  ; 80 10 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $7E			  ; 80 7E | Branch always
	CPX #$3B			 ; E0 3B | Compare X register (immediate)
	CPY $A73F			; CC 3F A7 | Compare Y register (absolute)
	ADC $21			  ; 65 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	CLI				  ; 58 | Clear interrupt disable flag
	SEP #$C8			 ; E2 C8 | Set processor status bits
	CPX $38			  ; E4 38 | Compare X register (zero page)
	ASL $6F00,X		  ; 1E 00 6F | Arithmetic shift left (absolute,X)
	LDA $C602,X		  ; BD 02 C6 | Load from absolute,X into accumulator
	CPY $10			  ; C4 10 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1A9
; Address: $DEB17E
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1A9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $090E,X		  ; 1E 0E 09 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $80			  ; 30 80 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	JMP ($F490)		  ; 6C 90 F4 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $28			  ; 80 28 | Branch always
	BVC $20			  ; 50 20 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1AA
; Address: $DEB1D2
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1AA:
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	BCS $40			  ; B0 40 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $5C2D,X		  ; 5E 2D 5C | Logical shift right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D00			; 0E 00 0D | Arithmetic shift left (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	BRA $A8			  ; 80 A8 | Branch always
	BVC $74			  ; 50 74 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1AB
; Address: $DEB209
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1AB:
	JSR $8076			; 20 76 80 | Jump to subroutine
	LSR $88			  ; 46 88 | Logical shift right (zero page)
	BMI $20			  ; 30 20 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	LDY $0800,X		  ; BC 00 08 | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1AC
; Address: $DEB245
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1AC:
	JSR $50DC			; 20 DC 50 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1AD
; Address: $DEB24E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1AD:
	BNE $40			  ; D0 40 | Branch if not equal
	BIT $5020			; 2C 20 50 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1AF
; Address: $DEB264
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1AF:
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	ORA $0006,Y		  ; 19 06 00 | Logical OR with accumulator (absolute,Y)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ASL $0604,X		  ; 1E 04 06 | Arithmetic shift left (absolute,X)
	INY				  ; C8 | Increment Y register
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B0
; Address: $DEB28B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B0:
	BEQ $26			  ; F0 26 | Branch if equal
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	DEX				  ; CA | Decrement X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BRA $08			  ; 80 08 | Branch always
	CLC				  ; 18 | Clear carry flag
	BMI $02			  ; 30 02 | Branch if negative
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEC $3A04			; CE 04 3A | Decrement (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0708			; 0D 08 07 | Logical OR with accumulator (absolute)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC $FF02			; CE 02 FF | Decrement (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	CMP $C2			  ; C5 C2 | Compare accumulator (zero page)
	ORA $7702,X		  ; 1D 02 77 | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B1
; Address: $DEB2CA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B1:
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	LDY $48			  ; A4 48 | Load from zero page into Y register
	SEI				  ; 78 | Set interrupt disable flag
	BPL $FA			  ; 10 FA | Branch if positive
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B4
; Address: $DEB2E5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B4:
	JSR $505C			; 20 5C 50 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $50			  ; F0 50 | Branch if equal
	BCS $10			  ; B0 10 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	BIT $D020			; 2C 20 D0 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BVC $DF			  ; 50 DF | Branch if overflow clear
	BPL $5F			  ; 10 5F | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B5
; Address: $DEB306
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B5:
	ROR $1910			; 6E 10 19 | Rotate right (absolute)
	ROL $40			  ; 26 40 | Rotate left (zero page)
	AND $12			  ; 25 12 | Logical AND with accumulator (zero page)
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B6
; Address: $DEB316
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B6:
	CLC				  ; 18 | Clear carry flag
	ROR $3F3F,X		  ; 7E 3F 3F | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B7
; Address: $DEB32B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B7:
	BEQ $24			  ; F0 24 | Branch if equal
	CPX #$CC			 ; E0 CC | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BRA $08			  ; 80 08 | Branch always
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ASL $0314,X		  ; 1E 14 03 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1B8
; Address: $DEB363
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1B8:
	REP #$85			 ; C2 85 | Reset processor status bits
	ORA $E302,X		  ; 1D 02 E3 | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	STX $20			  ; 86 20 | Store X register to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1BA
; Address: $DEB371
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1BA:
	SED				  ; F8 | Set decimal mode flag
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	BRA $FA			  ; 80 FA | Branch always
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1BC
; Address: $DEB388
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1BC:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	BMI $10			  ; 30 10 | Branch if negative
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ASL $2600,X		  ; 1E 00 26 | Arithmetic shift left (absolute,X)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ROR $673B,X		  ; 7E 3B 67 | Rotate right (absolute,X)
	AND ($62,X)		  ; 21 62 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1BD
; Address: $DEB3AD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1BD:
	JSR $0324			; 20 24 03 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1BE
; Address: $DEB3BA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1BE:
	JSR $2139			; 20 39 21 | PPU graphics register access
	CLC				  ; 18 | Clear carry flag
	ROL $4B00			; 2E 00 4B | Rotate left (absolute)
	ORA #$52			 ; 09 52 | Logical OR with accumulator (immediate)
	ORA ($66),Y		  ; 11 66 | Logical OR with accumulator ((zero page),Y)
	AND ($6A,X)		  ; 21 6A | Logical AND with accumulator ((zero page,X))
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ADC $3D10,X		  ; 7D 10 3D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1BF
; Address: $DEB3D8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1BF:
	JSR $143D			; 20 3D 14 | Jump to subroutine
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C1
; Address: $DEB3FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C1:
	PLA				  ; 68 | Pull accumulator from stack
	BMI $D0			  ; 30 D0 | Branch if negative
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	LDY #$D8			 ; A0 D8 | Load immediate value into Y register
	BCC $C8			  ; 90 C8 | Branch if carry clear
	BRA $D0			  ; 80 D0 | Branch always
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $80			  ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C2
; Address: $DEB416
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C2:
	JSR $3080			; 20 80 30 | Jump to subroutine
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C3
; Address: $DEB420
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C3:
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	DEY				  ; 88 | Decrement Y register
	BVS $88			  ; 70 88 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BVS $18			  ; 70 18 | Branch if overflow set
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $78			  ; 70 78 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C4
; Address: $DEB43C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C4:
	JSR $0040			; 20 40 00 | Jump to subroutine
	ROL $07			  ; 26 07 | Rotate left (zero page)
	ASL $360D,X		  ; 1E 0D 36 | Arithmetic shift left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	STZ $18			  ; 64 18 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	JMP $48EB40		  ; 5C 40 EB 48 | Jump to address long
	STZ $18			  ; 64 18 | Store zero to zero page
	JMP $287408		  ; 5C 08 74 28 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	AND $1E08,X		  ; 3D 08 1E | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C6
; Address: $DEB47A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C6:
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BMI $D0			  ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C8
; Address: $DEB485
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C8:
	JSR $1018			; 20 18 10 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	BRA $7C			  ; 80 7C | Branch always
	PHA				  ; 48 | Push accumulator to stack
	ROR				  ; 6A | Rotate right (accumulator)
	JMP $0008			; 4C 08 00 | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1C9
; Address: $DEB4A0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1C9:
	JSL $102414		  ; 22 14 24 10 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BMI $80			  ; 30 80 | Branch if negative
	BVS $04			  ; 70 04 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $10			  ; 84 10 | Store Y register to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1CA
; Address: $DEB4B0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1CA:
	CLC				  ; 18 | Clear carry flag
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	AND $0F48			; 2D 48 0F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1CB
; Address: $DEB4CE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1CB:
	JSR $0009			; 20 09 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $02			  ; 10 02 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	ORA $061A,X		  ; 1D 1A 06 | Logical OR with accumulator (absolute,X)
	ROL $6D1A,X		  ; 3E 1A 6D | Rotate left (absolute,X)
	AND #$EC			 ; 29 EC | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1CC
; Address: $DEB4EB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1CC:
	BPL $AF			  ; 10 AF | Branch if positive
	DEX				  ; CA | Decrement X register
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1CD
; Address: $DEB4F2
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1CD:
	JSL $180101		  ; 22 01 01 18 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BNE $14			  ; D0 14 | Branch if not equal
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	AND ($AE),Y		  ; 31 AE | Logical AND with accumulator ((zero page),Y)
	ORA $BC			  ; 05 BC | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	JMP ($2B12)		  ; 6C 12 2B | Jump to address (absolute indirect)
	BPL $39			  ; 10 39 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BPL $06			  ; 10 06 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	INY				  ; C8 | Increment Y register
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CPX #$16			 ; E0 16 | Compare X register (immediate)
	PEA #$F012		   ; F4 12 F0 | Push effective address to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	CLV				  ; B8 | Clear overflow flag
	LSR				  ; 4A | Logical shift right (accumulator)
	BEQ $4F			  ; F0 4F | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND $E708			; 2D 08 E7 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1CE
; Address: $DEB54D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1CE:
	JSR $8A4D			; 20 4D 8A | Jump to subroutine
	LDY $06			  ; A4 06 | Load from zero page into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	ASL $3C20,X		  ; 1E 20 3C | Arithmetic shift left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	ROR $65AC			; 6E AC 65 | Rotate right (absolute)
	LDY $33			  ; A4 33 | Load from zero page into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $42C0,X		  ; 3E C0 42 | Hardware register operation
	DEY				  ; 88 | Decrement Y register
	LDY $48			  ; A4 48 | Load from zero page into Y register
	SEI				  ; 78 | Set interrupt disable flag
	LDY $A4FC			; AC FC A4 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1CF
; Address: $DEB575
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1CF:
	INC $7EEA,X		  ; FE EA 7E | Increment (absolute,X)
	BEQ $FC			  ; F0 FC | Branch if equal
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0E72,X		  ; 1D 72 0E | Logical OR with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CMP $D851,Y		  ; D9 51 D8 | Compare accumulator (absolute,Y)
	BVS $F4			  ; 70 F4 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D0
; Address: $DEB58B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D0:
	JSR $04D7			; 20 D7 04 | Jump to subroutine
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	EOR ($05,X)		  ; 41 05 | Exclusive OR with accumulator ((zero page,X))
	BCS $06			  ; B0 06 | Branch if carry set
	BVS $07			  ; 70 07 | Branch if overflow set
	BVS $03			  ; 70 03 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BIT $0C			  ; 24 0C | Test bits in accumulator (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ADC $D6			  ; 65 D6 | Add with carry (zero page)
	ORA $FC			  ; 05 FC | Logical OR with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ROL $5C			  ; 26 5C | Rotate left (zero page)
	AND ($75,X)		  ; 21 75 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D1
; Address: $DEB5AD
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D1:
	JSL $05003E		  ; 22 3E 00 05 | Jump to subroutine long
	AND $8F			  ; 25 8F | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $2F0F			; 2E 0F 2F | Rotate left (absolute)
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	BEQ $4C			  ; F0 4C | Branch if equal
	BVC $9E			  ; 50 9E | Branch if overflow clear
	STY $0013			; 8C 13 00 | Store Y register to absolute address
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	CMP $5300,X		  ; DD 00 53 | Compare accumulator (absolute,X)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	JMP ($E00C)		  ; 6C 0C E0 | Game work RAM access
	ORA $1FC8			; 0D C8 1F | Logical OR with accumulator (absolute)
	BRA $E0			  ; 80 E0 | Game work RAM access
	STY $A06D			; 8C 6D A0 | Store Y register to absolute address
	AND ($D0),Y		  ; 31 D0 | Logical AND with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $C450			; 2E 50 C4 | Rotate left (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D2
; Address: $DEB5F0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D2:
	BRA $E0			  ; 80 E0 | Game work RAM access
	LDY #$F3			 ; A0 F3 | Load immediate value into Y register
	BPL $FF			  ; 10 FF | Branch if positive
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D3
; Address: $DEB5F7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D3:
	ROR $7CF0,X		  ; 7E F0 7C | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D4
; Address: $DEB606
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D4:
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	ADC ($20),Y		  ; 71 20 | Add with carry ((zero page),Y)
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	LSR $22			  ; 46 22 | Logical shift right (zero page)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D5
; Address: $DEB617
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D5:
	JSR $200E			; 20 0E 20 | Jump to subroutine
	ORA $11			  ; 05 11 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	EOR $28			  ; 45 28 | Exclusive OR with accumulator (zero page)
	AND $08			  ; 25 08 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D6
; Address: $DEB624
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D6:
	JSL $0E210C		  ; 22 0C 21 0E | Jump to subroutine long
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $03			  ; 30 03 | Branch if negative
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ASL $0E18			; 0E 18 0E | Arithmetic shift left (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $0F0F,X		  ; 1E 0F 0F | Arithmetic shift left (absolute,X)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	STZ $E0			  ; 64 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	STZ $261C,X		  ; 9E 1C 26 | Store zero to absolute,X
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	LDY $7800,X		  ; BC 00 78 | Load from absolute,X into Y register
	BIT $3440			; 2C 40 34 | Test bits in accumulator (absolute)
	CPY #$D2			 ; C0 D2 | Compare Y register (immediate)
	BPL $0A			  ; 10 0A | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INC $04			  ; E6 04 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $3E			  ; 10 3E | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	BIT $640B			; 2C 0B 64 | Test bits in accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D7
; Address: $DEB687
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D7:
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($20),Y		  ; 71 20 | Add with carry ((zero page),Y)
	ORA ($9E,X)		  ; 01 9E | Logical OR with accumulator ((zero page,X))
	STX $62			  ; 86 62 | Store X register to zero page
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1D9
; Address: $DEB698
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1D9:
	ASL $2520			; 0E 20 25 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	STZ $28			  ; 64 28 | Store zero to zero page
	WDM #$2C			 ; 42 2C | Reserved instruction
	EOR ($2E,X)		  ; 41 2E | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1DB
; Address: $DEB6AB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1DB:
	ASL $0821,X		  ; 1E 21 08 | Arithmetic shift left (absolute,X)
	ORA $3806,Y		  ; 19 06 38 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BPL $2F			  ; 10 2F | Branch if positive
	ASL $1F2F,X		  ; 1E 2F 1F | Arithmetic shift left (absolute,X)
	ASL $100E			; 0E 0E 10 | Arithmetic shift left (absolute)
	ASL $6400			; 0E 00 64 | Arithmetic shift left (absolute)
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $04			  ; 86 04 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1DC
; Address: $DEB6CB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1DC:
	JSL $32026F		  ; 22 6F 02 32 | Jump to subroutine long
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ROR $FF22,X		  ; 7E 22 FF | Rotate right (absolute,X)
	DEC $E820,X		  ; DE 20 E8 | Decrement (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1DD
; Address: $DEB6EB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1DD:
	JSR $0084			; 20 84 00 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	LDY $38			  ; A4 38 | Load from zero page into Y register
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	AND $1B1B,X		  ; 3D 1B 1B | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1DE
; Address: $DEB71A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1DE:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1DF
; Address: $DEB72A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1DF:
	JSR $6A03			; 20 03 6A | Jump to subroutine
	WDM #$2F			 ; 42 2F | Reserved instruction
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CPX $716F			; EC 6F 71 | Compare X register (absolute)
	AND $43			  ; 25 43 | Logical AND with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	STY $E0EE			; 8C EE E0 | Game work RAM access
	NOP				  ; EA | No operation
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ASL $F500,X		  ; 1E 00 F5 | Arithmetic shift left (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	BPL $8E			  ; 10 8E | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E0
; Address: $DEB77A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E0:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPX $216F			; EC 6F 21 | PPU graphics register access
	LDA $8057,X		  ; BD 57 80 | Load from absolute,X into accumulator
	AND ($51,X)		  ; 21 51 | Logical AND with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF 00 D7 08 | Load from absolute long,X into accumulator
	ADC ($06),Y		  ; 71 06 | Add with carry ((zero page),Y)
	STX $E0EE			; 8E EE E0 | Game work RAM access
	CPX #$A4			 ; E0 A4 | Compare X register (immediate)
	REP #$D8			 ; C2 D8 | Reset processor status bits
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $FB00,X		  ; 1E 00 FB | Arithmetic shift left (absolute,X)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E1
; Address: $DEB7B9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E1:
	JSR $00CC			; 20 CC 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ROL $1800,X		  ; 3E 00 18 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E2
; Address: $DEB7DE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E2:
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0B12			; 0D 12 0B | Logical OR with accumulator (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0915			; 0E 15 09 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E3
; Address: $DEB7FE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E3:
	JSL $0D1700		  ; 22 00 17 0D | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ROL $0F2F,X		  ; 3E 2F 0F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ORA ($31,X)		  ; 01 31 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E4
; Address: $DEB810
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E4:
	JSR $0100			; 20 00 01 | Jump to subroutine
	BMI $41			  ; 30 41 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	INY				  ; C8 | Increment Y register
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	BMI $38			  ; 30 38 | Branch if negative
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BEQ $C8			  ; F0 C8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BMI $FC			  ; 30 FC | Branch if negative
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	STY $44F8			; 8C F8 44 | Store Y register to absolute address
	CPY #$9C			 ; C0 9C | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $80			  ; A4 80 | Load from zero page into Y register
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E6
; Address: $DEB85C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E6:
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	BVC $08			  ; 50 08 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	BEQ $A8			  ; F0 A8 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	STX $F0			  ; 86 F0 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E7
; Address: $DEB86B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E7:
	CPY $8080			; CC 80 80 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STX $FC70			; 8E 70 FC | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	ORA $0C1A			; 0D 1A 0C | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA $31			  ; 05 31 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1E8
; Address: $DEB890
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1E8:
	JSR $0100			; 20 00 01 | Jump to subroutine
	EOR $18			  ; 45 18 | Exclusive OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	INX				  ; E8 | Increment X register
	STY $44F8			; 8C F8 44 | Store Y register to absolute address
	CPY #$9C			 ; C0 9C | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $80			  ; A4 80 | Load from zero page into Y register
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1EA
; Address: $DEB8BC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1EA:
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	BVC $08			  ; 50 08 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	BEQ $A8			  ; F0 A8 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $E4			  ; F0 E4 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	DEC $D8			  ; C6 D8 | Decrement (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	DEC $DC30			; CE 30 DC | Decrement (absolute)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1EB
; Address: $DEB8ED
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1EB:
	JSR $204A			; 20 4A 20 | Jump to subroutine
	BPL $06			  ; 10 06 | Branch if positive
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	ROR $6772			; 6E 72 67 | Rotate right (absolute)
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BPL $27			  ; 10 27 | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1EC
; Address: $DEB91A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1EC:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $E8E6			; 4E E6 E8 | Logical shift right (absolute)
	BEQ $88			  ; F0 88 | Branch if equal
	BRA $EE			  ; 80 EE | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	BVS $EE			  ; 70 EE | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA $1F35,X		  ; 1D 35 1F | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1ED
; Address: $DEB94D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1ED:
	JSR $204A			; 20 4A 20 | Jump to subroutine
	BPL $06			  ; 10 06 | Branch if positive
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	ROR $6772			; 6E 72 67 | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BPL $33			  ; 10 33 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $E4E6			; 4E E6 E4 | Logical shift right (absolute)
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	BRA $E6			  ; 80 E6 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $E6			  ; 30 E6 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BMI $10			  ; 30 10 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	ORA $1509,Y		  ; 19 09 15 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1EE
; Address: $DEB9C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1EE:
	JSR $B060			; 20 60 B0 | Jump to subroutine
	JMP $47271F		  ; 5C 1F 27 47 | Jump to address long
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1EF
; Address: $DEB9D2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1EF:
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	SBC $9C07			; ED 07 9C | Subtract with carry (absolute)
	ADC ($83,X)		  ; 61 83 | Add with carry ((zero page,X))
	BRA $3F			  ; 80 3F | Branch always
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1F0
; Address: $DEB9E2
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1F0:
	LDY $40			  ; A4 40 | Load from zero page into Y register
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	JMP $4832			; 4C 32 48 | Jump to address
	BPL $3A			  ; 10 3A | Branch if positive
	ORA $60			  ; 05 60 | Logical OR with accumulator (zero page)
	ROL $3E3F,X		  ; 3E 3F 3E | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $07			  ; 10 07 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $D0			  ; E4 D0 | Compare X register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $14			  ; E4 14 | Compare X register (zero page)
	BPL $30			  ; 10 30 | Branch if positive
	PEA #$0080		   ; F4 80 00 | Push effective address to stack
	BRA $2A			  ; 80 2A | Branch always
	CPY $11			  ; C4 11 | Compare Y register (zero page)
	INC $F609			; EE 09 F6 | Increment (absolute)
	BPL $E4			  ; 10 E4 | Branch if positive
	SEP #$08			 ; E2 08 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	ASL $D0			  ; 06 D0 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $C048			; 4C 48 C0 | Jump to address
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	SED				  ; F8 | Set decimal mode flag
	SBC $E2			  ; E5 E2 | Subtract with carry (zero page)
	INC				  ; 1A | Increment accumulator
	PEA #$E052		   ; F4 52 E0 | Game work RAM access
	LDA $C186,Y		  ; B9 86 C1 | Load from absolute,Y into accumulator
	ROL $FE01,X		  ; 3E 01 FE | Rotate left (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0E			  ; C4 0E | Compare Y register (zero page)
	ASL $A0			  ; 06 A0 | Arithmetic shift left (zero page)
	CPX #$D9			 ; E0 D9 | Compare X register (immediate)
	SBC ($54),Y		  ; F1 54 | Subtract with carry ((zero page),Y)
	BEQ $74			  ; F0 74 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1F1
; Address: $DEBA58
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1F1:
	BEQ $D4			  ; F0 D4 | Branch if equal
	BEQ $44			  ; F0 44 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA $1509,Y		  ; 19 09 15 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1F2
; Address: $DEBA68
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1F2:
	JSR $B060			; 20 60 B0 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ADC $9C07			; 6D 07 9C | Add with carry (absolute)
	ADC ($83,X)		  ; 61 83 | Add with carry ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	BCS $40			  ; B0 40 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1F3
; Address: $DEBA84
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1F3:
	BVC $2A			  ; 50 2A | Branch if overflow clear
	BIT $5812			; 2C 12 58 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $3B3F,X		  ; 1E 3F 3B | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY $C0			  ; C4 C0 | Compare Y register (zero page)
	INC $F4DA			; EE DA F4 | Increment (absolute)
	BIT $E0			  ; 24 E0 | Game work RAM access
	BPL $14			  ; 10 14 | Branch if positive
	BMI $F4			  ; 30 F4 | Branch if negative
	STY $00			  ; 84 00 | Store Y register to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	STY $31			  ; 84 31 | Store Y register to zero page
	DEC $EE11			; CE 11 EE | Decrement (absolute)
	PEA #$E01A		   ; F4 1A E0 | Game work RAM access
	SEP #$0C			 ; E2 0C | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	ASL $D0			  ; 06 D0 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $C048			; 4C 48 C0 | Jump to address
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	DEC $1A			  ; C6 1A | Decrement (zero page)
	PEA #$E053		   ; F4 53 E0 | Game work RAM access
	LDA $C186,Y		  ; B9 86 C1 | Load from absolute,Y into accumulator
	ROL $FC01,X		  ; 3E 01 FC | Rotate left (absolute,X)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BEQ $37			  ; F0 37 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1F4
; Address: $DEBAEC
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1F4:
	SEP #$00			 ; E2 00 | Set processor status bits
	JMP $C008A0		  ; 5C A0 08 C0 | Jump to address long
	SBC $F104,Y		  ; F9 04 F1 | Subtract with carry (absolute,Y)
	BEQ $74			  ; F0 74 | Branch if equal
	BEQ $74			  ; F0 74 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $0D23			; 0D 23 0D | Logical OR with accumulator (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $1D00,X		  ; 1D 00 1D | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$5E			 ; 09 5E | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	AND $1F0A,X		  ; 3D 0A 1F | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$63			 ; E0 63 | Compare X register (immediate)
	CPX #$63			 ; E0 63 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA				  ; BF 40 76 09 | Load from absolute long,X into accumulator
	AND #$14			 ; 29 14 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1F6
; Address: $DEBB4C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1F6:
	LDA				  ; BF 48 7D 02 | Load from absolute long,X into accumulator
	CPX #$63			 ; E0 63 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1FB
; Address: $DEBB5D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1FB:
	PLA				  ; 68 | Pull accumulator from stack
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BNE $A8			  ; D0 A8 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	SED				  ; F8 | Set decimal mode flag
	STY $E088			; 8C 88 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BEQ $1C			  ; F0 1C | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1FC
; Address: $DEBB77
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1FC:
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $54			  ; 70 54 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	BMI $F8			  ; 30 F8 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	STY $9208			; 8C 08 92 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1FD
; Address: $DEBB91
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1FD:
	JSR $0014			; 20 14 00 | Jump to subroutine
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $7CD4,X		  ; BC D4 7C | Load from absolute,X into Y register
	LDA $A86E2E		  ; AF 2E 6E A8 | Load from absolute long address into accumulator
	BPL $34			  ; 10 34 | Branch if positive
	BVC $2C			  ; 50 2C | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	STZ $F020			; 9C 20 F0 | Store zero to absolute
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BNE $58			  ; D0 58 | Branch if not equal
	BNE $58			  ; D0 58 | Branch if not equal
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1FE
; Address: $DEBBBD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1FE:
	JSR $0080			; 20 80 00 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $000A			; 0D 0A 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $07			  ; 10 07 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	AND $450A,X		  ; 3D 0A 45 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_1FF
; Address: $DEBBE7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_1FF:
	JSL $273A4F		  ; 22 4F 3A 27 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_200
; Address: $DEBBEE
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_200:
	STA $1066,X		  ; 9D 66 10 | Store accumulator to absolute,X
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	CPX #$68			 ; E0 68 | Compare X register (immediate)
	BVS $70			  ; 70 70 | Branch if overflow set
	STA $4F76			; 8D 76 4F | Store accumulator to absolute address
	BMI $7D			  ; 30 7D | Branch if negative
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ORA $3562,X		  ; 1D 62 35 | Logical OR with accumulator (absolute,X)
	WDM #$8F			 ; 42 8F | Reserved instruction
	WDM #$77			 ; 42 77 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ROL				  ; 2A | Rotate left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	BVS $42			  ; 70 42 | Hardware register operation
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BNE $A8			  ; D0 A8 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	LDY $78			  ; A4 78 | Load from zero page into Y register
	SED				  ; F8 | Set decimal mode flag
	STY $E088			; 8C 88 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BEQ $1C			  ; F0 1C | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_202
; Address: $DEBC3B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_202:
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $54			  ; 70 54 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	BMI $F8			  ; 30 F8 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_203
; Address: $DEBC49
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_203:
	DEY				  ; 88 | Decrement Y register
	STY $9408			; 8C 08 94 | Store Y register to absolute address
	BCC $54			  ; 90 54 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_204
; Address: $DEBC51
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_204:
	JSR $0014			; 20 14 00 | Jump to subroutine
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	BNE $78			  ; D0 78 | Branch if not equal
	BVC $AC			  ; 50 AC | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	JMP ($74A8)		  ; 6C A8 74 | Jump to address (absolute indirect)
	BCC $74			  ; 90 74 | Branch if carry clear
	BCC $6C			  ; 90 6C | Branch if carry clear
	BRA $3C			  ; 80 3C | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BNE $D8			  ; D0 D8 | Branch if not equal
	BNE $D8			  ; D0 D8 | Branch if not equal
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_205
; Address: $DEBC92
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_205:
	JSL $235401		  ; 22 01 54 23 | Jump to subroutine long
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	PLP				  ; 28 | Pull processor status from stack
	BMI $4E			  ; 30 4E | Branch if negative
	INC				  ; 1A | Increment accumulator
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_207
; Address: $DEBCB3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_207:
	JSR $2050			; 20 50 20 | Jump to subroutine
	BVC $27			  ; 50 27 | Branch if overflow clear
	REP #$2C			 ; C2 2C | Reset processor status bits
	CMP $2B			  ; C5 2B | Compare accumulator (zero page)
	REP #$27			 ; C2 27 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_209
; Address: $DEBCC1
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_209:
	JSL $6C6119		  ; 22 19 61 6C | Jump to subroutine long
	LSR $DB22,X		  ; 5E 22 DB | Logical shift right (absolute,X)
	AND $D2			  ; 25 D2 | Logical AND with accumulator (zero page)
	BIT $2A74			; 2C 74 2A | Test bits in accumulator (absolute)
	STA ($07,X)		  ; 81 07 | Store accumulator to (zero page,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $0C2D			; 0D 2D 0C | Logical OR with accumulator (absolute)
	AND $2E0F			; 2D 0F 2E | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_20A
; Address: $DEBCF8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_20A:
	DEY				  ; 88 | Decrement Y register
	BVS $18			  ; 70 18 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $6C			  ; 90 6C | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	STY $18F8			; 8C F8 18 | Store Y register to absolute address
	BPL $8C			  ; 10 8C | Branch if positive
	STX $0D			  ; 86 0D | Store X register to zero page
	ASL $59			  ; 06 59 | Arithmetic shift left (zero page)
	JMP $4852			; 4C 52 48 | Jump to address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_20B
; Address: $DEBD11
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_20B:
	JSR $0040			; 20 40 00 | Jump to subroutine
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	EOR ($36,X)		  ; 41 36 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_20C
; Address: $DEBD1A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_20C:
	JSR $40D6			; 20 D6 40 | Jump to subroutine
	INC $EC40			; EE 40 EC | Increment (absolute)
	WDM #$5D			 ; 42 5D | Reserved instruction
	LSR $A5			  ; 46 A5 | Logical shift right (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	STY $0876			; 8C 76 08 | Store Y register to absolute address
	JMP ($08E2)		  ; 6C E2 08 | Jump to address (absolute indirect)
	JMP $F841A0		  ; 5C A0 41 F8 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	STZ $3CDC			; 9C DC 3C | Store zero to absolute
	LDY $7C7C,X		  ; BC 7C 7C | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_20D
; Address: $DEBD3E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_20D:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHY				  ; 5A | Push Y register to stack
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($8C,X)		  ; 21 8C | Logical AND with accumulator ((zero page,X))
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $4E			  ; 30 4E | Branch if negative
	INC				  ; 1A | Increment accumulator
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	STA ($2F,X)		  ; 81 2F | Store accumulator to (zero page,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	PLP				  ; 28 | Pull processor status from stack
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	ROR				  ; 6A | Rotate right (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_20F
; Address: $DEBD73
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_20F:
	JSR $2050			; 20 50 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	REP #$2C			 ; C2 2C | Reset processor status bits
	CMP $2B			  ; C5 2B | Compare accumulator (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	JMP $225E20		  ; 5C 20 5E 22 | Jump to address long
	AND $F2			  ; 25 F2 | Logical AND with accumulator (zero page)
	BIT $0877			; 2C 77 08 | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	STA ($07),Y		  ; 91 07 | Store accumulator to (zero page),Y
	DEY				  ; 88 | Decrement Y register
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $0C2D			; 0D 2D 0C | Logical OR with accumulator (absolute)
	AND $0808			; 2D 08 08 | Logical AND with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $6C			  ; 90 6C | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	STY $18F8			; 8C F8 18 | Store Y register to absolute address
	BPL $8C			  ; 10 8C | Branch if positive
	STX $0D			  ; 86 0D | Store X register to zero page
	ASL $59			  ; 06 59 | Arithmetic shift left (zero page)
	JMP $4852			; 4C 52 48 | Jump to address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_210
; Address: $DEBDB1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_210:
	JSR $0040			; 20 40 00 | Jump to subroutine
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	EOR ($36,X)		  ; 41 36 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_211
; Address: $DEBDBA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_211:
	JSR $40D6			; 20 D6 40 | Jump to subroutine
	INC $EC41			; EE 41 EC | Increment (absolute)
	WDM #$52			 ; 42 52 | Reserved instruction

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_212
; Address: $DEBDC3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_212:
	JMP $8CB2			; 4C B2 8C | Jump to address
	LDY $5280,X		  ; BC 80 52 | Load from absolute,X into Y register
	BIT $14EA			; 2C EA 14 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_213
; Address: $DEBDCC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_213:
	JSL $00FC58		  ; 22 58 FC 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$92			 ; C0 92 | Compare Y register (immediate)
	BNE $3C			  ; D0 3C | Branch if not equal
	LDY $7C7C,X		  ; BC 7C 7C | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $5F			  ; 25 5F | Logical AND with accumulator (zero page)
	BCS $5F			  ; B0 5F | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_214
; Address: $DEBDEE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_214:
	AND ($51),Y		  ; 31 51 | Logical AND with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	BCS $4F			  ; B0 4F | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $4E			  ; 80 4E | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $305F			; 2C 5F 30 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_215
; Address: $DEBE06
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_215:
	JSL $517143		  ; 22 43 71 51 | Jump to subroutine long
	ADC ($50),Y		  ; 71 50 | Add with carry ((zero page),Y)
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	ROR				  ; 6A | Rotate right (accumulator)
	BRA $44			  ; 80 44 | Branch always
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $7C			  ; 80 7C | Branch always
	DEY				  ; 88 | Decrement Y register
	LSR $94			  ; 46 94 | Logical shift right (zero page)
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register
	ORA $1E0B,X		  ; 1D 0B 1E | Logical OR with accumulator (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $AC48			; AE 48 AC | Load from absolute address into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$F9			 ; 42 F9 | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $5D15,X		  ; 1E 15 5D | Arithmetic shift left (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $44			  ; 06 44 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_216
; Address: $DEBE3E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_216:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BMI $B8			  ; 30 B8 | Branch if negative
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_217
; Address: $DEBE54
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_217:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $38			  ; F0 38 | Branch if equal
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	BVC $28			  ; 50 28 | Branch if overflow clear
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	BNE $A2			  ; D0 A2 | Branch if not equal
	BRA $72			  ; 80 72 | Branch always
	LDY $70			  ; A4 70 | Load from zero page into Y register
	INY				  ; C8 | Increment Y register
	INC $18			  ; E6 18 | Increment (zero page)
	DEC $60			  ; C6 60 | Decrement (zero page)
	BMI $20			  ; 30 20 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BRA $3C			  ; 80 3C | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	INC $022C			; EE 2C 02 | Increment (absolute)
	CMP $12			  ; C5 12 | Compare accumulator (zero page)
	ROR $98			  ; 66 98 | Rotate right (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	STY $10			  ; 84 10 | Store Y register to zero page
	DEC $C618			; CE 18 C6 | Decrement (absolute)
	CMP $22			  ; C5 22 | Compare accumulator (zero page)
	LDX $1F40,Y		  ; BE 40 1F | Load from absolute,Y into X register
	DEC $062E			; CE 2E 06 | Decrement (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	DEC $DEFF,X		  ; DE FF DE | Decrement (absolute,X)
	ROL $C026,X		  ; 3E 26 C0 | Rotate left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	BVC $3F			  ; 50 3F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_218
; Address: $DEBEAC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_218:
	JSR $3100			; 20 00 31 | Jump to subroutine
	AND ($07),Y		  ; 31 07 | Logical AND with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BVC $2F			  ; 50 2F | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_219
; Address: $DEBEBA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_219:
	JSR $583F			; 20 3F 58 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ROL $332A			; 2E 2A 33 | Rotate left (absolute)
	BIT $303F			; 2C 3F 30 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_21A
; Address: $DEBEC6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_21A:
	JSL $311123		  ; 22 23 11 31 | Jump to subroutine long
	ORA ($30),Y		  ; 11 30 | Logical OR with accumulator ((zero page),Y)
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	BIT $48			  ; 24 48 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_21B
; Address: $DEBED3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_21B:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	ROL $74			  ; 26 74 | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $1E0B,X		  ; 1D 0B 1E | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $6E29			; 6E 29 6E | Rotate right (absolute)
	AND #$76			 ; 29 76 | Logical AND with accumulator (immediate)
	AND ($5C,X)		  ; 21 5C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_21C
; Address: $DEBEED
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_21C:
	JSL $0A002F		  ; 22 2F 00 0A | Jump to subroutine long
	ASL $3D15,X		  ; 1E 15 3D | Arithmetic shift left (absolute,X)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	BNE $A2			  ; D0 A2 | Branch if not equal
	STY $72			  ; 84 72 | Store Y register to zero page
	LDY $70			  ; A4 70 | Load from zero page into Y register
	INY				  ; C8 | Increment Y register
	INC $19			  ; E6 19 | Increment (zero page)
	DEC $60			  ; C6 60 | Decrement (zero page)
	BMI $20			  ; 30 20 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BRA $3C			  ; 80 3C | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ASL $B1EE			; 0E EE B1 | Arithmetic shift left (absolute)
	ASL $4C12			; 0E 12 4C | Arithmetic shift left (absolute)
	STZ $E060,X		  ; 9E 60 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	ROR $0C			  ; 66 0C | Rotate right (zero page)
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	INC $7E10			; EE 10 7E | Increment (absolute)
	ROL $1CBC,X		  ; 3E BC 1C | Rotate left (absolute,X)
	STA				  ; 9F 94 FF 7E | Store accumulator to absolute long,X
	ROR $028E			; 6E 8E 02 | Rotate right (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_21E
; Address: $DEBF4D
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_21E:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	BMI $2F			  ; 30 2F | Branch if negative
	BMI $49			  ; 30 49 | Branch if negative
	EOR $7B26,Y		  ; 59 26 7B | Exclusive OR with accumulator (absolute,Y)
	JMP $2C73			; 4C 73 2C | Jump to address
	BVS $3F			  ; 70 3F | Branch if overflow set
	LDX #$DD			 ; A2 DD | Load immediate value into X register
	ADC $371E,X		  ; 7D 1E 37 | Add with carry (absolute,X)
	ORA $2713,X		  ; 1D 13 27 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $2E11			; 6E 11 2E | Rotate right (absolute)
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	ORA #$FD			 ; 09 FD | Logical OR with accumulator (immediate)
	ROL $0F00,X		  ; 3E 00 0F | Rotate left (absolute,X)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $70			  ; B0 70 | Branch if carry set
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	PEA #$F40C		   ; F4 0C F4 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$B40C		   ; F4 0C B4 | Push effective address to stack
	JMP $4AB6			; 4C B6 4A | Jump to address
	STZ $9D62,X		  ; 9E 62 9D | Store zero to absolute,X
	STA $8E66,Y		  ; 99 66 8E | Store accumulator to absolute,Y
	PHA				  ; 48 | Push accumulator to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $FA70,Y		  ; BE 70 FA | Load from absolute,Y into X register
	CPX $BC			  ; E4 BC | Compare X register (zero page)
	BNE $EC			  ; D0 EC | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	BRA $C0			  ; 80 C0 | Branch always
	LDX $7C00,Y		  ; BE 00 7C | Load from absolute,Y into X register
	CPX $F000			; EC 00 F0 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $2F			  ; 30 2F | Branch if negative
	BMI $49			  ; 30 49 | Branch if negative
	ADC $B946,Y		  ; 79 46 B9 | Add with carry (absolute,Y)
	LSR $9D			  ; 46 9D | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_21F
; Address: $DEC00B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_21F:
	ROR $7D			  ; 66 7D | Rotate right (zero page)
	AND $3F12			; 2D 12 3F | Logical AND with accumulator (absolute)
	ADC $0E75			; 6D 75 0E | Add with carry (absolute)
	AND $370B,X		  ; 3D 0B 37 | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $0301,X		  ; 1E 01 03 | Arithmetic shift left (absolute,X)
	ADC $3E00,X		  ; 7D 00 3E | Add with carry (absolute,X)
	PEA #$B40C		   ; F4 0C B4 | Push effective address to stack
	JMP $4EB2			; 4C B2 4E | Jump to address
	TXS				  ; 9A | Transfer X register to stack pointer
	STZ $9E			  ; 64 9E | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_220
; Address: $DEC04A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_220:
	STA $CE72			; 8D 72 CE | Store accumulator to absolute address
	PHX				  ; DA | Push X register to stack
	ROL $FC			  ; 26 FC | Rotate left (zero page)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $00			  ; E6 00 | Increment (zero page)
	ADC $9B			  ; 65 9B | Add with carry (zero page)
	LDX $EC78,Y		  ; BE 78 EC | Load from absolute,Y into X register
	BEQ $38			  ; F0 38 | Branch if equal
	INY				  ; C8 | Increment Y register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $9F			  ; 90 9F | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCC $60			  ; 90 60 | Branch if carry clear
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ROL $2E31			; 2E 31 2E | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $3C01,X		  ; 3E 01 3C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_221
; Address: $DEC0A1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_221:
	JSR $033D			; 20 3D 03 | Jump to subroutine
	INC $6C14			; EE 14 6C | Increment (absolute)
	ROL $7D00,X		  ; 3E 00 7D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA $331E,Y		  ; 19 1E 33 | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	ROR $38			  ; 66 38 | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	ROL $0401,X		  ; 3E 01 04 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_222
; Address: $DEC0E4
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_222:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $30			  ; D0 30 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STY $0044			; 8C 44 00 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY $0430			; CC 30 04 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	BRA $90			  ; 80 90 | Branch always
	BCC $60			  ; 90 60 | Branch if carry clear
	BVC $28			  ; 50 28 | Branch if overflow clear
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $90			  ; B0 90 | Branch if carry set
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCS $30			  ; B0 30 | Branch if carry set
	BCC $EC			  ; 90 EC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_223
; Address: $DEC114
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_223:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BVS $C8			  ; 70 C8 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BMI $D0			  ; 30 D0 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	JMP ($24DC)		  ; 6C DC 24 | Jump to address (absolute indirect)
	CPX $7818			; EC 18 78 | Compare X register (absolute)
	BRA $A8			  ; 80 A8 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BIT $3D30			; 2C 30 3D | Test bits in accumulator (absolute)
	STZ $1A			  ; 64 1A | Store zero to zero page
	ROL $1F11			; 2E 11 1F | Rotate left (absolute)
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ROL $3D00,X		  ; 3E 00 3D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ASL $0C01			; 0E 01 0C | Arithmetic shift left (absolute)
	ASL $3B1D,X		  ; 1E 1D 3B | Arithmetic shift left (absolute,X)
	ROL $3A35,X		  ; 3E 35 3A | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_224
; Address: $DEC16D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_224:
	SEC				  ; 38 | Set carry flag
	ROL $0701,X		  ; 3E 01 07 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_225
; Address: $DEC183
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_225:
	BVC $28			  ; 50 28 | Branch if overflow clear
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $90			  ; B0 90 | Branch if carry set
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	BCC $EC			  ; 90 EC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_226
; Address: $DEC194
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_226:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	DEY				  ; 88 | Decrement Y register
	BVS $CC			  ; 70 CC | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	PEA #$9878		   ; F4 78 98 | Push effective address to stack
	BVS $C8			  ; 70 C8 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	JMP ($1818)		  ; 6C 18 18 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_227
; Address: $DEC1AF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_227:
	JSR $30C8			; 20 C8 30 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $20			  ; 80 20 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $170E			; 0D 0E 17 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BIT $2030			; 2C 30 20 | Test bits in accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_228
; Address: $DEC1CF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_228:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	AND $5A			  ; 25 5A | Logical AND with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $E41B,X		  ; 7E 1B E4 | Rotate right (absolute,X)
	BPL $72			  ; 10 72 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_22A
; Address: $DEC1F6
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_22A:
	BVS $01			  ; 70 01 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $0F			  ; 30 0F | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ROR $38			  ; 66 38 | Rotate right (zero page)
	EOR $372F,X		  ; 5D 2F 37 | Exclusive OR with accumulator (absolute,X)
	ORA $2617,Y		  ; 19 17 26 | Logical OR with accumulator (absolute,Y)
	ORA $1863,Y		  ; 19 63 18 | Logical OR with accumulator (absolute,Y)
	ROL $0C01,X		  ; 3E 01 0C | Rotate left (absolute,X)
	ASL $0F01,X		  ; 1E 01 0F | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $70			  ; B0 70 | Branch if carry set
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	BVS $E4			  ; 70 E4 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BRA $84			  ; 80 84 | Branch always
	ROR $5EA6			; 6E A6 5E | Rotate right (absolute)
	PLX				  ; FA | Pull X register from stack
	ASL $7FEA,X		  ; 1E EA 7F | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR $0A42			; 4D 42 0A | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $4E00,X		  ; 1E 00 4E | Arithmetic shift left (absolute,X)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	BVC $0A			  ; 50 0A | Branch if overflow clear
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$4A			 ; E0 4A | Compare X register (immediate)
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	PEA #$88E8		   ; F4 E8 88 | Push effective address to stack
	BEQ $64			  ; F0 64 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROR $E080,X		  ; 7E 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	ADC $7A			  ; 65 7A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_22B
; Address: $DEC286
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_22B:
	SEI				  ; 78 | Set interrupt disable flag
	INC $F43B,X		  ; FE 3B F4 | Increment (absolute,X)
	BPL $B2			  ; 10 B2 | Branch if positive
	WDM #$50			 ; 42 50 | Reserved instruction
	AND #$2E			 ; 29 2E | Logical AND with accumulator (immediate)
	BPL $78			  ; 10 78 | Branch if positive
	BVS $01			  ; 70 01 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $0F			  ; 50 0F | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	BRA $84			  ; 80 84 | Branch always
	JMP ($5AA4)		  ; 6C A4 5A | Jump to address (absolute indirect)
	NOP				  ; EA | No operation
	ROR $27D8,X		  ; 7E D8 27 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LSR $0A44			; 4E 44 0A | Logical shift right (absolute)
	STZ $0874,X		  ; 9E 74 08 | Store zero to absolute,X
	LSR $0E00			; 4E 00 0E | Logical shift right (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	BVC $0C			  ; 50 0C | Branch if overflow clear
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ORA $676F,Y		  ; 19 6F 67 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STA $CA87			; 8D 87 CA | Store accumulator to absolute address
	EOR ($A7,X)		  ; 41 A7 | Exclusive OR with accumulator ((zero page,X))
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $F1			  ; 10 F1 | Branch if positive
	ADC $7E79,Y		  ; 79 79 7E | Add with carry (absolute,Y)
	ROR $1F1F,X		  ; 7E 1F 1F | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $5F			  ; 10 5F | Branch if positive
	ADC $6D00			; 6D 00 6D | Add with carry (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $374B,X		  ; 5D 4B 37 | Exclusive OR with accumulator (absolute,X)
	ROR $7F			  ; 66 7F | Rotate right (zero page)
	ADC $3F3F			; 6D 3F 3F | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $3700,X		  ; 7D 00 37 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_22C
; Address: $DEC32A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_22C:
	JSR $3800			; 20 00 38 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	LDX $00			  ; A6 00 | Load from zero page into X register
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	SBC ($E1),Y		  ; F1 E1 | Subtract with carry ((zero page),Y)
	STA $04			  ; 85 04 | Store accumulator to zero page
	DEC $7ED8,X		  ; DE D8 7E | Decrement (absolute,X)
	STZ $FA			  ; 64 FA | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	ADC $8F20			; 6D 20 8F | Add with carry (absolute)
	INC $EE6E			; EE 6E EE | Increment (absolute)
	STZ $7E9E,X		  ; 9E 9E 7E | Store zero to absolute,X
	ROR $F8F8,X		  ; 7E F8 F8 | Rotate right (absolute,X)
	STZ $E4			  ; 64 E4 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_22D
; Address: $DEC35E
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_22D:
	JSR $6EF6			; 20 F6 6E | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDX $730A,Y		  ; BE 0A 73 | Load from absolute,Y into X register
	LDA $F629,X		  ; BD 29 F6 | Load from absolute,X into accumulator
	STX $F8			  ; 86 F8 | Store X register to zero page
	INC $1CFA,X		  ; FE FA 1C | Increment (absolute,X)
	LDY $40A0,X		  ; BC A0 40 | Load from absolute,X into Y register
	BNE $0E			  ; D0 0E | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 F6 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	INC $1C00,X		  ; FE 00 1C | Increment (absolute,X)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	ADC $7D00			; 6D 00 7D | Add with carry (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	DEC $94BD			; CE BD 94 | Decrement (absolute)
	ADC ($1F,X)		  ; 61 1F | Add with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	AND $0005,X		  ; 3D 05 00 | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $6F00,X		  ; FD 00 6F | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ROR $B640			; 6E 40 B6 | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $BA			  ; E6 BA | Increment (zero page)
	CPX $F04C			; EC 4C F0 | Compare X register (absolute)
	ROR $FE			  ; 66 FE | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	BNE $0E			  ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_22E
; Address: $DEC3B3
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_22E:
	RTI				  ; 40 | Return from interrupt
	LDX $EC00,Y		  ; BE 00 EC | Load from absolute,Y into X register
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ASL $2D1E,X		  ; 1E 1E 2D | Arithmetic shift left (absolute,X)
	ORA $0B07			; 0D 07 0B | Logical OR with accumulator (absolute)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $1F1F,X		  ; 1E 1F 1F | Arithmetic shift left (absolute,X)
	ASL $010F			; 0E 0F 01 | Arithmetic shift left (absolute)
	ASL $3B0E,X		  ; 1E 0E 3B | Arithmetic shift left (absolute,X)
	AND $616D,Y		  ; 39 6D 61 | Logical AND with accumulator (absolute,Y)
	LDY $F900,X		  ; BC 00 F9 | Load from absolute,X into Y register
	ORA ($6B),Y		  ; 11 6B | Logical OR with accumulator ((zero page),Y)
	ORA ($54,X)		  ; 01 54 | Logical OR with accumulator ((zero page,X))
	ASL $3D07			; 0E 07 3D | Arithmetic shift left (absolute)
	ADC ($32),Y		  ; 71 32 | Add with carry ((zero page),Y)
	EOR ($4E,X)		  ; 41 4E | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	LDY $7D07			; AC 07 7D | Load from absolute address into Y register
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	EOR $777E,Y		  ; 59 7E 77 | Exclusive OR with accumulator (absolute,Y)
	AND $053D,Y		  ; 39 3D 05 | Logical AND with accumulator (absolute,Y)
	BVC $2B			  ; 50 2B | Branch if overflow clear
	ADC $7E00,X		  ; 7D 00 7E | Add with carry (absolute,X)
	AND $0500,Y		  ; 39 00 05 | Logical AND with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_22F
; Address: $DEC42B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_22F:
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$EC			 ; E0 EC | Compare X register (immediate)
	ORA $FF1C,X		  ; 1D 1C FF | Logical OR with accumulator (absolute,X)
	ASL $FCBE			; 0E BE FC | Arithmetic shift left (absolute)
	BIT $38F0			; 2C F0 38 | Test bits in accumulator (absolute)
	BNE $48			  ; D0 48 | Branch if not equal
	BEQ $38			  ; F0 38 | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_230
; Address: $DEC450
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_230:
	ASL $0EFE,X		  ; 1E FE 0E | Arithmetic shift left (absolute,X)
	STY $2000			; 8C 00 20 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_233
; Address: $DEC468
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_233:
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	CPY $343C			; CC 3C 34 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BCC $20			  ; 90 20 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BPL $88			  ; 10 88 | Branch if positive
	BPL $C8			  ; 10 C8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	ROL $5F23,X		  ; 3E 23 5F | Rotate left (absolute,X)
	ADC ($4D,X)		  ; 61 4D | Add with carry ((zero page,X))
	AND $003F,X		  ; 3D 3F 00 | Logical AND with accumulator (absolute,X)
	BVC $2E			  ; 50 2E | Branch if overflow clear
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	BVS $90			  ; 70 90 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$A4			 ; E0 A4 | Compare X register (immediate)
	BVS $B4			  ; 70 B4 | Branch if overflow set
	BVS $A8			  ; 70 A8 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($F4FC)		  ; 6C FC F4 | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	BNE $20			  ; D0 20 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	BPL $68			  ; 10 68 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	LDY #$E0			 ; A0 E0 | Game work RAM access
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $DD			  ; 70 DD | Branch if overflow set
	TSX				  ; BA | Transfer stack pointer to X register
	PLB				  ; AB | Pull data bank register from stack
	ORA $0F42			; 0D 42 0F | Logical OR with accumulator (absolute)
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	ORA #$38			 ; 09 38 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_234
; Address: $DEC4F3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_234:
	SEC				  ; 38 | Set carry flag
	CPX $5A60			; EC 60 5A | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	BVC $60			  ; 50 60 | Branch if overflow clear
	BPL $20			  ; 10 20 | Branch if positive
	BVS $0C			  ; 70 0C | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	EOR $7426,Y		  ; 59 26 74 | Exclusive OR with accumulator (absolute,Y)
	ROR $3D0B,X		  ; 7E 0B 3D | Rotate right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	LSR $3F			  ; 46 3F | Logical shift right (zero page)
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_235
; Address: $DEC52A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_235:
	JSR $E000			; 20 00 E0 | Game work RAM access
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	INC $BB0E			; EE 0E BB | Increment (absolute)
	EOR $D5F8,X		  ; 5D F8 D5 | Exclusive OR with accumulator (absolute,X)
	BCS $42			  ; B0 42 | Hardware register operation
	BEQ $95			  ; F0 95 | Branch if equal
	CPX #$CD			 ; E0 CD | Compare X register (immediate)
	BCC $3C			  ; 90 3C | Branch if carry clear
	BEQ $1E			  ; F0 1E | Branch if equal
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0230			; 0E 30 02 | Arithmetic shift left (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $ED57			; ED 57 ED | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	LDX $2EE0,Y		  ; BE E0 2E | Load from absolute,Y into X register
	LDY $54A0,X		  ; BC A0 54 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_236
; Address: $DEC571
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_236:
	JSR $40A7			; 20 A7 40 | Jump to subroutine
	BRA $6E			  ; 80 6E | Branch always
	BRA $EC			  ; 80 EC | Branch always
	LDY #$E0			 ; A0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_237
; Address: $DEC58D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_237:
	JSR $3140			; 20 40 31 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $07			  ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_238
; Address: $DEC598
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_238:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	ASL $1C40			; 0E 40 1C | Arithmetic shift left (absolute)
	JMP $230F			; 4C 0F 23 | Jump to address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_239
; Address: $DEC5A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_239:
	JSR $1010			; 20 10 10 | Jump to subroutine
	BPL $19			  ; 10 19 | Branch if positive
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	WDM #$24			 ; 42 24 | Reserved instruction

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_23A
; Address: $DEC5B2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_23A:
	JSR $1010			; 20 10 10 | Jump to subroutine
	ASL $3C00,X		  ; 1E 00 3C | Arithmetic shift left (absolute,X)
	ROL $8311			; 2E 11 83 | Rotate left (absolute)
	DEY				  ; 88 | Decrement Y register
	BVC $18			  ; 50 18 | Branch if overflow clear
	BIT $4C31			; 2C 31 4C | Test bits in accumulator (absolute)
	ADC ($58),Y		  ; 71 58 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	AND $7D02,X		  ; 3D 02 7D | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_23C
; Address: $DEC5E9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_23C:
	JSR $1000			; 20 00 10 | Jump to subroutine
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $C0			  ; 10 C0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	BPL $02			  ; 10 02 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $C4			  ; F0 C4 | Branch if equal
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $90			  ; 10 90 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	STY $04			  ; 84 04 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $84			  ; 80 84 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	STY $140A			; 8C 0A 14 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_23D
; Address: $DEC628
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_23D:
	ASL $3AC6,X		  ; 1E C6 3A | Arithmetic shift left (absolute,X)
	CPY $92			  ; C4 92 | Compare Y register (zero page)
	JMP ($00FC)		  ; 6C FC 00 | Jump to address (absolute indirect)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_23E
; Address: $DEC631
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_23E:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	BMI $C0			  ; 30 C0 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	DEC $FC20,X		  ; DE 20 FC | Decrement (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	JMP $230F			; 4C 0F 23 | Jump to address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_23F
; Address: $DEC646
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_23F:
	JSR $1010			; 20 10 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_240
; Address: $DEC64F
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_240:
	JSL $202300		  ; 22 00 23 20 | Jump to subroutine long
	BPL $10			  ; 10 10 | Branch if positive
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	ROL $0201,X		  ; 3E 01 02 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $C4			  ; F0 C4 | Branch if equal
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $4204			; 8C 04 42 | Hardware register operation
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STY $04			  ; 84 04 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $04			  ; 10 04 | Branch if positive
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_241
; Address: $DEC698
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_241:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	ASL $2F40,X		  ; 1E 40 2F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $10			  ; 50 10 | Branch if overflow clear
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_242
; Address: $DEC6AB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_242:
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $1A			  ; 10 1A | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_243
; Address: $DEC6BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_243:
	JSR $1B1C			; 20 1C 1B | Jump to subroutine
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_244
; Address: $DEC6C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_244:
	JSL $344B1C		  ; 22 1C 4B 34 | Jump to subroutine long
	EOR $3F26,Y		  ; 59 26 3F | Exclusive OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_245
; Address: $DEC6D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_245:
	CLC				  ; 18 | Clear carry flag
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_247
; Address: $DEC6EA
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_247:
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_248
; Address: $DEC6EE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_248:
	JSL $000020		  ; 22 20 00 00 | Jump to subroutine long
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_24A
; Address: $DEC700
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_24A:
	JSL $604220		  ; 22 20 42 60 | Jump to subroutine long
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $10			  ; B0 10 | Branch if carry set
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BVC $08			  ; 50 08 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	STZ $0800			; 9C 00 08 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_24B
; Address: $DEC716
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_24B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_24C
; Address: $DEC71F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_24C:
	JSR $8884			; 20 84 88 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BPL $90			  ; 10 90 | Branch if positive
	BCC $C8			  ; 90 C8 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_24D
; Address: $DEC72B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_24D:
	JSR $F0E8			; 20 E8 F0 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $60			  ; 90 60 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	BPL $E0			  ; 10 E0 | Game work RAM access
	BCC $E0			  ; 90 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BRA $E0			  ; 80 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $10			  ; 50 10 | Branch if overflow clear
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $1A			  ; 10 1A | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	ORA $021E,Y		  ; 19 1E 02 | Logical OR with accumulator (absolute,Y)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $0E10			; 0E 10 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_24E
; Address: $DEC768
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_24E:
	JSL $1C631C		  ; 22 1C 63 1C | Jump to subroutine long
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	ASL $1E10			; 0E 10 1E | Arithmetic shift left (absolute)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_24F
; Address: $DEC780
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_24F:
	JSL $604220		  ; 22 20 42 60 | Jump to subroutine long
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $10			  ; B0 10 | Branch if carry set
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BVC $80			  ; 50 80 | Branch if overflow clear
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	STZ $0800			; 9C 00 08 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_250
; Address: $DEC796
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_250:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $20			  ; 90 20 | Branch if carry clear
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $50			  ; 80 50 | Branch always
	BCC $90			  ; 90 90 | Branch if carry clear
	BPL $88			  ; 10 88 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $08			  ; 50 08 | Branch if overflow clear
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_253
; Address: $DEC7B5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_253:
	JSR $6010			; 20 10 60 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BEQ $50			  ; F0 50 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_254
; Address: $DEC7D8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_254:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	ORA $3700,Y		  ; 19 00 37 | Logical OR with accumulator (absolute,Y)
	BIT $0141			; 2C 41 01 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $06			  ; 10 06 | Branch if positive
	BPL $1B			  ; 10 1B | Branch if positive
	ROL $3901			; 2E 01 39 | Rotate left (absolute)
	ROL $1C10			; 2E 10 1C | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_255
; Address: $DEC7F3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_255:
	JSR $0008			; 20 08 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BVS $06			  ; 70 06 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	LDA $1B534F		  ; AF 4F 53 1B | Load from absolute long address into accumulator
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BVS $56			  ; 70 56 | Branch if overflow set
	AND ($6F,X)		  ; 21 6F | Logical AND with accumulator ((zero page,X))
	ROL $1000,X		  ; 3E 00 10 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BVS $0F			  ; 70 0F | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	ROL $0200,X		  ; 3E 00 02 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_258
; Address: $DEC82D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_258:
	BPL $02			  ; 10 02 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $C0			  ; 10 C0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $34C8			; EC C8 34 | Compare X register (absolute)
	BRA $4C			  ; 80 4C | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_259
; Address: $DEC845
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_259:
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BNE $C8			  ; D0 C8 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	STY $9C			  ; 84 9C | Store Y register to zero page
	PEA #$7808		   ; F4 08 78 | Push effective address to stack
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_25A
; Address: $DEC861
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_25A:
	CLC				  ; 18 | Clear carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $C8			  ; C4 C8 | Compare Y register (zero page)
	ASL $0A06			; 0E 06 0A | Arithmetic shift left (absolute)
	CPY $007C			; CC 7C 00 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BRA $41			  ; 80 41 | Branch always
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $06			  ; 10 06 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $3921,X		  ; 1E 21 39 | Arithmetic shift left (absolute,X)
	ROL $1C10			; 2E 10 1C | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_25B
; Address: $DEC893
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_25B:
	JSR $0008			; 20 08 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BMI $06			  ; 30 06 | Branch if negative
	BRA $4C			  ; 80 4C | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPY $8074			; CC 74 80 | Compare Y register (absolute)
	STZ $08F4			; 9C F4 08 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_25C
; Address: $DEC8BA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_25C:
	SEC				  ; 38 | Set carry flag
	ASL $0060			; 0E 60 00 | Arithmetic shift left (absolute)
	BMI $03			  ; 30 03 | Branch if negative
	WDM #$35			 ; 42 35 | Reserved instruction
	BIT $5062			; 2C 62 50 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_25D
; Address: $DEC8D6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_25D:
	STA				  ; 9F 6E 37 1F | Store accumulator to absolute long,X
	ORA $2C20,Y		  ; 19 20 2C | Logical OR with accumulator (absolute,Y)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	BIT $5113			; 2C 13 51 | Test bits in accumulator (absolute)
	ROL $36C9			; 2E C9 36 | Rotate left (absolute)
	STZ $0B			  ; 64 0B | Store zero to zero page
	ADC $7D3F,Y		  ; 79 3F 7D | Add with carry (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	AND $30			  ; 25 30 | Logical AND with accumulator (zero page)
	BPL $1C			  ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_25E
; Address: $DEC906
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_25E:
	JSR $2C33			; 20 33 2C | Jump to subroutine
	BPL $46			  ; 10 46 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BIT $131F			; 2C 1F 13 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BNE $10			  ; D0 10 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	STZ $18			  ; 64 18 | Store zero to zero page
	CPX $28			  ; E4 28 | Compare X register (zero page)
	DEC $48			  ; C6 48 | Decrement (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX $FC7C			; EC 7C FC | Compare X register (absolute)
	INC $CEFE			; EE FE CE | Increment (absolute)
	INC $08B4,X		  ; FE B4 08 | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $AC			  ; 50 AC | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $4C			  ; 64 4C | Store zero to zero page
	BCS $4A			  ; B0 4A | Branch if carry set
	JMP ($9462)		  ; 6C 62 94 | Jump to address (absolute indirect)
	LDX $BEFC,Y		  ; BE FC BE | Load from absolute,Y into X register
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_25F
; Address: $DEC95B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_25F:
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $49			  ; F0 49 | Branch if equal
	LDX $0D			  ; A6 0D | Load from zero page into X register
	DEX				  ; CA | Decrement X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_260
; Address: $DEC965
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_260:
	JSR $D804			; 20 04 D8 | Jump to subroutine
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $90			  ; 80 90 | Branch always
	BRA $38			  ; 80 38 | Branch always
	BPL $D0			  ; 10 D0 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA $2C20,Y		  ; 19 20 2C | Logical OR with accumulator (absolute,Y)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	BIT $5113			; 2C 13 51 | Test bits in accumulator (absolute)
	ROL $36C9			; 2E C9 36 | Rotate left (absolute)
	ADC $7D3F,Y		  ; 79 3F 7D | Add with carry (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC $B0			  ; 65 B0 | Add with carry (zero page)
	BVC $04			  ; 50 04 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_261
; Address: $DEC9A6
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_261:
	JSR $241B			; 20 1B 24 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ROL $013E,X		  ; 3E 3E 01 | Rotate left (absolute,X)
	ORA ($B4,X)		  ; 01 B4 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $AC			  ; 50 AC | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $4C			  ; 64 4C | Store zero to zero page
	BCS $4A			  ; B0 4A | Branch if carry set
	JMP ($9066)		  ; 6C 66 90 | Jump to address (absolute indirect)
	LDX $BEFC,Y		  ; BE FC BE | Load from absolute,Y into X register
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	PEA #$A44A		   ; F4 4A A4 | Push effective address to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_262
; Address: $DEC9E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_262:
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CPY $3034			; CC 34 30 | Compare Y register (absolute)
	CPY $6208			; CC 08 62 | Compare Y register (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_263
; Address: $DEC9EF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_263:
	JSR $8090			; 20 90 80 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BPL $C8			  ; 10 C8 | Branch if positive
	BMI $34			  ; 30 34 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BMI $38			  ; 30 38 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_264
; Address: $DEC9FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_264:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $2D			  ; 10 2D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_266
; Address: $DECA17
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_266:
	AND $3F2F,X		  ; 3D 2F 3F | Logical AND with accumulator (absolute,X)
	BIT $2A13			; 2C 13 2A | Test bits in accumulator (absolute)
	ROL $19			  ; 26 19 | Rotate left (zero page)
	BIT $4912			; 2C 12 49 | Test bits in accumulator (absolute)
	AND #$64			 ; 29 64 | Logical AND with accumulator (immediate)
	ADC $393D,X		  ; 7D 3D 39 | Add with carry (absolute,X)
	ORA $3C7C,Y		  ; 19 7C 3C | Logical OR with accumulator (absolute,Y)
	ROL $7EFE,X		  ; 3E FE 7E | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_267
; Address: $DECA46
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_267:
	JSR $2029			; 20 29 20 | Jump to subroutine
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC ($30),Y		  ; 71 30 | Add with carry ((zero page),Y)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA $171F,Y		  ; 19 1F 17 | Logical OR with accumulator (absolute,Y)
	ASL $013E			; 0E 3E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BNE $50			  ; D0 50 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $24			  ; 30 24 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_268
; Address: $DECA74
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_268:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $DC			  ; F0 DC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY $FEF8,X		  ; BC F8 FE | Load from absolute,X into Y register
	DEC $58DC,X		  ; DE DC 58 | Decrement (absolute,X)
	LDY $A0			  ; A4 A0 | Load from zero page into Y register
	JMP $04F428		  ; 5C 28 F4 04 | Jump to address long
	BCS $1C			  ; B0 1C | Branch if carry set
	CPX #$66			 ; E0 66 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	STZ $DE70			; 9C 70 DE | Store zero to absolute
	STX $248C			; 8E 8C 24 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STZ $3C1C			; 9C 1C 3C | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDX #$C0			 ; A2 C0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_269
; Address: $DECAAF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_269:
	JSR $0010			; 20 10 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BMI $88			  ; 30 88 | Branch if negative
	BCS $B8			  ; B0 B8 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_26A
; Address: $DECABE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_26A:
	JSR $2CE0			; 20 E0 2C | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $19			  ; 26 19 | Rotate left (zero page)
	BIT $4912			; 2C 12 49 | Test bits in accumulator (absolute)
	AND #$62			 ; 29 62 | Logical AND with accumulator (immediate)
	ORA $3F7F,X		  ; 1D 7F 3F | Logical OR with accumulator (absolute,X)
	ADC $393D,X		  ; 7D 3D 39 | Add with carry (absolute,X)
	ORA $3C7C,Y		  ; 19 7C 3C | Logical OR with accumulator (absolute,Y)
	ROL $7EFE,X		  ; 3E FE 7E | Rotate left (absolute,X)
	AND $0B02			; 2D 02 0B | Logical AND with accumulator (absolute)
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_26B
; Address: $DECAE6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_26B:
	JSR $2132			; 20 32 21 | PPU graphics register access
	ORA ($66),Y		  ; 11 66 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_26C
; Address: $DECAF6
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_26C:
	AND $121F			; 2D 1F 12 | Logical AND with accumulator (absolute)
	ASL $1C0C,X		  ; 1E 0C 1C | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $A0			  ; A4 A0 | Load from zero page into Y register
	JMP $04F428		  ; 5C 28 F4 04 | Jump to address long
	BCS $1C			  ; B0 1C | Branch if carry set
	CPX #$66			 ; E0 66 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	JMP $DCDEB0		  ; 5C B0 DE DC | Jump to address long
	STX $248C			; 8E 8C 24 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STZ $3C1C			; 9C 1C 3C | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BRA $90			  ; 80 90 | Branch always
	BVC $08			  ; 50 08 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	LDY $C238,X		  ; BC 38 C2 | Load from absolute,X into Y register
	BRA $FC			  ; 80 FC | Branch always
	BRA $10			  ; 80 10 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BMI $88			  ; 30 88 | Branch if negative
	BCS $38			  ; B0 38 | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BPL $27			  ; 10 27 | Branch if positive
	INC				  ; 1A | Increment accumulator
	ADC ($0C,X)		  ; 61 0C | Add with carry ((zero page,X))
	ASL $1E1F			; 0E 1F 1E | Arithmetic shift left (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_26D
; Address: $DECB60
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_26D:
	JSR $261F			; 20 1F 26 | Jump to subroutine
	ORA $0712,X		  ; 1D 12 07 | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_26E
; Address: $DECB67
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_26E:
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ROL $1FC8			; 2E C8 1F | Rotate left (absolute)
	ROR $783E,X		  ; 7E 3E 78 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	BPL $70			  ; 10 70 | Branch if positive
	AND ($7C,X)		  ; 21 7C | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_270
; Address: $DECB7C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_270:
	ROR $40			  ; 66 40 | Rotate right (zero page)
	ROL $10			  ; 26 10 | Rotate left (zero page)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_271
; Address: $DECB86
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_271:
	JSR $2012			; 20 12 20 | Jump to subroutine
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $131F			; 0D 1F 13 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $3E36,X		  ; 1E 36 3E | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BIT $DE2C			; 2C 2C DE | Test bits in accumulator (absolute)
	BPL $6C			  ; 10 6C | Branch if positive
	BIT $58C0			; 2C C0 58 | Test bits in accumulator (absolute)
	STX $64			  ; 86 64 | Store X register to zero page
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $E2C0			; CC C0 E2 | Compare Y register (absolute)
	JMP ($DEC1)		  ; 6C C1 DE | Jump to address (absolute indirect)
	SEP #$6C			 ; E2 6C | Set processor status bits
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	DEC $FEFE,X		  ; DE FE FE | Decrement (absolute,X)
	INC $F804,X		  ; FE 04 F8 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_272
; Address: $DECBC3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_272:
	LDY $E840,X		  ; BC 40 E8 | Load from absolute,X into Y register
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $7C7E			; EC 7E 7C | Compare X register (absolute)
	ASL $5C1C,X		  ; 1E 1C 5C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $3E0C			; 0E 0C 3E | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_273
; Address: $DECBE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_273:
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STY $4C			  ; 84 4C | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_274
; Address: $DECBE8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_274:
	STY $30			  ; 84 30 | Store Y register to zero page
	BCC $AA			  ; 90 AA | Branch if carry clear
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_275
; Address: $DECBEF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_275:
	JSR $0012			; 20 12 00 | Jump to subroutine
	BPL $F8			  ; 10 F8 | Branch if positive
	BMI $34			  ; 30 34 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_276
; Address: $DECBFE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_276:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	ROL $1D			  ; 26 1D | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ROL $1FF0			; 2E F0 1F | Rotate left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ROR $783E,X		  ; 7E 3E 78 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	BPL $70			  ; 10 70 | Branch if positive
	AND ($7C,X)		  ; 21 7C | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_278
; Address: $DECC1C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_278:
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_279
; Address: $DECC23
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_279:
	LDY $E840,X		  ; BC 40 E8 | Load from absolute,X into Y register
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_27A
; Address: $DECC2E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_27A:
	JSL $7C7EF0		  ; 22 F0 7E 7C | Jump to subroutine long
	ASL $5C1C,X		  ; 1E 1C 5C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $3E0C			; 0E 0C 3E | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ROR $02			  ; 66 02 | Rotate right (zero page)
	STZ $08			  ; 64 08 | Store zero to zero page
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	LDY $D824,X		  ; BC 24 D8 | Load from absolute,X into Y register
	JMP $06F882		  ; 5C 82 F8 06 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $BC			  ; 80 BC | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_27B
; Address: $DECC58
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_27B:
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	DEC $E6			  ; C6 E6 | Decrement (zero page)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $190F			; 0D 0F 19 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	EOR $0020,Y		  ; 59 20 00 | Exclusive OR with accumulator (absolute,Y)
	BVS $03			  ; 70 03 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BMI $1F			  ; 30 1F | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	AND $4F06,Y		  ; 39 06 4F | Logical AND with accumulator (absolute,Y)
	BMI $55			  ; 30 55 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3D02,X		  ; 3D 02 3D | Logical AND with accumulator (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $50			  ; 24 50 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ASL $0F12			; 0E 12 0F | Arithmetic shift left (absolute)
	ASL $0608			; 0E 08 06 | Arithmetic shift left (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $F0			  ; B0 F0 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	ASL $1EC0			; 0E C0 1E | Arithmetic shift left (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	PHY				  ; 5A | Push Y register to stack
	LDY $5C			  ; A4 5C | Load from zero page into Y register
	LDY #$14			 ; A0 14 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	JMP $F4F0			; 4C F0 F4 | Jump to address
	CPX #$46			 ; E0 46 | Compare X register (immediate)
	CPX $00FC			; EC FC 00 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_27C
; Address: $DECCF8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_27C:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $20			  ; 30 20 | Branch if negative
	CPX #$19			 ; E0 19 | Compare X register (immediate)
	ROR $56			  ; 66 56 | Rotate right (zero page)
	BCC $20			  ; 90 20 | Branch if carry clear
	BVC $60			  ; 50 60 | Branch if overflow clear
	BEQ $60			  ; F0 60 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_27E
; Address: $DECD13
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_27E:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BMI $55			  ; 30 55 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3D02,X		  ; 3D 02 3D | Logical AND with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PHY				  ; 5A | Push Y register to stack
	LDY $5C			  ; A4 5C | Load from zero page into Y register
	LDY #$14			 ; A0 14 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	JMP $F4F0			; 4C F0 F4 | Jump to address
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $24			  ; 30 24 | Branch if negative
	ORA $1B14			; 0D 14 1B | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($34),Y		  ; 31 34 | Logical AND with accumulator ((zero page),Y)
	ORA #$33			 ; 09 33 | Logical OR with accumulator (immediate)
	ORA $1F02,X		  ; 1D 02 1F | Logical OR with accumulator (absolute,X)
	BIT $2913			; 2C 13 29 | Test bits in accumulator (absolute)
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	ORA $0603			; 0D 03 06 | Logical OR with accumulator (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_27F
; Address: $DECDB5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_27F:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPX $8CEC			; EC EC 8C | Compare X register (absolute)
	CPX $D898			; EC 98 D8 | Compare X register (absolute)
	BNE $CE			  ; D0 CE | Branch if not equal
	BPL $6B			  ; 10 6B | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEP #$11			 ; E2 11 | Set processor status bits
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CPY $28			  ; C4 28 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_280
; Address: $DECDDD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_280:
	JSR $00FE			; 20 FE 00 | Jump to subroutine
	EOR $D5FA			; 4D FA D5 | Exclusive OR with accumulator (absolute)
	INC $EC06			; EE 06 EC | Increment (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BEQ $90			  ; F0 90 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_282
; Address: $DECDF9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_282:
	JSR $0080			; 20 80 00 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	BCC $60			  ; 90 60 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	BNE $08			  ; D0 08 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_284
; Address: $DECE1C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_284:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $34			  ; 80 34 | Branch always
	BIT $2913			; 2C 13 29 | Test bits in accumulator (absolute)
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	ORA $0603			; 0D 03 06 | Logical OR with accumulator (absolute)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	EOR $D5FA			; 4D FA D5 | Exclusive OR with accumulator (absolute)
	INC $EC06			; EE 06 EC | Increment (absolute)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_285
; Address: $DECE6A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_285:
	DEY				  ; 88 | Decrement Y register
	BEQ $90			  ; F0 90 | Branch if equal
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_287
; Address: $DECE79
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_287:
	JSR $0080			; 20 80 00 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX $08			  ; E4 08 | Compare X register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	STY $14			  ; 84 14 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_288
; Address: $DECE8B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_288:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_289
; Address: $DECE97
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_289:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($13),Y		  ; 11 13 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3C			  ; 25 3C | Logical AND with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $33			  ; 70 33 | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)
	AND ($0A),Y		  ; 31 0A | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))
	ROR $3D			  ; 66 3D | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	ORA $1628,X		  ; 1D 28 16 | Logical OR with accumulator (absolute,X)
	ORA $3364			; 0D 64 33 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BPL $01			  ; 10 01 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $4E			  ; 06 4E | Arithmetic shift left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC ($69,X)		  ; 61 69 | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_28A
; Address: $DECEEB
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_28A:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	BPL $50			  ; 10 50 | Branch if positive
	LDY $3CA4			; AC A4 3C | Load from absolute address into Y register
	CPY #$4A			 ; C0 4A | Compare Y register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	ASL $12CC			; 0E CC 12 | Arithmetic shift left (absolute)
	BNE $24			  ; D0 24 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $F850			; 8C 50 F8 | Store Y register to absolute address
	CPY $1230			; CC 30 12 | Compare Y register (absolute)
	CPY $FC02			; CC 02 FC | Compare Y register (absolute)
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	CLV				  ; B8 | Clear overflow flag
	INC				  ; 1A | Increment accumulator
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_28B
; Address: $DECF31
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_28B:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	JMP $0C00			; 4C 00 0C | Jump to address
	CLC				  ; 18 | Clear carry flag
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $64			  ; 70 64 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	BCC $98			  ; 90 98 | Branch if carry clear
	BVS $28			  ; 70 28 | Branch if overflow set
	BEQ $48			  ; F0 48 | Branch if equal
	BVS $10			  ; 70 10 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_28C
; Address: $DECF4C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_28C:
	BCC $60			  ; 90 60 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))
	ROR $3D			  ; 66 3D | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	ORA $1628,X		  ; 1D 28 16 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_28E
; Address: $DECF74
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_28E:
	SEC				  ; 38 | Set carry flag
	BPL $01			  ; 10 01 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ROL $12			  ; 26 12 | Rotate left (zero page)
	CPY $FC02			; CC 02 FC | Compare Y register (absolute)
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	CLV				  ; B8 | Clear overflow flag
	INC				  ; 1A | Increment accumulator
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $26B0			; 2C B0 26 | Test bits in accumulator (absolute)
	CPY $20DC			; CC DC 20 | Compare Y register (absolute)
	JMP $0C00			; 4C 00 0C | Jump to address
	CLC				  ; 18 | Clear carry flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	AND $75BA			; 2D BA 75 | Logical AND with accumulator (absolute)
	ASL $2507,X		  ; 1E 07 25 | Arithmetic shift left (absolute,X)
	ORA $27			  ; 05 27 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	EOR ($BC),Y		  ; 51 BC | Exclusive OR with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	CPX $8003			; EC 03 80 | Compare X register (absolute)
	STX $C000			; 8E 00 C0 | Store X register to absolute address
	BMI $00			  ; 30 00 | Branch if negative
	SEP #$E2			 ; E2 E2 | Set processor status bits
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $EB			  ; 80 EB | Branch always
	BPL $8E			  ; 10 8E | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_28F
; Address: $DECFDA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_28F:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	EOR #$B4			 ; 49 B4 | Exclusive OR with accumulator (immediate)
	EOR $C2AE,X		  ; 5D AE C2 | Exclusive OR with accumulator (absolute,X)
	BVS $E0			  ; 70 E0 | Game work RAM access
	LDY $C2			  ; A4 C2 | Load from zero page into Y register
	CLD				  ; D8 | Clear decimal mode flag
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_290
; Address: $DECFF9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_290:
	JSR $00CC			; 20 CC 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_291
; Address: $DED007
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_291:
	AND #$14			 ; 29 14 | Logical AND with accumulator (immediate)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $8A22			; 4C 22 8A | Jump to address
	STA				  ; 9F 5F BE 7C | Store accumulator to absolute long,X
	LDX $BF7C,Y		  ; BE 7C BF | Load from absolute,Y into X register
	ROR $2F3E			; 6E 3E 2F | Rotate right (absolute)
	ADC $9458,X		  ; 7D 58 94 | Add with carry (absolute,X)
	BRA $5A			  ; 80 5A | Branch always
	EOR #$2A			 ; 49 2A | Exclusive OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $31			  ; 05 31 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BVC $7D			  ; 50 7D | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $3F22,X		  ; 3E 22 3F | Rotate left (absolute,X)
	EOR $18			  ; 45 18 | Exclusive OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$DCA0		   ; F4 A0 DC | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	PEA #$B008		   ; F4 08 B0 | Push effective address to stack
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_293
; Address: $DED04E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_293:
	JSR $DEE0			; 20 E0 DE | Jump to subroutine
	STZ $0E9C,X		  ; 9E 9C 0E | Store zero to absolute,X
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $20			  ; 30 20 | Branch if negative
	BVC $10			  ; 50 10 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	BCC $20			  ; 90 20 | Branch if carry clear
	REP #$E4			 ; C2 E4 | Reset processor status bits
	PHP				  ; 08 | Push processor status to stack
	DEC $D8			  ; C6 D8 | Decrement (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	BMI $10			  ; 30 10 | Branch if negative
	BVC $12			  ; 50 12 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC $DC30			; CE 30 DC | Decrement (absolute)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$14			 ; 29 14 | Logical AND with accumulator (immediate)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_294
; Address: $DED08B
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_294:
	ROL $59			  ; 26 59 | Rotate left (zero page)
	BCC $47			  ; 90 47 | Branch if carry clear
	STA				  ; 9F 5F BE 7C | Store accumulator to absolute long,X
	ROL $7F7C,X		  ; 3E 7C 7F | Rotate left (absolute,X)
	LDX $1A3E			; AE 3E 1A | Load from absolute address into X register
	SEI				  ; 78 | Set interrupt disable flag
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	JMP $2D3C			; 4C 3C 2D | Jump to address
	RTI				  ; 40 | Return from interrupt
	ORA ($31,X)		  ; 01 31 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ADC ($21,X)		  ; 61 21 | PPU graphics register access
	ROL $0F02,X		  ; 3E 02 0F | Rotate left (absolute,X)
	BMI $41			  ; 30 41 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$DCA0		   ; F4 A0 DC | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	PEA #$B008		   ; F4 08 B0 | Push effective address to stack
	BPL $E0			  ; 10 E0 | Game work RAM access
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	DEC $9EDC,X		  ; DE DC 9E | Decrement (absolute,X)
	STZ $0C0E			; 9C 0E 0C | Store zero to absolute
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_295
; Address: $DED0DF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_295:
	JSR $D452			; 20 52 D4 | Jump to subroutine
	TXS				  ; 9A | Transfer X register to stack pointer
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	STX $F0			  ; 86 F0 | Store X register to zero page
	CPY $8080			; CC 80 80 | Compare Y register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $90			  ; 70 90 | Branch if overflow set
	BEQ $78			  ; F0 78 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_296
; Address: $DED0F7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_296:
	PHP				  ; 08 | Push processor status to stack
	STX $FC70			; 8E 70 FC | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1F22,X		  ; 1D 22 1F | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STZ $1B			  ; 64 1B | Store zero to zero page
	DEC $3E			  ; C6 3E | Decrement (zero page)
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_297
; Address: $DED112
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_297:
	ADC $303D,X		  ; 7D 3D 30 | Add with carry (absolute,X)
	BPL $12			  ; 10 12 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ADC $64			  ; 65 64 | Add with carry (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $69F9			; 0E F9 69 | Arithmetic shift left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $1F06,X		  ; 1E 06 1F | Arithmetic shift left (absolute,X)
	BPL $33			  ; 10 33 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_298
; Address: $DED140
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_298:
	JSR $00D8			; 20 D8 00 | Jump to subroutine
	BVC $BC			  ; 50 BC | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	ASL $26E0			; 0E E0 26 | Arithmetic shift left (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_299
; Address: $DED14D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_299:
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($DC),Y		  ; 51 DC | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $0E3C,X		  ; 3E 3C 0E | Rotate left (absolute,X)
	LSR $1C0C			; 4E 0C 1C | Logical shift right (absolute)
	LDX $22			  ; A6 22 | Load from zero page into X register
	BVS $92			  ; 70 92 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	CPX $F1			  ; E4 F1 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $E6			  ; 80 E6 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $78			  ; F0 78 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_29A
; Address: $DED175
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_29A:
	PHP				  ; 08 | Push processor status to stack
	BMI $E6			  ; 30 E6 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1F22,X		  ; 1D 22 1F | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STZ $1B			  ; 64 1B | Store zero to zero page
	ROL $3B8A,X		  ; 3E 8A 3B | Rotate left (absolute,X)
	ADC $303D,X		  ; 7D 3D 30 | Add with carry (absolute,X)
	BPL $12			  ; 10 12 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_29B
; Address: $DED19C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_29B:
	ADC $64			  ; 65 64 | Add with carry (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $29C9			; 0E C9 29 | Arithmetic shift left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1E0F,Y		  ; 19 0F 1E | Logical OR with accumulator (absolute,Y)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	BPL $27			  ; 10 27 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_29C
; Address: $DED1C0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_29C:
	JSR $00D8			; 20 D8 00 | Jump to subroutine
	BVC $BC			  ; 50 BC | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	ASL $26E0			; 0E E0 26 | Arithmetic shift left (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($DC),Y		  ; 51 DC | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $0E3C,X		  ; 3E 3C 0E | Rotate left (absolute,X)
	LSR $1C0C			; 4E 0C 1C | Logical shift right (absolute)
	LDX $26			  ; A6 26 | Load from zero page into X register
	BVS $9F			  ; 70 9F | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $88			  ; F0 88 | Branch if equal
	BRA $EE			  ; 80 EE | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $F0			  ; 90 F0 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_29D
; Address: $DED1F4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_29D:
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	BVS $EE			  ; 70 EE | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA $2C60,Y		  ; 19 60 2C | Logical OR with accumulator (absolute,Y)
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	ADC $25			  ; 65 25 | Add with carry (zero page)
	INC				  ; 1A | Increment accumulator
	ADC ($4E),Y		  ; 71 4E | Add with carry ((zero page),Y)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	LDY $7963,X		  ; BC 63 79 | Load from absolute,X into Y register
	ADC $7F7F,X		  ; 7D 7F 7F | Add with carry (absolute,X)
	STA				  ; 9F 1F 1F 1F | Store accumulator to absolute long,X
	PHY				  ; 5A | Push Y register to stack
	BMI $13			  ; 30 13 | Branch if negative
	BPL $1C			  ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_29F
; Address: $DED22B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_29F:
	BPL $46			  ; 10 46 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BIT $131F			; 2C 1F 13 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP $08A0			; 4C A0 08 | Jump to address
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A0
; Address: $DED245
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A0:
	JSR $D804			; 20 04 D8 | Jump to subroutine
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $90			  ; 80 90 | Branch always
	BRA $38			  ; 80 38 | Branch always
	BPL $D0			  ; 10 D0 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BMI $03			  ; 30 03 | Branch if negative
	WDM #$35			 ; 42 35 | Reserved instruction
	BIT $5062			; 2C 62 50 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 6E 37 1F | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A1
; Address: $DED282
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A1:
	ORA $2C60,Y		  ; 19 60 2C | Logical OR with accumulator (absolute,Y)
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	JMP $1133			; 4C 33 11 | Jump to address
	ROL $5669			; 2E 69 56 | Rotate left (absolute)
	ADC $7D7F,Y		  ; 79 7F 7D | Add with carry (absolute,Y)
	STA				  ; 9F 1F AC 53 | Store accumulator to absolute long,X
	TSX				  ; BA | Transfer stack pointer to X register
	ADC $50			  ; 65 50 | Add with carry (zero page)
	BMI $04			  ; 30 04 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A2
; Address: $DED2A8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A2:
	JSR $241B			; 20 1B 24 | Jump to subroutine
	EOR $3F18,Y		  ; 59 18 3F | Exclusive OR with accumulator (absolute,Y)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BNE $10			  ; D0 10 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	STZ $18			  ; 64 18 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A3
; Address: $DED2CD
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A3:
	CPX $28			  ; E4 28 | Compare X register (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX $FC7C			; EC 7C FC | Compare X register (absolute)
	INC $48FE			; EE FE 48 | Increment (absolute)
	STX $B4			  ; 86 B4 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $AC			  ; 50 AC | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $4C			  ; 64 4C | Store zero to zero page
	BCS $4A			  ; B0 4A | Branch if carry set
	JMP ($FECE)		  ; 6C CE FE | Jump to address (absolute indirect)
	LDX $BEFC,Y		  ; BE FC BE | Load from absolute,Y into X register
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ROR $90			  ; 66 90 | Rotate right (zero page)
	JMP $08A0			; 4C A0 08 | Jump to address
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CPY $20E4			; CC E4 20 | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A4
; Address: $DED30F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A4:
	JSR $F4FC			; 20 FC F4 | Jump to subroutine
	BCC $80			  ; 90 80 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	BPL $C8			  ; 10 C8 | Branch if positive
	BMI $34			  ; 30 34 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A5
; Address: $DED31E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A5:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $2D			  ; 10 2D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A7
; Address: $DED340
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A7:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	ORA #$2D			 ; 09 2D | Logical OR with accumulator (immediate)
	BIT $4D16			; 2C 16 4D | Test bits in accumulator (absolute)
	AND $0C75			; 2D 75 0C | Logical AND with accumulator (absolute)
	AND $7019,Y		  ; 39 19 70 | Logical AND with accumulator (absolute,Y)
	BMI $71			  ; 30 71 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A8
; Address: $DED359
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A8:
	BMI $F0			  ; 30 F0 | Branch if negative
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2A9
; Address: $DED35E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2A9:
	JSL $032E20		  ; 22 20 2E 03 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2AA
; Address: $DED366
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2AA:
	JSR $2029			; 20 29 20 | Jump to subroutine
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC ($30),Y		  ; 71 30 | Add with carry ((zero page),Y)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA $171F,Y		  ; 19 1F 17 | Logical OR with accumulator (absolute,Y)
	ASL $013E			; 0E 3E 01 | Arithmetic shift left (absolute)
	ORA ($58,X)		  ; 01 58 | Logical OR with accumulator ((zero page,X))
	LDY $80			  ; A4 80 | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	BCS $1C			  ; B0 1C | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2AB
; Address: $DED38A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2AB:
	STX $4E90			; 8E 90 4E | Store X register to absolute address
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$DE			 ; E0 DE | Compare X register (immediate)
	STX $048C			; 8E 8C 04 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	STZ $04			  ; 64 04 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDX #$C0			 ; A2 C0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2AC
; Address: $DED3AF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2AC:
	JSR $0010			; 20 10 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BMI $88			  ; 30 88 | Branch if negative
	BCS $B8			  ; B0 B8 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2AD
; Address: $DED3BE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2AD:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $2D			  ; 10 2D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2AF
; Address: $DED3E2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2AF:
	JSR $221F			; 20 1F 22 | Jump to subroutine
	ORA $021B,X		  ; 1D 1B 02 | Logical OR with accumulator (absolute,X)
	AND $350A,X		  ; 3D 0A 35 | Logical AND with accumulator (absolute,X)
	AND $36C3			; 2D C3 36 | Logical AND with accumulator (absolute)
	ADC $343D,X		  ; 7D 3D 34 | Add with carry (absolute,X)
	BPL $60			  ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B0
; Address: $DED3F9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B0:
	JSR $2060			; 20 60 20 | Jump to subroutine
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $73			  ; 70 73 | Branch if overflow set
	ORA $032E			; 0D 2E 03 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B1
; Address: $DED408
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B1:
	JSR $2034			; 20 34 20 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B2
; Address: $DED410
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B2:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BNE $50			  ; D0 50 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $24			  ; 30 24 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $DC			  ; F0 DC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY $FEF8,X		  ; BC F8 FE | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $A0			  ; A4 A0 | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	BCS $1C			  ; B0 1C | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B3
; Address: $DED44C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B3:
	ASL $0E90			; 0E 90 0E | Arithmetic shift left (absolute)
	BEQ $DE			  ; F0 DE | Branch if equal
	DEC $AEDC,X		  ; DE DC AE | Decrement (absolute,X)
	STY $0404			; 8C 04 04 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $E860			; 9C 60 E8 | Store zero to absolute
	BRA $10			  ; 80 10 | Branch always
	BNE $08			  ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B4
; Address: $DED467
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B4:
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $00			  ; 64 00 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B5
; Address: $DED46E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B5:
	STZ $0890			; 9C 90 08 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BMI $48			  ; 30 48 | Branch if negative
	BNE $98			  ; D0 98 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F0			  ; 90 F0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B6
; Address: $DED480
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B6:
	JSR $241F			; 20 1F 24 | Jump to subroutine
	ORA $28			  ; 05 28 | Logical OR with accumulator (zero page)
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	JMP $C817			; 4C 17 C8 | Jump to address
	STZ $0B			  ; 64 0B | Store zero to zero page
	ROR $783E,X		  ; 7E 3E 78 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $70			  ; 10 70 | Branch if positive
	AND ($7B,X)		  ; 21 7B | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BEQ $50			  ; F0 50 | Branch if equal
	BVS $50			  ; 70 50 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $13			  ; 10 13 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	AND ($32,X)		  ; 21 32 | Logical AND with accumulator ((zero page,X))
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$55			 ; 09 55 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $121E			; 2C 1E 12 | Test bits in accumulator (absolute)
	ASL $1C14,X		  ; 1E 14 1C | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	INC $B26C,X		  ; FE 6C B2 | Increment (absolute,X)
	LSR $12EC,X		  ; 5E EC 12 | Logical shift right (absolute,X)
	CPX $DC22			; EC 22 DC | Compare X register (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $28E8			; 9C E8 28 | Store zero to absolute
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	ROR $1212,X		  ; 7E 12 12 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B7
; Address: $DED4DA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B7:
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	BMI $AC			  ; 30 AC | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BPL $FC			  ; 10 FC | Branch if positive
	BRA $10			  ; 80 10 | Branch always
	SEC				  ; 38 | Set carry flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BMI $B0			  ; 30 B0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BVC $78			  ; 50 78 | Branch if overflow clear
	JMP ($807C)		  ; 6C 7C 80 | Jump to address (absolute indirect)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BPL $27			  ; 10 27 | Branch if positive
	INC				  ; 1A | Increment accumulator
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ASL $1E1F			; 0E 1F 1E | Arithmetic shift left (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ROR $730C,X		  ; 7E 0C 73 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B8
; Address: $DED522
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B8:
	JSR $261F			; 20 1F 26 | Jump to subroutine
	ORA $28			  ; 05 28 | Logical OR with accumulator (zero page)
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	JMP $C817			; 4C 17 C8 | Jump to address
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ROL $387A,X		  ; 3E 7A 38 | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $70			  ; 10 70 | Branch if positive
	AND ($7B,X)		  ; 21 7B | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BEQ $50			  ; F0 50 | Branch if equal
	BVS $50			  ; 70 50 | Branch if overflow set
	STZ $0B			  ; 64 0B | Store zero to zero page
	BPL $13			  ; 10 13 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2B9
; Address: $DED548
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2B9:
	JSR $2009			; 20 09 20 | Jump to subroutine
	ASL $4D			  ; 06 4D | Arithmetic shift left (zero page)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2BA
; Address: $DED55A
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2BA:
	ORA $321F,Y		  ; 19 1F 32 | Logical OR with accumulator (absolute,Y)
	ROL $0101,X		  ; 3E 01 01 | Rotate left (absolute,X)
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BIT $DE2C			; 2C 2C DE | Test bits in accumulator (absolute)
	BPL $6C			  ; 10 6C | Branch if positive
	BIT $58C0			; 2C C0 58 | Test bits in accumulator (absolute)
	STX $00			  ; 86 00 | Store X register to zero page
	CPY $E2C0			; CC C0 E2 | Compare Y register (absolute)
	JMP ($DEC1)		  ; 6C C1 DE | Jump to address (absolute indirect)
	SEP #$6C			 ; E2 6C | Set processor status bits
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	DEC $64FE,X		  ; DE FE 64 | Decrement (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $AC72,X		  ; FE 72 AC | Increment (absolute,X)
	AND #$D2			 ; 29 D2 | Logical AND with accumulator (immediate)
	ADC #$B2			 ; 69 B2 | Add with carry (immediate)
	STZ $FEE8			; 9C E8 FE | Store zero to absolute
	INC $7E7E,X		  ; FE 7E 7E | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2BB
; Address: $DED5A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2BB:
	JSR $C808			; 20 08 C8 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PEA #$A250		   ; F4 50 A2 | Push effective address to stack
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2BC
; Address: $DED5AF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2BC:
	JSR $0010			; 20 10 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $D8			  ; 10 D8 | Branch if positive
	BMI $A4			  ; 30 A4 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2BD
; Address: $DED5BE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2BD:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2BE
; Address: $DED5CE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2BE:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	AND $7F1F,X		  ; 3D 1F 7F | Logical AND with accumulator (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	AND $7F1F,X		  ; 3D 1F 7F | Logical AND with accumulator (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	LDY $D824,X		  ; BC 24 D8 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2BF
; Address: $DED60C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2BF:
	JMP $06F882		  ; 5C 82 F8 06 | Jump to address long
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $BC			  ; 80 BC | Branch always
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	DEC $E6			  ; C6 E6 | Decrement (zero page)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BIT $571C			; 2C 1C 57 | Test bits in accumulator (absolute)
	EOR $001F,Y		  ; 59 1F 00 | Exclusive OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C0
; Address: $DED63C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C0:
	JSR $2000			; 20 00 20 | Jump to subroutine
	JMP $280C			; 4C 0C 28 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C1
; Address: $DED644
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C1:
	JSR $4800			; 20 00 48 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3500			; 2D 00 35 | Logical AND with accumulator (absolute)
	ADC $3F00,X		  ; 7D 00 3F | Add with carry (absolute,X)
	ORA $0220			; 0D 20 02 | Logical OR with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1A00			; 0E 00 1A | Arithmetic shift left (absolute)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BIT $4A38			; 2C 38 4A | Test bits in accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C2
; Address: $DED698
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C2:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $B200			; 8C 00 B2 | Store Y register to absolute address
	BCS $14			  ; B0 14 | Branch if carry set
	BPL $04			  ; 10 04 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $E800			; 4C 00 E8 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	CPX $F400			; EC 00 F4 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C3
; Address: $DED6BC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C3:
	LDY $A800			; AC 00 A8 | Load from absolute address into Y register
	LSR $BE00			; 4E 00 BE | Logical shift right (absolute)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BCS $04			  ; B0 04 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	CPX $7000			; EC 00 70 | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1804			; 0D 04 18 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $000D			; 2D 0D 00 | Logical AND with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C4
; Address: $DED700
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C4:
	JSR $4300			; 20 00 43 | Jump to subroutine
	ORA ($6B),Y		  ; 11 6B | Logical OR with accumulator ((zero page),Y)
	AND ($69,X)		  ; 21 69 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C5
; Address: $DED709
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C5:
	JSR $004B			; 20 4B 00 | Jump to subroutine
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BIT $1400			; 2C 00 14 | Test bits in accumulator (absolute)
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA $2703,Y		  ; 19 03 27 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BIT $5C38			; 2C 38 5C | Test bits in accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEC $A6CC			; CE CC A6 | Decrement (absolute)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	INX				  ; E8 | Increment X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C6
; Address: $DED761
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C6:
	JSR $6062			; 20 62 60 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $14			  ; D0 14 | Branch if not equal
	BEQ $34			  ; F0 34 | Branch if equal
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $0400			; 9C 00 04 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C7
; Address: $DED778
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C7:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $A0			  ; 10 A0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C8
; Address: $DED780
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C8:
	SED				  ; F8 | Set decimal mode flag
	BRA $70			  ; 80 70 | Branch always
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag
	BRA $B0			  ; 80 B0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCC $80			  ; 90 80 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2C9
; Address: $DED7A0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2C9:
	JSR $4300			; 20 00 43 | Jump to subroutine
	ORA ($6B),Y		  ; 11 6B | Logical OR with accumulator ((zero page),Y)
	AND ($69,X)		  ; 21 69 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2CA
; Address: $DED7A9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2CA:
	JSR $004B			; 20 4B 00 | Jump to subroutine
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BIT $1400			; 2C 00 14 | Test bits in accumulator (absolute)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA $2703,Y		  ; 19 03 27 | Logical OR with accumulator (absolute,Y)
	ROL $1800,X		  ; 3E 00 18 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BRA $B0			  ; 80 B0 | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $B0			  ; 80 B0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $40			  ; D0 40 | Branch if not equal
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BMI $18			  ; 30 18 | Branch if negative
	EOR $001D,Y		  ; 59 1D 00 | Exclusive OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2CC
; Address: $DED822
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2CC:
	JSL $0D2A03		  ; 22 03 2A 0D | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2CD
; Address: $DED82D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2CD:
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $15			  ; 10 15 | Branch if positive
	INC				  ; 1A | Increment accumulator
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BMI $8C			  ; 30 8C | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	PHY				  ; 5A | Push Y register to stack
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2CF
; Address: $DED880
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2CF:
	JSL $C04420		  ; 22 20 44 C0 | Jump to subroutine long
	BCS $12			  ; B0 12 | Branch if carry set
	CPX #$6E			 ; E0 6E | Compare X register (immediate)
	CPY $FA			  ; C4 FA | Compare Y register (zero page)
	BPL $FE			  ; 10 FE | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INC $DC08,X		  ; FE 08 DC | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	CPX $D830			; EC 30 D8 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D0
; Address: $DED8A5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D0:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D2
; Address: $DED8C0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D2:
	JMP $220D			; 4C 0D 22 | Jump to address
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0748			; 0D 48 07 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $32			  ; 10 32 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $15			  ; 10 15 | Branch if positive
	BPL $1A			  ; 10 1A | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D3
; Address: $DED8E0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D3:
	JSL $C04420		  ; 22 20 44 C0 | Jump to subroutine long
	BCS $12			  ; B0 12 | Branch if carry set
	CPX #$6E			 ; E0 6E | Compare X register (immediate)
	CPY $FA			  ; C4 FA | Compare Y register (zero page)
	BPL $FE			  ; 10 FE | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INC $DC00,X		  ; FE 00 DC | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ASL $1A0F,X		  ; 1E 0F 1A | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $0D0D,X		  ; 1D 0D 0D | Logical OR with accumulator (absolute,X)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D4
; Address: $DED923
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D4:
	JSR $0232			; 20 32 02 | Jump to subroutine
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $48			  ; 90 48 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	BIT $78E8			; 2C E8 78 | Test bits in accumulator (absolute)
	BEQ $5C			  ; F0 5C | Branch if equal
	JMP $E82A3A		  ; 5C 3A 2A E8 | Jump to address long
	INC $FC			  ; E6 FC | Increment (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BCS $70			  ; B0 70 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D6
; Address: $DED958
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D6:
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	INC $F1EC			; EE EC F1 | Increment (absolute)
	BEQ $DD			  ; F0 DD | Branch if equal
	DEX				  ; CA | Decrement X register
	INC $00			  ; E6 00 | Increment (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $38			  ; F0 38 | Branch if equal
	BMI $F8			  ; 30 F8 | Branch if negative
	BEQ $70			  ; F0 70 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D7
; Address: $DED96E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D7:
	BCS $E0			  ; B0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$51			 ; E0 51 | Compare X register (immediate)
	LDY $5A			  ; A4 5A | Load from zero page into Y register
	BRA $10			  ; 80 10 | Branch always
	CMP $C508			; CD 08 C5 | Compare accumulator (absolute)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	SBC $CAEF			; ED EF CA | Subtract with carry (absolute)
	INC $C6CC			; EE CC C6 | Increment (absolute)
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA $0005			; 0D 05 00 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	INC $EC10,X		  ; FE 10 EC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BVS $90			  ; 70 90 | Branch if overflow set
	BRA $D0			  ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D8
; Address: $DED9CF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D8:
	BVC $12			  ; 50 12 | Branch if overflow clear
	LDX $A6			  ; A6 A6 | Load from zero page into X register
	STY $84			  ; 84 84 | Store Y register to zero page
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2D9
; Address: $DED9D9
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2D9:
	JSR $0080			; 20 80 00 | Jump to subroutine
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVC $60			  ; 50 60 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	BVS $80			  ; 70 80 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BNE $C0			  ; D0 C0 | Branch if not equal
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BMI $E0			  ; 30 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $08			  ; B0 08 | Branch if carry set
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$31			 ; E0 31 | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	BPL $6D			  ; 10 6D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ADC $6A6F			; 6D 6F 6A | Add with carry (absolute)
	ROR $366C			; 6E 6C 36 | Rotate right (absolute)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $0705			; 0D 05 07 | Logical OR with accumulator (absolute)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2DA
; Address: $DEDA42
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2DA:
	PHP				  ; 08 | Push processor status to stack
	INC $EC10,X		  ; FE 10 EC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BVS $18			  ; 70 18 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	BPL $12			  ; 10 12 | Branch if positive
	LDX $A6			  ; A6 A6 | Load from zero page into X register
	STY $84			  ; 84 84 | Store Y register to zero page
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2DB
; Address: $DEDA59
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2DB:
	JSR $0080			; 20 80 00 | Jump to subroutine
	INX				  ; E8 | Increment X register
	BRA $D8			  ; 80 D8 | Branch always
	INX				  ; E8 | Increment X register
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	NOP				  ; EA | No operation
	CPX $00F4			; EC F4 00 | Compare X register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY $6C78			; CC 78 6C | Compare Y register (absolute)
	PEA #$F0E8		   ; F4 E8 F0 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	AND $1F04			; 2D 04 1F | Logical AND with accumulator (absolute)
	ORA $1F22,X		  ; 1D 22 1F | Logical OR with accumulator (absolute,X)
	BPL $06			  ; 10 06 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $3F			  ; 50 3F | Branch if overflow clear
	AND $0819,Y		  ; 39 19 08 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $60			  ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2DC
; Address: $DEDAA2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2DC:
	CLV				  ; B8 | Clear overflow flag
	BVC $56			  ; 50 56 | Branch if overflow clear
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ASL $1F0E,X		  ; 1E 0E 1F | Arithmetic shift left (absolute,X)
	ASL $0D06			; 0E 06 0D | Arithmetic shift left (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	JMP $44B8			; 4C B8 44 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BNE $48			  ; D0 48 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BVC $10			  ; 50 10 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BMI $7C			  ; 30 7C | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BPL $0C			  ; 10 0C | Branch if positive
	ROR				  ; 6A | Rotate right (accumulator)
	STY $3C			  ; 84 3C | Store Y register to zero page
	BMI $68			  ; 30 68 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2DD
; Address: $DEDAEA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2DD:
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	JMP $E062F8		  ; 5C F8 62 E0 | Game work RAM access
	BPL $90			  ; 10 90 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $1F04			; 2D 04 1F | Logical AND with accumulator (absolute)
	ORA $1F22,X		  ; 1D 22 1F | Logical OR with accumulator (absolute,X)
	BPL $06			  ; 10 06 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND $0819,Y		  ; 39 19 08 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2DE
; Address: $DEDB1E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2DE:
	ROL $901F,X		  ; 3E 1F 90 | Rotate left (absolute,X)
	CPX $F840			; EC 40 F8 | Compare X register (absolute)
	JMP $44B8			; 4C B8 44 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	JMP $0A1A5C		  ; 5C 5C 1A 0A | Jump to address long
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BVC $10			  ; 50 10 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $FC			  ; 10 FC | Branch if positive
	SEC				  ; 38 | Set carry flag
	ROR $03EC			; 6E EC 03 | Rotate right (absolute)
	ORA $1404			; 0D 04 14 | Logical OR with accumulator (absolute)
	AND $2300			; 2D 00 23 | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BIT $0320			; 2C 20 03 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E0
; Address: $DEDB61
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E0:
	JSR $0839			; 20 39 08 | Jump to subroutine
	ROL $1708,X		  ; 3E 08 17 | Rotate left (absolute,X)
	BMI $5F			  ; 30 5F | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $13			  ; 30 13 | Branch if negative
	BIT $213E			; 2C 3E 21 | PPU graphics register access
	ROL $1231			; 2E 31 12 | Rotate left (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	BPL $B8			  ; 10 B8 | Branch if positive
	BVC $FC			  ; 50 FC | Branch if overflow clear
	CLV				  ; B8 | Clear overflow flag
	BNE $3C			  ; D0 3C | Branch if not equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E1
; Address: $DEDBB2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E1:
	JSR $10F0			; 20 F0 10 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVC $FC			  ; 50 FC | Branch if overflow clear
	CLV				  ; B8 | Clear overflow flag
	BNE $FC			  ; D0 FC | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	CPY $1C0C			; CC 0C 1C | Compare Y register (absolute)
	BPL $7C			  ; 10 7C | Branch if positive
	BVC $E8			  ; 50 E8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E2
; Address: $DEDBC7
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E2:
	JSR $F468			; 20 68 F4 | Jump to subroutine
	SEP #$EC			 ; E2 EC | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BPL $C0			  ; 10 C0 | Branch if positive
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PEA #$F40C		   ; F4 0C F4 | Push effective address to stack
	JMP ($B89C)		  ; 6C 9C B8 | Jump to address (absolute indirect)
	PLP				  ; 28 | Pull processor status from stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $3C00			; CC 00 3C | Compare Y register (absolute)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E3
; Address: $DEDC01
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E3:
	JSR $0839			; 20 39 08 | Jump to subroutine
	ROL $1708,X		  ; 3E 08 17 | Rotate left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E4
; Address: $DEDC10
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E4:
	JSR $081F			; 20 1F 08 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPY $1C0C			; CC 0C 1C | Compare Y register (absolute)
	BPL $7C			  ; 10 7C | Branch if positive
	BVC $E8			  ; 50 E8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E5
; Address: $DEDC27
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E5:
	JSR $F468			; 20 68 F4 | Jump to subroutine
	INC $0CFA			; EE FA 0C | Increment (absolute)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BPL $C0			  ; 10 C0 | Branch if positive
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($21),Y		  ; 71 21 | PPU graphics register access
	JMP $070118		  ; 5C 18 01 07 | Jump to address long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ROR $3C6E,X		  ; 7E 6E 3C | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BIT $3F73			; 2C 73 3F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E6
; Address: $DEDC72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E6:
	ADC $192C			; 6D 2C 19 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $3900,X		  ; 3D 00 39 | Logical AND with accumulator (absolute,X)
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E7
; Address: $DEDC89
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E7:
	JSR $2C33			; 20 33 2C | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2E8
; Address: $DEDC98
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2E8:
	JSR $2F00			; 20 00 2F | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVC $50			  ; 50 50 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $84			  ; F0 84 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$5C			 ; E0 5C | Compare X register (immediate)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $38			  ; D0 38 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2EA
; Address: $DEDCCB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2EA:
	JSR $D838			; 20 38 D8 | Jump to subroutine
	BNE $10			  ; D0 10 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2EB
; Address: $DEDCDF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2EB:
	JSR $1C18			; 20 18 1C | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	CPY $08E8			; CC E8 08 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BPL $D0			  ; 10 D0 | Branch if positive
	BMI $D0			  ; 30 D0 | Branch if negative
	BMI $A0			  ; 30 A0 | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2EC
; Address: $DEDCF1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2EC:
	CPX #$2A			 ; E0 2A | Compare X register (immediate)
	BNE $EC			  ; D0 EC | Branch if not equal
	BPL $C0			  ; 10 C0 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	ROR $3C6E,X		  ; 7E 6E 3C | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $192C			; 6D 2C 19 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2EE
; Address: $DEDD27
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2EE:
	JSR $302F			; 20 2F 30 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	ORA $001F			; 0D 1F 00 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $B8			  ; E4 B8 | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $38			  ; D0 38 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F0
; Address: $DEDD4B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F0:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	BNE $90			  ; D0 90 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	BMI $90			  ; 30 90 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BPL $E8			  ; 10 E8 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BNE $80			  ; D0 80 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F1
; Address: $DEDD70
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F1:
	BPL $40			  ; 10 40 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $28			  ; 10 28 | Branch if positive
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $18			  ; 10 18 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F2
; Address: $DEDD7C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F2:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA $1C0C			; 0D 0C 1C | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $26			  ; 10 26 | Branch if positive
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	BIT $322B			; 2C 2B 32 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F3
; Address: $DEDDA4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F3:
	JSR $3115			; 20 15 31 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($39),Y		  ; 51 39 | Exclusive OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	BMI $20			  ; 30 20 | Branch if negative
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F4
; Address: $DEDDB6
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F4:
	JSR $3004			; 20 04 30 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	ROR $0200,X		  ; 7E 00 02 | Rotate right (absolute,X)
	ORA $4A			  ; 05 4A | Logical OR with accumulator (zero page)
	BIT $3E			  ; 24 3E | Test bits in accumulator (zero page)
	ROL $2E20,X		  ; 3E 20 2E | Rotate left (absolute,X)
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	AND $041D,Y		  ; 39 1D 04 | Logical AND with accumulator (absolute,Y)
	ASL $2601			; 0E 01 26 | Arithmetic shift left (absolute)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	BPL $F8			  ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F5
; Address: $DEDDE7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F5:
	JSR $303C			; 20 3C 30 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $3C			  ; C4 3C | Compare Y register (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F7
; Address: $DEDDF6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F7:
	JSR $30F8			; 20 F8 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	STY $78			  ; 84 78 | Store Y register to zero page
	STZ $3C78			; 9C 78 3C | Store zero to absolute
	JMP $04A8			; 4C A8 04 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $D874			; 8C 74 D8 | Store Y register to absolute address
	ROL $9EE4			; 2E E4 9E | Rotate left (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	JMP ($0C4A)		  ; 6C 4A 0C | Jump to address (absolute indirect)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2F8
; Address: $DEDE12
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2F8:
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	BCS $4C			  ; B0 4C | Branch if carry set
	BMI $7C			  ; 30 7C | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $7C			  ; 84 7C | Store Y register to zero page
	LDY $2028			; AC 28 20 | Load from absolute address into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	BCS $78			  ; B0 78 | Branch if carry set
	BRA $64			  ; 80 64 | Branch always
	BRA $1C			  ; 80 1C | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BPL $FC			  ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2FA
; Address: $DEDE44
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2FA:
	JSR $3115			; 20 15 31 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $3659,Y		  ; 79 59 36 | Add with carry (absolute,Y)
	BMI $20			  ; 30 20 | Branch if negative
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2FB
; Address: $DEDE56
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2FB:
	JSR $7004			; 20 04 70 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1200,X		  ; 1E 00 12 | Arithmetic shift left (absolute,X)
	ORA $DC3C			; 0D 3C DC | Logical OR with accumulator (absolute)
	JMP $04A8			; 4C A8 04 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $D874			; 8C 74 D8 | Store Y register to absolute address
	BIT $8AF4			; 2C F4 8A | Test bits in accumulator (absolute)
	STZ $526E			; 9C 6E 52 | Store zero to absolute
	DEY				  ; 88 | Decrement Y register
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $7E00			; 0E 00 7E | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA $331E,Y		  ; 19 1E 33 | Logical OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2FC
; Address: $DEDE96
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2FC:
	INC				  ; 1A | Increment accumulator
	AND $3F50,Y		  ; 39 50 3F | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $3D0F,Y		  ; 19 0F 3D | Logical OR with accumulator (absolute,Y)
	ADC ($A0,X)		  ; 61 A0 | Add with carry ((zero page,X))
	JMP $0946			; 4C 46 09 | Jump to address
	ASL $1701			; 0E 01 17 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2FD
; Address: $DEDEC9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2FD:
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	CPY $F47C			; CC 7C F4 | Compare Y register (absolute)
	CPX $E4FC			; EC FC E4 | Compare X register (absolute)
	PHX				  ; DA | Push X register to stack
	INC $00			  ; E6 00 | Increment (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2FE
; Address: $DEDEF7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2FE:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	INC $B200,X		  ; FE 00 B2 | Increment (absolute,X)
	DEC $FCCA			; CE CA FC | Decrement (absolute)
	NOP				  ; EA | No operation
	LDY $BCF8			; AC F8 BC | Load from absolute address into Y register
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BEQ $B8			  ; F0 B8 | Branch if equal
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	STY $240A			; 8C 0A 24 | Store Y register to absolute address
	STZ $90			  ; 64 90 | Store zero to zero page
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_2FF
; Address: $DEDF27
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_2FF:
	JSR $20D8			; 20 D8 20 | Jump to subroutine
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BPL $40			  ; 10 40 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $57			  ; 80 57 | Branch always
	AND $3F50,Y		  ; 39 50 3F | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $1D0F,Y		  ; 19 0F 1D | Logical OR with accumulator (absolute,Y)
	DEC $FCCA			; CE CA FC | Decrement (absolute)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_300
; Address: $DEDF66
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_300:
	LDY $BCF8			; AC F8 BC | Load from absolute address into Y register
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BEQ $BC			  ; F0 BC | Branch if equal
	INX				  ; E8 | Increment X register
	NOP				  ; EA | No operation
	CPY $00FE			; CC FE 00 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_301
; Address: $DEDF92
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_301:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1D01			; 0E 01 1D | Arithmetic shift left (absolute)
	JMP $6373			; 4C 73 63 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_302
; Address: $DEDFA5
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_302:
	ADC $1D2A,X		  ; 7D 2A 1D | Add with carry (absolute,X)
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	ORA $0E0E,X		  ; 1D 0E 0E | Logical OR with accumulator (absolute,X)
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $010E			; 0D 0E 01 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $1F05			; 0D 05 1F | Logical OR with accumulator (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	PEA #$D4EC		   ; F4 EC D4 | Push effective address to stack
	CPX $CC74			; EC 74 CC | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDY $ECF8,X		  ; BC F8 EC | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BCS $90			  ; B0 90 | Branch if carry set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPX #$44			 ; E0 44 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_303
; Address: $DEE00F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_303:
	BMI $F8			  ; 30 F8 | Branch if negative
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_304
; Address: $DEE020
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_304:
	LDX #$54			 ; A2 54 | Load immediate value into X register
	STZ $00			  ; 64 00 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BCC $20			  ; 90 20 | Branch if carry clear
	BNE $28			  ; D0 28 | Branch if not equal
	BNE $98			  ; D0 98 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BCS $A0			  ; B0 A0 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_305
; Address: $DEE032
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_305:
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BPL $A0			  ; 10 A0 | Branch if positive
	CPX #$4C			 ; E0 4C | Compare X register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_306
; Address: $DEE045
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_306:
	ADC $1D2A,X		  ; 7D 2A 1D | Add with carry (absolute,X)
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	ORA $0F0E,X		  ; 1D 0E 0F | Logical OR with accumulator (absolute,X)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0916			; 0D 16 09 | Logical OR with accumulator (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $020C			; 0E 0C 02 | Arithmetic shift left (absolute)
	CLV				  ; B8 | Clear overflow flag
	LDY $ECF8,X		  ; BC F8 EC | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BCS $90			  ; B0 90 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCS $F8			  ; B0 F8 | Branch if carry set
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_307
; Address: $DEE09A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_307:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVC $40			  ; 50 40 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_308
; Address: $DEE09F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_308:
	JSR $D020			; 20 20 D0 | Jump to subroutine
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_309
; Address: $DEE0A5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_309:
	BRA $50			  ; 80 50 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCS $68			  ; B0 68 | Branch if carry set
	BCC $A8			  ; 90 A8 | Branch if carry clear
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	BRA $08			  ; 80 08 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BCS $A0			  ; B0 A0 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	AND $333F,X		  ; 3D 3F 33 | Logical AND with accumulator (absolute,X)
	ADC #$77			 ; 69 77 | Add with carry (immediate)
	ADC #$77			 ; 69 77 | Add with carry (immediate)
	ROL $3C15			; 2E 15 3C | Rotate left (absolute)
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	INC				  ; 1A | Increment accumulator
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	ROL $1400,X		  ; 3E 00 14 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_30A
; Address: $DEE0F6
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_30A:
	JSR $3001			; 20 01 30 | Jump to subroutine
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $9606			; 0E 06 96 | Arithmetic shift left (absolute)
	ADC ($A0,X)		  ; 61 A0 | Add with carry ((zero page,X))
	JMP $0946			; 4C 46 09 | Jump to address
	ASL $1701			; 0E 01 17 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$CCFC		   ; F4 FC CC | Push effective address to stack
	PEA #$EC9C		   ; F4 9C EC | Push effective address to stack
	PHX				  ; DA | Push X register to stack
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_30C
; Address: $DEE13E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_30C:
	INC $B200,X		  ; FE 00 B2 | Increment (absolute,X)
	INC $BC5A,X		  ; FE 5A BC | Increment (absolute,X)
	INC				  ; 1A | Increment accumulator
	INX				  ; E8 | Increment X register
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $24			  ; F0 24 | Branch if equal
	INY				  ; C8 | Increment Y register
	ROL $1C00,X		  ; 3E 00 1C | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_30D
; Address: $DEE15B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_30D:
	JSR $6060			; 20 60 60 | Jump to subroutine
	BVS $60			  ; 70 60 | Branch if overflow set
	STY $240A			; 8C 0A 24 | Store Y register to absolute address
	STZ $90			  ; 64 90 | Store zero to zero page
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_30E
; Address: $DEE167
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_30E:
	JSR $20D8			; 20 D8 20 | Jump to subroutine
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BCC $40			  ; 90 40 | Branch if carry clear
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ROL $3C15			; 2E 15 3C | Rotate left (absolute)
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BIT $13			  ; 24 13 | Test bits in accumulator (zero page)
	ROL $1400,X		  ; 3E 00 14 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_30F
; Address: $DEE196
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_30F:
	JSR $3001			; 20 01 30 | Jump to subroutine
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $4A06			; 0E 06 4A | Arithmetic shift left (absolute)
	AND ($50),Y		  ; 31 50 | Logical AND with accumulator ((zero page),Y)
	BIT $26			  ; 24 26 | Test bits in accumulator (zero page)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $BC5A,X		  ; FE 5A BC | Increment (absolute,X)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_310
; Address: $DEE1C7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_310:
	INX				  ; E8 | Increment X register
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $003E			; CC 3E 00 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_311
; Address: $DEE1DB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_311:
	JSR $6060			; 20 60 60 | Jump to subroutine
	BVS $60			  ; 70 60 | Branch if overflow set
	ADC #$86			 ; 69 86 | Add with carry (immediate)
	ORA $32			  ; 05 32 | Logical OR with accumulator (zero page)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	INX				  ; E8 | Increment X register
	BPL $68			  ; 10 68 | Branch if positive
	BCC $50			  ; 90 50 | Branch if carry clear
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BNE $C0			  ; D0 C0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_312
; Address: $DEE1FD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_312:
	JSR $C040			; 20 40 C0 | Jump to subroutine
	ROL $0037			; 2E 37 00 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $301B,X		  ; 3D 1B 30 | Logical AND with accumulator (absolute,X)
	BPL $0D			  ; 10 0D | Branch if positive
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $07			  ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_313
; Address: $DEE22E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_313:
	JSL $001B0C		  ; 22 0C 1B 00 | Jump to subroutine long
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	AND $301B,X		  ; 3D 1B 30 | Logical AND with accumulator (absolute,X)
	BPL $0D			  ; 10 0D | Branch if positive
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $001B			; 0D 1B 00 | Logical OR with accumulator (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_315
; Address: $DEE28D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_315:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_31A
; Address: $DEE2A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_31A:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_31D
; Address: $DEE2B8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_31D:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_31F
; Address: $DEE2C7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_31F:
	JSR $1010			; 20 10 10 | Jump to subroutine
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_321
; Address: $DEE2D7
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_321:
	JSR $1010			; 20 10 10 | Jump to subroutine
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
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
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_322
; Address: $DEE329
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_322:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_324
; Address: $DEE34D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_324:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_329
; Address: $DEE368
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_329:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_32C
; Address: $DEE378
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_32C:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_32E
; Address: $DEE385
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_32E:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL $400E			; 0E 0E 40 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_331
; Address: $DEE398
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_331:
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_333
; Address: $DEE3F0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_333:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_337
; Address: $DEE40B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_337:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_339
; Address: $DEE41B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_339:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_33A
; Address: $DEE420
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_33A:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_33C
; Address: $DEE427
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_33C:
	JSR $1010			; 20 10 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_33D
; Address: $DEE42C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_33D:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_33F
; Address: $DEE437
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_33F:
	JSR $1010			; 20 10 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_340
; Address: $DEE43C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_340:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_341
; Address: $DEE448
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_341:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $1C			  ; 30 1C | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_342
; Address: $DEE458
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_342:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $1C			  ; 30 1C | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_344
; Address: $DEE466
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_344:
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_346
; Address: $DEE476
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_346:
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_347
; Address: $DEE47A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_347:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_349
; Address: $DEE4CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_349:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_34B
; Address: $DEE4DB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_34B:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_34E
; Address: $DEE4EA
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_34E:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_34F
; Address: $DEE4EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_34F:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_351
; Address: $DEE4F7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_351:
	JSR $1010			; 20 10 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_353
; Address: $DEE501
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_353:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_355
; Address: $DEE513
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_355:
	JSR $1010			; 20 10 10 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_357
; Address: $DEE526
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_357:
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_359
; Address: $DEE536
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_359:
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_35A
; Address: $DEE54C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_35A:
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_35C
; Address: $DEE56D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_35C:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_35E
; Address: $DEE57D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_35E:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_360
; Address: $DEE58D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_360:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_365
; Address: $DEE5A9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_365:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_368
; Address: $DEE5B9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_368:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_36A
; Address: $DEE5C5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_36A:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL $400E			; 0E 0E 40 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_36C
; Address: $DEE5D5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_36C:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_36E
; Address: $DEE630
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_36E:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_372
; Address: $DEE64D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_372:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_377
; Address: $DEE669
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_377:
	JSR $4040			; 20 40 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_37A
; Address: $DEE679
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_37A:
	JSR $4040			; 20 40 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_37C
; Address: $DEE687
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_37C:
	JSR $1010			; 20 10 10 | Jump to subroutine
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_37E
; Address: $DEE697
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_37E:
	JSR $1010			; 20 10 10 | Jump to subroutine
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_37F
; Address: $DEE6B8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_37F:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_381
; Address: $DEE70F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_381:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_383
; Address: $DEE71F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_383:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_385
; Address: $DEE731
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_385:
	JSR $2424			; 20 24 24 | Jump to subroutine
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_386
; Address: $DEE738
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_386:
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_387
; Address: $DEE73E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_387:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_388
; Address: $DEE744
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_388:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_389
; Address: $DEE754
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_389:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_38A
; Address: $DEE7C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_38A:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_38C
; Address: $DEE7CF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_38C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_38E
; Address: $DEE7DF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_38E:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_38F
; Address: $DEE7F0
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_38F:
	JSR $2420			; 20 20 24 | Jump to subroutine
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_390
; Address: $DEE832
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_390:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
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
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_392
; Address: $DEE8A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_392:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_395
; Address: $DEE8BC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_395:
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_396
; Address: $DEE900
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_396:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_397
; Address: $DEE910
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_397:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PEA #$08F4		   ; F4 F4 08 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	PEA #$08F4		   ; F4 F4 08 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_399
; Address: $DEE969
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_399:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_39B
; Address: $DEE979
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_39B:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_39C
; Address: $DEE9C0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_39C:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_39D
; Address: $DEE9D0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_39D:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PEA #$08F4		   ; F4 F4 08 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	PEA #$08F4		   ; F4 F4 08 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_39E
; Address: $DEEA3C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_39E:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA $80808F		  ; 8F 8F 80 80 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA $80808F		  ; 8F 8F 80 80 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA $80808F		  ; 8F 8F 80 80 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_39F
; Address: $DEEB0A
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_39F:
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA $80808F		  ; 8F 8F 80 80 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3A1
; Address: $DEEBAD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3A1:
	JSR $2020			; 20 20 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3A3
; Address: $DEEBBD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3A3:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3A5
; Address: $DEEBC8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3A5:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3A6
; Address: $DEEBD8
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3A6:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3A8
; Address: $DEEC6D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3A8:
	JSR $2020			; 20 20 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3AA
; Address: $DEEC7D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3AA:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3AB
; Address: $DEEC88
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3AB:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3AC
; Address: $DEEC98
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3AC:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3AD
; Address: $DEECFA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3AD:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3AE
; Address: $DEED26
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3AE:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3AF
; Address: $DEED36
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3AF:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BCC $90			  ; 90 90 | Branch if carry clear
	STA $40408F		  ; 8F 8F 40 40 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B0
; Address: $DEED48
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B0:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BCC $90			  ; 90 90 | Branch if carry clear
	STA $40408F		  ; 8F 8F 40 40 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B1
; Address: $DEED58
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B1:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B2
; Address: $DEEDE6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B2:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B3
; Address: $DEEDEC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B3:
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B4
; Address: $DEEDF6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B4:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BCC $90			  ; 90 90 | Branch if carry clear
	STA $40408F		  ; 8F 8F 40 40 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B5
; Address: $DEEE08
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B5:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BCC $90			  ; 90 90 | Branch if carry clear
	STA $40408F		  ; 8F 8F 40 40 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B6
; Address: $DEEE18
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B6:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	ORA $130B			; 0D 0B 13 | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STZ $43			  ; 64 43 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	BPL $67			  ; 10 67 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $9EA1,X		  ; FE A1 9E | Increment (absolute,X)
	ADC ($56),Y		  ; 71 56 | Add with carry ((zero page),Y)
	AND $706B,Y		  ; 39 6B 70 | Logical AND with accumulator (absolute,Y)
	ADC #$50			 ; 69 50 | Add with carry (immediate)
	JMP ($DF10)		  ; 6C 10 DF | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B8
; Address: $DEEEB0
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B8:
	LDA				  ; BF 00 1F 00 | Load from absolute long,X into accumulator
	ADC $3C06,Y		  ; 79 06 3C | Add with carry (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	STA $5B6E,Y		  ; 99 6E 5B | Store accumulator to absolute,Y
	BIT $2D7A			; 2C 7A 2D | Test bits in accumulator (absolute)
	AND $173E			; 2D 3E 17 | Logical AND with accumulator (absolute)
	ORA $0C0B,X		  ; 1D 0B 0C | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BCS $B8			  ; B0 B8 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	CPY $6C			  ; C4 6C | Compare Y register (zero page)
	STY $4C			  ; 84 4C | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$EC08		   ; F4 08 EC | Push effective address to stack
	BPL $C8			  ; 10 C8 | Branch if positive
	BMI $77			  ; 30 77 | Branch if negative
	STA $2ED9			; 8D D9 2E | Store accumulator to absolute address
	NOP				  ; EA | No operation
	INC $DE06,X		  ; FE 06 DE | Increment (absolute,X)
	LDX $F700,Y		  ; BE 00 F7 | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $DE00,X		  ; FE 00 DE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3B9
; Address: $DEEF19
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3B9:
	JSR $40BC			; 20 BC 40 | Jump to subroutine
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	PEA #$E828		   ; F4 28 E8 | Push effective address to stack
	SBC $AE32			; ED 32 AE | Subtract with carry (absolute)
	JMP $F0D8E8		  ; 5C E8 D8 F0 | Jump to address long
	BEQ $40			  ; F0 40 | Branch if equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $FE			  ; 80 FE | Branch always
	LDA ($9E,X)		  ; A1 9E | Load from (zero page,X) into accumulator
	ADC ($56),Y		  ; 71 56 | Add with carry ((zero page),Y)
	AND $706B,Y		  ; 39 6B 70 | Logical AND with accumulator (absolute,Y)
	ADC #$50			 ; 69 50 | Add with carry (immediate)
	JMP ($EF10)		  ; 6C 10 EF | Jump to address (absolute indirect)
	BPL $ED			  ; 10 ED | Branch if positive
	LDA				  ; BF 00 1F 00 | Load from absolute long,X into accumulator
	ADC $3C06,Y		  ; 79 06 3C | Add with carry (absolute,Y)
	STA $2ED9			; 8D D9 2E | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3BA
; Address: $DEEF64
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3BA:
	NOP				  ; EA | No operation
	INC $DE06,X		  ; FE 06 DE | Increment (absolute,X)
	LDX $FB00,Y		  ; BE 00 FB | Load from absolute,Y into X register
	TAX				  ; AA | Transfer accumulator to X register
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $DE00,X		  ; FE 00 DE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3BB
; Address: $DEEF79
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3BB:
	JSR $40BC			; 20 BC 40 | Jump to subroutine
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $1F09			; 0E 09 1F | Arithmetic shift left (absolute)
	ORA $2417,Y		  ; 19 17 24 | Logical OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($27),Y		  ; 31 27 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $3233			; 2C 33 32 | Test bits in accumulator (absolute)
	AND $3729			; 2D 29 37 | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3BD
; Address: $DEEFAE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3BD:
	LDX $3377			; AE 77 33 | Load from absolute address into X register
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	LDX $9377			; AE 77 93 | Load from absolute address into X register
	ADC $7ECF,X		  ; 7D CF 7E | Add with carry (absolute,X)
	BVC $30			  ; 50 30 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)
	ROR $7702,X		  ; 7E 02 77 | Rotate right (absolute,X)
	BMI $0F			  ; 30 0F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3BE
; Address: $DEEFE5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3BE:
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BNE $A8			  ; D0 A8 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	JMP $9C84			; 4C 84 9C | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INX				  ; E8 | Increment X register
	BPL $CC			  ; 10 CC | Branch if positive
	BMI $9C			  ; 30 9C | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3BF
; Address: $DEEFFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3BF:
	INC $C600,X		  ; FE 00 C6 | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$DC22		   ; F4 22 DC | Push effective address to stack
	BIT $0CF4			; 2C F4 0C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3C0
; Address: $DEF00A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3C0:
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	STY $2400			; 8C 00 24 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BNE $90			  ; D0 90 | Branch if not equal
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3C1
; Address: $DEF028
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3C1:
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $10			  ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3C5
; Address: $DEF03D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3C5:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BIT $3233			; 2C 33 32 | Test bits in accumulator (absolute)
	AND $3729			; 2D 29 37 | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3C8
; Address: $DEF052
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3C8:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROL $7800,X		  ; 3E 00 78 | Rotate left (absolute,X)
	LDA $8B66,X		  ; BD 66 8B | Load from absolute,X into accumulator
	DEX				  ; CA | Decrement X register
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $68			  ; 30 68 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $01			  ; 70 01 | Branch if overflow set
	BMI $07			  ; 30 07 | Branch if negative
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3C9
; Address: $DEF082
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3C9:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$DC22		   ; F4 22 DC | Push effective address to stack
	BIT $0CF4			; 2C F4 0C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	BVS $FE			  ; 70 FE | Branch if overflow set
	STY $2400			; 8C 00 24 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BVS $C0			  ; 70 C0 | Branch if overflow set
	STZ $28F4			; 9C F4 28 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	LDY #$94			 ; A0 94 | Load immediate value into Y register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	LDA ($98,X)		  ; A1 98 | Load from (zero page,X) into accumulator
	WDM #$3D			 ; 42 3D | Reserved instruction
	PLY				  ; 7A | Pull Y register from stack
	PHA				  ; 48 | Push accumulator to stack
	ROL $1B6C,X		  ; 3E 6C 1B | Rotate left (absolute,X)
	SBC $BF7D			; ED 7D BF | Subtract with carry (absolute)
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	EOR $07			  ; 45 07 | Exclusive OR with accumulator (zero page)
	STZ $BB7A,X		  ; 9E 7A BB | Store zero to absolute,X
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	BIT $1C17			; 2C 17 1C | Test bits in accumulator (absolute)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3CA
; Address: $DEF0F8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3CA:
	JSR $1007			; 20 07 10 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BCS $B8			  ; B0 B8 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3CB
; Address: $DEF10B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3CB:
	CPX $2C			  ; E4 2C | Compare X register (zero page)
	CPY $4C			  ; C4 4C | Compare Y register (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$EC08		   ; F4 08 EC | Push effective address to stack
	BPL $C8			  ; 10 C8 | Branch if positive
	BMI $37			  ; 30 37 | Branch if negative
	CMP $EE19			; CD 19 EE | Compare accumulator (absolute)
	WDM #$BC			 ; 42 BC | Reserved instruction
	LSR $1EF2,X		  ; 5E F2 1E | Logical shift right (absolute,X)
	BEQ $36			  ; F0 36 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	LDA $FDBE			; AD BE FD | Load from absolute address into accumulator
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	WDM #$00			 ; 42 00 | Reserved instruction
	LDX $A620			; AE 20 A6 | Load from absolute address into X register
	CPX #$75			 ; E0 75 | Compare X register (immediate)
	LSR $AED3,X		  ; 5E D3 AE | Logical shift right (absolute,X)
	CPX $CD			  ; E4 CD | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	BRA $C0			  ; 80 C0 | Branch always
	BRA $46			  ; 80 46 | Branch always
	CPX #$82			 ; E0 82 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $CA			  ; F0 CA | Branch if equal
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3CC
; Address: $DEF15F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3CC:
	BRA $FE			  ; 80 FE | Branch always
	LDA ($98,X)		  ; A1 98 | Load from (zero page,X) into accumulator
	WDM #$3D			 ; 42 3D | Reserved instruction
	PLY				  ; 7A | Pull Y register from stack
	PHA				  ; 48 | Push accumulator to stack
	ROL $1B6C,X		  ; 3E 6C 1B | Rotate left (absolute,X)
	ADC $00BF,X		  ; 7D BF 00 | Add with carry (absolute,X)
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ADC $07			  ; 65 07 | Add with carry (zero page)
	CMP $EE19			; CD 19 EE | Compare accumulator (absolute)
	WDM #$BC			 ; 42 BC | Reserved instruction
	LSR $1EF2,X		  ; 5E F2 1E | Logical shift right (absolute,X)
	BEQ $36			  ; F0 36 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3CD
; Address: $DEF18B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3CD:
	CLD				  ; D8 | Clear decimal mode flag
	LDX $00FD,Y		  ; BE FD 00 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	WDM #$00			 ; 42 00 | Reserved instruction
	LDX $A220			; AE 20 A2 | Load from absolute address into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $2C01,X		  ; 1E 01 2C | Arithmetic shift left (absolute,X)
	BPL $56			  ; 10 56 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BIT $000E			; 2C 0E 00 | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $D62D			; 6D 2D D6 | Add with carry (absolute)
	ROR $99			  ; 66 99 | Rotate right (zero page)
	ADC ($1C,X)		  ; 61 1C | Add with carry ((zero page,X))
	ROL $1031			; 2E 31 10 | Rotate left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $2118,X		  ; 5E 18 21 | PPU graphics register access
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3CE
; Address: $DEF1E5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3CE:
	BIT $2161			; 2C 61 21 | PPU graphics register access
	AND $120C			; 2D 0C 12 | Logical AND with accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BVS $84			  ; 70 84 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3CF
; Address: $DEF229
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3CF:
	BPL $53			  ; 10 53 | Branch if positive
	CPX $9CE6			; EC E6 9C | Compare X register (absolute)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	PEA #$080C		   ; F4 0C 08 | Push effective address to stack
	BEQ $FC			  ; F0 FC | Branch if equal
	CPX $AC00			; EC 00 AC | Compare X register (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	DEC $24			  ; C6 24 | Decrement (zero page)
	BRA $CC			  ; 80 CC | Branch always
	PHA				  ; 48 | Push accumulator to stack
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $64			  ; 10 64 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D0
; Address: $DEF24F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D0:
	JSR $0080			; 20 80 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BRA $FC			  ; 80 FC | Branch always
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D1
; Address: $DEF25C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D1:
	JSR $1800			; 20 00 18 | Jump to subroutine
	BIT $5610			; 2C 10 56 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BIT $000E			; 2C 0E 00 | Test bits in accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $364D			; CD 4D 36 | Compare accumulator (absolute)
	ROR $39			  ; 66 39 | Rotate right (zero page)
	AND ($1C,X)		  ; 21 1C | Logical AND with accumulator ((zero page,X))
	ROL $1031			; 2E 31 10 | Rotate left (absolute)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive
	XBA				  ; EB | Exchange accumulator bytes
	INC $99			  ; E6 99 | Increment (zero page)
	STX $F8			  ; 86 F8 | Store X register to zero page
	PEA #$080C		   ; F4 0C 08 | Push effective address to stack
	BEQ $FC			  ; F0 FC | Branch if equal
	CPX $A800			; EC 00 A8 | Compare X register (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D2
; Address: $DEF2A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D2:
	ROL $5610			; 2E 10 56 | Rotate left (absolute)
	SEC				  ; 38 | Set carry flag
	JMP $00000E		  ; 5C 0E 00 00 | Jump to address long
	BPL $15			  ; 10 15 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D4
; Address: $DEF2AD
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D4:
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA $0608			; 0D 08 06 | Logical OR with accumulator (absolute)
	ORA $13			  ; 05 13 | Logical OR with accumulator (zero page)
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BPL $0C			  ; 10 0C | Branch if positive
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $0017			; 0E 17 00 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BVS $C4			  ; 70 C4 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STZ $18			  ; 64 18 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $20			  ; 70 20 | Branch if overflow set
	BNE $30			  ; D0 30 | Branch if not equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $24			  ; F0 24 | Branch if equal
	BCC $18			  ; 90 18 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F4			  ; 80 F4 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D5
; Address: $DEF31E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D5:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D8
; Address: $DEF329
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D8:
	JSR $64A6			; 20 A6 64 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3D9
; Address: $DEF338
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3D9:
	JSR $E818			; 20 18 E8 | Jump to subroutine
	BPL $E0			  ; 10 E0 | Game work RAM access
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ROL $1C			  ; 26 1C | Rotate left (zero page)
	ORA $110C,Y		  ; 19 0C 11 | Logical OR with accumulator (absolute,Y)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0F04,Y		  ; 19 04 0F | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3DA
; Address: $DEF361
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3DA:
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BPL $E8			  ; 10 E8 | Branch if positive
	BEQ $18			  ; F0 18 | Branch if equal
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BIT $5610			; 2C 10 56 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BIT $020E			; 2C 0E 02 | Test bits in accumulator (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ROL $0E			  ; 26 0E | Rotate left (zero page)
	LSR $24			  ; 46 24 | Logical shift right (zero page)
	LDA ($60),Y		  ; B1 60 | Load from (zero page),Y into accumulator
	ROL $1031			; 2E 31 10 | Rotate left (absolute)
	SEC				  ; 38 | Set carry flag
	BPL $01			  ; 10 01 | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3DB
; Address: $DEF39D
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3DB:
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	BVC $C6			  ; 50 C6 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	AND $2D1E,Y		  ; 39 1E 2D | Logical AND with accumulator (absolute,Y)
	ASL $0113			; 0E 13 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	BEQ $40			  ; F0 40 | Branch if equal
	LDY #$C2			 ; A0 C2 | Load immediate value into Y register
	BEQ $63			  ; F0 63 | Branch if equal
	ADC $A4			  ; 65 A4 | Add with carry (zero page)
	STA $F802			; 8D 02 F8 | Store accumulator to absolute address
	PEA #$080C		   ; F4 0C 08 | Push effective address to stack
	BEQ $1C			  ; F0 1C | Branch if equal
	JMP $0C00			; 4C 00 0C | Jump to address
	INC				  ; 1A | Increment accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA $7A0A,X		  ; 1D 0A 7A | Logical OR with accumulator (absolute,X)
	BPL $EC			  ; 10 EC | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	STY $40			  ; 84 40 | Store Y register to zero page
	LDY $D868			; AC 68 D8 | Load from absolute address into Y register
	BCC $6C			  ; 90 6C | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BIT $5610			; 2C 10 56 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BIT $020E			; 2C 0E 02 | Test bits in accumulator (absolute)
	ORA $43			  ; 05 43 | Logical OR with accumulator (zero page)
	DEC $4E			  ; C6 4E | Decrement (zero page)
	LDX $24			  ; A6 24 | Load from zero page into X register
	LDA ($40),Y		  ; B1 40 | Load from (zero page),Y into accumulator
	ROL $1031			; 2E 31 10 | Rotate left (absolute)
	SEC				  ; 38 | Set carry flag
	BMI $01			  ; 30 01 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3DC
; Address: $DEF420
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3DC:
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	BEQ $40			  ; F0 40 | Branch if equal
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BEQ $64			  ; F0 64 | Branch if equal
	BEQ $62			  ; F0 62 | Branch if equal
	LDY $8D			  ; A4 8D | Load from zero page into Y register
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	PEA #$080C		   ; F4 0C 08 | Push effective address to stack
	BEQ $1C			  ; F0 1C | Branch if equal
	JMP $0800			; 4C 00 08 | Jump to address
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0A00			; 0E 00 0A | Arithmetic shift left (absolute)
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	BPL $08			  ; 10 08 | Branch if positive
	ORA $070D			; 0D 0D 07 | Logical OR with accumulator (absolute)
	ORA $0603			; 0D 03 06 | Logical OR with accumulator (absolute)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $20			  ; 90 20 | Branch if carry clear
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3DD
; Address: $DEF4AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3DD:
	JSR $C060			; 20 60 C0 | Jump to subroutine
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BCC $90			  ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3DE
; Address: $DEF4B1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3DE:
	JSR $0068			; 20 68 00 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $60			  ; 80 60 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3E1
; Address: $DEF4C3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3E1:
	BVS $90			  ; 70 90 | Branch if overflow set
	BCC $50			  ; 90 50 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3E2
; Address: $DEF4C8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3E2:
	BNE $C0			  ; D0 C0 | Branch if not equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3E3
; Address: $DEF4D8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3E3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL $1A00			; 0E 00 1A | Arithmetic shift left (absolute)
	BIT $2800			; 2C 00 28 | Test bits in accumulator (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3E5
; Address: $DEF507
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3E5:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3E6
; Address: $DEF511
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3E6:
	JSR $2050			; 20 50 20 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	LDY $6300,X		  ; BC 00 63 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	EOR #$20			 ; 49 20 | Exclusive OR with accumulator (immediate)
	ORA ($4B,X)		  ; 01 4B | Logical OR with accumulator ((zero page,X))
	EOR $6879,Y		  ; 59 79 68 | Exclusive OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3E9
; Address: $DEF52E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3E9:
	JSR $B400			; 20 00 B4 | Jump to subroutine
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3EB
; Address: $DEF547
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3EB:
	JSR $3818			; 20 18 38 | Jump to subroutine
	BIT $467C			; 2C 7C 46 | Test bits in accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3EC
; Address: $DEF554
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3EC:
	BVS $00			  ; 70 00 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	CMP ($12,X)		  ; C1 12 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3ED
; Address: $DEF561
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3ED:
	TXA				  ; 8A | Transfer X register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	ADC ($04),Y		  ; 71 04 | Add with carry ((zero page),Y)
	LDX $00			  ; A6 00 | Load from zero page into X register
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	INX				  ; E8 | Increment X register
	BIT $1000			; 2C 00 10 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3EF
; Address: $DEF5A9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3EF:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3F0
; Address: $DEF5B3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3F0:
	JSR $2050			; 20 50 20 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	LDA				  ; BF 00 61 18 | Load from absolute long,X into accumulator
	ORA ($4B,X)		  ; 01 4B | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3F2
; Address: $DEF5CA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3F2:
	JSR $5430			; 20 30 54 | Jump to subroutine
	BPL $38			  ; 10 38 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3F3
; Address: $DEF5D1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3F3:
	JSR $00B4			; 20 B4 00 | Jump to subroutine
	CPX $00			  ; E4 00 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3F6
; Address: $DEF5EB
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3F6:
	PHY				  ; 5A | Push Y register to stack
	PLP				  ; 28 | Pull processor status from stack
	TXA				  ; 8A | Transfer X register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3F7
; Address: $DEF5F2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3F7:
	BVS $00			  ; 70 00 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	CMP ($12,X)		  ; C1 12 | Compare accumulator ((zero page,X))
	ADC ($04),Y		  ; 71 04 | Add with carry ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVC $30			  ; 50 30 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	LDX $00			  ; A6 00 | Load from zero page into X register
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BPL $08			  ; 10 08 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0800			; 0D 00 08 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BPL $01			  ; 10 01 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3F8
; Address: $DEF661
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3F8:
	JSR $9090			; 20 90 90 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BVC $90			  ; 50 90 | Branch if overflow clear
	BCC $40			  ; 90 40 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3FA
; Address: $DEF678
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3FA:
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BVC $30			  ; 50 30 | Branch if overflow clear
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BPL $90			  ; 10 90 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3FB
; Address: $DEF688
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3FB:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BRA $18			  ; 80 18 | Branch always
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA $0D1D			; 0D 1D 0D | Logical OR with accumulator (absolute)
	ORA $000C,X		  ; 1D 0C 00 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3FC
; Address: $DEF6DC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3FC:
	JSL $006200		  ; 22 00 62 00 | Jump to subroutine long
	ASL $1B0E,X		  ; 1E 0E 1B | Arithmetic shift left (absolute,X)
	ASL $060B			; 0E 0B 06 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $90			  ; 90 90 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3FD
; Address: $DEF708
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3FD:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_3FE
; Address: $DEF710
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_3FE:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	STY $18			  ; 84 18 | Store Y register to zero page
	ASL $2440,X		  ; 1E 40 24 | Arithmetic shift left (absolute,X)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BVS $D8			  ; 70 D8 | Branch if overflow set
	BVS $D0			  ; 70 D0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_400
; Address: $DEF734
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_400:
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $1E06,X		  ; 1D 06 1E | Logical OR with accumulator (absolute,X)
	BPL $0C			  ; 10 0C | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_401
; Address: $DEF758
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_401:
	JSR $1C1E			; 20 1E 1C | Jump to subroutine
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND $3C3D,X		  ; 3D 3D 3C | Logical AND with accumulator (absolute,X)
	AND ($14),Y		  ; 31 14 | Logical AND with accumulator ((zero page),Y)
	ASL $2000,X		  ; 1E 00 20 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_402
; Address: $DEF783
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_402:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BCS $B0			  ; B0 B0 | Branch if carry set
	BNE $D0			  ; D0 D0 | Branch if not equal
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	LDY $A838,X		  ; BC 38 A8 | Load from absolute,X into Y register
	BMI $8C			  ; 30 8C | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_404
; Address: $DEF7B4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_404:
	JSL $004600		  ; 22 00 46 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BVC $10			  ; 50 10 | Branch if overflow clear
	BMI $30			  ; 30 30 | Branch if negative
	BMI $31			  ; 30 31 | Branch if negative
	AND ($17),Y		  ; 31 17 | Logical AND with accumulator ((zero page),Y)
	BPL $60			  ; 10 60 | Branch if positive
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_405
; Address: $DEF7D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_405:
	JSR $0049			; 20 49 00 | Jump to subroutine
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR $2000			; 4E 00 20 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_406
; Address: $DEF7DC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_406:
	JSR $2000			; 20 00 20 | Jump to subroutine
	EOR #$3F			 ; 49 3F | Exclusive OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ROL $3C38,X		  ; 3E 38 3C | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $30			  ; 84 30 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_407
; Address: $DEF80E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_407:
	JSR $0020			; 20 20 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $E7F5,Y		  ; F9 F5 E7 | Subtract with carry (absolute,Y)
	INC $BEAF,X		  ; FE AF BE | Increment (absolute,X)
	STZ $A4DC			; 9C DC A4 | Store zero to absolute
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_409
; Address: $DEF842
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_409:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $9E9A,X		  ; FE 9A 9E | Increment (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_40B
; Address: $DEF882
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_40B:
	JSR $3030			; 20 30 30 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $15			  ; 30 15 | Branch if negative
	ORA $1F03,X		  ; 1D 03 1F | Logical OR with accumulator (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_40C
; Address: $DEF89C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_40C:
	JSR $4000			; 20 00 40 | Jump to subroutine
	EOR #$3F			 ; 49 3F | Exclusive OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	ASL $0C17,X		  ; 1E 17 0C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_40D
; Address: $DEF8AC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_40D:
	JSL $001C18		  ; 22 18 1C 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_40E
; Address: $DEF8E0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_40E:
	JSR $0820			; 20 20 08 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $E7F5,Y		  ; F9 F5 E7 | Subtract with carry (absolute,Y)
	INC $BEAF,X		  ; FE AF BE | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	LDY $00			  ; A4 00 | Load from zero page into Y register
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_40F
; Address: $DEF905
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_40F:
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BMI $48			  ; 30 48 | Branch if negative
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_410
; Address: $DEF910
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_410:
	JSL $001C00		  ; 22 00 1C 00 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_411
; Address: $DEF91D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_411:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $140C			; 0E 0C 14 | Arithmetic shift left (absolute)
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BIT $2B3C			; 2C 3C 2B | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	ROL $0D38			; 2E 38 0D | Rotate left (absolute)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_412
; Address: $DEF96D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_412:
	JSR $0038			; 20 38 00 | Jump to subroutine
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$10			 ; 42 10 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_413
; Address: $DEF98F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_413:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	LDY $749C,X		  ; BC 9C 74 | Load from absolute,X into Y register
	BCS $14			  ; B0 14 | Branch if carry set
	SEP #$04			 ; E2 04 | Set processor status bits

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_415
; Address: $DEF9B4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_415:
	JSL $004200		  ; 22 00 42 00 | Jump to subroutine long
	WDM #$08			 ; 42 08 | Reserved instruction
	BPL $08			  ; 10 08 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1900			; 0E 00 19 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $140C			; 0E 0C 14 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_416
; Address: $DEF9FC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_416:
	BMI $01			  ; 30 01 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $1B1C,X		  ; 3E 1C 1B | Rotate left (absolute,X)
	ASL $6800			; 0E 00 68 | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_419
; Address: $DEFA26
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_419:
	JSR $90E0			; 20 E0 90 | Jump to subroutine
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BMI $28			  ; 30 28 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	BCS $00			  ; B0 00 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP $0C00			; 4C 00 0C | Jump to address
	BRA $14			  ; 80 14 | Branch always
	BRA $0C			  ; 80 0C | Branch always
	ASL $0004			; 0E 04 00 | Arithmetic shift left (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	INC				  ; 1A | Increment accumulator
	BPL $00			  ; 10 00 | Branch if positive
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	BPL $1E			  ; 10 1E | Branch if positive
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ASL $2104,X		  ; 1E 04 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_41A
; Address: $DEFA92
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_41A:
	JSR $1200			; 20 00 12 | Jump to subroutine
	ASL $1A0C,X		  ; 1E 0C 1A | Arithmetic shift left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BVS $20			  ; 70 20 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_41B
; Address: $DEFAAD
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_41B:
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BMI $F0			  ; 30 F0 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BIT $0400			; 2C 00 04 | Test bits in accumulator (absolute)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $10			  ; 84 10 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_41C
; Address: $DEFAEA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_41C:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_41D
; Address: $DEFAFB
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_41D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $4639,Y		  ; 39 39 46 | Logical AND with accumulator (absolute,Y)
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $08			  ; 80 08 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_41E
; Address: $DEFB3C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_41E:
	STA $08			  ; 85 08 | Store accumulator to zero page
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BVS $8E			  ; 70 8E | Branch if overflow set
	BIT $048E			; 2C 8E 04 | Test bits in accumulator (absolute)
	LDA				  ; BF 24 F7 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_41F
; Address: $DEFB4F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_41F:
	JSR $1044			; 20 44 10 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	JMP $E414			; 4C 14 E4 | Jump to address
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	WDM #$20			 ; 42 20 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_422
; Address: $DEFB63
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_422:
	JSR $1828			; 20 28 18 | Jump to subroutine
	BMI $3C			  ; 30 3C | Branch if negative
	ROL $744C,X		  ; 3E 4C 74 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	JMP $18DC80		  ; 5C 80 DC 18 | Jump to address long
	ASL $C600,X		  ; 1E 00 C6 | Arithmetic shift left (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($02,X)		  ; 81 02 | Store accumulator to (zero page,X)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_423
; Address: $DEFB7E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_423:
	JSR $A003			; 20 03 A0 | Jump to subroutine
	CPX $F038			; EC 38 F0 | Compare X register (absolute)
	ORA $1EF0,Y		  ; 19 F0 1E | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$F404		   ; F4 04 F4 | Push effective address to stack
	BPL $03			  ; 10 03 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $80			  ; 70 80 | Branch if overflow set
	BCS $40			  ; B0 40 | Branch if carry set
	BVC $E0			  ; 50 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_424
; Address: $DEFBA8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_424:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	SEP #$C0			 ; E2 C0 | Set processor status bits
	STY $4C00			; 8C 00 4C | Store Y register to absolute address
	LDY $08			  ; A4 08 | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	JMP $C4C8			; 4C C8 C4 | Jump to address
	STX $02			  ; 86 02 | Store X register to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $4639,Y		  ; 39 39 46 | Logical AND with accumulator (absolute,Y)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_425
; Address: $DEFBD8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_425:
	BRA $00			  ; 80 00 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	CMP $0A30			; CD 30 0A | Compare accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	BIT $72			  ; 24 72 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_426
; Address: $DEFBE9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_426:
	JSR $68FA			; 20 FA 68 | Jump to subroutine
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	EOR $0C			  ; 45 0C | Exclusive OR with accumulator (zero page)
	AND ($2C,X)		  ; 21 2C | Logical AND with accumulator ((zero page,X))
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	ASL $30			  ; 06 30 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_427
; Address: $DEFC02
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_427:
	JSR $2810			; 20 10 28 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BMI $3C			  ; 30 3C | Branch if negative
	ROL $744C,X		  ; 3E 4C 74 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	JMP $08DC80		  ; 5C 80 DC 08 | Jump to address long
	LSR $C600			; 4E 00 C6 | Logical shift right (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($02,X)		  ; 81 02 | Store accumulator to (zero page,X)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_428
; Address: $DEFC1E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_428:
	JSR $A003			; 20 03 A0 | Jump to subroutine
	CPX $F038			; EC 38 F0 | Compare X register (absolute)
	ORA $1EF0,Y		  ; 19 F0 1E | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	LDY $14FC,X		  ; BC FC 14 | Load from absolute,X into Y register
	PEA #$B414		   ; F4 14 B4 | Push effective address to stack
	BPL $03			  ; 10 03 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	BRA $94			  ; 80 94 | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	RTI				  ; 40 | Return from interrupt
	ROL $C4			  ; 26 C4 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_429
; Address: $DEFC58
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_429:
	WDM #$84			 ; 42 84 | Reserved instruction
	BRA $80			  ; 80 80 | Branch always
	ASL $0204			; 0E 04 02 | Arithmetic shift left (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $0E07			; 0D 07 0E | Logical OR with accumulator (absolute)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0800			; 0D 00 08 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ROL $3F27,X		  ; 3E 27 3F | Rotate left (absolute,X)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ORA $0124,X		  ; 1D 24 01 | Logical OR with accumulator (absolute,X)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_42A
; Address: $DEFC96
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_42A:
	JSR $4001			; 20 01 40 | Jump to subroutine
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_42B
; Address: $DEFC9E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_42B:
	JSL $1D0100		  ; 22 00 01 1D | Jump to subroutine long
	BPL $10			  ; 10 10 | Branch if positive
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_42C
; Address: $DEFCB0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_42C:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	BVS $20			  ; 70 20 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_42D
; Address: $DEFCC6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_42D:
	JSR $B040			; 20 40 B0 | Jump to subroutine
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_42E
; Address: $DEFCCE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_42E:
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	BCC $00			  ; 90 00 | Branch if carry clear
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_42F
; Address: $DEFCDD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_42F:
	BRA $14			  ; 80 14 | Branch always
	BRA $10			  ; 80 10 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $50			  ; 50 50 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	STZ $3C			  ; 64 3C | Store zero to zero page
	CPX $7C			  ; E4 7C | Compare X register (zero page)
	STZ $FC			  ; 64 FC | Store zero to zero page
	CLV				  ; B8 | Clear overflow flag
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	BIT $0480			; 2C 80 04 | Test bits in accumulator (absolute)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BRA $02			  ; 80 02 | Branch always
	BRA $02			  ; 80 02 | Branch always

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_430
; Address: $DEFD00
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_430:
	JSR $1838			; 20 38 18 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BMI $10			  ; 30 10 | Branch if negative
	BVS $30			  ; 70 30 | Branch if overflow set
	BVS $30			  ; 70 30 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_431
; Address: $DEFD17
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_431:
	JSR $3038			; 20 38 30 | Jump to subroutine
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_432
; Address: $DEFD2E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_432:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0F08,Y		  ; 19 08 0F | Logical OR with accumulator (absolute,Y)
	ORA $3E			  ; 05 3E | Logical OR with accumulator (zero page)
	ORA ($62,X)		  ; 01 62 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_433
; Address: $DEFD49
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_433:
	JSR $41F5			; 20 F5 41 | Jump to subroutine
	STZ $B900,X		  ; 9E 00 B9 | Store zero to absolute,X
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_434
; Address: $DEFD58
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_434:
	JSR $413D			; 20 3D 41 | Jump to subroutine
	ORA #$4F			 ; 09 4F | Logical OR with accumulator (immediate)
	ORA $3F00,Y		  ; 19 00 3F | Logical OR with accumulator (absolute,Y)
	ORA $045F,Y		  ; 19 5F 04 | Logical OR with accumulator (absolute,Y)
	ROR $3430,X		  ; 7E 30 34 | Rotate right (absolute,X)
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	ORA $041B,Y		  ; 19 1B 04 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_435
; Address: $DEFD78
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_435:
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BCC $80			  ; 90 80 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $5C			  ; 90 5C | Branch if carry clear
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	BEQ $58			  ; F0 58 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $F0			  ; 10 F0 | Branch if positive
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	CPY $4288			; CC 88 42 | Hardware register operation
	LDX $7F84			; AE 84 7F | Load from absolute address into X register
	STA $1090,Y		  ; 99 90 10 | Store accumulator to absolute,Y
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	LDY $D484,X		  ; BC 84 D4 | Load from absolute,X into Y register
	SEP #$90			 ; E2 90 | Set processor status bits
	ADC $9200			; 6D 00 92 | Add with carry (absolute)
	SED				  ; F8 | Set decimal mode flag
	BCC $FC			  ; 90 FC | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $7C48			; CC 48 7C | Compare Y register (absolute)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BNE $48			  ; D0 48 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_436
; Address: $DEFDD9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_436:
	JSR $7848			; 20 48 78 | Jump to subroutine
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_437
; Address: $DEFDEC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_437:
	JSL $002002		  ; 22 02 20 00 | Jump to subroutine long
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0C00			; 0D 00 0C | Logical OR with accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_438
; Address: $DEFE0E
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_438:
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1900			; 0D 00 19 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	ASL $1B03,X		  ; 1E 03 1B | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $1E			  ; 10 1E | Branch if positive
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BVC $40			  ; 50 40 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BVC $64			  ; 50 64 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_439
; Address: $DEFE69
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_439:
	JSR $089E			; 20 9E 08 | Jump to subroutine
	INC $F100,X		  ; FE 00 F1 | Increment (absolute,X)
	BPL $50			  ; 10 50 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	CPX $0400			; EC 00 04 | Compare X register (absolute)
	BPL $DE			  ; 10 DE | Branch if positive
	PLX				  ; FA | Pull X register from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_43A
; Address: $DEFE8B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_43A:
	JSR $10F8			; 20 F8 10 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_43C
; Address: $DEFEA2
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_43C:
	ORA $0C00			; 0D 00 0C | Logical OR with accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1900			; 0D 00 19 | Logical OR with accumulator (absolute)
	ASL $0C02			; 0E 02 0C | Arithmetic shift left (absolute)
	ASL $1B03,X		  ; 1E 03 1B | Arithmetic shift left (absolute,X)
	BVC $64			  ; 50 64 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	SEP #$20			 ; E2 20 | Set processor status bits
	TAX				  ; AA | Transfer accumulator to X register
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_43D
; Address: $DEFF08
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_43D:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $1900,X		  ; 1D 00 19 | Logical OR with accumulator (absolute,X)
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA $3F00,X		  ; 1D 00 3F | Logical OR with accumulator (absolute,X)
	JMP $7708			; 4C 08 77 | Jump to address
	BIT $8E			  ; 24 8E | Test bits in accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_43E
; Address: $DEFF58
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_43E:
	PHP				  ; 08 | Push processor status to stack
	BIT $2D			  ; 24 2D | Test bits in accumulator (zero page)
	ORA ($57,X)		  ; 01 57 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$37			 ; 09 37 | Logical OR with accumulator (immediate)
	ASL $3300,X		  ; 1E 00 33 | Arithmetic shift left (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0400,X		  ; 1E 00 04 | Arithmetic shift left (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BCC $80			  ; 90 80 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BPL $5C			  ; 10 5C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	CPX $80			  ; E4 80 | Compare X register (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $98			  ; 80 98 | Branch always
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	LDY $F200,X		  ; BC 00 F2 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_43F
; Address: $DEFFA7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_43F:
	JSR $143E			; 20 3E 14 | Jump to subroutine
	SBC ($20),Y		  ; F1 20 | Subtract with carry ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	BCC $40			  ; 90 40 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_441
; Address: $DEFFBA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_441:
	JSR $00AE			; 20 AE 00 | Jump to subroutine
	NOP				  ; EA | No operation
	BCC $F0			  ; 90 F0 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank3C_DmaFunction_447
; Address: $DEFFDC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3C_DmaFunction_447:
	JSR $003C			; 20 3C 00 | Jump to subroutine
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BIT $89			  ; 24 89 | Test bits in accumulator (zero page)
	LDX $5900			; AE 00 59 | Load from absolute address into X register
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BIT $2D			  ; 24 2D | Test bits in accumulator (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
