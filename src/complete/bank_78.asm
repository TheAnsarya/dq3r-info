;==============================================================================
; Dragon Quest III - Bank $78
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $FC0000-$FC7FFF
; Instructions: 8171
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_78"

;------------------------------------------------------------------------------
; Bank78_DmaFunction_000
; Address: $FC800A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_000:
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $50			  ; 90 50 | Branch if carry clear
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BCC $00			  ; 90 00 | Branch if carry clear
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $0E			  ; D0 0E | Branch if not equal
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $321C			; 2C 1C 32 | Test bits in accumulator (absolute)
	ASL $1E38,X		  ; 1E 38 1E | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_002
; Address: $FC80A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_002:
	JSR $324D			; 20 4D 32 | Jump to subroutine
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 3A C5 CF | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_003
; Address: $FC80B1
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_003:
	JSR $7220			; 20 20 72 | Jump to subroutine
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	JMP ($5E90)		  ; 6C 90 5E | Jump to address (absolute indirect)
	LDY #$B3			 ; A0 B3 | Load immediate value into Y register
	JMP $1CE3			; 4C E3 1C | Jump to address
	LDX $00B0			; AE B0 00 | Load from absolute address into X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	PLP				  ; 28 | Pull processor status from stack
	BVC $FE			  ; 50 FE | Branch if overflow clear
	SEP #$FF			 ; E2 FF | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	ASL $7F99,X		  ; 1E 99 7F | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_004
; Address: $FC80E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_004:
	ORA $0707			; 0D 07 07 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FFF7,X		  ; FE F7 FF | Increment (absolute,X)
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	ADC $017C,X		  ; 7D 7C 01 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_005
; Address: $FC8136
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_005:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	STX $30F0			; 8E F0 30 | Store X register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $3F72,X		  ; 1E 72 3F | Arithmetic shift left (absolute,X)
	ASL $1E0F,X		  ; 1E 0F 1E | Arithmetic shift left (absolute,X)
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	EOR $4785			; 4D 85 47 | Exclusive OR with accumulator (absolute)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP $4D05,X		  ; DD 05 4D | Compare accumulator (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	SEI				  ; 78 | Set interrupt disable flag
	BRA $3F			  ; 80 3F | Branch always
	BRA $B2			  ; 80 B2 | Branch always
	BRA $38			  ; 80 38 | Branch always
	BRA $18			  ; 80 18 | Branch always
	STA $0022,Y		  ; 99 22 00 | Store accumulator to absolute,Y
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F 90 6E 70 | Store accumulator to absolute long,X
	ASL $6630			; 0E 30 66 | Arithmetic shift left (absolute)
	JMP $94B240		  ; 5C 40 B2 94 | Jump to address long
	INC $1FE0			; EE E0 1F | Increment (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_006
; Address: $FC81F2
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_006:
	STY $0E			  ; 84 0E | Store Y register to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	STX $CE80			; 8E 80 CE | Store X register to absolute address
	ORA $3F00,X		  ; 1D 00 3F | Logical OR with accumulator (absolute,X)
	ORA $3F7F,X		  ; 1D 7F 3F | Logical OR with accumulator (absolute,X)
	BIT $101F			; 2C 1F 10 | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	BEQ $50			  ; F0 50 | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	DEC $C73F			; CE 3F C7 | Decrement (absolute)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	CPX $00FF			; EC FF 00 | Compare X register (absolute)
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_007
; Address: $FC82AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_007:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $98			  ; 80 98 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_008
; Address: $FC82CB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_008:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $90			  ; 80 90 | Branch always
	CPX #$74			 ; E0 74 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_009
; Address: $FC8320
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_009:
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_00A
; Address: $FC8341
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_00A:
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_00C
; Address: $FC8360
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_00C:
	INY				  ; C8 | Increment Y register
	LDX $B0EB,Y		  ; BE EB B0 | Load from absolute,Y into X register
	LDA				  ; BF 10 3F 10 | Load from absolute long,X into accumulator
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ROL $DCEC,X		  ; 3E EC DC | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_00F
; Address: $FC839A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_00F:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$0B			 ; C0 0B | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FFF6,X		  ; FE F6 FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROL $3C1F,X		  ; 3E 1F 3C | Rotate left (absolute,X)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ASL $0700,X		  ; 1E 00 07 | Arithmetic shift left (absolute,X)
	CMP ($FE),Y		  ; D1 FE | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_010
; Address: $FC8402
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_010:
	JSL $F874FC		  ; 22 FC 74 F8 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BEQ $70			  ; F0 70 | Branch if equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_012
; Address: $FC841A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_012:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $84			  ; 80 84 | Branch always
	JMP $58D8			; 4C D8 58 | Jump to address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_013
; Address: $FC8448
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_013:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_014
; Address: $FC8452
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_014:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $06FC,X		  ; 1E FC 06 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	BIT $D8			  ; 24 D8 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BNE $48			  ; D0 48 | Branch if not equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_015
; Address: $FC84CF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_015:
	BCS $FE			  ; B0 FE | Branch if carry set
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BEQ $40			  ; F0 40 | Branch if equal
	CPY $DEF0			; CC F0 DE | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	AND ($0D),Y		  ; 31 0D | Logical AND with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_016
; Address: $FC8549
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_016:
	BCC $80			  ; 90 80 | Branch if carry clear
	BPL $B0			  ; 10 B0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_019
; Address: $FC8560
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_019:
	PLP				  ; 28 | Pull processor status from stack
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	BPL $05			  ; 10 05 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_01A
; Address: $FC85CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_01A:
	JSR $1800			; 20 00 18 | Jump to subroutine
	BRA $84			  ; 80 84 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_01B
; Address: $FC85E2
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_01B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STA $E07F,Y		  ; 99 7F E0 | Game work RAM access
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $1FFF,X		  ; 1E FF 1F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BCC $E0			  ; 90 E0 | Game work RAM access
	DEY				  ; 88 | Decrement Y register
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $68			  ; F0 68 | Branch if equal
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BCS $F0			  ; B0 F0 | Branch if carry set
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_01C
; Address: $FC8674
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_01C:
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $5F			  ; 10 5F | Branch if positive
	EOR $46E6,Y		  ; 59 E6 46 | Exclusive OR with accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_01D
; Address: $FC8690
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_01D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BMI $F2			  ; 30 F2 | Branch if negative
	BCC $62			  ; 90 62 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_01E
; Address: $FC86A7
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_01E:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	STZ $18			  ; 64 18 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	JMP $0036			; 4C 36 00 | Jump to address
	ROL $7C27,X		  ; 3E 27 7C | Rotate left (absolute,X)
	ORA #$79			 ; 09 79 | Logical OR with accumulator (immediate)
	ROL $FB00			; 2E 00 FB | Rotate left (absolute)
	PLB				  ; AB | Pull data bank register from stack
	WDM #$31			 ; 42 31 | Reserved instruction
	CMP $57CC			; CD CC 57 | Compare accumulator (absolute)
	AND ($63,X)		  ; 21 63 | Logical AND with accumulator ((zero page,X))
	ROL $FF2A			; 2E 2A FF | Rotate left (absolute)
	DEC $3373			; CE 73 33 | Decrement (absolute)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STZ $0000			; 9C 00 00 | Store zero to absolute
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	INC				  ; 1A | Increment accumulator
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_01F
; Address: $FC8740
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_01F:
	STY $5898			; 8C 98 58 | Store Y register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_020
; Address: $FC8752
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_020:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ROL $6201,X		  ; 3E 01 62 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	JMP $0030			; 4C 30 00 | Jump to address
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ROR $3C17,X		  ; 7E 17 3C | Rotate right (absolute,X)
	ROL $FB00			; 2E 00 FB | Rotate left (absolute)
	PLB				  ; AB | Pull data bank register from stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	WDM #$31			 ; 42 31 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $00CD			; CD CD 00 | Compare accumulator (absolute)
	ROL $FF2A			; 2E 2A FF | Rotate left (absolute)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	DEC $FF73			; CE 73 FF | Decrement (absolute)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	JMP $FD35			; 4C 35 FD | Jump to address
	ORA $30D0			; 0D D0 30 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_021
; Address: $FC87A7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_021:
	JSR $C140			; 20 40 C1 | Jump to subroutine
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	LSR $C6			  ; 46 C6 | Logical shift right (zero page)
	ROR $E6			  ; 66 E6 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $4F			  ; F0 4F | Branch if equal
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	AND $1900,Y		  ; 39 00 19 | Logical AND with accumulator (absolute,Y)
	CMP $A870,Y		  ; D9 70 A8 | Compare accumulator (absolute,Y)
	BVS $D8			  ; 70 D8 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_022
; Address: $FC87D0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_022:
	JSR $2208			; 20 08 22 | Jump to subroutine
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)
	BCC $60			  ; 90 60 | Branch if carry clear
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $40			  ; 70 40 | Branch if overflow set
	BMI $20			  ; 30 20 | Branch if negative
	BPL $18			  ; 10 18 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive
	BMI $38			  ; 30 38 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_023
; Address: $FC87F0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_023:
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_024
; Address: $FC87F4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_024:
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PEA #$FC0E		   ; F4 0E FC | Push effective address to stack
	ORA $70			  ; 05 70 | Logical OR with accumulator (zero page)
	ADC ($07,X)		  ; 61 07 | Add with carry ((zero page,X))
	ROL $1E1B,X		  ; 3E 1B 1E | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($F9),Y		  ; 51 F9 | Exclusive OR with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_026
; Address: $FC881B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_026:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($63,X)		  ; 21 63 | Logical AND with accumulator ((zero page,X))
	SBC $83AE,Y		  ; F9 AE 83 | Subtract with carry (absolute,Y)
	INC $04BD			; EE BD 04 | Increment (absolute)
	LDA $8004,X		  ; BD 04 80 | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STZ $0820			; 9C 20 08 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank78_DmaFunction_027
; Address: $FC8836
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_027:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $02			  ; 10 02 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_029
; Address: $FC8848
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_029:
	JSR $6000			; 20 00 60 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BMI $C0			  ; 30 C0 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_02A
; Address: $FC8859
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_02A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	LDA				  ; BF 7F 6F 1F | Load from absolute long,X into accumulator
	ORA $0303,X		  ; 1D 03 03 | Logical OR with accumulator (absolute,X)
	STA $06FE			; 8D FE 06 | Store accumulator to absolute address
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_02C
; Address: $FC8894
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_02C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BVS $78			  ; 70 78 | Branch if overflow set
	BEQ $F8			  ; F0 F8 | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $B0			  ; F0 B0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	ROL $FB00			; 2E 00 FB | Rotate left (absolute)
	PLB				  ; AB | Pull data bank register from stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	WDM #$31			 ; 42 31 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $FF2A			; 2E 2A FF | Rotate left (absolute)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	DEC $FF73			; CE 73 FF | Decrement (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $F2			  ; 06 F2 | Arithmetic shift left (zero page)
	BRA $08			  ; 80 08 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $54			  ; 80 54 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	STA				  ; 9F 1D 9B 37 | Store accumulator to absolute long,X
	PLB				  ; AB | Pull data bank register from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_02F
; Address: $FC8985
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_02F:
	BCC $80			  ; 90 80 | Branch if carry clear
	BPL $B0			  ; 10 B0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_031
; Address: $FC898D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_031:
	BEQ $C0			  ; F0 C0 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_033
; Address: $FC899E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_033:
	JSR $4400			; 20 00 44 | Jump to subroutine
	PEA #$FC0E		   ; F4 0E FC | Push effective address to stack
	ORA $73			  ; 05 73 | Logical OR with accumulator (zero page)
	BVS $18			  ; 70 18 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_034
; Address: $FC89AA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_034:
	JSR $2810			; 20 10 28 | Jump to subroutine
	ORA $1F0F,Y		  ; 19 0F 1F | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($F9),Y		  ; 51 F9 | Exclusive OR with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_036
; Address: $FC89BB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_036:
	JSR $0006			; 20 06 00 | Jump to subroutine
	AND ($63,X)		  ; 21 63 | Logical AND with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	BVS $A8			  ; 70 A8 | Branch if overflow set
	BVS $D8			  ; 70 D8 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	LDY $8F8F			; AC 8F 8F | Load from absolute address into Y register
	BRA $08			  ; 80 08 | Branch always
	DEY				  ; 88 | Decrement Y register
	STZ $0820			; 9C 20 08 | Store zero to absolute
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_037
; Address: $FC89E3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_037:
	BRA $F0			  ; 80 F0 | Branch always
	BVS $C0			  ; 70 C0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_038
; Address: $FC89E9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_038:
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $C0			  ; 80 C0 | Branch always
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_03A
; Address: $FC8A05
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_03A:
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	ORA $0B63,X		  ; 1D 63 0B | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $3C			  ; 10 3C | Branch if positive
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	ADC #$F9			 ; 69 F9 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_03C
; Address: $FC8A1B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_03C:
	JSR $2003			; 20 03 20 | Jump to subroutine
	CMP $57CD			; CD CD 57 | Compare accumulator (absolute)
	AND ($63,X)		  ; 21 63 | Logical AND with accumulator ((zero page,X))
	ASL $D4			  ; 06 D4 | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ADC ($A9),Y		  ; 71 A9 | Add with carry ((zero page),Y)
	AND $DD			  ; 25 DD | Logical AND with accumulator (zero page)
	STA $800032		  ; 8F 32 00 80 | Store accumulator to absolute long address
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STZ $0821			; 9C 21 08 | Store zero to absolute
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_03D
; Address: $FC8A43
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_03D:
	BRA $F0			  ; 80 F0 | Branch always
	BVS $C0			  ; 70 C0 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BMI $40			  ; 30 40 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_03E
; Address: $FC8A59
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_03E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $79FF,X		  ; 1E FF 79 | Arithmetic shift left (absolute,X)
	INC $F8F7,X		  ; FE F7 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_03F
; Address: $FC8A9B
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_03F:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $10			  ; 80 10 | Branch always
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $06FC			; 0E FC 06 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $6000,X		  ; FE 00 60 | Increment (absolute,X)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	EOR $46E6,Y		  ; 59 E6 46 | Exclusive OR with accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $8C			  ; 80 8C | Branch always
	BVS $F2			  ; 70 F2 | Branch if overflow set
	BCC $62			  ; 90 62 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_040
; Address: $FC8B07
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_040:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	STA $07078F		  ; 8F 8F 07 07 | Store accumulator to absolute long address
	INC $F876,X		  ; FE 76 F8 | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $06078F		  ; 8F 8F 07 06 | Store accumulator to absolute long address
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_041
; Address: $FC8BB0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_041:
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_042
; Address: $FC8BE8
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_042:
	JSR $70FF			; 20 FF 70 | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $1FFF,X		  ; 1E FF 1F | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$F00C		   ; F4 0C F0 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	WDM #$FC			 ; 42 FC | Reserved instruction
	WDM #$FC			 ; 42 FC | Reserved instruction
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ROL $0012			; 2E 12 00 | Rotate left (absolute)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROL $1C08,X		  ; 3E 08 1C | Rotate left (absolute,X)
	ORA $003C			; 0D 3C 00 | Logical OR with accumulator (absolute)
	ADC $2A82,X		  ; 7D 82 2A | Add with carry (absolute,X)
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	BPL $31			  ; 10 31 | Branch if positive
	NOP				  ; EA | No operation
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	CPY $CE			  ; C4 CE | Compare Y register (zero page)
	BPL $04			  ; 10 04 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_044
; Address: $FC8C87
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_044:
	BRA $F0			  ; 80 F0 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_045
; Address: $FC8C8C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_045:
	CLD				  ; D8 | Clear decimal mode flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_047
; Address: $FC8C95
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_047:
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVC $78			  ; 50 78 | Branch if overflow clear
	BMI $04			  ; 30 04 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LSR $37FF,X		  ; 5E FF 37 | Logical shift right (absolute,X)
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $03FF,Y		  ; F9 FF 03 | Subtract with carry (absolute,Y)
	STA				  ; 9F 6F FF F8 | Store accumulator to absolute long,X
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 52 FC | Store accumulator to absolute long,X
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_048
; Address: $FC8D19
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_048:
	JSR $E0F0			; 20 F0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ASL $F2			  ; 06 F2 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_04A
; Address: $FC8D28
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_04A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $5C			  ; 80 5C | Branch always
	JMP $005C00		  ; 5C 00 5C 00 | Jump to address long
	JMP $001400		  ; 5C 00 14 00 | Jump to address long
	INY				  ; C8 | Increment Y register
	LDX $B0EB,Y		  ; BE EB B0 | Load from absolute,Y into X register
	BMI $28			  ; 30 28 | Branch if negative
	BIT $200C			; 2C 0C 20 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_04B
; Address: $FC8D4E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_04B:
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $05			  ; 10 05 | Branch if positive
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	CPX $48DC			; EC DC 48 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	BCS $A0			  ; B0 A0 | Branch if carry set
	BCS $A0			  ; B0 A0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_04D
; Address: $FC8D72
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_04D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND $07FF,X		  ; 3D FF 07 | Logical AND with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BVC $30			  ; 50 30 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_04E
; Address: $FC8D88
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_04E:
	JSR $2161			; 20 61 21 | PPU graphics register access
	AND $027F,X		  ; 3D 7F 02 | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	RTI				  ; 40 | Return from interrupt
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CMP $A870,Y		  ; D9 70 A8 | Compare accumulator (absolute,Y)
	BVS $D8			  ; 70 D8 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	STY $8D8E			; 8C 8E 8D | Store Y register to absolute address
	STA $200705		  ; 8F 05 07 20 | Store accumulator to absolute long address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_04F
; Address: $FC8DB2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_04F:
	JSL $000700		  ; 22 00 07 00 | Jump to subroutine long
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	BVC $60			  ; 50 60 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_050
; Address: $FC8DC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_050:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BMI $60			  ; 30 60 | Branch if negative
	BVS $E0			  ; 70 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_051
; Address: $FC8DD1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_051:
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $80			  ; 30 80 | Branch if negative
	BPL $C0			  ; 10 C0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_052
; Address: $FC8DE5
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_052:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	ADC ($E1,X)		  ; 61 E1 | Add with carry ((zero page,X))
	ORA $3936,Y		  ; 19 36 39 | Logical OR with accumulator (absolute,Y)
	ROR $3F			  ; 66 3F | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	ASL $AA00,X		  ; 1E 00 AA | Arithmetic shift left (absolute,X)
	CPX $5438			; EC 38 54 | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	JMP ($EE44)		  ; 6C 44 EE | Jump to address (absolute indirect)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_053
; Address: $FC8E21
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_053:
	JSR $0800			; 20 00 08 | Jump to subroutine
	ASL $84			  ; 06 84 | Arithmetic shift left (zero page)
	STX $84			  ; 86 84 | Store X register to zero page
	STX $0C			  ; 86 0C | Store X register to zero page
	ASL $D810			; 0E 10 D8 | Arithmetic shift left (absolute)
	BMI $C0			  ; 30 C0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_054
; Address: $FC8E37
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_054:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $597F,X		  ; 3D 7F 59 | Logical AND with accumulator (absolute,X)
	ORA $0303			; 0D 03 03 | Logical OR with accumulator (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	INC $F876,X		  ; FE 76 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_055
; Address: $FC8EAC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_055:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	LDA				  ; BF 7F 5E 3F | Load from absolute long,X into accumulator
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	INC $FFEF			; EE EF FF | Increment (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	STZ $FA9E			; 9C 9E FA | Store zero to absolute
	PEA #$08F8		   ; F4 F8 08 | Push effective address to stack
	BEQ $B0			  ; F0 B0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_058
; Address: $FC8F48
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_058:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $5C			  ; 80 5C | Branch always
	JMP $005C00		  ; 5C 00 5C 00 | Jump to address long
	JMP $005C00		  ; 5C 00 5C 00 | Jump to address long
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $E0FD,X		  ; FD FD E0 | Game work RAM access
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BCS $B0			  ; B0 B0 | Branch if carry set
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_05A
; Address: $FC8FFA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_05A:
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA $010D			; 0D 0D 01 | Logical OR with accumulator (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SBC $00F9,Y		  ; F9 F9 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_05B
; Address: $FC9056
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_05B:
	JSR $7020			; 20 20 70 | Jump to subroutine
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $FE			  ; 80 FE | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_05D
; Address: $FC906E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_05D:
	JSL $00001F		  ; 22 1F 00 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F E0 9F E0 | Store accumulator to absolute long,X
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_05F
; Address: $FC909B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_05F:
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $0EFF			; 0E FF 0E | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $10			  ; 80 10 | Branch always
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $D4			  ; F0 D4 | Branch if equal
	INX				  ; E8 | Increment X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $041E,X		  ; 1E 1E 04 | Arithmetic shift left (absolute,X)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	INC $70FE,X		  ; FE FE 70 | Increment (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA $0719,Y		  ; 19 19 07 | Logical OR with accumulator (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_060
; Address: $FC9196
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_060:
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $0F9C			; 9C 9C 0F | Store zero to absolute
	ASL $C01E,X		  ; 1E 1E C0 | Arithmetic shift left (absolute,X)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $0F			  ; 30 0F | Branch if negative
	ROL $5F1F			; 2E 1F 5F | Rotate left (absolute)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$E4F8		   ; F4 F8 E4 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $F2			  ; 06 F2 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_062
; Address: $FC9288
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_062:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $5C			  ; 80 5C | Branch always
	JMP $005C00		  ; 5C 00 5C 00 | Jump to address long
	JMP $005C00		  ; 5C 00 5C 00 | Jump to address long
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $C8FE,X		  ; FE FE C8 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	BMI $30			  ; 30 30 | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_063
; Address: $FC9337
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_063:
	SED				  ; F8 | Set decimal mode flag
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $CCFE,X		  ; FE FE CC | Increment (absolute,X)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	SBC $60FD,X		  ; FD FD 60 | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_064
; Address: $FC9364
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_064:
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ROL $FFFF,X		  ; 3E FF FF | Rotate left (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	ROR $FFFD,X		  ; 7E FD FF | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $FE			  ; F0 FE | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $F8FF,X		  ; 1E FF F8 | Arithmetic shift left (absolute,X)
	ADC $FFBF,X		  ; 7D BF FF | Add with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	STZ $F8			  ; 64 F8 | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	JMP $005400		  ; 5C 00 54 00 | Jump to address long
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	WDM #$3C			 ; 42 3C | Reserved instruction
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ROR $18			  ; 66 18 | Rotate right (zero page)
	ASL $C300,X		  ; 1E 00 C3 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_065
; Address: $FC945A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_065:
	PHP				  ; 08 | Push processor status to stack
	ROR $18			  ; 66 18 | Rotate right (zero page)
	BIT $1010			; 2C 10 10 | Test bits in accumulator (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ROL $013E,X		  ; 3E 3E 01 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_066
; Address: $FC9536
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_066:
	JSR $0020			; 20 20 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ROL $1F			  ; 26 1F | Rotate left (zero page)
	LSR $003F,X		  ; 5E 3F 00 | Logical shift right (absolute,X)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F E0 1F E0 | Store accumulator to absolute long,X
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_067
; Address: $FC956F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_067:
	STA				  ; 9F 07 00 7F | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_068
; Address: $FC9579
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_068:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $0EFF			; 0E FF 0E | Arithmetic shift left (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $10			  ; 80 10 | Branch always
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_069
; Address: $FC95AB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_069:
	SED				  ; F8 | Set decimal mode flag
	REP #$FC			 ; C2 FC | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_06B
; Address: $FC95FC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_06B:
	BPL $10			  ; 10 10 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_06D
; Address: $FC9634
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_06D:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $E6			  ; E6 E6 | Increment (zero page)
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC $1FCE			; CE CE 1F | Decrement (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $7CFE,X		  ; FE FE 7C | Increment (absolute,X)
	LDY $FC7F,X		  ; BC 7F FC | Load from absolute,X into Y register
	INC $BE7F,X		  ; FE 7F BE | Increment (absolute,X)
	LDA				  ; BF 7F 5F 3F | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVC $BF			  ; 50 BF | Branch if overflow clear
	BVC $BF			  ; 50 BF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_06E
; Address: $FC9704
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_06E:
	BIT $16DF			; 2C DF 16 | Test bits in accumulator (absolute)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BVC $EF			  ; 50 EF | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	BEQ $79			  ; F0 79 | Branch if equal
	INC $FE7D,X		  ; FE 7D FE | Increment (absolute,X)
	ADC $7DFE,X		  ; 7D FE 7D | Add with carry (absolute,X)
	INC $FE7D,X		  ; FE 7D FE | Increment (absolute,X)
	ADC $7AFE,X		  ; 7D FE 7A | Add with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $001E,X		  ; 1E 1E 00 | Arithmetic shift left (absolute,X)
	STZ $64			  ; 64 64 | Store zero to zero page
	BRA $80			  ; 80 80 | Branch always
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $001D,X		  ; 1D 1D 00 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_071
; Address: $FC987A
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_071:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ROR $FFFD,X		  ; 7E FD FF | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ADC $FFBF,X		  ; 7D BF FF | Add with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PEA #$B8F8		   ; F4 F8 B8 | Push effective address to stack
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_072
; Address: $FC9938
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_072:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $071E,X		  ; 1E 1E 07 | Arithmetic shift left (absolute,X)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_073
; Address: $FC99C6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_073:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1B09			; 0E 09 1B | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_075
; Address: $FC99E4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_075:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	STA ($05,X)		  ; 81 05 | Store accumulator to (zero page,X)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_076
; Address: $FC99F5
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_076:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	STA $61A0,Y		  ; 99 A0 61 | Store accumulator to absolute,Y
	STA ($82,X)		  ; 81 82 | Store accumulator to (zero page,X)
	BVS $01			  ; 70 01 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BMI $60			  ; 30 60 | Branch if negative
	BEQ $10			  ; F0 10 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	INY				  ; C8 | Increment Y register
	ASL $2302,X		  ; 1E 02 23 | Arithmetic shift left (absolute,X)
	ASL $3D00			; 0E 00 3D | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3C0C			; 0E 0C 3C | Arithmetic shift left (absolute)
	WDM #$5D			 ; 42 5D | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $2200,X		  ; 7D 00 22 | Add with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $041F,X		  ; 1E 1F 04 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_077
; Address: $FC9A89
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_077:
	JSR $131C			; 20 1C 13 | Jump to subroutine
	ASL $003E			; 0E 3E 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_078
; Address: $FC9A9A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_078:
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	CMP ($07,X)		  ; C1 07 | Compare accumulator ((zero page,X))
	SBC $88F0			; ED F0 88 | Subtract with carry (absolute)
	LSR $383E			; 4E 3E 38 | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_079
; Address: $FC9ABD
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_079:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1B09			; 0E 09 1B | Arithmetic shift left (absolute)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_07B
; Address: $FC9B02
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_07B:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	STA ($05,X)		  ; 81 05 | Store accumulator to (zero page,X)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA $332D,Y		  ; 19 2D 33 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_07C
; Address: $FC9B13
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_07C:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_07D
; Address: $FC9B3F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_07D:
	BRA $00			  ; 80 00 | Branch always
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	AND ($0D),Y		  ; 31 0D | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_07E
; Address: $FC9B4D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_07E:
	JSL $00561B		  ; 22 1B 56 00 | Jump to subroutine long
	ASL $2800			; 0E 00 28 | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	STZ $00			  ; 64 00 | Store zero to zero page
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_07F
; Address: $FC9B6C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_07F:
	BRA $A1			  ; 80 A1 | Branch always
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_080
; Address: $FC9B83
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_080:
	JSL $6D2612		  ; 22 12 26 6D | Jump to subroutine long
	EOR $27			  ; 45 27 | Exclusive OR with accumulator (zero page)
	LSR $FE6D			; 4E 6D FE | Logical shift right (absolute)
	AND $31			  ; 25 31 | Logical AND with accumulator (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ROL $7F02,X		  ; 3E 02 7F | Rotate left (absolute,X)
	BRA $1F			  ; 80 1F | Branch always
	DEC $BC00			; CE 00 BC | Decrement (absolute)
	AND $7A33			; 2D 33 7A | Logical AND with accumulator (absolute)
	LSR $D4			  ; 46 D4 | Logical shift right (zero page)
	STY $18A8			; 8C A8 18 | Store Y register to absolute address
	BVC $30			  ; 50 30 | Branch if overflow clear
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_081
; Address: $FC9BBC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_081:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $831C			; 0E 1C 83 | Arithmetic shift left (absolute)
	BRA $03			  ; 80 03 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_082
; Address: $FC9BD4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_082:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	LDY $1CA8,X		  ; BC A8 1C | Load from absolute,X into Y register
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	LDX $1F			  ; A6 1F | Load from zero page into X register
	ORA $C8			  ; 05 C8 | Logical OR with accumulator (zero page)
	LDY $A94F,X		  ; BC 4F A9 | Load from absolute,X into Y register
	INC				  ; 1A | Increment accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_084
; Address: $FC9C02
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_084:
	BMI $80			  ; 30 80 | Branch if negative
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_085
; Address: $FC9C07
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_085:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	JMP $0050			; 4C 50 00 | Jump to address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_086
; Address: $FC9C1E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_086:
	STX $2100			; 8E 00 21 | PPU graphics register access
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	ADC #$15			 ; 69 15 | Add with carry (immediate)
	ORA $0512			; 0D 12 05 | Logical OR with accumulator (absolute)
	LSR $7F00,X		  ; 5E 00 7F | Logical shift right (absolute,X)
	BPL $16			  ; 10 16 | Branch if positive
	BPL $17			  ; 10 17 | Branch if positive
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CMP ($7A),Y		  ; D1 7A | Compare accumulator ((zero page),Y)
	STZ $4887			; 9C 87 48 | Store zero to absolute
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ROL $5670			; 2E 70 56 | Rotate left (absolute)
	AND #$92			 ; 29 92 | Logical AND with accumulator (immediate)
	BPL $84			  ; 10 84 | Branch if positive
	CPY $6300			; CC 00 63 | Compare Y register (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	JMP $F89478		  ; 5C 78 94 F8 | Jump to address long
	BEQ $B8			  ; F0 B8 | Branch if equal
	BCC $7C			  ; 90 7C | Branch if carry clear
	CPY $DC28			; CC 28 DC | Compare Y register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_087
; Address: $FC9C6C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_087:
	PLP				  ; 28 | Pull processor status from stack
	BMI $90			  ; 30 90 | Branch if negative
	LDY #$A2			 ; A0 A2 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_089
; Address: $FC9C8B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_089:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_08A
; Address: $FC9CA1
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_08A:
	JSL $6D2612		  ; 22 12 26 6D | Jump to subroutine long
	EOR $27			  ; 45 27 | Exclusive OR with accumulator (zero page)
	LSR $FE6D			; 4E 6D FE | Logical shift right (absolute)
	AND $31			  ; 25 31 | Logical AND with accumulator (zero page)
	ASL $C7			  ; 06 C7 | Arithmetic shift left (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ROL $7F02,X		  ; 3E 02 7F | Rotate left (absolute,X)
	BRA $1F			  ; 80 1F | Branch always
	DEC $BC00			; CE 00 BC | Decrement (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	LSR $D4			  ; 46 D4 | Logical shift right (zero page)
	STY $18A8			; 8C A8 18 | Store Y register to absolute address
	BVC $30			  ; 50 30 | Branch if overflow clear
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_08B
; Address: $FC9CDA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_08B:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
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
; Bank78_DmaFunction_08C
; Address: $FC9D21
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_08C:
	LSR $37			  ; 46 37 | Logical shift right (zero page)
	LDY $0C26			; AC 26 0C | Load from absolute address into Y register
	ROR $4C			  ; 66 4C | Rotate right (zero page)
	DEC $8C			  ; C6 8C | Decrement (zero page)
	LSR $CC1C			; 4E 1C CC | Logical shift right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_08D
; Address: $FC9D32
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_08D:
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	AND $3B56,Y		  ; 39 56 3B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_08E
; Address: $FC9D44
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_08E:
	JSL $033F12		  ; 22 12 3F 03 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	WDM #$09			 ; 42 09 | Reserved instruction
	LDA ($30),Y		  ; B1 30 | Load from (zero page),Y into accumulator
	STA ($08,X)		  ; 81 08 | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	ADC $DE00,X		  ; 7D 00 DE | Add with carry (absolute,X)
	DEC $0600			; CE 00 06 | Decrement (absolute)
	JMP $E71F			; 4C 1F E7 | Jump to address
	ROL $08E5			; 2E E5 08 | Rotate left (absolute)
	INC $4B			  ; E6 4B | Increment (zero page)
	PHX				  ; DA | Push X register to stack
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	CMP ($4F),Y		  ; D1 4F | Compare accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$B6			 ; C0 B6 | Compare Y register (immediate)
	ADC ($FC,X)		  ; 61 FC | Add with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	LSR $DAA4			; 4E A4 DA | Logical shift right (absolute)
	SBC ($2D),Y		  ; F1 2D | Subtract with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $BC0E			; 4E 0E BC | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_08F
; Address: $FC9DA6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_08F:
	PLA				  ; 68 | Pull accumulator from stack
	SBC ($99),Y		  ; F1 99 | Subtract with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	SBC $3C36,X		  ; FD 36 3C | Subtract with carry (absolute,X)
	BNE $00			  ; D0 00 | Branch if not equal
	LDY $00			  ; A4 00 | Load from zero page into Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $0000			; 8C 00 00 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_090
; Address: $FC9DC3
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_090:
	JSR $277C			; 20 7C 27 | Jump to subroutine
	CPY $0D			  ; C4 0D | Compare Y register (zero page)
	PHB				  ; 8B | Push data bank register to stack
	SEP #$F0			 ; E2 F0 | Set processor status bits
	LDX $7C			  ; A6 7C | Load from zero page into X register
	PHA				  ; 48 | Push accumulator to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	INC $1C9C			; EE 9C 1C | Increment (absolute)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_092
; Address: $FC9DEF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_092:
	BMI $CC			  ; 30 CC | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_093
; Address: $FC9DF8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_093:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ORA $0606			; 0D 06 06 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ROL $F9			  ; 26 F9 | Rotate left (zero page)
	STZ $3F9F,X		  ; 9E 9F 3F | Store zero to absolute,X
	BMI $70			  ; 30 70 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_095
; Address: $FC9E40
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_095:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_096
; Address: $FC9E69
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_096:
	WDM #$09			 ; 42 09 | Reserved instruction
	LDA ($30),Y		  ; B1 30 | Load from (zero page),Y into accumulator
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	ADC $DE00,X		  ; 7D 00 DE | Add with carry (absolute,X)
	DEC $DC00			; CE 00 DC | Decrement (absolute)
	JMP $E71F			; 4C 1F E7 | Jump to address
	ROL $08E5			; 2E E5 08 | Rotate left (absolute)
	INC $4B			  ; E6 4B | Increment (zero page)
	PHX				  ; DA | Push X register to stack
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	CMP ($4F),Y		  ; D1 4F | Compare accumulator ((zero page),Y)
	ASL $00E1			; 0E E1 00 | Arithmetic shift left (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_098
; Address: $FC9EA9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_098:
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 B7 08 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	SEP #$62			 ; E2 62 | Set processor status bits
	ROR $3F3F,X		  ; 7E 3F 3F | Rotate right (absolute,X)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_099
; Address: $FC9EFE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_099:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $18			  ; 84 18 | Store Y register to zero page
	BRA $14			  ; 80 14 | Branch always
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LDX #$0A			 ; A2 0A | Load immediate value into X register
	LDA ($77,X)		  ; A1 77 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_09A
; Address: $FC9F25
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_09A:
	JSR $0122			; 20 22 01 | Jump to subroutine
	ASL $3901			; 0E 01 39 | Arithmetic shift left (absolute)
	LSR $FE4B			; 4E 4B FE | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_09B
; Address: $FC9F2E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_09B:
	JSR $DCBC			; 20 BC DC | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ASL $25D3			; 0E D3 25 | Arithmetic shift left (absolute)
	INC $0D			  ; E6 0D | Increment (zero page)
	LDA $0BCC48		  ; AF 48 CC 0B | Load from absolute long address into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $101F,X		  ; 1E 1F 10 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_09C
; Address: $FC9F53
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_09C:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BVC $40			  ; 50 40 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	SBC $80			  ; E5 80 | Subtract with carry (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$79			 ; C0 79 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	DEY				  ; 88 | Decrement Y register
	CPY $3BF2			; CC F2 3B | Compare Y register (absolute)
	STY $63F0			; 8C F0 63 | Store Y register to absolute address
	STA $4A01			; 8D 01 4A | Store accumulator to absolute address
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $4300			; 0D 00 43 | Logical OR with accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_09D
; Address: $FC9F81
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_09D:
	JSR $2018			; 20 18 20 | Jump to subroutine
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_09E
; Address: $FC9F88
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_09E:
	PEA #$0810		   ; F4 10 08 | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	BIT $04F0			; 2C F0 04 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	JMP $0C3030		  ; 5C 30 30 0C | Jump to address long
	BPL $0C			  ; 10 0C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A0
; Address: $FC9FCC
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A0:
	JSR $2008			; 20 08 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA $160B			; 0D 0B 16 | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $56			  ; 26 56 | Rotate left (zero page)
	LSR $4C54			; 4E 54 4C | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ROR $8080,X		  ; 7E 80 80 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $360C			; 0D 0C 36 | Logical OR with accumulator (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A1
; Address: $FCA017
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A1:
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $70			  ; 90 70 | Branch if carry clear
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	LDA ($77,X)		  ; A1 77 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A2
; Address: $FCA043
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A2:
	JSR $0122			; 20 22 01 | Jump to subroutine
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BIT $E6			  ; 24 E6 | Test bits in accumulator (zero page)
	LDY $CC48			; AC 48 CC | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	JMP $1C9898		  ; 5C 98 98 1C | Jump to address long
	CLC				  ; 18 | Clear carry flag
	BPL $70			  ; 10 70 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A4
; Address: $FCA071
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A4:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVS $40			  ; 70 40 | Branch if overflow set
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPX $80			  ; E4 80 | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY $5963			; CC 63 59 | Compare Y register (absolute)
	ROL $0C3E,X		  ; 3E 3E 0C | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A5
; Address: $FCA092
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A5:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND ($15),Y		  ; 31 15 | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $7F40,X		  ; 3E 40 7F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A6
; Address: $FCA0B4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A6:
	JSR $103F			; 20 3F 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A7
; Address: $FCA0E3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A7:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLV				  ; B8 | Clear overflow flag
	LDX #$90			 ; A2 90 | Load immediate value into X register
	AND ($C8,X)		  ; 21 C8 | Logical AND with accumulator ((zero page,X))
	BRA $38			  ; 80 38 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $5E13			; 4C 13 5E | Jump to address
	ASL $392B,X		  ; 1E 2B 39 | Arithmetic shift left (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A8
; Address: $FCA11C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A8:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	LSR $3D3F			; 4E 3F 3D | Logical shift right (absolute)
	ASL $30CE			; 0E CE 30 | Arithmetic shift left (absolute)
	JMP $EAC0			; 4C C0 EA | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0A9
; Address: $FCA132
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0A9:
	ASL $1000			; 0E 00 10 | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	STY $CD			  ; 84 CD | Store Y register to zero page
	INC $B7FC,X		  ; FE FC B7 | Increment (absolute,X)
	AND ($49),Y		  ; 31 49 | Logical AND with accumulator ((zero page),Y)
	BMI $58			  ; 30 58 | Branch if negative
	BPL $85			  ; 10 85 | Branch if positive
	SEC				  ; 38 | Set carry flag
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0AA
; Address: $FCA15C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0AA:
	JSR $4800			; 20 00 48 | Jump to subroutine
	CPY $CC28			; CC 28 CC | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $F0			  ; F0 F0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0AB
; Address: $FCA16C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0AB:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0AD
; Address: $FCA176
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0AD:
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1A00			; 0E 00 1A | Arithmetic shift left (absolute)
	LDY $A89C			; AC 9C A8 | Load from absolute address into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $5239,Y		  ; 59 39 52 | Exclusive OR with accumulator (absolute,Y)
	SBC $FB05,X		  ; FD 05 FB | Subtract with carry (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	SBC $FB08,X		  ; FD 08 FB | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	LSR $AC			  ; 46 AC | Logical shift right (zero page)
	STZ $3858			; 9C 58 38 | Store zero to absolute
	BCS $70			  ; B0 70 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0AE
; Address: $FCA209
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0AE:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BCS $01			  ; B0 01 | Branch if carry set
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0AF
; Address: $FCA21A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0AF:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $7418,X		  ; 1D 18 74 | Logical OR with accumulator (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B0
; Address: $FCA24E
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B0:
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	LSR $F9B1			; 4E B1 F9 | Logical shift right (absolute)
	STA $01018E		  ; 8F 8E 01 01 | Store accumulator to absolute long address
	BCS $00			  ; B0 00 | Branch if carry set
	LDX $4600,Y		  ; BE 00 46 | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	JMP ($F04C)		  ; 6C 4C F0 | Jump to address (absolute indirect)
	BVC $80			  ; 50 80 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	LDY #$36			 ; A0 36 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	BCS $47			  ; B0 47 | Branch if carry set
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	LSR $5F00			; 4E 00 5F | Logical shift right (absolute)
	AND ($16),Y		  ; 31 16 | Logical AND with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B1
; Address: $FCA2D0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B1:
	JSR $2800			; 20 00 28 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	CMP $FFC7,X		  ; DD C7 FF | Compare accumulator (absolute,X)
	ADC $31CE,Y		  ; 79 CE 31 | Add with carry (absolute,Y)
	CPY $8630			; CC 30 86 | Compare Y register (absolute)
	AND ($87),Y		  ; 31 87 | Logical AND with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CPY $8800			; CC 00 88 | Compare Y register (absolute)
	BRA $38			  ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B2
; Address: $FCA303
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B2:
	BCS $30			  ; B0 30 | Branch if carry set
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BEQ $C8			  ; F0 C8 | Branch if equal
	LDA ($66,X)		  ; A1 66 | Load from (zero page,X) into accumulator
	ORA $FCF9,Y		  ; 19 F9 FC | Logical OR with accumulator (absolute,Y)
	ORA $0070			; 0D 70 00 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	LSR $0600,X		  ; 5E 00 06 | Logical shift right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B3
; Address: $FCA32F
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CPY $B807			; CC 07 B8 | Compare Y register (absolute)
	DEC $FA44			; CE 44 FA | Decrement (absolute)
	LDA ($6D),Y		  ; B1 6D | Load from (zero page),Y into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $1B			  ; 46 1B | Logical shift right (zero page)
	SEC				  ; 38 | Set carry flag
	BMI $17			  ; 30 17 | Branch if negative
	ROL $69			  ; 26 69 | Rotate left (zero page)
	AND $7900			; 2D 00 79 | Logical AND with accumulator (absolute)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC				  ; 3A | Decrement accumulator
	EOR $1000,Y		  ; 59 00 10 | Exclusive OR with accumulator (absolute,Y)
	INC $FE38,X		  ; FE 38 FE | Increment (absolute,X)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BVC $40			  ; 50 40 | Branch if overflow clear
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	CPX $FC30			; EC 30 FC | Compare X register (absolute)
	BCC $7C			  ; 90 7C | Branch if carry clear
	STY $7E			  ; 84 7E | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B4
; Address: $FCA3B0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B4:
	BCS $80			  ; B0 80 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$2C			 ; 09 2C | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B5
; Address: $FCA3ED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B5:
	SEC				  ; 38 | Set carry flag
	CPY $0064			; CC 64 00 | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STA $B33C18		  ; 8F 18 3C B3 | Store accumulator to absolute long address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B6
; Address: $FCA406
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B6:
	JMP $B2C3			; 4C C3 B2 | Jump to address
	ASL $7C44			; 0E 44 7C | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	ROL $0CD4,X		  ; 3E D4 0C | Rotate left (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	EOR $C883			; 4D 83 C8 | Exclusive OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B7
; Address: $FCA424
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B7:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0B8
; Address: $FCA437
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0B8:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STX $17			  ; 86 17 | Store X register to zero page
	BVS $4E			  ; 70 4E | Branch if overflow set
	CPY $3E47			; CC 47 3E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0BA
; Address: $FCA47C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0BA:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $1A			  ; E6 1A | Increment (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0BB
; Address: $FCA49A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0BB:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STX $0003			; 8E 03 00 | Store X register to absolute address
	ASL $493F			; 0E 3F 49 | Arithmetic shift left (absolute)
	ASL $62A3,X		  ; 1E A3 62 | Arithmetic shift left (absolute,X)
	EOR $E5FE,Y		  ; 59 FE E5 | Exclusive OR with accumulator (absolute,Y)
	ORA $0001,X		  ; 1D 01 00 | Logical OR with accumulator (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0BC
; Address: $FCA4D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0BC:
	JSL $001C00		  ; 22 00 1C 00 | Jump to subroutine long
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0BD
; Address: $FCA4E5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0BD:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0BF
; Address: $FCA4FA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0BF:
	JSR $2800			; 20 00 28 | Jump to subroutine
	JMP $1F00			; 4C 00 1F | Jump to address
	BVC $4F			  ; 50 4F | Branch if overflow clear
	BNE $3F			  ; D0 3F | Branch if not equal
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	LDY #$DD			 ; A0 DD | Load immediate value into Y register
	ADC #$36			 ; 69 36 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C1
; Address: $FCA512
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C1:
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C2
; Address: $FCA518
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C2:
	JSL $001400		  ; 22 00 14 00 | Jump to subroutine long
	STX $C479			; 8E 79 C4 | Store X register to absolute address
	BMI $A0			  ; 30 A0 | Branch if negative
	STZ $40			  ; 64 40 | Store zero to zero page
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C3
; Address: $FCA528
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C3:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	JMP $009800		  ; 5C 00 98 00 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	EOR $DD			  ; 45 DD | Exclusive OR with accumulator (zero page)
	LDX $4E			  ; A6 4E | Load from zero page into X register
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $30			  ; D0 30 | Branch if not equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ADC $AA00			; 6D 00 AA | Add with carry (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C4
; Address: $FCA57E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C4:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $1E0F			; 0E 0F 1E | Arithmetic shift left (absolute)
	ORA $0521			; 0D 21 05 | Logical OR with accumulator (absolute)
	EOR $4810,Y		  ; 59 10 48 | Exclusive OR with accumulator (absolute,Y)
	BVC $05			  ; 50 05 | Branch if overflow clear
	AND ($1B),Y		  ; 31 1B | Logical AND with accumulator ((zero page),Y)
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	ROL $6E00,X		  ; 3E 00 6E | Rotate left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C5
; Address: $FCA59E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C5:
	JSR $B800			; 20 00 B8 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $F983,Y		  ; B9 83 F9 | Load from absolute,Y into accumulator
	EOR #$4E			 ; 49 4E | Exclusive OR with accumulator (immediate)
	EOR $03FC,X		  ; 5D FC 03 | Exclusive OR with accumulator (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	ADC $00			  ; 65 00 | Add with carry (zero page)
	BPL $CA			  ; 10 CA | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $88			  ; 10 88 | Branch if positive
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $EC			  ; F0 EC | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP ($9458)		  ; 6C 58 94 | Jump to address (absolute indirect)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C7
; Address: $FCA5CE
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C7:
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C8
; Address: $FCA5D4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C8:
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0C9
; Address: $FCA5DE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0C9:
	BRA $00			  ; 80 00 | Branch always
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1800			; 0D 00 18 | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0CA
; Address: $FCA60C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0CA:
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0CB
; Address: $FCA61E
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0CB:
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	AND ($7F),Y		  ; 31 7F | Logical AND with accumulator ((zero page),Y)
	CMP $F7			  ; C5 F7 | Compare accumulator (zero page)
	LSR $7C9C			; 4E 9C 7C | Logical shift right (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	STX $00			  ; 86 00 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	BIT $E000			; 2C 00 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	JMP ($D674)		  ; 6C 74 D6 | Jump to address (absolute indirect)
	LDX $DC			  ; A6 DC | Load from zero page into X register
	PHP				  ; 08 | Push processor status to stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $0606,X		  ; 9D 06 06 | Store accumulator to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0CC
; Address: $FCA6B0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0CC:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $04			  ; 70 04 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0CD
; Address: $FCA6F0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0CD:
	JSR $8000			; 20 00 80 | Jump to subroutine
	ORA $0A07			; 0D 07 0A | Logical OR with accumulator (absolute)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA $3293,X		  ; 1D 93 32 | Logical OR with accumulator (absolute,X)
	LDA ($71,X)		  ; A1 71 | Load from (zero page,X) into accumulator
	INY				  ; C8 | Increment Y register
	BVS $0B			  ; 70 0B | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0CE
; Address: $FCA723
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0CE:
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BIT $6CE8			; 2C E8 6C | Test bits in accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0CF
; Address: $FCA730
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0CF:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D0
; Address: $FCA740
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D0:
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0C07			; 0D 07 0C | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $0905			; 0D 05 09 | Logical OR with accumulator (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ORA #$B7			 ; 09 B7 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D1
; Address: $FCA76C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D1:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $48			  ; 10 48 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	STZ $40			  ; 64 40 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D3
; Address: $FCA780
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D3:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	LDX $C0C0,Y		  ; BE C0 C0 | Load from absolute,Y into X register
	CMP $C600			; CD 00 C6 | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BCC $B0			  ; 90 B0 | Branch if carry clear
	BEQ $90			  ; F0 90 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	JMP $4000			; 4C 00 40 | Jump to address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	ORA $1A13,Y		  ; 19 13 1A | Logical OR with accumulator (absolute,Y)
	ROL $0032			; 2E 32 00 | Rotate left (absolute)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	STA $5C41			; 8D 41 5C | Store accumulator to absolute address
	LDX $1F64,Y		  ; BE 64 1F | Load from absolute,Y into X register
	SBC ($2D),Y		  ; F1 2D | Subtract with carry ((zero page),Y)
	SBC #$A0			 ; E9 A0 | Subtract with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CMP ($ED),Y		  ; D1 ED | Compare accumulator ((zero page),Y)
	EOR ($72),Y		  ; 51 72 | Exclusive OR with accumulator ((zero page),Y)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	LDA ($82),Y		  ; B1 82 | Load from (zero page),Y into accumulator
	DEC				  ; 3A | Decrement accumulator
	ADC $F826,X		  ; 7D 26 F8 | Add with carry (absolute,X)
	STA $971B94		  ; 8F 94 1B 97 | Store accumulator to absolute long address
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR $C400			; 4E 00 C4 | Logical shift right (absolute)
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D4
; Address: $FCA83A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D4:
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($4000)		  ; 6C 00 40 | Jump to address (absolute indirect)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ORA #$24			 ; 09 24 | Logical OR with accumulator (immediate)
	ORA $0550,Y		  ; 19 50 05 | Logical OR with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D5
; Address: $FCA85A
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D5:
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1800,X		  ; 1D 00 18 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $2600,Y		  ; 19 00 26 | Logical OR with accumulator (absolute,Y)
	ORA #$5B			 ; 09 5B | Logical OR with accumulator (immediate)
	STA $EF26,X		  ; 9D 26 EF | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	BPL $F2			  ; 10 F2 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BIT $EC88			; 2C 88 EC | Test bits in accumulator (absolute)
	BMI $F8			  ; 30 F8 | Branch if negative
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($F400)		  ; 6C 00 F4 | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	AND $0000			; 2D 00 00 | Logical AND with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $34			  ; 10 34 | Branch if positive
	ORA ($37),Y		  ; 11 37 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	JMP $08DE			; 4C DE 08 | Jump to address
	ROL $1600			; 2E 00 16 | Rotate left (absolute)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	BRA $00			  ; 80 00 | Branch always
	BCC $D2			  ; 90 D2 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D7
; Address: $FCA90D
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D7:
	ROR $C2A0			; 6E A0 C2 | Rotate right (absolute)
	BCS $00			  ; B0 00 | Branch if carry set
	JMP ($CC00)		  ; 6C 00 CC | Jump to address (absolute indirect)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BMI $0C			  ; 30 0C | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ORA $0706			; 0D 06 07 | Logical OR with accumulator (absolute)
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BMI $20			  ; 30 20 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BMI $14			  ; 30 14 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BIT $78			  ; 24 78 | Test bits in accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $40			  ; 10 40 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $013C2A		  ; 5C 2A 3C 01 | Jump to address long
	ORA $9F08			; 0D 08 9F | Logical OR with accumulator (absolute)
	STA				  ; 9F AC 65 E0 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D8
; Address: $FCA98C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D8:
	BRA $40			  ; 80 40 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0D9
; Address: $FCA9A0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0D9:
	STZ $4C			  ; 64 4C | Store zero to zero page
	JMP $0C64			; 4C 64 0C | Jump to address
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	ROR $60			  ; 66 60 | Rotate right (zero page)
	SEP #$70			 ; E2 70 | Set processor status bits
	SBC ($CE),Y		  ; F1 CE | Subtract with carry ((zero page),Y)
	ROR $6381,X		  ; 7E 81 63 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0DA
; Address: $FCA9B7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0DA:
	JSR $009E			; 20 9E 00 | Jump to subroutine
	STA $000100		  ; 8F 00 01 00 | Store accumulator to absolute long address
	ROL $32			  ; 26 32 | Rotate left (zero page)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	ROR $06			  ; 66 06 | Rotate right (zero page)
	STX $630F			; 8E 0F 63 | Store X register to absolute address
	ROR $C681,X		  ; 7E 81 C6 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0DB
; Address: $FCA9D1
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0DB:
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROL $045A,X		  ; 3E 5A 04 | Rotate left (absolute,X)
	ADC $7100,Y		  ; 79 00 71 | Add with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	ROR $3F10			; 6E 10 3F | Rotate right (absolute)
	BPL $27			  ; 10 27 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA $170A,X		  ; 1D 0A 17 | Logical OR with accumulator (absolute,X)
	ORA $060E			; 0D 0E 06 | Logical OR with accumulator (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX $18			  ; E4 18 | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	BCS $70			  ; B0 70 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0DC
; Address: $FCAA0C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0DC:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	EOR $920B			; 4D 0B 92 | Exclusive OR with accumulator (absolute)
	BEQ $26			  ; F0 26 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STY $8000			; 8C 00 80 | Store Y register to absolute address
	INC $1C9C			; EE 9C 1C | Increment (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0DD
; Address: $FCAA7A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0DD:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $85			  ; E6 85 | Increment (zero page)
	STZ $1811			; 9C 11 18 | Store zero to absolute
	BEQ $01			  ; F0 01 | Branch if equal
	BEQ $01			  ; F0 01 | Branch if equal
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	PLY				  ; 7A | Pull Y register from stack
	INC $00			  ; E6 00 | Increment (zero page)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0DE
; Address: $FCAA9F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0DE:
	JSR $7033			; 20 33 70 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	JMP $3600			; 4C 00 36 | Jump to address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	ROR $3637			; 6E 37 36 | Rotate right (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0DF
; Address: $FCAACD
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0DF:
	JSR $5040			; 20 40 50 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	CPX $006C			; EC 6C 00 | Compare X register (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY $26			  ; C4 26 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BIT $2C08			; 2C 08 2C | Test bits in accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BPL $58			  ; 10 58 | Branch if positive
	BCC $20			  ; 90 20 | Branch if carry clear
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E0
; Address: $FCAB10
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E0:
	DEC				  ; 3A | Decrement accumulator
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	STA $8964,X		  ; 9D 64 89 | Store accumulator to absolute,X
	STA $72EE,Y		  ; 99 EE 72 | Store accumulator to absolute,Y
	BVS $03			  ; 70 03 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E1
; Address: $FCAB28
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E1:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E2
; Address: $FCAB40
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E2:
	JSR $E040			; 20 40 E0 | Game work RAM access
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $B0			  ; B0 B0 | Branch if carry set
	ROR $326C			; 6E 6C 32 | Rotate right (absolute)
	BIT $8013			; 2C 13 80 | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	JMP ($1200)		  ; 6C 00 12 | Jump to address (absolute indirect)
	ASL $1D00			; 0E 00 1D | Arithmetic shift left (absolute)
	DEC $DF00,X		  ; DE 00 DF | Decrement (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDX $D022			; AE 22 D0 | Load from absolute address into X register
	AND ($B1),Y		  ; 31 B1 | Logical AND with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	XBA				  ; EB | Exchange accumulator bytes
	INC $C9			  ; E6 C9 | Increment (zero page)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BNE $00			  ; D0 00 | Branch if not equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BCC $54			  ; 90 54 | Branch if carry clear
	AND $0373,X		  ; 3D 73 03 | Logical AND with accumulator (absolute,X)
	BMI $54			  ; 30 54 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	LDA $CB9E,X		  ; BD 9E CB | Load from absolute,X into accumulator
	CPX $70			  ; E4 70 | Compare X register (zero page)
	LDY #$0C			 ; A0 0C | Load immediate value into Y register
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E3
; Address: $FCAB9C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E3:
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BIT $342C			; 2C 2C 34 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E4
; Address: $FCABAA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E4:
	JSL $121636		  ; 22 36 16 12 | Jump to subroutine long
	ORA $0013,Y		  ; 19 13 00 | Logical OR with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	ROL $1E00,X		  ; 3E 00 1E | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E5
; Address: $FCABC3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E5:
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($15),Y		  ; 11 15 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E6
; Address: $FCABEF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E6:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E7
; Address: $FCAC2F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E7:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$0B			 ; E0 0B | Compare X register (immediate)
	ASL $0E17			; 0E 17 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E8
; Address: $FCAC48
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E8:
	JSR $041F			; 20 1F 04 | Jump to subroutine
	ASL $0476			; 0E 76 04 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	LDX $60			  ; A6 60 | Load from zero page into X register
	STY $FF62			; 8C 62 FF | Store Y register to absolute address
	CPX #$2F			 ; E0 2F | Compare X register (immediate)
	BNE $6F			  ; D0 6F | Branch if not equal
	BNE $7F			  ; D0 7F | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	SBC $1DC0,Y		  ; F9 C0 1D | Subtract with carry (absolute,Y)
	BCC $10			  ; 90 10 | Branch if carry clear
	BPL $10			  ; 10 10 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BVS $38			  ; 70 38 | Branch if overflow set
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0E9
; Address: $FCAC84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0E9:
	JSL $0F121D		  ; 22 1D 12 0F | Jump to subroutine long
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL $0706			; 0E 06 07 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0EA
; Address: $FCAC8E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0EA:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0EB
; Address: $FCACA5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0EB:
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDX $4BD9			; AE D9 4B | Load from absolute address into X register
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0EC
; Address: $FCACB2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0EC:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	LDY $5162,X		  ; BC 62 51 | Load from absolute,X into Y register
	AND ($4E),Y		  ; 31 4E | Logical AND with accumulator ((zero page),Y)
	AND $1713,X		  ; 3D 13 17 | Logical AND with accumulator (absolute,X)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0ED
; Address: $FCACCE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0ED:
	JSL $000300		  ; 22 00 03 00 | Jump to subroutine long
	ASL $1000			; 0E 00 10 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0EE
; Address: $FCAD09
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0EE:
	JSR $1030			; 20 30 10 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	ORA ($14),Y		  ; 11 14 | Logical OR with accumulator ((zero page),Y)
	ORA $1914,Y		  ; 19 14 19 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0EF
; Address: $FCAD5C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0EF:
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ORA $050E			; 0D 0E 05 | Logical OR with accumulator (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BMI $20			  ; 30 20 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $1E02,X		  ; 1E 02 1E | Arithmetic shift left (absolute,X)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F0
; Address: $FCADB2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F0:
	JSR $103F			; 20 3F 10 | Jump to subroutine
	ASL $1C13,X		  ; 1E 13 1C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BVS $10			  ; 70 10 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ORA $1DE5,X		  ; 1D E5 1D | Logical OR with accumulator (absolute,X)
	SBC $9B			  ; E5 9B | Subtract with carry (zero page)
	DEY				  ; 88 | Decrement Y register
	ADC $00A2,Y		  ; 79 A2 00 | Add with carry (absolute,Y)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F1
; Address: $FCADFC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F1:
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP $CA64,X		  ; DD 64 CA | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F2
; Address: $FCAE24
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F2:
	JSL $5CA363		  ; 22 63 A3 5C | Jump to subroutine long
	DEC $ED61,X		  ; DE 61 ED | Decrement (absolute,X)
	BVS $30			  ; 70 30 | Branch if overflow set
	LDA $00025C		  ; AF 5C 02 00 | Load from absolute long address into accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	JMP $004400		  ; 5C 00 44 00 | Jump to address long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	INC $01F0			; EE F0 01 | Increment (absolute)
	INC $47B0,X		  ; FE B0 47 | Increment (absolute,X)
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	LSR $5F00			; 4E 00 5F | Logical shift right (absolute)
	ASL $0763,X		  ; 1E 63 07 | Arithmetic shift left (absolute,X)
	AND ($16),Y		  ; 31 16 | Logical AND with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F3
; Address: $FCAE70
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F3:
	JSR $3800			; 20 00 38 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $031C			; 0E 1C 03 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	LDY $1CA8,X		  ; BC A8 1C | Load from absolute,X into Y register
	STZ $140E			; 9C 0E 14 | Store zero to absolute
	DEC $C50C			; CE 0C C5 | Decrement (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	WDM #$A5			 ; 42 A5 | Reserved instruction

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F4
; Address: $FCAEAF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F4:
	WDM #$04			 ; 42 04 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA $8383			; 0D 83 83 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	BNE $20			  ; D0 20 | Branch if not equal
	ROL $0F00,X		  ; 3E 00 0F | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	SEC				  ; 38 | Set carry flag
	ASL $123E,X		  ; 1E 3E 12 | Arithmetic shift left (absolute,X)
	ROL $3C04,X		  ; 3E 04 3C | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F5
; Address: $FCAEFE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F5:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND $8300,Y		  ; 39 00 83 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $0E12			; 0E 12 0E | Arithmetic shift left (absolute)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $F3			  ; 10 F3 | Branch if positive
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F6
; Address: $FCAF5B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F6:
	BPL $0C			  ; 10 0C | Branch if positive
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND $3916,X		  ; 3D 16 39 | Logical AND with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F7
; Address: $FCAF83
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F7:
	JSL $E060A1		  ; 22 A1 60 E0 | Game work RAM access
	SBC ($71,X)		  ; E1 71 | Subtract with carry ((zero page,X))
	SBC #$48			 ; E9 48 | Subtract with carry (immediate)
	JMP ($FE51)		  ; 6C 51 FE | Jump to address (absolute indirect)
	STA ($1C,X)		  ; 81 1C | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F8
; Address: $FCAF93
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F8:
	JSR $001E			; 20 1E 00 | Jump to subroutine
	ASL $9600,X		  ; 1E 00 96 | Arithmetic shift left (absolute,X)
	BPL $12			  ; 10 12 | Branch if positive
	BPL $96			  ; 10 96 | Branch if positive
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA $0EE8,Y		  ; 19 E8 0E | Logical OR with accumulator (absolute,Y)
	SEP #$06			 ; E2 06 | Set processor status bits

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0F9
; Address: $FCAFE9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0F9:
	JSR $20C3			; 20 C3 20 | Jump to subroutine
	SBC ($20,X)		  ; E1 20 | Subtract with carry ((zero page,X))
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $3C00,Y		  ; 19 00 3C | Logical OR with accumulator (absolute,Y)
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0FA
; Address: $FCB007
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0FA:
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BEQ $04			  ; F0 04 | Branch if equal
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	AND $7F35,X		  ; 3D 35 7F | Logical AND with accumulator (absolute,X)
	ROR $7F			  ; 66 7F | Rotate right (zero page)
	JMP ($CCFF)		  ; 6C FF CC | Jump to address (absolute indirect)
	CPY $0023			; CC 23 00 | Compare Y register (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	AND $7F00,X		  ; 3D 00 7F | Logical AND with accumulator (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY $06FE,X		  ; BC FE 06 | Load from absolute,X into Y register
	INC $FF0E,X		  ; FE 0E FF | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	LSR $BE0C			; 4E 0C BE | Logical shift right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	BEQ $9E			  ; F0 9E | Branch if equal
	SEC				  ; 38 | Set carry flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BMI $3C			  ; 30 3C | Branch if negative
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	ADC ($72,X)		  ; 61 72 | Add with carry ((zero page,X))
	AND ($71,X)		  ; 21 71 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0FB
; Address: $FCB085
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0FB:
	JSR $2051			; 20 51 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0FC
; Address: $FCB0AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0FC:
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $C0			  ; 10 C0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_0FF
; Address: $FCB0BC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_0FF:
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_100
; Address: $FCB0C1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_100:
	BVC $18			  ; 50 18 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_101
; Address: $FCB0D6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_101:
	JSR $0038			; 20 38 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ROL $7709,X		  ; 3E 09 77 | Rotate left (absolute,X)
	ORA #$77			 ; 09 77 | Logical OR with accumulator (immediate)
	AND $5168,Y		  ; 39 68 51 | Logical AND with accumulator (absolute,Y)
	AND $1916,Y		  ; 39 16 19 | Logical AND with accumulator (absolute,Y)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_102
; Address: $FCB0F0
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_102:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	AND $3901,Y		  ; 39 01 39 | Logical AND with accumulator (absolute,Y)
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	AND #$38			 ; 29 38 | Logical AND with accumulator (immediate)
	BPL $C7			  ; 10 C7 | Branch if positive
	BPL $C7			  ; 10 C7 | Branch if positive
	SEC				  ; 38 | Set carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	JMP ($2800)		  ; 6C 00 28 | Jump to address (absolute indirect)
	PLP				  ; 28 | Pull processor status from stack
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_103
; Address: $FCB128
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_103:
	ORA ($39),Y		  ; 11 39 | Logical OR with accumulator ((zero page),Y)
	ROL $1E1F			; 2E 1F 1E | Rotate left (absolute)
	ORA $010E			; 0D 0E 01 | Logical OR with accumulator (absolute)
	AND $2900			; 2D 00 29 | Logical AND with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($E2,X)		  ; 21 E2 | Logical AND with accumulator ((zero page,X))
	ADC ($E2,X)		  ; 61 E2 | Add with carry ((zero page,X))
	SEP #$E3			 ; E2 E3 | Set processor status bits
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	BIT $7AD1			; 2C D1 7A | Test bits in accumulator (absolute)
	STA $4F			  ; 85 4F | Store accumulator to zero page
	BRA $9C			  ; 80 9C | Branch always
	STZ $1210,X		  ; 9E 10 12 | Store zero to absolute,X
	BPL $D6			  ; 10 D6 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	AND $09			  ; 25 09 | Logical AND with accumulator (zero page)
	ASL $021D			; 0E 1D 02 | Arithmetic shift left (absolute)
	ORA $0001			; 0D 01 00 | Logical OR with accumulator (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BCS $C0			  ; B0 C0 | Branch if carry set
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	CPX $F1			  ; E4 F1 | Compare X register (zero page)
	CPY $D1DE			; CC DE D1 | Compare Y register (absolute)
	ROL $23ED			; 2E ED 23 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_105
; Address: $FCB1D5
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_105:
	JSR $2424			; 20 24 24 | Jump to subroutine
	BIT $2D2C			; 2C 2C 2D | Test bits in accumulator (absolute)
	ORA $0393			; 0D 93 03 | Logical OR with accumulator (absolute)
	EOR $0101,X		  ; 5D 01 01 | Exclusive OR with accumulator (absolute,X)
	CMP ($19),Y		  ; D1 19 | Compare accumulator ((zero page),Y)
	CMP ($CC,X)		  ; C1 CC | Compare accumulator ((zero page,X))
	CMP ($3F),Y		  ; D1 3F | Compare accumulator ((zero page),Y)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	INC $3600			; EE 00 36 | Increment (absolute)
	BPL $32			  ; 10 32 | Branch if positive
	BPL $D2			  ; 10 D2 | Branch if positive
	PEA #$7A00		   ; F4 00 7A | Push effective address to stack
	STZ $9C7A			; 9C 7A 9C | Store zero to absolute
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STY $DC93			; 8C 93 DC | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_106
; Address: $FCB21E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_106:
	JSL $C4FF00		  ; 22 00 FF C4 | Jump to subroutine long
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_107
; Address: $FCB229
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_107:
	ASL $6C6F,X		  ; 1E 6F 6C | Arithmetic shift left (absolute,X)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BRA $00			  ; 80 00 | Branch always
	BCS $20			  ; B0 20 | Branch if carry set
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_108
; Address: $FCB263
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_108:
	JSR $FCA0			; 20 A0 FC | Jump to subroutine
	INX				  ; E8 | Increment X register
	PEA #$0810		   ; F4 10 08 | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	BIT $04F0			; 2C F0 04 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	BPL $18			  ; 10 18 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_109
; Address: $FCB2A5
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_109:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $BB01,X		  ; FE 01 BB | Increment (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ADC $BAAB,X		  ; 7D AB BA | Add with carry (absolute,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
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
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_10B
; Address: $FCB33D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_10B:
	JSR $2828			; 20 28 28 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_10C
; Address: $FCB34F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_10C:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$B2			 ; E0 B2 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	ADC $00F2,X		  ; 7D F2 00 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_10E
; Address: $FCB37B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_10E:
	JSR $2868			; 20 68 28 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $002C00		  ; 5C 00 2C 00 | Jump to address long
	ROL $1F00			; 2E 00 1F | Rotate left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $EE69			; EE 69 EE | Increment (absolute)
	ADC #$F6			 ; 69 F6 | Add with carry (immediate)
	ORA ($8A),Y		  ; 11 8A | Logical OR with accumulator ((zero page),Y)
	ADC $7F84,Y		  ; 79 84 7F | Add with carry (absolute,Y)
	STX $8A77			; 8E 77 8A | Store X register to absolute address
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0100,Y		  ; 19 00 01 | Logical OR with accumulator (absolute,Y)
	ASL $1001			; 0E 01 10 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_10F
; Address: $FCB3C5
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_10F:
	JSR $2003			; 20 03 20 | Jump to subroutine
	ORA ($46,X)		  ; 01 46 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $3C00,X		  ; 1E 00 3C | Arithmetic shift left (absolute,X)
	ROR $FA00,X		  ; 7E 00 FA | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	BVS $80			  ; 70 80 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BRA $62			  ; 80 62 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_110
; Address: $FCB3EA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_110:
	BRA $61			  ; 80 61 | Branch always
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $5F00,X		  ; 7E 00 5F | Rotate right (absolute,X)
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CLV				  ; B8 | Clear overflow flag
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ROR $E300,X		  ; 7E 00 E3 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_111
; Address: $FCB428
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_111:
	JSR $C8F8			; 20 F8 C8 | Jump to subroutine
	ROL $0F36,X		  ; 3E 36 0F | Rotate left (absolute,X)
	ORA $FE03			; 0D 03 FE | Logical OR with accumulator (absolute)
	ADC $E300,X		  ; 7D 00 E3 | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_112
; Address: $FCB446
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_112:
	JSR $08E6			; 20 E6 08 | Jump to subroutine
	AND $0E02,Y		  ; 39 02 0E | Logical AND with accumulator (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC $3700,X		  ; DE 00 37 | Decrement (absolute,X)
	ORA $0200			; 0D 00 02 | Logical OR with accumulator (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $2FF2,X		  ; 7D F2 2F | Add with carry (absolute,X)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ASL $960E			; 0E 0E 96 | Arithmetic shift left (absolute)
	ASL $58			  ; 06 58 | Arithmetic shift left (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BIT $1F00			; 2C 00 1F | Test bits in accumulator (absolute)
	AND $07EA			; 2D EA 07 | Logical AND with accumulator (absolute)
	STZ $17			  ; 64 17 | Store zero to zero page
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA ($96,X)		  ; 01 96 | Logical OR with accumulator ((zero page,X))
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND $1E00			; 2D 00 1E | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_113
; Address: $FCB4CD
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_113:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BEQ $63			  ; F0 63 | Branch if equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA ($2D,X)		  ; 01 2D | Logical OR with accumulator ((zero page,X))
	ORA ($2C),Y		  ; 11 2C | Logical OR with accumulator ((zero page),Y)
	ORA ($6E),Y		  ; 11 6E | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	BRA $F6			  ; 80 F6 | Branch always
	INC $F608,X		  ; FE 08 F6 | Increment (absolute,X)
	BPL $F2			  ; 10 F2 | Branch if positive
	BMI $F2			  ; 30 F2 | Branch if negative
	BMI $90			  ; 30 90 | Branch if negative
	BPL $80			  ; 10 80 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCC $10			  ; 90 10 | Branch if carry clear
	BRA $98			  ; 80 98 | Branch always
	BRA $B4			  ; 80 B4 | Branch always
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_114
; Address: $FCB549
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_114:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INC $6F01,X		  ; FE 01 6F | Increment (absolute,X)
	BPL $6F			  ; 10 6F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $42			  ; 30 42 | Hardware register operation
	SEC				  ; 38 | Set carry flag
	EOR ($7C,X)		  ; 41 7C | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROR $7E40,X		  ; 7E 40 7E | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_115
; Address: $FCB56D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_115:
	SBC ($4F,X)		  ; E1 4F | Subtract with carry ((zero page,X))
	CMP ($CE,X)		  ; C1 CE | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_116
; Address: $FCB59C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_116:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BVS $40			  ; 70 40 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BMI $14			  ; 30 14 | Branch if negative
	BPL $04			  ; 10 04 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_117
; Address: $FCB5D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_117:
	JSR $1000			; 20 00 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_118
; Address: $FCB5EE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_118:
	CLC				  ; 18 | Clear carry flag
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_119
; Address: $FCB607
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_119:
	JSR $E000			; 20 00 E0 | Game work RAM access
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BVC $80			  ; 50 80 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_11A
; Address: $FCB618
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_11A:
	JSR $E000			; 20 00 E0 | Game work RAM access
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$00			 ; E2 00 | Set processor status bits
	ROL $64			  ; 26 64 | Rotate left (zero page)
	LSR $9DE4,X		  ; 5E E4 9D | Logical shift right (absolute,X)
	BCC $0D			  ; 90 0D | Branch if carry clear
	BPL $0D			  ; 10 0D | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	REP #$00			 ; C2 00 | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$42			 ; 42 42 | Hardware register operation
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ROR $6F			  ; 66 6F | Rotate right (zero page)
	JMP ($F8FF)		  ; 6C FF F8 | Jump to address (absolute indirect)
	CLD				  ; D8 | Clear decimal mode flag
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $E6			  ; E6 E6 | Increment (zero page)
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	INC $0036,X		  ; FE 36 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	LSR $5D22,X		  ; 5E 22 5D | Logical shift right (absolute,X)
	AND $11F1			; 2D F1 11 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_11B
; Address: $FCB6B2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_11B:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA $2D0D			; 0D 0D 2D | Logical OR with accumulator (absolute)
	BIT $3032			; 2C 32 30 | Test bits in accumulator (absolute)
	ROL $6020			; 2E 20 60 | Rotate left (absolute)
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_11C
; Address: $FCB6D8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_11C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEP #$33			 ; E2 33 | Set processor status bits
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	SBC $F13F,Y		  ; F9 3F F1 | Subtract with carry (absolute,Y)
	ORA ($F9),Y		  ; 11 F9 | Logical OR with accumulator ((zero page),Y)
	ORA $29F9,Y		  ; 19 F9 29 | Logical OR with accumulator (absolute,Y)
	ORA $0E00			; 0D 00 0E | Logical OR with accumulator (absolute)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BNE $E0			  ; D0 E0 | Game work RAM access
	BCC $E0			  ; 90 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_11D
; Address: $FCB748
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_11D:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BVS $C0			  ; 70 C0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	JMP $014C			; 4C 4C 01 | Jump to address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_11E
; Address: $FCB768
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_11E:
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	JMP $0100			; 4C 00 01 | Jump to address
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_11F
; Address: $FCB7AF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_11F:
	JSL $030001		  ; 22 01 00 03 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ADC ($4E),Y		  ; 71 4E | Add with carry ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $50			  ; 70 50 | Branch if overflow set
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_120
; Address: $FCB7D2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_120:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_122
; Address: $FCB7EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_122:
	JSR $1814			; 20 14 18 | Jump to subroutine
	BPL $0E			  ; 10 0E | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_124
; Address: $FCB821
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_124:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $3610,X		  ; 1D 10 36 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND #$13			 ; 29 13 | Logical AND with accumulator (immediate)
	AND $1831,Y		  ; 39 31 18 | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_125
; Address: $FCB869
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_125:
	ASL $0407,X		  ; 1E 07 04 | Arithmetic shift left (absolute,X)
	ORA $FF1D,X		  ; 1D 1D FF | Logical OR with accumulator (absolute,X)
	ORA $FC00,X		  ; 1D 00 FC | Logical OR with accumulator (absolute,X)
	SBC $FB0D,X		  ; FD 0D FB | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_127
; Address: $FCB8A9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_127:
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0D00			; 0E 00 0D | Arithmetic shift left (absolute)
	CMP $3E00,X		  ; DD 00 3E | Compare accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	INC $FE06,X		  ; FE 06 FE | Increment (absolute,X)
	SBC $3903,X		  ; FD 03 39 | Subtract with carry (absolute,X)
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $0F			  ; 30 0F | Branch if negative
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	CPX $6A98			; EC 98 6A | Compare X register (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	LDX $9C			  ; A6 9C | Load from zero page into X register
	STY $8C96			; 8C 96 8C | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_128
; Address: $FCB932
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_128:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_129
; Address: $FCB940
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_129:
	STA				  ; 9F 9C 9F 98 | Store accumulator to absolute long,X
	LSR $1213			; 4E 13 12 | Logical shift right (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SBC $F91D,X		  ; FD 1D F9 | Subtract with carry (absolute,X)
	AND $FBFB,Y		  ; 39 FB FB | Logical AND with accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_12B
; Address: $FCB970
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_12B:
	SED				  ; F8 | Set decimal mode flag
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_12C
; Address: $FCB980
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_12C:
	INC				  ; 1A | Increment accumulator
	EOR ($10),Y		  ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
	WDM #$31			 ; 42 31 | Reserved instruction
	LDA $21			  ; A5 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_12D
; Address: $FCB987
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_12D:
	STY $61			  ; 84 61 | Store Y register to zero page
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	STX $86			  ; 86 86 | Store X register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_12E
; Address: $FCB994
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_12E:
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA $0F16,X		  ; 1D 16 0F | Logical OR with accumulator (absolute,X)
	ASL $1406			; 0E 06 14 | Arithmetic shift left (absolute)
	ASL $0728			; 0E 28 07 | Arithmetic shift left (absolute)
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $3100,Y		  ; 19 00 31 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BCS $20			  ; B0 20 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BCC $18			  ; 90 18 | Branch if carry clear
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	BMI $E7			  ; 30 E7 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BNE $00			  ; D0 00 | Branch if not equal
	INY				  ; C8 | Increment Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $1301			; 0E 01 13 | Arithmetic shift left (absolute)
	ORA ($37),Y		  ; 11 37 | Logical OR with accumulator ((zero page),Y)
	CMP #$2F			 ; C9 2F | Compare accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $3600			; 2E 00 36 | Rotate left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	LDY $9868			; AC 68 98 | Load from absolute address into Y register
	BRA $60			  ; 80 60 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_130
; Address: $FCBA4E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_130:
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEP #$E2			 ; E2 E2 | Set processor status bits
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEP #$00			 ; E2 00 | Set processor status bits
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ORA $190E,Y		  ; 19 0E 19 | Logical OR with accumulator (absolute,Y)
	ASL $0E1D			; 0E 1D 0E | Arithmetic shift left (absolute)
	ORA $1A0E,Y		  ; 19 0E 1A | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STX $C68C			; 8E 8C C6 | Store X register to absolute address
	CPY $FE			  ; C4 FE | Compare Y register (zero page)
	ROR $1C1C,X		  ; 7E 1C 1C | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BEQ $90			  ; F0 90 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	JMP $4C64			; 4C 64 4C | Jump to address
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_131
; Address: $FCBB35
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_131:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ROL $2632			; 2E 32 26 | Rotate left (absolute)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	ROL $0C86,X		  ; 3E 86 0C | Rotate left (absolute,X)
	STX $0C			  ; 86 0C | Store X register to zero page
	STX $0C			  ; 86 0C | Store X register to zero page
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$57			 ; 09 57 | Logical OR with accumulator (immediate)
	AND ($52),Y		  ; 31 52 | Logical AND with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($24),Y		  ; 31 24 | Logical AND with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $3E			  ; 50 3E | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $0D00,Y		  ; 19 00 0D | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ROR $1A			  ; 66 1A | Rotate right (zero page)
	ROL $101F			; 2E 1F 10 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_133
; Address: $FCBBB4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_133:
	PHP				  ; 08 | Push processor status to stack
	STA $C000,Y		  ; 99 00 C0 | Store accumulator to absolute,Y
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA #$C8			 ; 09 C8 | Logical OR with accumulator (immediate)
	LDY $7334			; AC 34 73 | Load from absolute address into Y register
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F F4 13 CC | Store accumulator to absolute long,X
	CMP $0076			; CD 76 00 | Compare accumulator (absolute)
	STY $00			  ; 84 00 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_134
; Address: $FCBBDE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_134:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_135
; Address: $FCBBE5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_135:
	JSR $A080			; 20 80 A0 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_136
; Address: $FCBBF8
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_136:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC $FD39,Y		  ; F9 39 FD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_137
; Address: $FCBCA3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_137:
	ORA $BBFB,X		  ; 1D FB BB | Logical OR with accumulator (absolute,X)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BPL $10			  ; 10 10 | Branch if positive
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	NOP				  ; EA | No operation
	CLD				  ; D8 | Clear decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_139
; Address: $FCBCCA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_139:
	JSL $102210		  ; 22 10 22 10 | Jump to subroutine long
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	ROR $60			  ; 66 60 | Rotate right (zero page)
	SEP #$4E			 ; E2 4E | Set processor status bits
	INC $63C1,X		  ; FE C1 63 | Increment (absolute,X)
	STA $9C41			; 8D 41 9C | Store accumulator to absolute address
	RTI				  ; 40 | Return from interrupt
	ROR $4024,X		  ; 7E 24 40 | Rotate right (absolute,X)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_13A
; Address: $FCBCF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_13A:
	JSR $009E			; 20 9E 00 | Jump to subroutine
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	BMI $24			  ; 30 24 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_13B
; Address: $FCBD02
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_13B:
	JSR $0666			; 20 66 06 | Jump to subroutine
	DEC $B1			  ; C6 B1 | Decrement (zero page)
	AND $7E02,Y		  ; 39 02 7E | Logical AND with accumulator (absolute,Y)
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)
	ROL $045A,X		  ; 3E 5A 04 | Rotate left (absolute,X)
	ADC $8100,Y		  ; 79 00 81 | Add with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	JMP $C600			; 4C 00 C6 | Jump to address
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	ASL $1818			; 0E 18 18 | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_13D
; Address: $FCBD43
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_13D:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA $010E			; 0D 0E 01 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1300			; 0E 00 13 | Arithmetic shift left (absolute)
	BVC $78			  ; 50 78 | Branch if overflow clear
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	AND $364F			; 2D 4F 36 | Logical AND with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND $1600			; 2D 00 16 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_13E
; Address: $FCBD9E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_13E:
	JSR $CE00			; 20 00 CE | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_13F
; Address: $FCBDA5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_13F:
	JSR $18E4			; 20 E4 18 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $90			  ; F0 90 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_141
; Address: $FCBDAF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_141:
	BRA $20			  ; 80 20 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_142
; Address: $FCBDBC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_142:
	RTI				  ; 40 | Return from interrupt
	AND $1A1F,X		  ; 3D 1F 1A | Logical AND with accumulator (absolute,X)
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_143
; Address: $FCBE2A
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_143:
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $40			  ; B0 40 | Branch if carry set
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	CPX $3AD0			; EC D0 3A | Compare X register (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $0B1A,X		  ; 1D 1A 0B | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVC $50			  ; 50 50 | Branch if overflow clear
	BPL $10			  ; 10 10 | Branch if positive
	PEA #$EC34		   ; F4 34 EC | Push effective address to stack
	INC $06			  ; E6 06 | Increment (zero page)
	ORA $0702			; 0D 02 07 | Logical OR with accumulator (absolute)
	ORA #$37			 ; 09 37 | Logical OR with accumulator (immediate)
	JMP $285820		  ; 5C 20 58 28 | Jump to address long
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $30			  ; D0 30 | Branch if not equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $3037			; 2C 37 30 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_144
; Address: $FCBE7F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_144:
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	BIT $9C90			; 2C 90 9C | Test bits in accumulator (absolute)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_145
; Address: $FCBE8B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_145:
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BVC $40			  ; 50 40 | Branch if overflow clear
	STZ $00			  ; 64 00 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_146
; Address: $FCBE9C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_146:
	JSR $4000			; 20 00 40 | Jump to subroutine
	STA $2974,X		  ; 9D 74 29 | Store accumulator to absolute,X
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SBC ($C9,X)		  ; E1 C9 | Subtract with carry ((zero page,X))
	STA ($4D),Y		  ; 91 4D | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank78_DmaFunction_147
; Address: $FCBEA9
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_147:
	CMP ($EE),Y		  ; D1 EE | Compare accumulator ((zero page),Y)
	BVC $6F			  ; 50 6F | Branch if overflow clear
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $940E,Y		  ; 99 0E 94 | Store accumulator to absolute,Y
	BIT #$B2			 ; 89 B2 | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_148
; Address: $FCBED4
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_148:
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($4C00)		  ; 6C 00 4C | Jump to address (absolute indirect)
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	JMP $FBB0			; 4C B0 FB | Jump to address
	ORA $031E,X		  ; 1D 1E 03 | Logical OR with accumulator (absolute,X)
	BCS $00			  ; B0 00 | Branch if carry set
	LDY $4700,X		  ; BC 00 47 | Load from absolute,X into Y register
	BRA $30			  ; 80 30 | Branch always
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	STA $00E363		  ; 8F 63 E3 00 | Store accumulator to absolute long address
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	STZ $2700			; 9C 00 27 | Store zero to absolute
	BPL $07			  ; 10 07 | Branch if positive
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA #$78			 ; 09 78 | Logical OR with accumulator (immediate)
	STA				  ; 9F CE C9 18 | Store accumulator to absolute long,X
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CMP $7B			  ; C5 7B | Compare accumulator (zero page)
	STX $79			  ; 86 79 | Store X register to zero page
	DEC $3930			; CE 30 39 | Decrement (absolute)
	ORA $C0			  ; 05 C0 | Logical OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	REP #$00			 ; C2 00 | Reset processor status bits
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_149
; Address: $FCBF64
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_149:
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BCS $38			  ; B0 38 | Branch if carry set
	BEQ $E5			  ; F0 E5 | Branch if equal
	BNE $AA			  ; D0 AA | Branch if not equal
	STZ $007E			; 9C 7E 00 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_14A
; Address: $FCBF74
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_14A:
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $4100			; 2D 00 41 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $5F			  ; 30 5F | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $1C1F,X		  ; 3E 1F 1C | Rotate left (absolute,X)
	PEA #$F034		   ; F4 34 F0 | Push effective address to stack
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PEA #$F000		   ; F4 00 F0 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND $0C79,Y		  ; 39 79 0C | Logical AND with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	SBC $6EED			; ED ED 6E | Subtract with carry (absolute)
	STZ $309E			; 9C 9E 30 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank78_DmaFunction_14B
; Address: $FCC04A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_14B:
	JSR $C030			; 20 30 C0 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $D000			; CC 00 D0 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_14D
; Address: $FCC061
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_14D:
	BPL $27			  ; 10 27 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA $170A,X		  ; 1D 0A 17 | Logical OR with accumulator (absolute,X)
	ORA $040C			; 0D 0C 04 | Logical OR with accumulator (absolute)
	ASL $0506			; 0E 06 05 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX $18			  ; E4 18 | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	BCS $30			  ; B0 30 | Branch if carry set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_14E
; Address: $FCC089
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_14E:
	JSR $6070			; 20 70 60 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	CPX #$9C			 ; E0 9C | Compare X register (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear
	CPY $1F23			; CC 23 1F | Compare Y register (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_150
; Address: $FCC0D8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_150:
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	DEC $9332			; CE 32 93 | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_154
; Address: $FCC0EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_154:
	JSR $0588			; 20 88 05 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_155
; Address: $FCC0FC
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_155:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_156
; Address: $FCC102
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_156:
	STA ($07),Y		  ; 91 07 | Store accumulator to (zero page),Y
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $7F			  ; 80 7F | Branch always
	SEP #$06			 ; E2 06 | Set processor status bits
	ORA $483E			; 0D 3E 48 | Logical OR with accumulator (absolute)
	ASL $62A3,X		  ; 1E A3 62 | Arithmetic shift left (absolute,X)
	EOR $E5FE,Y		  ; 59 FE E5 | Exclusive OR with accumulator (absolute,Y)
	ORA $0019,X		  ; 1D 19 00 | Logical OR with accumulator (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_157
; Address: $FCC138
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_157:
	JSL $001C00		  ; 22 00 1C 00 | Jump to subroutine long
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_158
; Address: $FCC15A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_158:
	JSR $2800			; 20 00 28 | Jump to subroutine
	JMP $8C00			; 4C 00 8C | Jump to address
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $1918			; 0D 18 19 | Logical OR with accumulator (absolute)
	BMI $19			  ; 30 19 | Branch if negative
	BMI $1B			  ; 30 1B | Branch if negative
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	ADC ($50,X)		  ; 61 50 | Add with carry ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_15A
; Address: $FCC17C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_15A:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_15C
; Address: $FCC188
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_15C:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $A0			  ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_15D
; Address: $FCC192
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_15D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	JMP ($1C44)		  ; 6C 44 1C | Jump to address (absolute indirect)
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	WDM #$3C			 ; 42 3C | Reserved instruction
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_15E
; Address: $FCC1CB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_15E:
	JSL $282438		  ; 22 38 24 28 | Jump to subroutine long
	DEC $00			  ; C6 00 | Decrement (zero page)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	ROL $3C42,X		  ; 3E 42 3C | Rotate left (absolute,X)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BCS $E0			  ; B0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ORA ($40),Y		  ; 11 40 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_161
; Address: $FCC244
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_161:
	EOR $19C4,X		  ; 5D C4 19 | Exclusive OR with accumulator (absolute,X)
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	ADC ($69,X)		  ; 61 69 | Add with carry ((zero page,X))
	AND $69AD,Y		  ; 39 AD 69 | Logical AND with accumulator (absolute,Y)
	ROL $5DF0,X		  ; 3E F0 5D | Rotate left (absolute,X)
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_162
; Address: $FCC256
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_162:
	LDX $00			  ; A6 00 | Load from zero page into X register
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	ASL $9A			  ; 06 9A | Arithmetic shift left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $968E,X		  ; 1D 8E 96 | Logical OR with accumulator (absolute,X)
	STZ $96B5			; 9C B5 96 | Store zero to absolute
	TSX				  ; BA | Transfer stack pointer to X register
	DEX				  ; CA | Decrement X register
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_163
; Address: $FCC27C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_163:
	PHA				  ; 48 | Push accumulator to stack
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($19,X)		  ; 21 19 | Logical AND with accumulator ((zero page,X))
	BMI $19			  ; 30 19 | Branch if negative
	BVC $30			  ; 50 30 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_164
; Address: $FCC28E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_164:
	BVS $E0			  ; 70 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_165
; Address: $FCC298
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_165:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BEQ $34			  ; F0 34 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ORA $864A			; 0D 4A 86 | Logical OR with accumulator (absolute)
	CMP $83			  ; C5 83 | Compare accumulator (zero page)
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BCS $60			  ; B0 60 | Branch if carry set
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_168
; Address: $FCC2E5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_168:
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $4D			  ; 06 4D | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC $0000,Y		  ; 79 00 00 | Add with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_169
; Address: $FCC325
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_169:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_16B
; Address: $FCC32D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_16B:
	JSR $A080			; 20 80 A0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_16C
; Address: $FCC340
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_16C:
	AND ($18),Y		  ; 31 18 | Logical AND with accumulator ((zero page),Y)
	ADC ($38,X)		  ; 61 38 | Add with carry ((zero page,X))
	ADC ($38,X)		  ; 61 38 | Add with carry ((zero page,X))
	ADC ($30,X)		  ; 61 30 | Add with carry ((zero page,X))
	ADC ($30,X)		  ; 61 30 | Add with carry ((zero page,X))
	SBC ($70,X)		  ; E1 70 | Subtract with carry ((zero page,X))
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_16D
; Address: $FCC35C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_16D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_16E
; Address: $FCC37C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_16E:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BPL $74			  ; 10 74 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $7D40,X		  ; BD 40 7D | Load from absolute,X into accumulator
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	JMP $D600			; 4C 00 D6 | Jump to address
	INC $EB00			; EE 00 EB | Increment (absolute)
	BNE $CF			  ; D0 CF | Branch if not equal
	BNE $6F			  ; D0 6F | Branch if not equal
	BNE $FF			  ; D0 FF | Branch if not equal
	BVC $7F			  ; 50 7F | Branch if overflow clear
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_16F
; Address: $FCC3B2
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_16F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BEQ $0B			  ; F0 0B | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FC08,X		  ; FE 08 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $33			  ; 05 33 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $74C7,Y		  ; 39 C7 74 | Logical AND with accumulator (absolute,Y)
	AND ($D7,X)		  ; 21 D7 | Logical AND with accumulator ((zero page,X))
	STA $000169		  ; 8F 69 01 00 | Store accumulator to absolute long address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1800			; 0D 00 18 | Logical OR with accumulator (absolute)
	STZ $3000			; 9C 00 30 | Store zero to absolute
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $50			  ; F0 50 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_170
; Address: $FCC416
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_170:
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_171
; Address: $FCC421
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_171:
	BMI $58			  ; 30 58 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $18			  ; 30 18 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $0010			; 0E 10 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_172
; Address: $FCC444
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_172:
	JSR $3008			; 20 08 30 | Jump to subroutine
	BPL $04			  ; 10 04 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_173
; Address: $FCC46F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_173:
	JSR $0080			; 20 80 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_174
; Address: $FCC476
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_174:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_175
; Address: $FCC47E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_175:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND $7DB8			; 2D B8 7D | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_176
; Address: $FCC4A3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_176:
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $B8B0,Y		  ; D9 B0 B8 | Compare accumulator (absolute,Y)
	BVS $B0			  ; 70 B0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_179
; Address: $FCC4B4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_179:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $A0			  ; 80 A0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_17A
; Address: $FCC4C7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_17A:
	JSR $50C0			; 20 C0 50 | Jump to subroutine
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $50			  ; 80 50 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_17E
; Address: $FCC4D8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_17E:
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BMI $40			  ; 30 40 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $4D			  ; 10 4D | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_17F
; Address: $FCC542
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_17F:
	ASL $DC4A,X		  ; 1E 4A DC | Arithmetic shift left (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	PHX				  ; DA | Push X register to stack
	STY $8D1B			; 8C 1B 8D | Store Y register to absolute address
	ORA $068D			; 0D 8D 06 | Logical OR with accumulator (absolute)
	STA $C706			; 8D 06 C7 | Store accumulator to absolute address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STZ $6604			; 9C 04 66 | Store zero to absolute
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	BCC $AD			  ; 90 AD | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CMP $6700,Y		  ; D9 00 67 | Compare accumulator (absolute,Y)
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($45),Y		  ; D1 45 | Compare accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_181
; Address: $FCC58B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_181:
	BRA $19			  ; 80 19 | Branch always
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	BVC $72			  ; 50 72 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	DEC $00			  ; C6 00 | Decrement (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_182
; Address: $FCC5B4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_182:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_183
; Address: $FCC5BC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_183:
	JSR $6000			; 20 00 60 | Jump to subroutine
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_184
; Address: $FCC5CA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_184:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_185
; Address: $FCC621
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_185:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_187
; Address: $FCC62F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_187:
	JSL $080006		  ; 22 06 00 08 | Jump to subroutine long
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_188
; Address: $FCC640
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_188:
	JSR $2187			; 20 87 21 | PPU graphics register access
	ORA #$A6			 ; 09 A6 | Logical OR with accumulator (immediate)
	DEC $0F40			; CE 40 0F | Decrement (absolute)
	EOR ($0F,X)		  ; 41 0F | Exclusive OR with accumulator ((zero page,X))
	REP #$8E			 ; C2 8E | Reset processor status bits
	DEY				  ; 88 | Decrement Y register
	ORA $3C99,X		  ; 1D 99 3C | Logical OR with accumulator (absolute,X)
	DEC $0900			; CE 00 09 | Decrement (absolute)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $1700			; 0D 00 17 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_189
; Address: $FCC65E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_189:
	JSL $306000		  ; 22 00 60 30 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BCS $90			  ; B0 90 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LDY $6E18,X		  ; BC 18 6E | Load from absolute,X into Y register
	BVS $8E			  ; 70 8E | Branch if overflow set
	CPX $34CA			; EC CA 34 | Compare X register (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_18A
; Address: $FCC672
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_18A:
	BCS $00			  ; B0 00 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	DEY				  ; 88 | Decrement Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	BIT $0008			; 2C 08 00 | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BCC $EC			  ; 90 EC | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$3A			 ; C0 3A | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SBC $6541,X		  ; FD 41 65 | Subtract with carry (absolute,X)
	ASL $1200			; 0E 00 12 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $D800,X		  ; 9E 00 D8 | Store zero to absolute,X
	ASL $83			  ; 06 83 | Arithmetic shift left (zero page)
	STX $03			  ; 86 03 | Store X register to zero page
	STX $03			  ; 86 03 | Store X register to zero page
	STX $03			  ; 86 03 | Store X register to zero page
	STX $03			  ; 86 03 | Store X register to zero page
	STX $03			  ; 86 03 | Store X register to zero page
	ASL $83			  ; 06 83 | Arithmetic shift left (zero page)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BCC $4E			  ; 90 4E | Branch if carry clear
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_18C
; Address: $FCC752
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_18C:
	ROR				  ; 6A | Rotate right (accumulator)
	PEA #$7400		   ; F4 00 74 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_18D
; Address: $FCC76D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_18D:
	JSR $2080			; 20 80 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_190
; Address: $FCC780
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_190:
	ROL $69			  ; 26 69 | Rotate left (zero page)
	LDX $F0			  ; A6 F0 | Load from zero page into X register
	CPX $BC			  ; E4 BC | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	STA $63834F		  ; 8F 4F 83 63 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	CPX #$99			 ; E0 99 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_192
; Address: $FCC7A3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_192:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BNE $20			  ; D0 20 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	BPL $34			  ; 10 34 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCS $00			  ; B0 00 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $1C00			; 2C 00 1C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_193
; Address: $FCC7F8
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_193:
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ORA ($5B),Y		  ; 11 5B | Logical OR with accumulator ((zero page),Y)
	ORA ($43),Y		  ; 11 43 | Logical OR with accumulator ((zero page),Y)
	LSR $13			  ; 46 13 | Logical shift right (zero page)
	LSR $33			  ; 46 33 | Logical shift right (zero page)
	ROR $33			  ; 66 33 | Rotate right (zero page)
	ROR $23			  ; 66 23 | Rotate right (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $6A			  ; 06 6A | Arithmetic shift left (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $00			  ; 64 00 | Store zero to zero page
	STA ($3A),Y		  ; 91 3A | Store accumulator to (zero page),Y
	BVC $0F			  ; 50 0F | Branch if overflow clear
	BIT $AF			  ; 24 AF | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	STA $541738		  ; 8F 38 17 54 | Store accumulator to absolute long address
	REP #$73			 ; C2 73 | Reset processor status bits
	ROL $7400			; 2E 00 74 | Rotate left (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	AND $E700,X		  ; 3D 00 E7 | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC #$1E			 ; E9 1E | Subtract with carry (immediate)
	REP #$3C			 ; C2 3C | Reset processor status bits
	CPY $E230			; CC 30 E2 | Compare Y register (absolute)
	BIT $78E7			; 2C E7 78 | Test bits in accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA $3400			; 0D 00 34 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $B8			  ; 30 B8 | Branch if negative
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	EOR ($54),Y		  ; 51 54 | Exclusive OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	ROR $00C8			; 6E C8 00 | Rotate right (absolute)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $F0			  ; 10 F0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_194
; Address: $FCC884
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_194:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_196
; Address: $FCC890
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_196:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $2A			  ; 80 2A | Branch always
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	ROR $00			  ; 66 00 | Rotate right (zero page)
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	WDM #$16			 ; 42 16 | Reserved instruction
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	JMP ($EC00)		  ; 6C 00 EC | Jump to address (absolute indirect)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $8C00			; 4C 00 8C | Jump to address
	DEC $00			  ; C6 00 | Decrement (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $50			  ; 70 50 | Branch if overflow set
	INX				  ; E8 | Increment X register
	BPL $F0			  ; 10 F0 | Branch if positive
	JMP $F8273F		  ; 5C 3F 27 F8 | Jump to address long
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_197
; Address: $FCC8D0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_197:
	JSR $4800			; 20 00 48 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDA $00AF00		  ; AF 00 AF 00 | Load from absolute long address into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_198
; Address: $FCC8EA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_198:
	JSR $8DE2			; 20 E2 8D | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	INY				  ; C8 | Increment Y register
	STA $6000,X		  ; 9D 00 60 | Store accumulator to absolute,X
	STY $01			  ; 84 01 | Store Y register to zero page
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	CMP $BB42,X		  ; DD 42 BB | Compare accumulator (absolute,X)
	BPL $7A			  ; 10 7A | Branch if positive
	ROR $3E04,X		  ; 7E 04 3E | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $CE00			; AD 00 CE | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_199
; Address: $FCC929
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_199:
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	LDX $07			  ; A6 07 | Load from zero page into X register
	LDX $0074			; AE 74 00 | Load from absolute address into X register
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $20			  ; 50 20 | Branch if overflow clear
	BVS $30			  ; 70 30 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_19B
; Address: $FCC956
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_19B:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $130A			; 0E 0A 13 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $73			  ; B0 73 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	ROL $1F2A,X		  ; 3E 2A 1F | Rotate left (absolute,X)
	BPL $0E			  ; 10 0E | Branch if positive
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($C2,X)		  ; 41 C2 | Exclusive OR with accumulator ((zero page,X))
	ASL $34F1			; 0E F1 34 | Arithmetic shift left (absolute)
	WDM #$C3			 ; 42 C3 | Reserved instruction
	BVS $83			  ; 70 83 | Branch if overflow set
	STA				  ; 9F 1C FF E3 | Store accumulator to absolute long,X
	LDY $7000,X		  ; BC 00 70 | Load from absolute,X into Y register
	LDA $F000,X		  ; BD 00 F0 | Load from absolute,X into accumulator
	JMP ($C000)		  ; 6C 00 C0 | Jump to address (absolute indirect)
	INX				  ; E8 | Increment X register
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_19C
; Address: $FCCA04
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_19C:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_19E
; Address: $FCCA0D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_19E:
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	REP #$10			 ; C2 10 | Reset processor status bits
	STY $10			  ; 84 10 | Store Y register to zero page
	STY $10			  ; 84 10 | Store Y register to zero page
	STY $18			  ; 84 18 | Store Y register to zero page
	BMI $18			  ; 30 18 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_19F
; Address: $FCCA4C
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_19F:
	JSR $3008			; 20 08 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STY $0400			; 8C 00 04 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $3300			; 0E 00 33 | Arithmetic shift left (absolute)
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	ASL $2D00			; 0E 00 2D | Arithmetic shift left (absolute)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BVS $B0			  ; 70 B0 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	ROR $3959,X		  ; 7E 59 39 | Rotate right (absolute,X)
	ROL $111F			; 2E 1F 11 | Rotate left (absolute)
	ASL $030C			; 0E 0C 03 | Arithmetic shift left (absolute)
	STA $000800		  ; 8F 00 08 00 | Store accumulator to absolute long address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	EOR $0600,X		  ; 5D 00 06 | Exclusive OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $67			  ; 65 67 | Add with carry (zero page)
	REP #$3A			 ; C2 3A | Reset processor status bits
	ORA #$CF			 ; 09 CF | Logical OR with accumulator (immediate)
	AND $F03F,X		  ; 3D 3F F0 | Logical AND with accumulator (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEP #$1D			 ; E2 1D | Set processor status bits
	LDY $0098,X		  ; BC 98 00 | Load from absolute,X into Y register
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A2
; Address: $FCCAC6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A2:
	JSR $20C1			; 20 C1 20 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A3
; Address: $FCCAD4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A3:
	JSL $008100		  ; 22 00 81 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A4
; Address: $FCCAE7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A4:
	JSR $2008			; 20 08 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BVC $18			  ; 50 18 | Branch if overflow clear
	BVC $30			  ; 50 30 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A5
; Address: $FCCAF0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A5:
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A7
; Address: $FCCAFE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A7:
	RTI				  ; 40 | Return from interrupt
	ASL $61A0			; 0E A0 61 | Arithmetic shift left (absolute)
	CPY $E107			; CC 07 E1 | Compare Y register (absolute)
	LDA ($70,X)		  ; A1 70 | Load from (zero page,X) into accumulator
	BVC $38			  ; 50 38 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	ASL $00FE			; 0E FE 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A8
; Address: $FCCB16
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A8:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1A9
; Address: $FCCB27
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1A9:
	BPL $40			  ; 10 40 | Branch if positive
	INY				  ; C8 | Increment Y register
	BVC $34			  ; 50 34 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BIT $1600			; 2C 00 16 | Test bits in accumulator (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$E6			 ; C0 E6 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1AA
; Address: $FCCB4F
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1AA:
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	ROL $0100,X		  ; 3E 00 01 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0807			; 0E 07 08 | Arithmetic shift left (absolute)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	LDA ($79,X)		  ; A1 79 | Load from (zero page,X) into accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROL $4E00,X		  ; 3E 00 4E | Rotate left (absolute,X)
	BEQ $C2			  ; F0 C2 | Branch if equal
	LDA $CAC0,X		  ; BD C0 CA | Load from absolute,X into accumulator
	STX $DC7F			; 8E 7F DC | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1AB
; Address: $FCCBAD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1AB:
	JSL $30007C		  ; 22 7C 00 30 | Jump to subroutine long
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1AD
; Address: $FCCBC8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1AD:
	JSR $1000			; 20 00 10 | Jump to subroutine
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	BNE $F4			  ; D0 F4 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $00			  ; E6 00 | Increment (zero page)
	CMP $2B00,X		  ; DD 00 2B | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $18			  ; 80 18 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1AE
; Address: $FCCC01
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1AE:
	BMI $60			  ; 30 60 | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1AF
; Address: $FCCC06
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1AF:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B0
; Address: $FCCC14
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B0:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	EOR $B021,Y		  ; 59 21 B0 | Exclusive OR with accumulator (absolute,Y)
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B1
; Address: $FCCC42
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B1:
	BRA $90			  ; 80 90 | Branch always
	BRA $70			  ; 80 70 | Branch always
	BVS $38			  ; 70 38 | Branch if overflow set
	BPL $78			  ; 10 78 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B2
; Address: $FCCC4A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B2:
	JSR $281C			; 20 1C 28 | Jump to subroutine
	BVS $8E			  ; 70 8E | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	ORA #$3A			 ; 09 3A | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	PHX				  ; DA | Push X register to stack
	CPY $C430			; CC 30 C4 | Compare Y register (absolute)
	CLV				  ; B8 | Clear overflow flag
	CPY #$89			 ; C0 89 | Compare Y register (immediate)
	SEP #$3B			 ; E2 3B | Set processor status bits
	CMP ($23,X)		  ; C1 23 | Compare accumulator ((zero page,X))
	STA ($07,X)		  ; 81 07 | Store accumulator to (zero page,X)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $33			  ; 05 33 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $74C7,Y		  ; 39 C7 74 | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B3
; Address: $FCCCDC
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B3:
	ORA $1800			; 0D 00 18 | Logical OR with accumulator (absolute)
	BMI $60			  ; 30 60 | Branch if negative
	BVS $E0			  ; 70 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $50			  ; F0 50 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B4
; Address: $FCCD2F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B4:
	JSR $0005			; 20 05 00 | Jump to subroutine
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B5
; Address: $FCCD3C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B5:
	JSR $6000			; 20 00 60 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $C05FFF		  ; 8F FF 5F C0 | Store accumulator to absolute long address
	PLP				  ; 28 | Pull processor status from stack
	BMI $6E			  ; 30 6E | Branch if negative
	INX				  ; E8 | Increment X register
	ORA $137E			; 0D 7E 13 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDA $4000			; AD 00 40 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B6
; Address: $FCCD74
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B6:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B7
; Address: $FCCD81
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B7:
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $CB			  ; C5 CB | Compare accumulator (zero page)
	ADC $E6FE,Y		  ; 79 FE E6 | Add with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B8
; Address: $FCCD8F
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B8:
	INY				  ; C8 | Increment Y register
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	LDA $C081,Y		  ; B9 81 C0 | Load from absolute,Y into accumulator
	EOR ($1E),Y		  ; 51 1E | Exclusive OR with accumulator ((zero page),Y)
	ROL $1C0C			; 2E 0C 1C | Rotate left (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP ($7F80)		  ; 6C 80 7F | Jump to address (absolute indirect)
	JMP ($0E1C)		  ; 6C 1C 0E | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	ASL $62A3,X		  ; 1E A3 62 | Arithmetic shift left (absolute,X)
	EOR $E5FE,Y		  ; 59 FE E5 | Exclusive OR with accumulator (absolute,Y)
	ORA $0053,X		  ; 1D 53 00 | Logical OR with accumulator (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1B9
; Address: $FCCDD8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1B9:
	JSL $001C00		  ; 22 00 1C 00 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1BA
; Address: $FCCDFA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1BA:
	JSR $2800			; 20 00 28 | Jump to subroutine
	JMP $0000			; 4C 00 00 | Jump to address
	BRA $98			  ; 80 98 | Branch always
	LDY #$EF			 ; A0 EF | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	LSR $BE			  ; 46 BE | Logical shift right (zero page)
	ORA $FC07,Y		  ; 19 07 FC | Logical OR with accumulator (absolute,Y)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1BB
; Address: $FCCE3A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1BB:
	BPL $00			  ; 10 00 | Branch if positive
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	LDY $76			  ; A4 76 | Load from zero page into Y register
	CMP $C9			  ; C5 C9 | Compare accumulator (zero page)
	AND ($B1),Y		  ; 31 B1 | Logical AND with accumulator ((zero page),Y)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1BC
; Address: $FCCE4F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1BC:
	INY				  ; C8 | Increment Y register
	EOR $7800,Y		  ; 59 00 78 | Exclusive OR with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1BD
; Address: $FCCE60
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1BD:
	JSL $FF803F		  ; 22 3F 80 FF | Jump to subroutine long
	CPY $9033			; CC 33 90 | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1BE
; Address: $FCCE68
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1BE:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INC $3C02,X		  ; FE 02 3C | Increment (absolute,X)
	WDM #$1C			 ; 42 1C | Reserved instruction
	EOR $E5FE,Y		  ; 59 FE E5 | Exclusive OR with accumulator (absolute,Y)
	ORA $00A5,X		  ; 1D A5 00 | Logical OR with accumulator (absolute,X)
	ORA $E800			; 0D 00 E8 | Logical OR with accumulator (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1BF
; Address: $FCCE98
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1BF:
	JSR $1C00			; 20 00 1C | Jump to subroutine
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1C0
; Address: $FCCEBA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1C0:
	JSR $2800			; 20 00 28 | Jump to subroutine
	JMP $2100			; 4C 00 21 | PPU graphics register access
	STA $C90569		  ; 8F 69 05 C9 | Store accumulator to absolute long address
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($45),Y		  ; D1 45 | Compare accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1C2
; Address: $FCCECF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1C2:
	BRA $9C			  ; 80 9C | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1C4
; Address: $FCCEF8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1C4:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1C5
; Address: $FCCF0F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1C5:
	JSR $0060			; 20 60 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1C6
; Address: $FCCF1E
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1C6:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PEA #$7F30		   ; F4 30 7F | Push effective address to stack
	CMP $F7			  ; C5 F7 | Compare accumulator (zero page)
	LSR $7C9C			; 4E 9C 7C | Logical shift right (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	BIT $E000			; 2C 00 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $D6B4			; EC B4 D6 | Compare X register (absolute)
	ROL $DC			  ; 26 DC | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $00			  ; 90 00 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0F69,Y		  ; 19 69 0F | Logical OR with accumulator (absolute,Y)
	BVC $26			  ; 50 26 | Branch if overflow clear
	ADC #$A6			 ; 69 A6 | Add with carry (immediate)
	BEQ $E4			  ; F0 E4 | Branch if equal
	LDY $8FDC,X		  ; BC DC 8F | Load from absolute,X into Y register
	JMP ($4647)		  ; 6C 47 46 | Jump to address (absolute indirect)
	BCS $00			  ; B0 00 | Branch if carry set
	STA $4F00,Y		  ; 99 00 4F | Store accumulator to absolute,Y
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1C9
; Address: $FCCF88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1C9:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1CA
; Address: $FCCF90
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1CA:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	AND $183E			; 2D 3E 18 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1CB
; Address: $FCD006
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1CB:
	JSR $2038			; 20 38 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	SBC ($1A,X)		  ; E1 1A | Subtract with carry ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA $000F			; 0D 0F 00 | Logical OR with accumulator (absolute)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1CC
; Address: $FCD068
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1CC:
	JSR $C038			; 20 38 C0 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	SBC ($DD),Y		  ; F1 DD | Subtract with carry ((zero page),Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1CD
; Address: $FCD09E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1CD:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 3F AF 3F | Load from absolute long,X into accumulator
	BNE $5F			  ; D0 5F | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1CE
; Address: $FCD0BA
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1CE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	ROL $F63C,X		  ; 3E 3C F6 | Rotate left (absolute,X)
	INC $FC			  ; E6 FC | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	PEA #$F03C		   ; F4 3C F0 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $1C1F,X		  ; 1E 1F 1C | Arithmetic shift left (absolute,X)
	ROL $31			  ; 26 31 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	BVC $80			  ; 50 80 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1CF
; Address: $FCD15E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1CF:
	BNE $20			  ; D0 20 | Branch if not equal
	LDY $5E			  ; A4 5E | Load from zero page into Y register
	STX $840C			; 8E 0C 84 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D0
; Address: $FCD166
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D0:
	JSR $B8A0			; 20 A0 B8 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D1
; Address: $FCD17A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D1:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	LSR $DEC4,X		  ; 5E C4 DE | Logical shift right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	BEQ $38			  ; F0 38 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PEA #$A400		   ; F4 00 A4 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D2
; Address: $FCD197
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D2:
	JSR $C004			; 20 04 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	ASL $071E			; 0E 1E 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $79			  ; 85 79 | Store accumulator to zero page
	EOR $EF			  ; 45 EF | Exclusive OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $8380,X		  ; 7D 80 83 | Add with carry (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $20			  ; D0 20 | Branch if not equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D5
; Address: $FCD203
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D5:
	JSR $2829			; 20 29 28 | Jump to subroutine
	BIT $2F0F			; 2C 0F 2F | Test bits in accumulator (absolute)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D6
; Address: $FCD218
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D6:
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	BEQ $FD			  ; F0 FD | Branch if equal
	EOR $EF			  ; 45 EF | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ADC $8381,X		  ; 7D 81 83 | Add with carry (absolute,X)
	INC $BA00,X		  ; FE 00 BA | Increment (absolute,X)
	BRA $90			  ; 80 90 | Branch always
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	BEQ $38			  ; F0 38 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D7
; Address: $FCD252
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D7:
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $6D3F			; 2E 3F 6D | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D8
; Address: $FCD28A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D8:
	SED				  ; F8 | Set decimal mode flag
	BEQ $D4			  ; F0 D4 | Branch if equal
	BVC $9C			  ; 50 9C | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	LDA				  ; BF 3F BF 3F | Load from absolute long,X into accumulator
	LDA				  ; BF 28 BF 40 | Load from absolute long,X into accumulator
	BVS $3F			  ; 70 3F | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1D9
; Address: $FCD2B8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1D9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC $F6FC,X		  ; FE FC F6 | Increment (absolute,X)
	INC $FC			  ; E6 FC | Increment (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $78			  ; F0 78 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ROL $2D3F			; 2E 3F 2D | Rotate left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1DB
; Address: $FCD2EC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1DB:
	BMI $50			  ; 30 50 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BPL $34			  ; 10 34 | Branch if positive
	BMI $3C			  ; 30 3C | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROR $00E0,X		  ; 7E E0 00 | Rotate right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $40			  ; B0 40 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1DC
; Address: $FCD319
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1DC:
	JSR $C008			; 20 08 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	BMI $47			  ; 30 47 | Branch if negative
	BVS $53			  ; 70 53 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1DE
; Address: $FCD328
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1DE:
	BVS $90			  ; 70 90 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA				  ; BF 3F BF 18 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1DF
; Address: $FCD340
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1DF:
	JSR $D428			; 20 28 D4 | Jump to subroutine
	BPL $14			  ; 10 14 | Branch if positive
	BPL $34			  ; 10 34 | Branch if positive
	BMI $3E			  ; 30 3E | Branch if negative
	ROR $FE7C,X		  ; 7E 7C FE | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E0
; Address: $FCD34E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E0:
	INC $10FC,X		  ; FE FC 10 | Increment (absolute,X)
	CPY #$E8			 ; C0 E8 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	SBC $7CBB,Y		  ; F9 BB 7C | Subtract with carry (absolute,Y)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E1
; Address: $FCD3CD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E1:
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF 3F BF 28 | Load from absolute long,X into accumulator
	LDA				  ; BF 40 1F 70 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E2
; Address: $FCD3F6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC $FC			  ; E6 FC | Increment (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $68			  ; F0 68 | Branch if equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	BPL $12			  ; 10 12 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E3
; Address: $FCD42F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E3:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	ORA $5C00,X		  ; 1D 00 5C | Logical OR with accumulator (absolute,X)
	STZ $BE			  ; 64 BE | Store zero to zero page

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E4
; Address: $FCD443
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E4:
	SEP #$6F			 ; E2 6F | Set processor status bits
	SBC ($03),Y		  ; F1 03 | Subtract with carry ((zero page),Y)
	DEC $DFB2			; CE B2 DF | Decrement (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	SEC				  ; 38 | Set carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ADC $FF82,X		  ; 7D 82 FF | Add with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E5
; Address: $FCD469
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E5:
	JSR $1020			; 20 20 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $60			  ; 50 60 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $1F			  ; 10 1F | Branch if positive
	BIT $3B33			; 2C 33 3B | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E6
; Address: $FCD487
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E6:
	JSR $4077			; 20 77 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BMI $50			  ; 30 50 | Branch if negative
	BMI $50			  ; 30 50 | Branch if negative
	XBA				  ; EB | Exchange accumulator bytes
	EOR $3847,X		  ; 5D 47 38 | Exclusive OR with accumulator (absolute,X)
	BRA $C3			  ; 80 C3 | Branch always
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	LDX $FF41,Y		  ; BE 41 FF | Load from absolute,Y into X register
	BRA $80			  ; 80 80 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0C0D			; CC 0D 0C | Compare Y register (absolute)
	ORA $1D1C			; 0D 1C 1D | Logical OR with accumulator (absolute)
	AND $00F0,X		  ; 3D F0 00 | Logical AND with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	JMP ($F480)		  ; 6C 80 F4 | Jump to address (absolute indirect)
	SEP #$00			 ; E2 00 | Set processor status bits
	REP #$00			 ; C2 00 | Reset processor status bits
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E7
; Address: $FCD4F8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E7:
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BEQ $F8			  ; F0 F8 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1E8
; Address: $FCD538
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1E8:
	JSR $4000			; 20 00 40 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $FCE5,X		  ; 7D E5 FC | Add with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	SED				  ; F8 | Set decimal mode flag
	BEQ $2C			  ; F0 2C | Branch if equal
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1EA
; Address: $FCD5C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1EA:
	JSR $5020			; 20 20 50 | Jump to subroutine
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BCS $98			  ; B0 98 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	BVS $88			  ; 70 88 | Branch if overflow set
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1EB
; Address: $FCD5D4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1EB:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $0B0A			; 0E 0A 0B | Arithmetic shift left (absolute)
	ORA $1C13			; 0D 13 1C | Logical OR with accumulator (absolute)
	ASL $3F2C,X		  ; 1E 2C 3F | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $30			  ; 70 30 | Branch if overflow set
	BCS $08			  ; B0 08 | Branch if carry set
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1EC
; Address: $FCD61A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1EC:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LSR $C2			  ; 46 C2 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1ED
; Address: $FCD626
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1ED:
	JSR $B8A0			; 20 A0 B8 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	AND $3F02,X		  ; 3D 02 3F | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1EE
; Address: $FCD63A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1EE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ROR $A7			  ; 66 A7 | Rotate right (zero page)
	ROR $2A7F,X		  ; 7E 7F 2A | Rotate right (absolute,X)
	REP #$DF			 ; C2 DF | Reset processor status bits
	ORA $3C			  ; 05 3C | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BNE $20			  ; D0 20 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1EF
; Address: $FCD657
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1EF:
	JSR $C002			; 20 02 C0 | Jump to subroutine
	LSR $5EA5,X		  ; 5E A5 5E | Logical shift right (absolute,X)
	STX $840C			; 8E 0C 84 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F0
; Address: $FCD666
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F0:
	JSR $BCA0			; 20 A0 BC | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F1
; Address: $FCD67A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F1:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	PEA #$A400		   ; F4 00 A4 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $10			  ; 80 10 | Branch always
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F2
; Address: $FCD6CA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F2:
	JSR $E038			; 20 38 E0 | Game work RAM access
	STX $00F0			; 8E F0 00 | Store X register to absolute address
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F3
; Address: $FCD704
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F3:
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	CPY $B4F4			; CC F4 B4 | Compare Y register (absolute)
	REP #$74			 ; C2 74 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F4
; Address: $FCD70E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F4:
	JSL $0000C1		  ; 22 C1 00 00 | Jump to subroutine long
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR				  ; 6A | Rotate right (accumulator)
	JMP $317E59		  ; 5C 59 7E 31 | Jump to address long
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $90			  ; 30 90 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$1B			 ; 29 1B | Logical AND with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $0E5F1D		  ; 5C 1D 5F 0E | Jump to address long

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F5
; Address: $FCD778
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F5:
	JSR $1000			; 20 00 10 | Jump to subroutine
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SBC $C501,X		  ; FD 01 C5 | Subtract with carry (absolute,X)
	EOR $EE			  ; 45 EE | Exclusive OR with accumulator (zero page)
	ROR $80FF,X		  ; 7E FF 80 | Rotate right (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	BMI $70			  ; 30 70 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	CPY $0CF8			; CC F8 0C | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND ($2F),Y		  ; 31 2F | Logical AND with accumulator ((zero page),Y)
	EOR ($20,X)		  ; 41 20 | Exclusive OR with accumulator ((zero page,X))
	LDY #$BC			 ; A0 BC | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $3F01,X		  ; 3E 01 3F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F7
; Address: $FCD7E9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F7:
	ASL $FC05,X		  ; 1E 05 FC | Arithmetic shift left (absolute,X)
	ASL $F8F8,X		  ; 1E F8 F8 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BPL $F8			  ; 10 F8 | Branch if positive
	BRA $10			  ; 80 10 | Branch always
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	EOR $5DAA,X		  ; 5D AA 5D | Exclusive OR with accumulator (absolute,X)
	STA $8818,X		  ; 9D 18 88 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F8
; Address: $FCD806
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F8:
	JSR $B8A0			; 20 A0 B8 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1F9
; Address: $FCD81A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1F9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	STY $FAF8			; 8C F8 FA | Store Y register to absolute address
	BCS $BE			  ; B0 BE | Branch if carry set
	REP #$CF			 ; C2 CF | Reset processor status bits
	ORA $3C			  ; 05 3C | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $C0			  ; 80 C0 | Branch always
	BMI $02			  ; 30 02 | Branch if negative
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $001F,X		  ; 1E 1F 00 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	ROL $31			  ; 26 31 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BMI $57			  ; 30 57 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1FB
; Address: $FCD88A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1FB:
	BMI $50			  ; 30 50 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1FC
; Address: $FCD88F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1FC:
	LDA				  ; BF 0F 00 17 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BRA $08			  ; 80 08 | Branch always
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1FD
; Address: $FCD8A5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1FD:
	JSR $1094			; 20 94 10 | Jump to subroutine
	BMI $3C			  ; 30 3C | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROR $FCFE,X		  ; 7E FE FC | Rotate right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	BPL $C0			  ; 10 C0 | Branch if positive
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3B0F			; 0D 0F 3B | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	BCC $1C			  ; 90 1C | Branch if carry clear
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA $101F,Y		  ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
	AND $0020,Y		  ; 39 20 00 | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1FE
; Address: $FCD985
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1FE:
	CMP $DD3E,X		  ; DD 3E DD | Compare accumulator (absolute,X)
	ORA $28EB,X		  ; 1D EB 28 | Logical OR with accumulator (absolute,X)
	BEQ $80			  ; F0 80 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	PHB				  ; 8B | Push data bank register to stack
	LDX $7DD0,Y		  ; BE D0 7D | Load from absolute,Y into X register
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BNE $76			  ; D0 76 | Branch if not equal
	BRA $0E			  ; 80 0E | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $10			  ; 70 10 | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	JMP ($0064)		  ; 6C 64 00 | Jump to address (absolute indirect)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $2617,Y		  ; 19 17 26 | Logical OR with accumulator (absolute,Y)
	AND $6758,Y		  ; 39 58 67 | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $3B0F			; 0D 0F 3B | Logical OR with accumulator (absolute)
	CMP $DD3E,X		  ; DD 3E DD | Compare accumulator (absolute,X)
	STA $18EB,X		  ; 9D EB 18 | Store accumulator to absolute,X
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_1FF
; Address: $FCDA1D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_1FF:
	JSR $1FE0			; 20 E0 1F | Jump to subroutine
	BVS $90			  ; 70 90 | Branch if overflow set
	CPX $D3BF			; EC BF D3 | Compare X register (absolute)
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BNE $7A			  ; D0 7A | Branch if not equal
	BRA $07			  ; 80 07 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_200
; Address: $FCDA3F
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_200:
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $30			  ; F0 30 | Branch if equal
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ROR $62			  ; 66 62 | Rotate right (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STZ $0000			; 9C 00 00 | Store zero to absolute
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $6D73,X		  ; 1D 73 6D | Logical OR with accumulator (absolute,X)
	CMP ($BA,X)		  ; C1 BA | Compare accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL $3A			  ; 26 3A | Rotate left (zero page)
	SBC $FDBB,Y		  ; F9 BB FD | Subtract with carry (absolute,Y)
	LDA $7887,X		  ; BD 87 78 | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	STX $CF			  ; 86 CF | Store X register to zero page
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC $3F20,X		  ; DE 20 3F | Decrement (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_201
; Address: $FCDB01
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_201:
	JSR $2033			; 20 33 20 | Jump to subroutine
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_202
; Address: $FCDB46
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_202:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $06FD,X		  ; FD FD 06 | Subtract with carry (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($7464)		  ; 6C 64 74 | Jump to address (absolute indirect)
	PEA #$D0F4		   ; F4 F4 D0 | Push effective address to stack
	PEA #$F4D0		   ; F4 D0 F4 | Push effective address to stack
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BEQ $68			  ; F0 68 | Branch if equal
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BRA $CF			  ; 80 CF | Branch always
	BRA $18			  ; 80 18 | Branch always
	BRA $30			  ; 80 30 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	STA ($17,X)		  ; 81 17 | Store accumulator to (zero page,X)
	ROR $2800,X		  ; 7E 00 28 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $3D3D,Y		  ; 39 3D 3D | Logical AND with accumulator (absolute,Y)
	ADC $F47D,X		  ; 7D 7D F4 | Add with carry (absolute,X)
	SBC $FDC4,X		  ; FD C4 FD | Subtract with carry (absolute,X)
	STA $3AFC			; 8D FC 3A | Store accumulator to absolute address
	SED				  ; F8 | Set decimal mode flag
	CPY $C600			; CC 00 C6 | Compare Y register (absolute)
	REP #$00			 ; C2 00 | Reset processor status bits
	PHP				  ; 08 | Push processor status to stack
	BPL $19			  ; 10 19 | Branch if positive
	BPL $13			  ; 10 13 | Branch if positive
	BPL $14			  ; 10 14 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	JMP $80BF			; 4C BF 80 | Jump to address
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BVS $0F			  ; 70 0F | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $E000,X		  ; FE 00 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_203
; Address: $FCDC4A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_203:
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	AND $F1C1,Y		  ; 39 C1 F1 | Logical AND with accumulator (absolute,Y)
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ROL $C83F,X		  ; 3E 3F C8 | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_204
; Address: $FCDC81
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_204:
	JSR $1030			; 20 30 10 | Jump to subroutine
	BCS $90			  ; B0 90 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_205
; Address: $FCDC8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_205:
	JSR $68E8			; 20 E8 68 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_206
; Address: $FCDC96
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_206:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $3F			  ; 30 3F | Branch if negative
	BEQ $10			  ; F0 10 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_208
; Address: $FCDD24
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_208:
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $CC			  ; F0 CC | Branch if equal
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BVS $7F			  ; 70 7F | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_209
; Address: $FCDDE9
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_209:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	ROL $C000,X		  ; 3E 00 C0 | Rotate left (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $50			  ; 80 50 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1B0F			; 0D 0F 1B | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	BCC $18			  ; 90 18 | Branch if carry clear
	INX				  ; E8 | Increment X register
	STY $00F4			; 8C F4 00 | Store Y register to absolute address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_20A
; Address: $FCDE5A
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_20A:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1B0F			; 0D 0F 1B | Logical OR with accumulator (absolute)
	ADC $7D5E,X		  ; 7D 5E 7D | Add with carry (absolute,X)
	STA $00EB,X		  ; 9D EB 00 | Store accumulator to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BCS $18			  ; B0 18 | Branch if carry set
	INX				  ; E8 | Increment X register
	LDY $7ED4,X		  ; BC D4 7E | Load from absolute,X into Y register
	TSX				  ; BA | Transfer stack pointer to X register
	ROR $3FBA,X		  ; 7E BA 3F | Rotate right (absolute,X)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX $FC10			; EC 10 FC | Compare X register (absolute)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $EDF3,X		  ; 1D F3 ED | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $DBF7,X		  ; FD F7 DB | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF DD 3E DD | Load from absolute long,X into accumulator
	STA $286B,X		  ; 9D 6B 28 | Store accumulator to absolute,X
	BRA $70			  ; 80 70 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	LDX $7FD2,Y		  ; BE D2 7F | Load from absolute,Y into X register
	LDA $B87D,Y		  ; B9 7D B8 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_20B
; Address: $FCDF46
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_20B:
	AND $74D0,X		  ; 3D D0 74 | Logical AND with accumulator (absolute,X)
	BRA $0E			  ; 80 0E | Branch always
	ASL $3CE0,X		  ; 1E E0 3C | Arithmetic shift left (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INC $FF10			; EE 10 FF | Increment (absolute)
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_20C
; Address: $FCDF6D
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_20C:
	JSR $A0E0			; 20 E0 A0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BRA $70			  ; 80 70 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BPL $F0			  ; 10 F0 | Branch if positive
	SBC ($0B,X)		  ; E1 0B | Subtract with carry ((zero page,X))
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	ORA $1CE0,X		  ; 1D E0 1C | Logical OR with accumulator (absolute,X)
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	BRA $F9			  ; 80 F9 | Branch always
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_20D
; Address: $FCDFFC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_20D:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_20F
; Address: $FCE00F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_20F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STA ($7A,X)		  ; 81 7A | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	STY $007F			; 8C 7F 00 | Store Y register to absolute address
	BRA $7F			  ; 80 7F | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA $7887,X		  ; BD 87 78 | Load from absolute,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_210
; Address: $FCE062
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_210:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_211
; Address: $FCE071
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_211:
	JSR $C03F			; 20 3F C0 | Jump to subroutine
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $C000,X		  ; FE 00 C0 | Increment (absolute,X)
	CPY #$E0			 ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_212
; Address: $FCE083
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_212:
	JSR $1030			; 20 30 10 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	JMP ($F464)		  ; 6C 64 F4 | Jump to address (absolute indirect)
	PEA #$F4D4		   ; F4 D4 F4 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $0F08			; 0D 08 0F | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $F9			  ; 80 F9 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_213
; Address: $FCE0E3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_213:
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BCS $90			  ; B0 90 | Branch if carry set
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BRA $D0			  ; 80 D0 | Branch always
	BRA $D0			  ; 80 D0 | Branch always
	BNE $50			  ; D0 50 | Branch if not equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_216
; Address: $FCE11C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_216:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF BF FF 00 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	SBC $F101,Y		  ; F9 01 F1 | Subtract with carry (absolute,Y)
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_217
; Address: $FCE181
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_217:
	JSR $2060			; 20 60 20 | Jump to subroutine
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	ORA $0E09,Y		  ; 19 09 0E | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_218
; Address: $FCE1B4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_218:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	PEA #$00FC		   ; F4 FC 00 | Push effective address to stack
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $54			  ; F0 54 | Branch if equal
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BPL $B0			  ; 10 B0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BVS $7F			  ; 70 7F | Branch if overflow set
	STA				  ; 9F 1F 67 07 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_219
; Address: $FCE27C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_219:
	CLC				  ; 18 | Clear carry flag
	INC $1FFF,X		  ; FE FF 1F | Increment (absolute,X)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA $FBFC,X		  ; 1D FC FB | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $E0			  ; E6 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_21A
; Address: $FCE2A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_21A:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_21B
; Address: $FCE2C7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_21B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BVS $7F			  ; 70 7F | Branch if overflow set
	STA				  ; 9F 1F 67 07 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_21C
; Address: $FCE2FC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_21C:
	CLC				  ; 18 | Clear carry flag
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA $FBFC,X		  ; 1D FC FB | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $E0			  ; E6 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	SBC $7CBB,Y		  ; F9 BB 7C | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_21D
; Address: $FCE36F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_21D:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $2C31,X		  ; 1D 31 2C | Logical OR with accumulator (absolute,X)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $2002,X		  ; 1D 02 20 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_21E
; Address: $FCE3C1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_21E:
	JSR $7050			; 20 50 70 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	DEC $6FE6,X		  ; DE E6 6F | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_220
; Address: $FCE3D2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_220:
	JSR $7000			; 20 00 70 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INC $FB00,X		  ; FE 00 FB | Increment (absolute,X)
	SBC $0002,X		  ; FD 02 00 | Subtract with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_221
; Address: $FCE3EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_221:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_222
; Address: $FCE404
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_222:
	JSL $67583F		  ; 22 3F 58 67 | Jump to subroutine long
	EOR ($EF,X)		  ; 41 EF | Exclusive OR with accumulator ((zero page,X))
	BRA $C7			  ; 80 C7 | Branch always
	BRA $60			  ; 80 60 | Branch always
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	SBC $EBF7,X		  ; FD F7 EB | Subtract with carry (absolute,X)
	EOR $3847,X		  ; 5D 47 38 | Exclusive OR with accumulator (absolute,X)
	BRA $C3			  ; 80 C3 | Branch always
	LDX $FF41,Y		  ; BE 41 FF | Load from absolute,Y into X register
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	STY $8484			; 8C 84 84 | Store Y register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	ORA $C6			  ; 05 C6 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	ROL $00E0,X		  ; 3E E0 00 | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $FA			  ; 80 FA | Branch always
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA $3B10,X		  ; 1D 10 3B | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_223
; Address: $FCE46F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_223:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDX $3C5D,Y		  ; BE 5D 3C | Load from absolute,Y into X register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_224
; Address: $FCE48A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_224:
	JSR $80F0			; 20 F0 80 | Jump to subroutine
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	BEQ $30			  ; F0 30 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_225
; Address: $FCE4A2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_225:
	ROR $FFAE,X		  ; 7E AE FF | Rotate right (absolute,X)
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ROL $C0C0,X		  ; 3E C0 C0 | Rotate left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	DEC $FF20,X		  ; DE 20 FF | Decrement (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_226
; Address: $FCE4C9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_226:
	JSR $90A0			; 20 A0 90 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $60			  ; 50 60 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_227
; Address: $FCE4DC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_227:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	ASL $110D			; 0E 0D 11 | Arithmetic shift left (absolute)
	ASL $302F,X		  ; 1E 2F 30 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ASL $EB1F,X		  ; 1E 1F EB | Arithmetic shift left (absolute,X)
	LDX $3C5D,Y		  ; BE 5D 3C | Load from absolute,Y into X register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_228
; Address: $FCE50C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_228:
	JSR $E0F0			; 20 F0 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BEQ $70			  ; F0 70 | Branch if equal
	ROR $FFAE,X		  ; 7E AE FF | Rotate right (absolute,X)
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	ROL $00C0,X		  ; 3E C0 00 | Rotate left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	DEC $FF20,X		  ; DE 20 FF | Decrement (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_229
; Address: $FCE54B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_229:
	BPL $90			  ; 10 90 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_22A
; Address: $FCE54F
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_22A:
	STZ $00			  ; 64 00 | Store zero to zero page
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	ROL $74			  ; 26 74 | Rotate left (zero page)
	JMP ($6E43)		  ; 6C 43 6E | Jump to address (absolute indirect)
	EOR ($CF,X)		  ; 41 CF | Exclusive OR with accumulator ((zero page,X))
	BRA $CF			  ; 80 CF | Branch always
	BRA $CF			  ; 80 CF | Branch always
	BRA $C7			  ; 80 C7 | Branch always
	BRA $1E			  ; 80 1E | Branch always
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVC $60			  ; 50 60 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_22D
; Address: $FCE5AF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_22D:
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $90			  ; 50 90 | Branch if overflow clear
	STA $2E5F1F		  ; 8F 1F 5F 2E | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_22E
; Address: $FCE5D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_22E:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	ROR $FEF2,X		  ; 7E F2 FE | Rotate right (absolute,X)
	EOR $FC			  ; 45 FC | Exclusive OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $CC			  ; F0 CC | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_22F
; Address: $FCE5F0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_22F:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	BMI $20			  ; 30 20 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BPL $1F			  ; 10 1F | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SBC $0EF9,Y		  ; F9 F9 0E | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_230
; Address: $FCE681
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_230:
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_233
; Address: $FCE6A4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_233:
	JSR $1740			; 20 40 17 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BVS $7F			  ; 70 7F | Branch if overflow set
	STA $007F0F		  ; 8F 0F 7F 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_234
; Address: $FCE6D4
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_234:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SBC $0EF9,Y		  ; F9 F9 0E | Subtract with carry (absolute,Y)
	ASL $E7FE,X		  ; 1E FE E7 | Arithmetic shift left (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BMI $34			  ; 30 34 | Branch if negative
	BNE $F4			  ; D0 F4 | Branch if not equal
	BEQ $6C			  ; F0 6C | Branch if equal
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	BCC $21			  ; 90 21 | PPU graphics register access
	EOR ($27,X)		  ; 41 27 | Exclusive OR with accumulator ((zero page,X))
	ASL $142F			; 0E 2F 14 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ROL $3800,X		  ; 3E 00 38 | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_235
; Address: $FCE761
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_235:
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	BCS $80			  ; B0 80 | Branch if carry set
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_236
; Address: $FCE76E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_236:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_238
; Address: $FCE77C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_238:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1E15,X		  ; 1E 15 1E | Arithmetic shift left (absolute,X)
	ROL $4435			; 2E 35 44 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BMI $18			  ; 30 18 | Branch if negative
	INX				  ; E8 | Increment X register
	BVS $94			  ; 70 94 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	CMP ($E0),Y		  ; D1 E0 | Game work RAM access
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX $FE10			; EC 10 FE | Compare X register (absolute)
	INC $F500,X		  ; FE 00 F5 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ASL $5E75,X		  ; 1E 75 5E | Arithmetic shift left (absolute,X)
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCS $70			  ; B0 70 | Branch if carry set
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	CPX $E2			  ; E4 E2 | Compare X register (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_239
; Address: $FCE85E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_239:
	LDY $0040,X		  ; BC 40 00 | Load from absolute,X into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0C09			; 0D 09 0C | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_23A
; Address: $FCE882
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_23A:
	JSR $D820			; 20 20 D8 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX $6E			  ; E4 6E | Compare X register (zero page)
	LDA $6474AF		  ; AF AF 74 64 | Load from absolute long address into accumulator
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_23B
; Address: $FCE894
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_23B:
	JSR $F800			; 20 00 F8 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	SBC $0002,X		  ; FD 02 00 | Subtract with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BVC $90			  ; 50 90 | Branch if overflow clear
	BMI $B0			  ; 30 B0 | Branch if negative
	LDA				  ; BF 3E BF D0 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_23C
; Address: $FCE8D8
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_23C:
	JSR $3000			; 20 00 30 | Jump to subroutine
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	SBC $18FF,X		  ; FD FF 18 | Subtract with carry (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	ORA #$F8			 ; 09 F8 | Logical OR with accumulator (immediate)
	INC $E0			  ; E6 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	JMP $800084		  ; 5C 84 00 80 | Jump to address long

;------------------------------------------------------------------------------
; Bank78_DmaFunction_23D
; Address: $FCE924
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_23D:
	JSR $B0A0			; 20 A0 B0 | Jump to subroutine
	BMI $BF			  ; 30 BF | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_23F
; Address: $FCE940
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_23F:
	RTI				  ; 40 | Return from interrupt
	WDM #$08			 ; 42 08 | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $3C36			; 0E 36 3C | Arithmetic shift left (absolute)
	DEX				  ; CA | Decrement X register
	SED				  ; F8 | Set decimal mode flag
	BEQ $38			  ; F0 38 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank78_DmaFunction_240
; Address: $FCE953
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_240:
	JSR $C030			; 20 30 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BMI $27			  ; 30 27 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP ($6E43)		  ; 6C 43 6E | Jump to address (absolute indirect)
	EOR ($6F,X)		  ; 41 6F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA $0E02			; 0D 02 0E | Logical OR with accumulator (absolute)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	STZ $F8			  ; 64 F8 | Store zero to zero page
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $FEF0			; 0E F0 FE | Arithmetic shift left (absolute)
	SBC $0302,X		  ; FD 02 03 | Subtract with carry (absolute,X)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_242
; Address: $FCE9A9
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_242:
	JSR $5040			; 20 40 50 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVC $80			  ; 50 80 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_243
; Address: $FCE9C6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_243:
	JSR $0040			; 20 40 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_244
; Address: $FCE9EE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_244:
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_245
; Address: $FCEA18
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_245:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $041F			; 0E 1F 04 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $78			  ; 10 78 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL $2607,X		  ; 1E 07 26 | Arithmetic shift left (absolute,X)
	BMI $05			  ; 30 05 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_246
; Address: $FCEAC3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_246:
	JSR $7020			; 20 20 70 | Jump to subroutine
	BEQ $60			  ; F0 60 | Branch if equal
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_247
; Address: $FCEACB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_247:
	BCC $30			  ; 90 30 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	BVS $80			  ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_248
; Address: $FCEAE2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_248:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $2A1C,X		  ; 1D 1C 2A | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $2021,Y		  ; 19 21 20 | Logical OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	INC				  ; 1A | Increment accumulator
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	INC $EE39,X		  ; FE 39 EE | Increment (absolute,X)
	ADC $00C6,X		  ; 7D C6 00 | Add with carry (absolute,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	BCS $30			  ; B0 30 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $B0			  ; 70 B0 | Branch if overflow set
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BEQ $3A			  ; F0 3A | Branch if equal

;------------------------------------------------------------------------------
; Bank78_DmaFunction_249
; Address: $FCEB41
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_249:
	JSL $3D191F		  ; 22 1F 19 3D | Jump to subroutine long
	AND $435B,X		  ; 3D 5B 43 | Logical AND with accumulator (absolute,X)
	AND ($1C),Y		  ; 31 1C | Logical AND with accumulator ((zero page),Y)
	ORA $232A,X		  ; 1D 2A 23 | Logical OR with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	PHY				  ; 5A | Push Y register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	SBC $9F60,Y		  ; F9 60 9F | Subtract with carry (absolute,Y)
	STA				  ; 9F 98 E7 18 | Store accumulator to absolute long,X
	INC $B0			  ; E6 B0 | Increment (zero page)
	PLX				  ; FA | Pull X register from stack
	STA $81			  ; 85 81 | Store accumulator to zero page
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PHA				  ; 48 | Push accumulator to stack
	CPY $85			  ; C4 85 | Compare Y register (zero page)
	ROR $8000,X		  ; 7E 00 80 | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_24A
; Address: $FCEBA0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_24A:
	JSR $1110			; 20 10 11 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $041F			; 0E 1F 04 | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_24C
; Address: $FCEBC4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_24C:
	BVS $A0			  ; 70 A0 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	ROL $0D3C			; 2E 3C 0D | Rotate left (absolute)
	ASL $0C16,X		  ; 1E 16 0C | Arithmetic shift left (absolute,X)
	ORA $0D33			; 0D 33 0D | Logical OR with accumulator (absolute)
	ROL $1220,X		  ; 3E 20 12 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_24D
; Address: $FCEBF2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_24D:
	JSL $010103		  ; 22 03 01 01 | Jump to subroutine long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ADC $D610			; 6D 10 D6 | Add with carry (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	DEC $EF			  ; C6 EF | Decrement (zero page)
	INC $54FF,X		  ; FE FF 54 | Increment (absolute,X)
	AND #$54			 ; 29 54 | Logical AND with accumulator (immediate)
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_24F
; Address: $FCEC28
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_24F:
	BCC $60			  ; 90 60 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_250
; Address: $FCEC2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_250:
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BCC $C4			  ; 90 C4 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	STZ $FC00			; 9C 00 FC | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_252
; Address: $FCEC5B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_252:
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$0D			 ; A0 0D | Load immediate value into Y register
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_253
; Address: $FCEC7C
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_253:
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	ROL $3633			; 2E 33 36 | Rotate left (absolute)
	ORA $0D07			; 0D 07 0D | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $18			  ; 30 18 | Branch if negative
	BMI $2E			  ; 30 2E | Branch if negative
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	STA $2A7A			; 8D 7A 2A | Store accumulator to absolute address
	SBC $2869,Y		  ; F9 69 28 | Subtract with carry (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	BCC $90			  ; 90 90 | Branch if carry clear
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	ASL $1F20			; 0E 20 1F | Arithmetic shift left (absolute)
	PLY				  ; 7A | Pull Y register from stack
	CMP ($F9),Y		  ; D1 F9 | Compare accumulator ((zero page),Y)
	BCC $28			  ; 90 28 | Branch if carry clear
	BCC $90			  ; 90 90 | Branch if carry clear
	ASL $110E			; 0E 0E 11 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $000006		  ; 8F 06 00 00 | Store accumulator to absolute long address
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_254
; Address: $FCED03
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_254:
	JSR $6030			; 20 30 60 | Jump to subroutine
	BVS $26			  ; 70 26 | Branch if overflow set
	LSR $9CA4,X		  ; 5E A4 9C | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_255
; Address: $FCED0B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_255:
	INX				  ; E8 | Increment X register
	LDX $58			  ; A6 58 | Load from zero page into X register
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDA $DD72,X		  ; BD 72 DD | Load from absolute,X into accumulator
	LDX $7A			  ; A6 7A | Load from zero page into X register
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $7B			  ; 30 7B | Branch if negative
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	BVS $B0			  ; 70 B0 | Branch if overflow set
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $32			  ; 80 32 | Branch always
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $1A37,X		  ; 1E 37 1A | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_256
; Address: $FCEDC2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_256:
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $E0			  ; 10 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $D8			  ; F0 D8 | Branch if equal
	BCS $F0			  ; B0 F0 | Branch if carry set
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $FE7F,X		  ; 7E 7F FE | Rotate right (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_257
; Address: $FCEE06
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_257:
	LDA				  ; BF D5 FF 11 | Load from absolute long,X into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ASL $D12E			; 0E 2E D1 | Arithmetic shift left (absolute)
	STX $FF80			; 8E 80 FF | Store X register to absolute address
	ASL $EDE8			; 0E E8 ED | Arithmetic shift left (absolute)
	PEA #$FF00		   ; F4 00 FF | Push effective address to stack
	BIT $CEC4			; 2C C4 CE | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	STZ $0E			  ; 64 0E | Store zero to zero page
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	ROL $FD27,X		  ; 3E 27 FD | Rotate left (absolute,X)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	AND $1EF3,X		  ; 3D F3 1E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_258
; Address: $FCEE46
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_258:
	JSR $1EDF			; 20 DF 1E | Jump to subroutine
	AND $81F3,X		  ; 3D F3 81 | Logical AND with accumulator (absolute,X)
	BVS $5D			  ; 70 5D | Branch if overflow set
	CPY #$CC			 ; C0 CC | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $E000,X		  ; DE 00 E0 | Game work RAM access
	BRA $CC			  ; 80 CC | Branch always
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	BMI $60			  ; 30 60 | Branch if negative
	BMI $E0			  ; 30 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVS $C0			  ; 70 C0 | Branch if overflow set
	ADC #$B0			 ; 69 B0 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_25B
; Address: $FCEEB3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_25B:
	JSR $4040			; 20 40 40 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $40			  ; 10 40 | Branch if positive
	STX $8E7F			; 8E 7F 8E | Store X register to absolute address
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_25D
; Address: $FCEED4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_25D:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $EE			  ; 80 EE | Branch always
	BRA $E4			  ; 80 E4 | Branch always
	BRA $F5			  ; 80 F5 | Branch always
	BRA $CE			  ; 80 CE | Branch always
	STA ($41,X)		  ; 81 41 | Store accumulator to (zero page,X)
	BRA $22			  ; 80 22 | Branch always
	CMP ($24,X)		  ; C1 24 | Compare accumulator ((zero page,X))
	REP #$52			 ; C2 52 | Reset processor status bits
	LDA ($13,X)		  ; A1 13 | Load from (zero page,X) into accumulator
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	BRA $43			  ; 80 43 | Branch always
	CPY #$47			 ; C0 47 | Compare Y register (immediate)
	CMP ($27,X)		  ; C1 27 | Compare accumulator ((zero page,X))
	CPX #$27			 ; E0 27 | Compare X register (immediate)
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_25E
; Address: $FCEF01
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_25E:
	BEQ $C8			  ; F0 C8 | Branch if equal
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BRA $94			  ; 80 94 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $68			  ; 10 68 | Branch if positive
	BCC $E0			  ; 90 E0 | Game work RAM access
	BCC $60			  ; 90 60 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	INC $FE60,X		  ; FE 60 FE | Increment (absolute,X)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_25F
; Address: $FCEF23
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_25F:
	JSR $4052			; 20 52 40 | Jump to subroutine
	EOR #$46			 ; 49 46 | Exclusive OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	ASL $1935,X		  ; 1E 35 19 | Arithmetic shift left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	EOR $1141			; 4D 41 11 | Exclusive OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC $F690			; 6D 90 F6 | Add with carry (absolute)
	LDA $5700,X		  ; BD 00 57 | Load from absolute,X into accumulator
	WDM #$FE			 ; 42 FE | Reserved instruction
	NOP				  ; EA | No operation
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	DEC $CF			  ; C6 CF | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_260
; Address: $FCEF56
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_260:
	LDA $57FF,X		  ; BD FF 57 | Load from absolute,X into accumulator
	LDA $15FE,X		  ; BD FE 15 | Load from absolute,X into accumulator
	EOR #$14			 ; 49 14 | Exclusive OR with accumulator (immediate)
	ASL $26BD			; 0E BD 26 | Arithmetic shift left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	BIT $90			  ; 24 90 | Test bits in accumulator (zero page)
	STY $ECD2			; 8C D2 EC | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_261
; Address: $FCEF6A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_261:
	JSR $0616			; 20 16 06 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	JMP $F0E020		  ; 5C 20 E0 F0 | Jump to address long
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_262
; Address: $FCEF75
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_262:
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $320E,Y		  ; 19 0E 32 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $0106			; 0D 06 01 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_264
; Address: $FCEFE1
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_264:
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	ASL $0F13,X		  ; 1E 13 0F | Arithmetic shift left (absolute,X)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ASL $00C6			; 0E C6 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $90			  ; D0 90 | Branch if not equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $60			  ; D0 60 | Branch if not equal
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $0D18			; 0D 18 0D | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_265
; Address: $FCF04D
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_265:
	BMI $18			  ; 30 18 | Branch if negative
	BMI $0A			  ; 30 0A | Branch if negative
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	ADC ($C0),Y		  ; 71 C0 | Add with carry ((zero page),Y)
	ADC $B8F4,Y		  ; 79 F4 B8 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	DEC $02			  ; C6 02 | Decrement (zero page)
	ASL $0E06			; 0E 06 0E | Arithmetic shift left (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 4A B5 71 | Load from absolute long,X into accumulator
	STX $A47B			; 8E 7B A4 | Store X register to absolute address
	LDA ($BF),Y		  ; B1 BF | Load from (zero page),Y into accumulator
	LDA				  ; BF 5F 80 E4 | Load from absolute long,X into accumulator
	BRA $F5			  ; 80 F5 | Branch always
	BRA $CE			  ; 80 CE | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $E0			  ; 10 E0 | Game work RAM access
	EOR ($A0),Y		  ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
	LDA ($D1,X)		  ; A1 D1 | Load from (zero page,X) into accumulator
	AND $A5D8			; 2D D8 A5 | Logical AND with accumulator (absolute)
	CMP $B4A0,X		  ; DD A0 B4 | Compare accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDY $2040,X		  ; BC 40 20 | Load from absolute,X into Y register
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPX #$2C			 ; E0 2C | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $2EE0			; 2E E0 2E | Rotate left (absolute)
	CPX #$2E			 ; E0 2E | Compare X register (immediate)
	CPX #$5E			 ; E0 5E | Compare X register (immediate)
	CPY #$5E			 ; C0 5E | Compare Y register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_266
; Address: $FCF0C2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_266:
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank78_DmaFunction_267
; Address: $FCF0C7
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_267:
	BRA $80			  ; 80 80 | Branch always
	BPL $0C			  ; 10 0C | Branch if positive
	EOR $0222			; 4D 22 02 | Exclusive OR with accumulator (absolute)
	BIT $6301			; 2C 01 63 | Test bits in accumulator (absolute)
	ROL $1414,X		  ; 3E 14 14 | Rotate left (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STZ $38			  ; 64 38 | Store zero to zero page
	ROL $331C,X		  ; 3E 1C 33 | Rotate left (absolute,X)
	ASL $143E,X		  ; 1E 3E 14 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $0606			; 0D 06 06 | Logical OR with accumulator (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BIT $2C18			; 2C 18 2C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $58			  ; 30 58 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $60			  ; 30 60 | Branch if negative
	BMI $60			  ; 30 60 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_26A
; Address: $FCF1D3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_26A:
	JSR $4040			; 20 40 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX $11EE			; AE EE 11 | Load from absolute address into X register
	TXA				  ; 8A | Transfer X register to accumulator
	PLX				  ; FA | Pull X register from stack
	LDY $00			  ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_26B
; Address: $FCF20A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_26B:
	INC $771D			; EE 1D 77 | Increment (absolute)
	AND #$DE			 ; 29 DE | Logical AND with accumulator (immediate)
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	CMP ($1F),Y		  ; D1 1F | Compare accumulator ((zero page),Y)
	NOP				  ; EA | No operation
	ASL $04F5			; 0E F5 04 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $D8			  ; 80 D8 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_26C
; Address: $FCF226
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_26C:
	BRA $00			  ; 80 00 | Branch always
	STZ $E21C			; 9C 1C E2 | Store zero to absolute
	ADC $9E8C			; 6D 8C 9E | Add with carry (absolute)
	ORA $80BC,Y		  ; 19 BC 80 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BIT $1830			; 2C 30 18 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_26D
; Address: $FCF244
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_26D:
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	EOR ($2F),Y		  ; 51 2F | Exclusive OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_26E
; Address: $FCF25E
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_26E:
	JSR $803B			; 20 3B 80 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $14			  ; F0 14 | Branch if equal
	INX				  ; E8 | Increment X register
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $0B0E			; 0E 0E 0B | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $2D			  ; 10 2D | Branch if positive
	BIT $1112			; 2C 12 11 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_26F
; Address: $FCF2AC
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_26F:
	ASL $0D07			; 0E 07 0D | Arithmetic shift left (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	AND $1013			; 2D 13 10 | Logical AND with accumulator (absolute)
	BIT $FD			  ; 24 FD | Test bits in accumulator (zero page)
	LDA				  ; BF 00 EF 80 | Load from absolute long,X into accumulator
	BCC $FF			  ; 90 FF | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	LDA				  ; BF FF EF 7F | Load from absolute long,X into accumulator
	EOR $92			  ; 45 92 | Exclusive OR with accumulator (zero page)
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	ADC $AF03,Y		  ; 79 03 AF | Add with carry (absolute,Y)
	ORA #$DA			 ; 09 DA | Logical OR with accumulator (immediate)
	ORA #$64			 ; 09 64 | Logical OR with accumulator (immediate)
	PEA #$88BB		   ; F4 BB 88 | Push effective address to stack
	STA $41			  ; 85 41 | Store accumulator to zero page
	LSR $17			  ; 46 17 | Logical shift right (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $D8			  ; F0 D8 | Branch if equal
	BEQ $68			  ; F0 68 | Branch if equal
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 42 4F 00 | Store accumulator to absolute long,X
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND $3F40			; 2D 40 3F | Logical AND with accumulator (absolute)
	BVC $2F			  ; 50 2F | Branch if overflow clear
	AND $235C			; 2D 5C 23 | Logical AND with accumulator (absolute)
	LSR $2029,X		  ; 5E 29 20 | Logical shift right (absolute,X)
	AND $3D20,Y		  ; 39 20 3D | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_273
; Address: $FCF343
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_273:
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	PEA #$0828		   ; F4 28 08 | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $507E,X		  ; BD 7E 50 | Load from absolute,X into accumulator
	LDA				  ; BF EF B5 FF | Load from absolute long,X into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	STZ $4B43			; 9C 43 4B | Store zero to absolute
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_274
; Address: $FCF39D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_274:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ASL $0508			; 0E 08 05 | Arithmetic shift left (absolute)
	ASL $0508			; 0E 08 05 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $0507			; 0E 07 05 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$0D			 ; A0 0D | Load immediate value into Y register
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	AND $1EF3,X		  ; 3D F3 1E | Logical AND with accumulator (absolute,X)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_276
; Address: $FCF3D8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_276:
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPY #$CC			 ; C0 CC | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $13			  ; 05 13 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $90			  ; 80 90 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_277
; Address: $FCF427
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_277:
	JSR $4020			; 20 20 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $0F0E,Y		  ; 19 0E 0F | Logical OR with accumulator (absolute,Y)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT $172F			; 2C 2F 17 | Test bits in accumulator (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_278
; Address: $FCF490
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_278:
	JSR $103F			; 20 3F 10 | Jump to subroutine
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PEA #$E868		   ; F4 68 E8 | Push effective address to stack
	BNE $E8			  ; D0 E8 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_27A
; Address: $FCF4BB
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_27A:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $20			  ; 80 20 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $1800,X		  ; 7E 00 18 | Rotate right (absolute,X)
	STY $04			  ; 84 04 | Store Y register to zero page
	STX $0508			; 8E 08 05 | Store X register to absolute address
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STY $03			  ; 84 03 | Store Y register to zero page
	STX $0507			; 8E 07 05 | Store X register to absolute address
	ASL $0006			; 0E 06 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_27B
; Address: $FCF520
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_27B:
	JSR $1EDF			; 20 DF 1E | Jump to subroutine
	AND $81F3,X		  ; 3D F3 81 | Logical AND with accumulator (absolute,X)
	BVS $5D			  ; 70 5D | Branch if overflow set
	BNE $90			  ; D0 90 | Branch if not equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	DEC $E000,X		  ; DE 00 E0 | Game work RAM access
	BRA $CC			  ; 80 CC | Branch always
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BNE $60			  ; D0 60 | Branch if not equal
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_27C
; Address: $FCF582
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_27C:
	ADC $9200			; 6D 00 92 | Add with carry (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ADC $FF00			; 6D 00 FF | Add with carry (absolute)
	BIT $EDFF			; 2C FF ED | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_27D
; Address: $FCF5A5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_27D:
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ASL $0027			; 0E 27 00 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_27E
; Address: $FCF5E5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_27E:
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_27F
; Address: $FCF5EF
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_27F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FEF0,X		  ; FE F0 FE | Increment (absolute,X)
	BNE $00			  ; D0 00 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL $0C1F			; 0E 1F 0C | Arithmetic shift left (absolute)
	ASL $1607			; 0E 07 16 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_281
; Address: $FCF628
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_281:
	BCS $C0			  ; B0 C0 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	BCC $30			  ; 90 30 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $F603,X		  ; 1D 03 F6 | Logical OR with accumulator (absolute,X)
	SBC #$9B			 ; E9 9B | Subtract with carry (immediate)
	DEC $C9			  ; C6 C9 | Decrement (zero page)
	CMP $0003,Y		  ; D9 03 00 | Compare accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	BVS $0F			  ; 70 0F | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$D7			 ; E0 D7 | Compare X register (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	BMI $30			  ; 30 30 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_282
; Address: $FCF6BF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_282:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	STZ $9B			  ; 64 9B | Store zero to zero page
	PHX				  ; DA | Push X register to stack
	ORA ($94,X)		  ; 01 94 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_283
; Address: $FCF731
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_283:
	DEC $0DFF			; CE FF 0D | Decrement (absolute)
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	ASL $1CE0,X		  ; 1E E0 1C | Arithmetic shift left (absolute,X)
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $1C			  ; 30 1C | Branch if negative
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FEC0,X		  ; FE C0 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BNE $D8			  ; D0 D8 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_285
; Address: $FCF7A6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_285:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BMI $DA			  ; 30 DA | Branch if negative
	BVS $DE			  ; 70 DE | Branch if overflow set
	STZ $EF			  ; 64 EF | Store zero to zero page

;------------------------------------------------------------------------------
; Bank78_DmaFunction_286
; Address: $FCF7EB
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_286:
	CMP $C3A3			; CD A3 C3 | Compare accumulator (absolute)
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $7FEB,X		  ; FE EB 7F | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	STA $0F0B0E		  ; 8F 0E 0B 0F | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0D06			; 0D 06 0D | Logical OR with accumulator (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY $03B3			; CC B3 03 | Compare Y register (absolute)
	LDY $E5			  ; A4 E5 | Load from zero page into Y register
	INC				  ; 1A | Increment accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	ROR $3F18,X		  ; 7E 18 3F | Rotate right (absolute,X)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative
	STY $030C			; 8C 0C 03 | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $6D14,X		  ; 1E 14 6D | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	BNE $4F			  ; D0 4F | Branch if not equal
	INC $FF			  ; E6 FF | Increment (zero page)
	INC $3689,X		  ; FE 89 36 | Increment (absolute,X)
	ASL $6D0B,X		  ; 1E 0B 6D | Arithmetic shift left (absolute,X)
	ADC $50			  ; 65 50 | Add with carry (zero page)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BRA $D6			  ; 80 D6 | Branch always
	LDY $FE20,X		  ; BC 20 FE | Load from absolute,X into Y register
	LDY #$7E			 ; A0 7E | Load immediate value into Y register
	BRA $6E			  ; 80 6E | Branch always
	BRA $C4			  ; 80 C4 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STZ $4400			; 9C 00 44 | Store zero to absolute
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_288
; Address: $FCF8C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_288:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BVC $43			  ; 50 43 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	STY $DCCF			; 8C CF DC | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank78_DmaFunction_289
; Address: $FCF8D1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_289:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BPL $30			  ; 10 30 | Branch if positive
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$E8			 ; C0 E8 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_28A
; Address: $FCF922
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_28A:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_28B
; Address: $FCF928
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_28B:
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BCC $58			  ; 90 58 | Branch if carry clear
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	BPL $FC			  ; 10 FC | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_28C
; Address: $FCF93E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_28C:
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $2760			; 9C 60 27 | Store zero to absolute
	CLD				  ; D8 | Clear decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	BVC $50			  ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_28D
; Address: $FCF96C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_28D:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_290
; Address: $FCF97B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_290:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $F03C3C		  ; 8F 3C 3C F0 | Store accumulator to absolute long address
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $300C			; 8C 0C 30 | Store Y register to absolute address
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BIT #$36			 ; 89 36 | Test bits in accumulator (immediate)
	INC $DFC6,X		  ; FE C6 DF | Increment (absolute,X)
	BNE $4F			  ; D0 4F | Branch if not equal
	LDA $80			  ; A5 80 | Load from zero page into accumulator
	BVS $29			  ; 70 29 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_291
; Address: $FCF9ED
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_291:
	JSR $1D1F			; 20 1F 1D | Jump to subroutine
	BRA $D6			  ; 80 D6 | Branch always
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPY #$E9			 ; C0 E9 | Compare Y register (immediate)
	BVC $30			  ; 50 30 | Branch if overflow clear
	LDA $7F			  ; A5 7F | Load from zero page into accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	BRA $6E			  ; 80 6E | Branch always
	LDY #$7E			 ; A0 7E | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_292
; Address: $FCFA04
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_292:
	JSR $00FE			; 20 FE 00 | Jump to subroutine
	LDY $8080,X		  ; BC 80 80 | Load from absolute,X into Y register
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	STZ $0000			; 9C 00 00 | Store zero to absolute
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_294
; Address: $FCFA27
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_294:
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $18			  ; 30 18 | Branch if negative
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_297
; Address: $FCFA37
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_297:
	JSR $1010			; 20 10 10 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $0003,X		  ; 1D 03 00 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $F603,X		  ; 1D 03 F6 | Logical OR with accumulator (absolute,X)
	SBC #$9B			 ; E9 9B | Subtract with carry (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	BVS $30			  ; 70 30 | Branch if overflow set
	BMI $30			  ; 30 30 | Branch if negative
	XBA				  ; EB | Exchange accumulator bytes
	SBC ($CA),Y		  ; F1 CA | Subtract with carry ((zero page),Y)
	ORA $0007			; 0D 07 00 | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank78_DmaFunction_298
; Address: $FCFB32
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_298:
	JSR $CC20			; 20 20 CC | Jump to subroutine
	CPY $3F			  ; C4 3F | Compare Y register (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_299
; Address: $FCFB44
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_299:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_29B
; Address: $FCFB56
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_29B:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $66			  ; 06 66 | Arithmetic shift left (zero page)
	INC $D363,X		  ; FE 63 D3 | Increment (absolute,X)
	CPX $A942			; EC 42 A9 | Compare X register (absolute)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_29D
; Address: $FCFBC9
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_29D:
	BEQ $A0			  ; F0 A0 | Branch if equal
	BVS $50			  ; 70 50 | Branch if overflow set
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F603,X		  ; 1D 03 F6 | Logical OR with accumulator (absolute,X)
	SBC #$9B			 ; E9 9B | Subtract with carry (immediate)
	DEC $C9			  ; C6 C9 | Decrement (zero page)
	CMP ($03),Y		  ; D1 03 | Compare accumulator ((zero page),Y)
	BIT $EF01			; 2C 01 EF | Test bits in accumulator (absolute)
	BRA $FA			  ; 80 FA | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BNE $FC			  ; D0 FC | Branch if not equal
	BIT $EFFE			; 2C FE EF | Test bits in accumulator (absolute)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank78_DmaFunction_29E
; Address: $FCFC20
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_29E:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC #$9B			 ; E9 9B | Subtract with carry (immediate)
	DEC $C9			  ; C6 C9 | Decrement (zero page)
	CMP ($03),Y		  ; D1 03 | Compare accumulator ((zero page),Y)
	BIT $EF01			; 2C 01 EF | Test bits in accumulator (absolute)
	BRA $FA			  ; 80 FA | Branch always
	BCS $FA			  ; B0 FA | Branch if carry set
	BNE $E0			  ; D0 E0 | Game work RAM access
	BCC $E0			  ; 90 E0 | Game work RAM access
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BNE $FC			  ; D0 FC | Branch if not equal
	BIT $EFFE			; 2C FE EF | Test bits in accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $000E,X		  ; 1D 0E 00 | Logical OR with accumulator (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $C9			  ; C6 C9 | Decrement (zero page)
	CMP ($03),Y		  ; D1 03 | Compare accumulator ((zero page),Y)
	BIT $EF01			; 2C 01 EF | Test bits in accumulator (absolute)
	BRA $FA			  ; 80 FA | Branch always
	BCS $DA			  ; B0 DA | Branch if carry set
	BEQ $6B			  ; F0 6B | Branch if equal
	BIT #$87			 ; 89 87 | Test bits in accumulator (immediate)
	ORA $C0			  ; 05 C0 | Logical OR with accumulator (zero page)
	BMI $D0			  ; 30 D0 | Branch if negative
	BIT $EFFE			; 2C FE EF | Test bits in accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCS $78			  ; B0 78 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $1E			  ; 24 1E | Test bits in accumulator (zero page)
	BPL $0C			  ; 10 0C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $0F02,X		  ; 1E 02 0F | Arithmetic shift left (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A0
; Address: $FCFD05
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A0:
	BMI $60			  ; 30 60 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $18			  ; 30 18 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A1
; Address: $FCFD16
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A1:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BMI $DA			  ; 30 DA | Branch if negative
	BVS $DE			  ; 70 DE | Branch if overflow set
	BIT $4F			  ; 24 4F | Test bits in accumulator (zero page)
	AND $336F,X		  ; 3D 6F 33 | Logical AND with accumulator (absolute,X)
	ADC $3831,Y		  ; 79 31 38 | Add with carry (absolute,Y)
	INC $7FEB,X		  ; FE EB 7F | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	STA $0F0B0E		  ; 8F 0E 0B 0F | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $0A0C,Y		  ; 19 0C 0A | Logical OR with accumulator (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	BNE $BB			  ; D0 BB | Branch if not equal
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ADC $22			  ; 65 22 | Add with carry (zero page)
	REP #$D0			 ; C2 D0 | Reset processor status bits
	BMI $E0			  ; 30 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	PHX				  ; DA | Push X register to stack
	LSR $FF			  ; 46 FF | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A2
; Address: $FCFDB6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A2:
	PLX				  ; FA | Pull X register from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $0A0C,Y		  ; 19 0C 0A | Logical OR with accumulator (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$97			 ; 09 97 | Logical OR with accumulator (immediate)
	AND $12			  ; 25 12 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A3
; Address: $FCFDE6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A3:
	JSR $D0C0			; 20 C0 D0 | Jump to subroutine
	BMI $E0			  ; 30 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	WDM #$FA			 ; 42 FA | Reserved instruction
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E0E,X		  ; 1D 0E 0E | Logical OR with accumulator (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	WDM #$02			 ; 42 02 | Reserved instruction
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A4
; Address: $FCFE24
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A4:
	JSR $6040			; 20 40 60 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	BVS $E0			  ; 70 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEP #$00			 ; E2 00 | Set processor status bits
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL $2607,X		  ; 1E 07 26 | Arithmetic shift left (absolute,X)
	BMI $05			  ; 30 05 | Branch if negative

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A5
; Address: $FCFE4E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A5:
	JSR $0010			; 20 10 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL $2000			; 0E 00 20 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A8
; Address: $FCFE69
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A8:
	BCC $30			  ; 90 30 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	BVS $80			  ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2A9
; Address: $FCFE6E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2A9:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	AND ($0F),Y		  ; 31 0F | Logical AND with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2AA
; Address: $FCFE9E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2AA:
	JSR $0039			; 20 39 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $08			  ; B0 08 | Branch if carry set
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2AD
; Address: $FCFEDC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2AD:
	JSR $0025			; 20 25 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2AE
; Address: $FCFEE7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2AE:
	BRA $50			  ; 80 50 | Branch always
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2AF
; Address: $FCFEF8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2AF:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $4C59,X		  ; 1D 59 4C | Logical OR with accumulator (absolute,X)
	LDX $5E5A			; AE 5A 5E | Load from absolute address into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $503532		  ; 8F 32 35 50 | Store accumulator to absolute long address
	EOR #$0B			 ; 49 0B | Exclusive OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	EOR #$5A			 ; 49 5A | Exclusive OR with accumulator (immediate)
	AND ($A8,X)		  ; 21 A8 | Logical AND with accumulator ((zero page,X))
	BMI $0D			  ; 30 0D | Branch if negative
	BVC $3F			  ; 50 3F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B0
; Address: $FCFF20
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B0:
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPX $A4			  ; E4 A4 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B1
; Address: $FCFF2F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B1:
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX $40			  ; E4 40 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B2
; Address: $FCFF3D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B2:
	JSR $9000			; 20 00 90 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BMI $58			  ; 30 58 | Branch if negative
	BMI $38			  ; 30 38 | Branch if negative
	BPL $24			  ; 10 24 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B3
; Address: $FCFF4D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B3:
	JSR $6402			; 20 02 64 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1D01			; 0E 01 1D | Arithmetic shift left (absolute)
	ASL $0F1E			; 0E 1E 0F | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B4
; Address: $FCFF9C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B4:
	SEC				  ; 38 | Set carry flag
	BPL $18			  ; 10 18 | Branch if positive
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BMI $04			  ; 30 04 | Branch if negative
	AND $5B			  ; 25 5B | Logical AND with accumulator (zero page)
	BPL $03			  ; 10 03 | Branch if positive
	AND #$6F			 ; 29 6F | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B5
; Address: $FCFFBB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B5:
	CLC				  ; 18 | Clear carry flag
	ORA $0F76			; 0D 76 0F | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank78_DmaFunction_2B7
; Address: $FCFFC5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank78_DmaFunction_2B7:
	JSR $90D0			; 20 D0 90 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	LSR $0F90			; 4E 90 0F | Logical shift right (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $40			  ; B0 40 | Branch if carry set
	BNE $60			  ; D0 60 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	BCS $90			  ; B0 90 | Branch if carry set
	DEX				  ; CA | Decrement X register
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
