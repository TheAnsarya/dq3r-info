;==============================================================================
; Dragon Quest III - Bank $7C
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $FE0000-$FE7FFF
; Instructions: 8150
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_7C"

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_000
; Address: $FE8000
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_000:
	DEC				  ; 3A | Decrement accumulator
	PLX				  ; FA | Pull X register from stack
	SBC $73FB,Y		  ; F9 FB 73 | Subtract with carry (absolute,Y)
	ADC $EE			  ; 65 EE | Add with carry (zero page)
	ROL $57FB			; 2E FB 57 | Rotate left (absolute)
	ROL $C5EA,X		  ; 3E EA C5 | Rotate left (absolute,X)
	STX $9E9F			; 8E 9F 9E | Store X register to absolute address
	STA				  ; 9F DB 5F BB | Store accumulator to absolute long,X
	STA				  ; 9F 70 7F E0 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	STX $F88B			; 8E 8B F8 | Store X register to absolute address
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	STA $F8FFFE		  ; 8F FE FF F8 | Store accumulator to absolute long address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_001
; Address: $FE8040
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_001:
	LDA $3FDF5F		  ; AF 5F DF 3F | Load from absolute long address into accumulator
	LDA				  ; BF 7F 5F CF | Load from absolute long,X into accumulator
	INC $9F82,X		  ; FE 82 9F | Increment (absolute,X)
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	SBC ($1C,X)		  ; E1 1C | Subtract with carry ((zero page,X))
	PEA #$F838		   ; F4 38 F8 | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_002
; Address: $FE8055
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_002:
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	CMP $82FE			; CD FE 82 | Compare accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_003
; Address: $FE8070
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_003:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_005
; Address: $FE80B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_005:
	JSR $1F00			; 20 00 1F | Jump to subroutine
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_006
; Address: $FE80D0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_006:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_007
; Address: $FE80D6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_007:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $10			  ; 70 10 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_008
; Address: $FE8102
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_008:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	LDY $B30D			; AC 0D B3 | Load from absolute address into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	SBC $F313			; ED 13 F3 | Subtract with carry (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	INC $FC81,X		  ; FE 81 FC | Increment (absolute,X)
	STA ($FD,X)		  ; 81 FD | Store accumulator to (zero page,X)
	SBC $F287,Y		  ; F9 87 F2 | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_009
; Address: $FE814E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_009:
	AND $FF20			; 2D 20 FF | Logical AND with accumulator (absolute)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $7F			  ; F0 7F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_00A
; Address: $FE815F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_00A:
	JSR $0C0F			; 20 0F 0C | Jump to subroutine
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA $020D			; 0D 0D 02 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $1C12,X		  ; 1E 12 1C | Arithmetic shift left (absolute,X)
	BPL $0E			  ; 10 0E | Branch if positive
	STA $FF19,X		  ; 9D 19 FF | Store accumulator to absolute,X
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF A0 0F 08 | Load from absolute long,X into accumulator
	INC $36			  ; E6 36 | Increment (zero page)
	STA $F3			  ; 85 F3 | Store accumulator to zero page
	SEP #$FB			 ; E2 FB | Set processor status bits
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	SBC $3EF9,X		  ; FD F9 3E | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_00B
; Address: $FE81B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_00B:
	ASL $04FF			; 0E FF 04 | Arithmetic shift left (absolute)
	SBC $7F06,X		  ; FD 06 7F | Subtract with carry (absolute,X)
	WDM #$3F			 ; 42 3F | Reserved instruction

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_00C
; Address: $FE81BD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_00C:
	JSR $021D			; 20 1D 02 | Jump to subroutine
	LDX $88E3,Y		  ; BE E3 88 | Load from absolute,Y into X register
	XBA				  ; EB | Exchange accumulator bytes
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_00D
; Address: $FE81C6
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_00D:
	JSL $D5C9BE		  ; 22 BE C9 D5 | Jump to subroutine long
	CMP ($DC,X)		  ; C1 DC | Compare accumulator ((zero page,X))
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	CMP $94C1,X		  ; DD C1 94 | Compare accumulator (absolute,X)
	STZ $94D5			; 9C D5 94 | Store zero to absolute
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BRA $7F			  ; 80 7F | Branch always
	ROL $FB00,X		  ; 3E 00 FB | Rotate left (absolute,X)
	SBC $9D9B,X		  ; FD 9B 9D | Subtract with carry (absolute,X)
	LDA $FDBB			; AD BB FD | Load from absolute address into accumulator
	SBC $BB			  ; E5 BB | Subtract with carry (zero page)
	DEC $E6B3,X		  ; DE B3 E6 | Decrement (absolute,X)
	BIT #$C7			 ; 89 C7 | Test bits in accumulator (immediate)
	CMP $E5E7,X		  ; DD E7 E5 | Compare accumulator (absolute,X)
	LDA				  ; BF 5D 37 5D | Load from absolute long,X into accumulator
	EOR $776F,X		  ; 5D 6F 77 | Exclusive OR with accumulator (absolute,X)
	ROR $4E7F			; 6E 7F 4E | Rotate right (absolute)
	ADC $9F5F,X		  ; 7D 5F 9F | Add with carry (absolute,X)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	ASL $21E1			; 0E E1 21 | PPU graphics register access
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SBC $FAFA,X		  ; FD FA FA | Subtract with carry (absolute,X)
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	PEA #$E8E8		   ; F4 E8 E8 | Push effective address to stack
	SBC $F905,X		  ; FD 05 F9 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_00E
; Address: $FE8239
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_00E:
	JSL $0CC4CC		  ; 22 CC C4 0C | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_00F
; Address: $FE8265
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_00F:
	PHP				  ; 08 | Push processor status to stack
	ASL $1012,X		  ; 1E 12 10 | Arithmetic shift left (absolute,X)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $1002,X		  ; 1E 02 10 | Arithmetic shift left (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BPL $2F			  ; 10 2F | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_011
; Address: $FE8298
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_011:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_012
; Address: $FE82A6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_012:
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	PLX				  ; FA | Pull X register from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $370E,X		  ; 1E 0E 37 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_013
; Address: $FE82FA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_013:
	BVS $0F			  ; 70 0F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SBC ($ED,X)		  ; E1 ED | Subtract with carry ((zero page,X))
	SBC $D2DC			; ED DC D2 | Subtract with carry (absolute)
	LDA $C1A3,X		  ; BD A3 C1 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_014
; Address: $FE834A
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_014:
	AND $3DC3,X		  ; 3D C3 3D | Logical AND with accumulator (absolute,X)
	AND $1FC3,X		  ; 3D C3 1F | Logical AND with accumulator (absolute,X)
	ASL $3B			  ; 06 3B | Arithmetic shift left (zero page)
	ROL $5E7F			; 2E 7F 5E | Rotate left (absolute)
	INC $FEBE,X		  ; FE BE FE | Increment (absolute,X)
	INC $FE7E,X		  ; FE 7E FE | Increment (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	LDA				  ; BF BF 9D F3 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	CPX $9CC3			; EC C3 9C | Compare X register (absolute)
	CPY #$A3			 ; C0 A3 | Compare Y register (immediate)
	JMP $E3DC63		  ; 5C 63 DC E3 | Jump to address long
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7E1F,X		  ; 7E 1F 7E | Rotate right (absolute,X)
	INC $FEBF,X		  ; FE BF FE | Increment (absolute,X)
	LDX $3E3F,Y		  ; BE 3F 3E | Load from absolute,Y into X register
	ROL $FF7F,X		  ; 3E 7F FF | Rotate left (absolute,X)
	LDA				  ; BF 7F 5F 3E | Load from absolute long,X into accumulator
	ROL $0848,X		  ; 3E 48 08 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SBC ($41,X)		  ; E1 41 | Subtract with carry ((zero page,X))
	ROL $08FF,X		  ; 3E FF 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	JMP $445C44		  ; 5C 44 5C 44 | Jump to address long
	JMP $425E44		  ; 5C 44 5E 42 | Hardware register operation
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_015
; Address: $FE83D1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_015:
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	CLI				  ; 58 | Clear interrupt disable flag
	CPX $5C			  ; E4 5C | Compare X register (zero page)
	CPX $5C			  ; E4 5C | Compare X register (zero page)
	CPX $5C			  ; E4 5C | Compare X register (zero page)
	SEP #$5E			 ; E2 5E | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_017
; Address: $FE83E2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_017:
	BEQ $9C			  ; F0 9C | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LSR $3F00,X		  ; 5E 00 3F | Logical shift right (absolute,X)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_019
; Address: $FE83F6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_019:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	STA $CD02			; 8D 02 CD | Store accumulator to absolute address
	INC $3901,X		  ; FE 01 39 | Increment (absolute,X)
	DEC $11			  ; C6 11 | Decrement (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($9C,X)		  ; 01 9C | Logical OR with accumulator ((zero page,X))
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDX $E0			  ; A6 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STX $00			  ; 86 00 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_01A
; Address: $FE8459
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_01A:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ASL $0021,X		  ; 1E 21 00 | Arithmetic shift left (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_01B
; Address: $FE8494
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_01B:
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BMI $29			  ; 30 29 | Branch if negative
	ORA ($51),Y		  ; 11 51 | Logical OR with accumulator ((zero page),Y)
	AND ($A1,X)		  ; 21 A1 | Logical AND with accumulator ((zero page,X))
	STX $01			  ; 86 01 | Store X register to zero page
	ASL $1E11			; 0E 11 1E | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	AND $710F,Y		  ; 39 0F 71 | Logical AND with accumulator (absolute,Y)
	DEC $76			  ; C6 76 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt
	INC $80			  ; E6 80 | Increment (zero page)
	INC $EE80			; EE 80 EE | Increment (absolute)
	BRA $EE			  ; 80 EE | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_01C
; Address: $FE84C9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_01C:
	JSR $20EE			; 20 EE 20 | Jump to subroutine
	INC $DE40			; EE 40 DE | Increment (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	REP #$3D			 ; C2 3D | Reset processor status bits
	AND $01C3,X		  ; 3D C3 01 | Logical AND with accumulator (absolute,X)
	AND $3DC3,X		  ; 3D C3 3D | Logical AND with accumulator (absolute,X)
	AND $7FC3,X		  ; 3D C3 7F | Logical AND with accumulator (absolute,X)
	INC $FE7E,X		  ; FE 7E FE | Increment (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	DEY				  ; 88 | Decrement Y register
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $BE80,Y		  ; BE 80 BE | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_01D
; Address: $FE8516
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_01D:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STZ $F700			; 9C 00 F7 | Store zero to absolute
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	STZ $5CA3			; 9C A3 5C | Store zero to absolute
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	JMP $E3DC63		  ; 5C 63 DC E3 | Jump to address long
	INC $FE5F,X		  ; FE 5F FE | Increment (absolute,X)
	LDX $BE3F,Y		  ; BE 3F BE | Load from absolute,Y into X register
	LDX $BE3F,Y		  ; BE 3F BE | Load from absolute,Y into X register
	LDX $3E3F,Y		  ; BE 3F 3E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_01E
; Address: $FE8541
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_01E:
	JSR $2177			; 20 77 21 | PPU graphics register access
	AND ($77,X)		  ; 21 77 | Logical AND with accumulator ((zero page,X))
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	LDX $EE22			; AE 22 EE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_01F
; Address: $FE8563
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_01F:
	JSL $EF21EF		  ; 22 EF 21 EF | Jump to subroutine long
	AND ($E7,X)		  ; 21 E7 | Logical AND with accumulator ((zero page,X))
	LDA ($F7,X)		  ; A1 F7 | Load from (zero page,X) into accumulator
	BCC $F5			  ; 90 F5 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	ROL $2EF2			; 2E F2 2E | Rotate left (absolute)
	SBC ($2F),Y		  ; F1 2F | Subtract with carry ((zero page),Y)
	SBC ($2F),Y		  ; F1 2F | Subtract with carry ((zero page),Y)
	SBC $F827,Y		  ; F9 27 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	JMP $0000			; 4C 00 00 | Jump to address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BMI $34			  ; 30 34 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $AF12			; ED 12 AF | Subtract with carry (absolute)
	BVC $3E			  ; 50 3E | Branch if overflow clear
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $00			  ; 50 00 | Branch if overflow clear
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_021
; Address: $FE85D0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_021:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_022
; Address: $FE8608
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_022:
	JSR $4818			; 20 18 48 | Jump to subroutine
	BMI $90			  ; 30 90 | Branch if negative
	STZ $20			  ; 64 20 | Store zero to zero page
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$E91F		   ; F4 1F E9 | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $0F			  ; 65 0F | Add with carry (zero page)
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	LDA $FF8A7F		  ; AF 7F 8A FF | Load from absolute long address into accumulator
	STZ $FF			  ; 64 FF | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	INY				  ; C8 | Increment Y register
	BNE $FF			  ; D0 FF | Branch if not equal
	LDY #$DE			 ; A0 DE | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	DEC $DEC2,X		  ; DE C2 DE | Decrement (absolute,X)
	REP #$DE			 ; C2 DE | Reset processor status bits
	REP #$DE			 ; C2 DE | Reset processor status bits
	REP #$DE			 ; C2 DE | Reset processor status bits
	DEC $DE			  ; C6 DE | Decrement (zero page)
	DEC $DE			  ; C6 DE | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	AND $3DC3,X		  ; 3D C3 3D | Logical AND with accumulator (absolute,X)
	AND $21C3,X		  ; 3D C3 21 | PPU graphics register access
	ORA $1DC3,X		  ; 1D C3 1D | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ROR $7FFF,X		  ; 7E FF 7F | Rotate right (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_024
; Address: $FE86A0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_024:
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	JMP $E39863		  ; 5C 63 98 E3 | Jump to address long
	STY $B0CF			; 8C CF B0 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_025
; Address: $FE86AC
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_025:
	JSR $60C7			; 20 C7 60 | Jump to subroutine
	INC $BE			  ; E6 BE | Increment (zero page)
	LDX $BE3F,Y		  ; BE 3F BE | Load from absolute,Y into X register
	ROR $727F,X		  ; 7E 7F 72 | Rotate right (absolute,X)
	STA $77FE,X		  ; 9D FE 77 | Store accumulator to absolute,X
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	BMI $77			  ; 30 77 | Branch if negative
	BMI $77			  ; 30 77 | Branch if negative
	BMI $77			  ; 30 77 | Branch if negative
	BVS $73			  ; 70 73 | Branch if overflow set
	BVS $73			  ; 70 73 | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEP #$C9			 ; E2 C9 | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	CMP $E4F1			; CD F1 E4 | Compare accumulator (absolute)
	SBC ($E6),Y		  ; F1 E6 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ADC $0BFC,Y		  ; 79 FC 0B | Add with carry (absolute,Y)
	INC $FE05,X		  ; FE 05 FE | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_026
; Address: $FE8705
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_026:
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	BVC $90			  ; 50 90 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_027
; Address: $FE870B
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_027:
	JSR $2858			; 20 58 28 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BCC $40			  ; 90 40 | Branch if carry clear
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F8			  ; 80 F8 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BEQ $1F			  ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_028
; Address: $FE8749
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_028:
	CPX #$3B			 ; E0 3B | Compare X register (immediate)
	CPY $77			  ; C4 77 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BMI $07			  ; 30 07 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_029
; Address: $FE877E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_029:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BRA $BC			  ; 80 BC | Branch always
	BMI $4F			  ; 30 4F | Branch if negative
	ASL $0721,X		  ; 1E 21 07 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	JMP $43C0			; 4C C0 43 | Jump to address

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_02A
; Address: $FE879C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_02A:
	JSR $1800			; 20 00 18 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	BPL $68			  ; 10 68 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_02B
; Address: $FE87B2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_02B:
	JSL $002400		  ; 22 00 24 00 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	SBC ($1E),Y		  ; F1 1E | Subtract with carry ((zero page),Y)
	INC $E0			  ; E6 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ASL $CE			  ; 06 CE | Arithmetic shift left (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	ORA $0811			; 0D 11 08 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_02C
; Address: $FE87EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_02C:
	JSR $221A			; 20 1A 22 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_02E
; Address: $FE8800
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_02E:
	JSR $40C9			; 20 C9 40 | Jump to subroutine
	BRA $3A			  ; 80 3A | Branch always
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ROR $7E03,X		  ; 7E 03 7E | Rotate right (absolute,X)
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	SBC #$3F			 ; E9 3F | Subtract with carry (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	LDA				  ; BF 7F 7F FF | Load from absolute long,X into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	DEC $DEC6,X		  ; DE C6 DE | Decrement (absolute,X)
	DEC $DF			  ; C6 DF | Decrement (zero page)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($07,X)		  ; E1 07 | Subtract with carry ((zero page,X))
	STZ $08			  ; 64 08 | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	BRA $B0			  ; 80 B0 | Branch always
	STA ($B9,X)		  ; 81 B9 | Store accumulator to (zero page,X)
	CMP ($DF,X)		  ; C1 DF | Compare accumulator ((zero page,X))
	LDA $BB7F,X		  ; BD 7F BB | Load from absolute,X into accumulator
	DEC $E63F			; CE 3F E6 | Decrement (absolute)
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC $7C80,X		  ; FE 80 7C | Increment (absolute,X)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ADC $6DFF			; 6D FF 6D | Add with carry (absolute)
	INC $EEFF			; EE FF EE | Increment (absolute)
	ORA $019F,Y		  ; 19 9F 01 | Logical OR with accumulator (absolute,Y)
	BRA $8C			  ; 80 8C | Branch always
	LSR $3921,X		  ; 5E 21 39 | Logical shift right (absolute,X)
	AND $7B0B,X		  ; 3D 0B 7B | Logical AND with accumulator (absolute,X)
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	SBC $7BFF,Y		  ; F9 FF 7B | Subtract with carry (absolute,Y)
	INC $F8D7,X		  ; FE D7 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F F0 F3 70 | Store accumulator to absolute long,X
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $F3			  ; F0 F3 | Branch if equal
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ADC $7DFC,X		  ; 7D FC 7D | Add with carry (absolute,X)
	INC $FE7E,X		  ; FE 7E FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_02F
; Address: $FE88E7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_02F:
	ROR $7EFE,X		  ; 7E FE 7E | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	JMP $2494			; 4C 94 24 | Jump to address
	INY				  ; C8 | Increment Y register
	BIT $C8			  ; 24 C8 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_030
; Address: $FE8906
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_030:
	JSL $E412CC		  ; 22 CC 12 E4 | Jump to subroutine long
	STZ $11			  ; 64 11 | Store zero to zero page
	ROR $11			  ; 66 11 | Rotate right (zero page)
	ROR $84			  ; 66 84 | Rotate right (zero page)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BPL $02			  ; 10 02 | Branch if positive
	ORA $0300			; 0D 00 03 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CMP ($FC,X)		  ; C1 FC | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $CC21,X		  ; DE 21 CC | Decrement (absolute,X)
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	ROL $0100,X		  ; 3E 00 01 | Rotate left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_031
; Address: $FE89CC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_031:
	JMP $780884		  ; 5C 84 08 78 | Jump to address long
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	BVS $08			  ; 70 08 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_032
; Address: $FE89E3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_032:
	JSR $2040			; 20 40 20 | Jump to subroutine
	BRA $48			  ; 80 48 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	STY $8844			; 8C 44 88 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	SBC ($8F),Y		  ; F1 8F | Subtract with carry ((zero page),Y)
	SBC ($4F,X)		  ; E1 4F | Subtract with carry ((zero page,X))
	ADC ($2F,X)		  ; 61 2F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_033
; Address: $FE8A0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_033:
	JSR $000F			; 20 0F 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_034
; Address: $FE8A1D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_034:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	SBC $00FF,Y		  ; F9 FF 00 | Subtract with carry (absolute,Y)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CMP $EFC1,X		  ; DD C1 EF | Compare accumulator (absolute,X)
	SEP #$EF			 ; E2 EF | Set processor status bits
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	SBC $0FF1,Y		  ; F9 F1 0F | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BPL $D3			  ; 10 D3 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	STX $E0FE			; 8E FE E0 | Game work RAM access
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_035
; Address: $FE8A77
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_035:
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	STA $BF1FDF		  ; 8F DF 1F BF | Store accumulator to absolute long address
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	BRA $E3			  ; 80 E3 | Branch always
	BRA $E3			  ; 80 E3 | Branch always
	BRA $C3			  ; 80 C3 | Branch always
	ORA ($66),Y		  ; 11 66 | Logical OR with accumulator ((zero page),Y)
	ORA ($66),Y		  ; 11 66 | Logical OR with accumulator ((zero page),Y)
	STA ($A6),Y		  ; 91 A6 | Store accumulator to (zero page),Y
	STA ($A6),Y		  ; 91 A6 | Store accumulator to (zero page),Y
	LDA $92			  ; A5 92 | Load from zero page into accumulator
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	BNE $1E			  ; D0 1E | Branch if not equal
	ASL $1CD4,X		  ; 1E D4 1C | Arithmetic shift left (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_036
; Address: $FE8B0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_036:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_037
; Address: $FE8B1C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_037:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_038
; Address: $FE8B23
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_038:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CPX $04			  ; E4 04 | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	STY $8C72			; 8C 72 8C | Store Y register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $20			  ; 64 20 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	EOR $79A6,Y		  ; 59 A6 79 | Exclusive OR with accumulator (absolute,Y)
	STX $71			  ; 86 71 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_039
; Address: $FE8B4B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_039:
	STX $8D72			; 8E 72 8D | Store X register to absolute address
	REP #$40			 ; C2 40 | Reset processor status bits
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_03A
; Address: $FE8B70
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_03A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BMI $90			  ; 30 90 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_03B
; Address: $FE8BAC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_03B:
	JSR $40C1			; 20 C1 40 | Jump to subroutine
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $1F			  ; F0 1F | Branch if equal
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_03C
; Address: $FE8BD3
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_03C:
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BPL $03			  ; 10 03 | Branch if positive
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $7F32,X		  ; 1E 32 7F | Arithmetic shift left (absolute,X)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	INC $FF2D,X		  ; FE 2D FF | Increment (absolute,X)
	LDX $FFFF,Y		  ; BE FF FF | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	BMI $07			  ; 30 07 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC $FCFF,Y		  ; F9 FF FC | Subtract with carry (absolute,Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA $1FFF07		  ; 8F 07 FF 1F | Store accumulator to absolute long address
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $1F			  ; 80 1F | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFC,X		  ; FD FC FF | Subtract with carry (absolute,X)
	INC $7FFF,X		  ; FE FF 7F | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_03D
; Address: $FE8CA1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_03D:
	JSR $20E7			; 20 E7 20 | Jump to subroutine
	BMI $B9			  ; 30 B9 | Branch if negative
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_03E
; Address: $FE8CB1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_03E:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	BMI $FE			  ; 30 FE | Branch if negative
	AND $7FC0,Y		  ; 39 C0 7F | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $11			  ; F0 11 | Branch if equal
	ASL $3FC1			; 0E C1 3F | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	INC $FF1F,X		  ; FE 1F FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_03F
; Address: $FE8CE6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_03F:
	BEQ $90			  ; F0 90 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	PEA #$FA8E		   ; F4 8E FA | Push effective address to stack
	ROR $947E,X		  ; 7E 7E 94 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_040
; Address: $FE8CF9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_040:
	BCC $FE			  ; 90 FE | Branch if carry clear
	INX				  ; E8 | Increment X register
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_042
; Address: $FE8D10
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_042:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BCS $48			  ; B0 48 | Branch if carry set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $03			  ; 80 03 | Branch always
	ROL $6F01			; 2E 01 6F | Rotate left (absolute)
	JMP ($7C01)		  ; 6C 01 7C | Jump to address (absolute indirect)
	ROL $6FFF			; 2E FF 6F | Rotate left (absolute)
	JMP ($7CFF)		  ; 6C FF 7C | Jump to address (absolute indirect)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $0707			; 0D 07 07 | Logical OR with accumulator (absolute)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	STA				  ; 9F FF E0 E0 | Store accumulator to absolute long,X
	STA				  ; 9F FF 7F E0 | Store accumulator to absolute long,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_043
; Address: $FE8DF4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_043:
	BRA $80			  ; 80 80 | Branch always
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $371E,Y		  ; 19 1E 37 | Logical OR with accumulator (absolute,Y)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FECF,X		  ; FE CF FE | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_044
; Address: $FE8E88
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_044:
	JSR $815F			; 20 5F 81 | Jump to subroutine
	ROR $FD02,X		  ; 7E 02 FD | Rotate right (absolute,X)
	ORA $00F2			; 0D F2 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	WDM #$FC			 ; 42 FC | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_045
; Address: $FE8EBE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_045:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDX $B10E			; AE 0E B1 | Load from absolute address into X register
	ORA ($B1),Y		  ; 11 B1 | Logical OR with accumulator ((zero page),Y)
	ORA ($A0),Y		  ; 11 A0 | Logical OR with accumulator ((zero page),Y)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $F111			; EE 11 F1 | Increment (absolute)
	ORA ($F1),Y		  ; 11 F1 | Logical OR with accumulator ((zero page),Y)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $F903,Y		  ; F9 03 F9 | Subtract with carry (absolute,Y)
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_046
; Address: $FE8EEB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_046:
	SBC ($8F),Y		  ; F1 8F | Subtract with carry ((zero page),Y)
	SBC ($6F,X)		  ; E1 6F | Subtract with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_047
; Address: $FE8EF3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_047:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_048
; Address: $FE8F06
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_048:
	SBC $FEFC,X		  ; FD FC FE | Subtract with carry (absolute,X)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BVS $07			  ; 70 07 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1047			; 0E 47 10 | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_049
; Address: $FE8F2B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_049:
	JSR $206B			; 20 6B 20 | Jump to subroutine
	BVC $01			  ; 50 01 | Branch if overflow clear
	ORA ($5F,X)		  ; 01 5F | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BVS $07			  ; 70 07 | Branch if overflow set
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $F804			; CD 04 F8 | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	SBC $FBFF,X		  ; FD FF FB | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	ADC ($9B),Y		  ; 71 9B | Add with carry ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF8F,X		  ; FE 8F FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR ($21,X)		  ; 41 21 | PPU graphics register access
	BRA $00			  ; 80 00 | Branch always
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_04A
; Address: $FE8FAE
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_04A:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $88			  ; F0 88 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	JMP $0E2618		  ; 5C 18 26 0E | Jump to address long
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $24			  ; F0 24 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_04B
; Address: $FE8FD8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_04B:
	JSL $001100		  ; 22 00 11 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	BPL $68			  ; 10 68 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	SBC $1206,Y		  ; F9 06 12 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_04C
; Address: $FE8FF2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_04C:
	JSL $002400		  ; 22 00 24 00 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	BEQ $0F			  ; F0 0F | Branch if equal
	BPL $DC			  ; 10 DC | Branch if positive
	ORA $23E6,Y		  ; 19 E6 23 | Logical OR with accumulator (absolute,Y)
	STX $79			  ; 86 79 | Store X register to zero page
	STY $F872			; 8C 72 F8 | Store Y register to absolute address
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BRA $70			  ; 80 70 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_04D
; Address: $FE9053
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_04D:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $370E,X		  ; 1E 0E 37 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_04E
; Address: $FE907A
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_04E:
	BVS $0F			  ; 70 0F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	BIT $13BF			; 2C BF 13 | Test bits in accumulator (absolute)
	LDA				  ; BF 09 9F 06 | Load from absolute long,X into accumulator
	LSR $2F90,X		  ; 5E 90 2F | Logical shift right (absolute,X)
	EOR $23FF			; 4D FF 23 | Exclusive OR with accumulator (absolute)
	BPL $FF			  ; 10 FF | Branch if positive
	STY $86FF			; 8C FF 86 | Store Y register to absolute address
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	ADC $0EEE,X		  ; 7D EE 0E | Add with carry (absolute,X)
	ASL $BC9B,X		  ; 1E 9B BC | Arithmetic shift left (absolute,X)
	SBC $D87C,Y		  ; F9 7C D8 | Subtract with carry (absolute,Y)
	INC $FF7E,X		  ; FE 7E FF | Increment (absolute,X)
	SBC ($F7),Y		  ; F1 F7 | Subtract with carry ((zero page),Y)
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)
	ORA $E7			  ; 05 E7 | Logical OR with accumulator (zero page)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ASL $0FF7,X		  ; 1E F7 0F | Arithmetic shift left (absolute,X)
	SBC ($1D,X)		  ; E1 1D | Subtract with carry ((zero page,X))
	SBC ($E5),Y		  ; F1 E5 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FD1C,X		  ; FD 1C FD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_04F
; Address: $FE9105
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_04F:
	ORA $B2FF,X		  ; 1D FF B2 | Logical OR with accumulator (absolute,X)
	CPY $7F			  ; C4 7F | Compare Y register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	SBC ($DE,X)		  ; E1 DE | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $3F			  ; 80 3F | Branch always
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ROL $E000,X		  ; 3E 00 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $3E			  ; 80 3E | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $6071			; 8E 71 60 | Store X register to absolute address
	STZ $2ED0,X		  ; 9E D0 2E | Store zero to absolute,X
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	DEC				  ; 3A | Decrement accumulator
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	STZ $2200,X		  ; 9E 00 22 | Store zero to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	DEC				  ; 3A | Decrement accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $B8			  ; 70 B8 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_050
; Address: $FE919A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_050:
	BPL $00			  ; 10 00 | Branch if positive
	BVS $78			  ; 70 78 | Branch if overflow set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_051
; Address: $FE91B2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_051:
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_053
; Address: $FE91E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_053:
	JSR $7120			; 20 20 71 | Jump to subroutine
	EOR ($F0),Y		  ; 51 F0 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	CPX $CE31			; EC 31 CE | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	ORA $0026,Y		  ; 19 26 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_054
; Address: $FE91F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_054:
	JSR $7120			; 20 20 71 | Jump to subroutine
	BEQ $94			  ; F0 94 | Branch if equal
	STY $8C00			; 8C 00 8C | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_055
; Address: $FE91FE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_055:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BIT #$06			 ; 89 06 | Test bits in accumulator (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	CLC				  ; 18 | Clear carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_056
; Address: $FE9216
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_056:
	RTI				  ; 40 | Return from interrupt
	STX $0F			  ; 86 0F | Store X register to zero page
	ASL $A2			  ; 06 A2 | Arithmetic shift left (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3802,X		  ; 1E 02 38 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $10			  ; 30 10 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BRA $43			  ; 80 43 | Branch always
	SEC				  ; 38 | Set carry flag
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC $0703,X		  ; FE 03 07 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC $B9			  ; 65 B9 | Add with carry (zero page)
	AND $1E4E,Y		  ; 39 4E 1E | Logical AND with accumulator (absolute,Y)
	CMP ($F7),Y		  ; D1 F7 | Compare accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SBC $F8F9,Y		  ; F9 F9 F8 | Subtract with carry (absolute,Y)
	LDA				  ; BF 3F FF 0F | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_057
; Address: $FE9278
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_057:
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	BVS $4F			  ; 70 4F | Branch if overflow set
	ORA $3F1F,Y		  ; 19 1F 3F | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_058
; Address: $FE927F
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_058:
	JSR $FF7F			; 20 7F FF | Jump to subroutine
	ADC $F6FF,Y		  ; 79 FF F6 | Add with carry (absolute,Y)
	SBC $FFF1,Y		  ; F9 F1 FF | Subtract with carry (absolute,Y)
	BMI $BD			  ; 30 BD | Branch if negative
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $6C6D,X		  ; 9D 6D 6C | Store accumulator to absolute,X
	BRA $80			  ; 80 80 | Branch always
	STX $C6			  ; 86 C6 | Store X register to zero page
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	NOP				  ; EA | No operation
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	LDA $F1F3			; AD F3 F1 | Load from absolute address into accumulator
	SBC ($B7,X)		  ; E1 B7 | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	CPX #$E0			 ; E0 E0 | Game work RAM access
	JMP $524C			; 4C 4C 52 | Jump to address
	LSR $FE02,X		  ; 5E 02 FE | Logical shift right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $1C18,X		  ; 5E 18 1C | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	SBC $F5D4,Y		  ; F9 D4 F5 | Subtract with carry (absolute,Y)
	NOP				  ; EA | No operation
	SBC #$D4			 ; E9 D4 | Subtract with carry (immediate)
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator
	LDA				  ; BF FF 3F 3F | Load from absolute long,X into accumulator
	ROR $FC5F,X		  ; 7E 5F FC | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $FA7E,Y		  ; F9 7E FA | Subtract with carry (absolute,Y)
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	LDA $FEFF,X		  ; BD FF FE | Load from absolute,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CLV				  ; B8 | Clear overflow flag
	INC				  ; 1A | Increment accumulator
	AND $83			  ; 25 83 | Logical AND with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $90			  ; 70 90 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	CPX $EC			  ; E4 EC | Compare X register (zero page)
	PEA #$7AF6		   ; F4 F6 7A | Push effective address to stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_059
; Address: $FE930F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_059:
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BCC $98			  ; 90 98 | Branch if carry clear
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $4ECE,X		  ; 1E CE 4E | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_05B
; Address: $FE9345
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_05B:
	BCC $F0			  ; 90 F0 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BVS $88			  ; 70 88 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_05C
; Address: $FE9354
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_05C:
	BCC $00			  ; 90 00 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_060
; Address: $FE93A3
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_060:
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BPL $03			  ; 10 03 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BRA $79			  ; 80 79 | Branch always
	CLC				  ; 18 | Clear carry flag
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	LDY $C043,X		  ; BC 43 C0 | Load from absolute,X into Y register
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ADC $8600,Y		  ; 79 00 86 | Add with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $6406,Y		  ; 19 06 64 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BCC $60			  ; 90 60 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_061
; Address: $FE93EC
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_061:
	JSR $4080			; 20 80 40 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $7F			  ; 84 7F | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $F3FF,Y		  ; F9 FF F3 | Subtract with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FC02,X		  ; FE 02 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$F4FB		   ; F4 FB F4 | Push effective address to stack
	SBC $FDF7,Y		  ; F9 F7 FD | Subtract with carry (absolute,Y)
	INC $FFF7,X		  ; FE F7 FF | Increment (absolute,X)
	ASL $0D14,X		  ; 1E 14 0D | Arithmetic shift left (absolute,X)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ASL $0904			; 0E 04 09 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_062
; Address: $FE947E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_062:
	PHP				  ; 08 | Push processor status to stack
	SBC $FAE7,Y		  ; F9 E7 FA | Subtract with carry (absolute,Y)
	LDA ($5F),Y		  ; B1 5F | Load from (zero page),Y into accumulator
	JMP $1DFD0D		  ; 5C 0D FD 1D | Jump to address long
	LDA ($07),Y		  ; B1 07 | Load from (zero page),Y into accumulator
	LDX $E7			  ; A6 E7 | Load from zero page into X register
	LDA $0112A5		  ; AF A5 12 01 | Load from absolute long address into accumulator
	SEP #$03			 ; E2 03 | Set processor status bits
	LDA				  ; BF 9F FF 7F | Load from absolute long,X into accumulator
	ADC $FFDF,X		  ; 7D DF FF | Add with carry (absolute,X)
	BEQ $DC			  ; F0 DC | Branch if equal
	BEQ $DC			  ; F0 DC | Branch if equal
	BCS $FC			  ; B0 FC | Branch if carry set
	LDY #$FC			 ; A0 FC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_063
; Address: $FE94B9
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_063:
	JSR $E23E			; 20 3E E2 | Jump to subroutine
	INC $FEA0,X		  ; FE A0 FE | Increment (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	PEA #$E8F4		   ; F4 F4 E8 | Push effective address to stack
	INX				  ; E8 | Increment X register
	BEQ $70			  ; F0 70 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	DEC $EE0A			; CE 0A EE | Decrement (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_064
; Address: $FE9518
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_064:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $88			  ; 70 88 | Branch if overflow set
	BMI $C8			  ; 30 C8 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_065
; Address: $FE9524
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_065:
	JSR $20D0			; 20 D0 20 | Jump to subroutine
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_066
; Address: $FE952B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_066:
	BNE $A0			  ; D0 A0 | Branch if not equal
	BVC $80			  ; 50 80 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_067
; Address: $FE9530
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_067:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_068
; Address: $FE953E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_068:
	JSR $0800			; 20 00 08 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_06A
; Address: $FE9558
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_06A:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_06B
; Address: $FE9567
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_06B:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_06F
; Address: $FE957C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_06F:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_070
; Address: $FE9598
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_070:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BCC $01			  ; 90 01 | Branch if carry clear
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BVS $0F			  ; 70 0F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_071
; Address: $FE95BF
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_071:
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	BRA $FF			  ; 80 FF | Branch always
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $1E01			; 0E 01 1E | Arithmetic shift left (absolute)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	EOR ($F8,X)		  ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	EOR ($FD,X)		  ; 41 FD | Exclusive OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PEA #$FCE5		   ; F4 E5 FC | Push effective address to stack
	SBC $EAEA			; ED EA EA | Subtract with carry (absolute)
	SBC $FFD4,X		  ; FD D4 FF | Subtract with carry (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	CMP $2DDF,X		  ; DD DF 2D | Compare accumulator (absolute,X)
	ROL $5F9D			; 2E 9D 5F | Rotate left (absolute)
	DEC $0F2F			; CE 2F 0F | Decrement (absolute)
	ASL $FCFC,X		  ; 1E FC FC | Arithmetic shift left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SEP #$03			 ; E2 03 | Set processor status bits
	REP #$F3			 ; C2 F3 | Reset processor status bits
	REP #$F3			 ; C2 F3 | Reset processor status bits
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	STA				  ; 9F 37 6F 1B | Store accumulator to absolute long,X
	LDA $1D67,X		  ; BD 67 1D | Load from absolute,X into accumulator
	CMP $35			  ; C5 35 | Compare accumulator (zero page)
	ADC ($BF),Y		  ; 71 BF | Add with carry ((zero page),Y)
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	INC $F5EF,X		  ; FE EF F5 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $F1FF,Y		  ; F9 FF F1 | Subtract with carry (absolute,Y)
	INC $FCF2,X		  ; FE F2 FC | Increment (absolute,X)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_072
; Address: $FE968D
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_072:
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	STA ($9E),Y		  ; 91 9E | Store accumulator to (zero page),Y
	LDY $F824,X		  ; BC 24 F8 | Load from absolute,X into Y register
	PHA				  ; 48 | Push accumulator to stack
	BEQ $10			  ; F0 10 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	LDY $1015,X		  ; BC 15 10 | Load from absolute,X into Y register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $3C			  ; 10 3C | Branch if positive
	BPL $FE			  ; 10 FE | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	INC $0000			; EE 00 00 | Increment (absolute)
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	SBC ($E7),Y		  ; F1 E7 | Subtract with carry ((zero page),Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $000A			; 0E 0A 00 | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_073
; Address: $FE976A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_073:
	STA $708F70		  ; 8F 70 8F 70 | Store accumulator to absolute long address
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	ASL $3E01,X		  ; 1E 01 3E | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $BF			  ; F0 BF | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_074
; Address: $FE9781
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_074:
	JSR $1F9F			; 20 9F 1F | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_075
; Address: $FE9791
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_075:
	JSR $1FFF			; 20 FF 1F | Jump to subroutine
	STA				  ; 9F BB DB 39 | Store accumulator to absolute long,X
	LDX $BF7E,Y		  ; BE 7E BF | Load from absolute,Y into X register
	ROR $5E3F,X		  ; 7E 3F 5E | Rotate right (absolute,X)
	STA				  ; 9F 5D EC 6B | Store accumulator to absolute long,X
	CPX $E7E1			; EC E1 E7 | Compare X register (absolute)
	SEP #$E3			 ; E2 E3 | Set processor status bits
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	BEQ $F7			  ; F0 F7 | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	NOP				  ; EA | No operation
	SBC $6DF6,X		  ; FD F6 6D | Subtract with carry (absolute,X)
	ROL $5C7B			; 2E 7B 5C | Rotate left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F3			  ; F0 F3 | Branch if equal
	STA ($1F,X)		  ; 81 1F | Store accumulator to (zero page,X)
	CMP $35			  ; C5 35 | Compare accumulator (zero page)
	CPY $34			  ; C4 34 | Compare Y register (zero page)
	CPY $34			  ; C4 34 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_077
; Address: $FE97EE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_077:
	STY $EF60			; 8C 60 EF | Store Y register to absolute address
	PEA #$F4EF		   ; F4 EF F4 | Push effective address to stack
	PEA #$E0DF		   ; F4 DF E0 | Game work RAM access
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_079
; Address: $FE980E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_079:
	BEQ $50			  ; F0 50 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_07A
; Address: $FE981C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_07A:
	BCC $70			  ; 90 70 | Branch if carry clear
	BNE $70			  ; D0 70 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	BPL $0D			  ; 10 0D | Branch if positive
	BPL $06			  ; 10 06 | Branch if positive
	BPL $03			  ; 10 03 | Branch if positive
	BPL $03			  ; 10 03 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BMI $08			  ; 30 08 | Branch if negative
	BPL $0F			  ; 10 0F | Branch if positive
	LDX $BF16,Y		  ; BE 16 BF | Load from absolute,Y into X register
	LDA				  ; BF 0C DF 07 | Load from absolute long,X into accumulator
	AND ($DF,X)		  ; 21 DF | Logical AND with accumulator ((zero page,X))
	BPL $3F			  ; 10 3F | Branch if positive
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	STY $FF			  ; 84 FF | Store Y register to zero page
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA $FD9E,X		  ; 9D 9E FD | Store accumulator to absolute,X
	ROL $86E4,X		  ; 3E E4 86 | Rotate left (absolute,X)
	INC $7F3F,X		  ; FE 3F 7F | Increment (absolute,X)
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	SBC ($62,X)		  ; E1 62 | Subtract with carry ((zero page,X))
	SBC ($1D,X)		  ; E1 1D | Subtract with carry ((zero page,X))
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	INC $FA8E,X		  ; FE 8E FA | Increment (absolute,X)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	EOR $E1A3,Y		  ; 59 A3 E1 | Exclusive OR with accumulator (absolute,Y)
	STA $F8FF8F		  ; 8F 8F FF F8 | Store accumulator to absolute long address
	BVS $FC			  ; 70 FC | Branch if overflow set
	INC $1EFE,X		  ; FE FE 1E | Increment (absolute,X)
	INC $FE1E,X		  ; FE 1E FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	ASL $1E0A			; 0E 0A 1E | Arithmetic shift left (absolute)
	ROL $FE34,X		  ; 3E 34 FE | Rotate left (absolute,X)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_07B
; Address: $FE98A9
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_07B:
	STA ($FE),Y		  ; 91 FE | Store accumulator to (zero page),Y
	SBC $FF85,X		  ; FD 85 FF | Subtract with carry (absolute,X)
	STA $3F041F		  ; 8F 1F 04 3F | Store accumulator to absolute long address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	ADC ($7E,X)		  ; 61 7E | Add with carry ((zero page,X))
	ADC $7F05,X		  ; 7D 05 7F | Add with carry (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_07C
; Address: $FE98E8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_07C:
	JSL $38441C		  ; 22 1C 44 38 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	BVS $10			  ; 70 10 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $3F			  ; F0 3F | Branch if equal
	LDA				  ; BF 27 3F 26 | Load from absolute long,X into accumulator
	LSR $4C7F			; 4E 7F 4C | Logical shift right (absolute)
	STZ $BCFE			; 9C FE BC | Store zero to absolute
	BEQ $3F			  ; F0 3F | Branch if equal
	BNE $7F			  ; D0 7F | Branch if not equal
	LDY #$FF			 ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_07D
; Address: $FE9917
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_07D:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $C7			  ; 80 C7 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BRA $30			  ; 80 30 | Branch always
	STA $300F30		  ; 8F 30 0F 30 | Store accumulator to absolute long address
	BMI $00			  ; 30 00 | Branch if negative
	AND ($8E),Y		  ; 31 8E | Logical AND with accumulator ((zero page),Y)
	AND ($EF),Y		  ; 31 EF | Logical AND with accumulator ((zero page),Y)
	LDA				  ; BF 71 BF 6F | Load from absolute long,X into accumulator
	INC $E56F			; EE 6F E5 | Increment (absolute)
	BEQ $7F			  ; F0 7F | Branch if equal
	SBC $DFFD,X		  ; FD FD DF | Subtract with carry (absolute,X)
	DEC $D9			  ; C6 D9 | Decrement (zero page)
	CPX #$D1			 ; E0 D1 | Compare X register (immediate)
	CPX #$93			 ; E0 93 | Compare X register (immediate)
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	CPX #$9A			 ; E0 9A | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_07E
; Address: $FE995D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_07E:
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	CPX #$EB			 ; E0 EB | Compare X register (immediate)
	CPX $F8F0			; EC F0 F8 | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	SBC ($48,X)		  ; E1 48 | Subtract with carry ((zero page,X))
	CMP ($18),Y		  ; D1 18 | Compare accumulator ((zero page),Y)
	INC $7871,X		  ; FE 71 78 | Increment (absolute,X)
	STA				  ; 9F 0F FF 0F | Store accumulator to absolute long,X
	LDA $9F0F,Y		  ; B9 0F 9F | Load from absolute,Y into accumulator
	STY $8E60			; 8C 60 8E | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_07F
; Address: $FE9984
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_07F:
	ASL $1EC0,X		  ; 1E C0 1E | Arithmetic shift left (absolute,X)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BIT $54			  ; 24 54 | Test bits in accumulator (zero page)
	ROR $3B12,X		  ; 7E 12 3B | Rotate right (absolute,X)
	DEX				  ; CA | Decrement X register
	ORA #$C8			 ; 09 C8 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	PEA #$F21C		   ; F4 1C F2 | Push effective address to stack
	ASL $1FF1,X		  ; 1E F1 1F | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	BMI $9F			  ; 30 9F | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_081
; Address: $FE9A05
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_081:
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_082
; Address: $FE9A17
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_082:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SBC $0EF3,Y		  ; F9 F3 0E | Subtract with carry (absolute,Y)
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_083
; Address: $FE9A39
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_083:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 3F FF 3F | Load from absolute long,X into accumulator
	STA				  ; 9F A1 FB 0A | Store accumulator to absolute long,X
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ADC $E8FF			; 6D FF E8 | Add with carry (absolute)
	INY				  ; C8 | Increment Y register
	BEQ $DB			  ; F0 DB | Branch if equal
	SBC $1033			; ED 33 10 | Subtract with carry (absolute)
	BPL $92			  ; 10 92 | Branch if positive
	AND ($BF),Y		  ; 31 BF | Logical AND with accumulator ((zero page),Y)
	AND $AF			  ; 25 AF | Logical AND with accumulator (zero page)
	STX $820C			; 8E 0C 82 | Store X register to absolute address
	LDA $DFD7,X		  ; BD D7 DF | Load from absolute,X into accumulator
	STA				  ; 9F BF BF FF | Store accumulator to absolute long,X
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	AND $5A5E,Y		  ; 39 5E 5A | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BVS $78			  ; 70 78 | Branch if overflow set
	INX				  ; E8 | Increment X register
	BVS $E0			  ; 70 E0 | Game work RAM access
	BVS $E0			  ; 70 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $D0			  ; F0 D0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PEA #$FEFE		   ; F4 FE FE | Push effective address to stack
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	BEQ $D0			  ; F0 D0 | Branch if equal
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	ASL $060A			; 0E 0A 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_084
; Address: $FE9ABD
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_084:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	ADC $0F			  ; 65 0F | Add with carry (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	STZ $FF			  ; 64 FF | Store zero to zero page
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BCC $FE			  ; 90 FE | Branch if carry clear
	INC $FD78,X		  ; FE 78 FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $FDF8,X		  ; FD F8 FD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	BEQ $FA			  ; F0 FA | Branch if equal
	BEQ $FA			  ; F0 FA | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	STX $1E31			; 8E 31 1E | Store X register to absolute address
	ADC ($10,X)		  ; 61 10 | Add with carry ((zero page,X))
	ORA $0D63			; 0D 63 0D | Logical OR with accumulator (absolute)
	ORA $19C3,X		  ; 1D C3 19 | Logical OR with accumulator (absolute,X)
	LDA				  ; BF 7F BF 7F | Load from absolute long,X into accumulator
	LDX $BE7F,Y		  ; BE 7F BE | Load from absolute,Y into X register
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	INC $10FF,X		  ; FE FF 10 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SEP #$E8			 ; E2 E8 | Set processor status bits
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	PHX				  ; DA | Push X register to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $C3			  ; B0 C3 | Branch if carry set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_085
; Address: $FE9B4A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_085:
	JSR $20C3			; 20 C3 20 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $0F1F,X		  ; 9E 1F 0F | Store zero to absolute,X
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	ROR $7E7F,X		  ; 7E 7F 7E | Rotate right (absolute,X)
	INC $DCFF,X		  ; FE FF DC | Increment (absolute,X)
	SBC $FE			  ; E5 FE | Subtract with carry (zero page)
	ASL $3EC0,X		  ; 1E C0 3E | Arithmetic shift left (absolute,X)
	BRA $3E			  ; 80 3E | Branch always
	BRA $3E			  ; 80 3E | Branch always
	BRA $3E			  ; 80 3E | Branch always
	BRA $BE			  ; 80 BE | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_086
; Address: $FE9B6B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_086:
	DEY				  ; 88 | Decrement Y register
	LDX $3E88,Y		  ; BE 88 3E | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF C0 7F 80 | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	INC $FF09,X		  ; FE 09 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_088
; Address: $FE9BA5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_088:
	JSR $3008			; 20 08 30 | Jump to subroutine
	BIT $98			  ; 24 98 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STY $A482			; 8C 82 A4 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_089
; Address: $FE9BB0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_089:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	BEQ $80			  ; F0 80 | Branch if equal
	BVS $C0			  ; 70 C0 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	CPX #$5C			 ; E0 5C | Compare X register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	ASL $010F			; 0E 0F 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $F3FF,X		  ; FD FF F3 | Subtract with carry (absolute,X)
	REP #$FF			 ; C2 FF | Reset processor status bits
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_08A
; Address: $FE9C1F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_08A:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC $0080,X		  ; FD 80 00 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	REP #$40			 ; C2 40 | Reset processor status bits
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	SBC $FD33,X		  ; FD 33 FD | Subtract with carry (absolute,X)
	CMP $FBAF,Y		  ; D9 AF FB | Compare accumulator (absolute,Y)
	STA $07AE22		  ; 8F 22 AE 07 | Store accumulator to absolute long address
	ORA $86FF,X		  ; 1D FF 86 | Logical OR with accumulator (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($52),Y		  ; 71 52 | Add with carry ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF AF FF 67 | Load from absolute long,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$F0			 ; E2 F0 | Set processor status bits
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_08C
; Address: $FE9C7F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_08C:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $0103,Y		  ; F9 03 01 | Subtract with carry (absolute,Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_08F
; Address: $FE9CC1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_08F:
	LDA $3FDF5F		  ; AF 5F DF 3F | Load from absolute long address into accumulator
	LDA				  ; BF BF 7F 3F | Load from absolute long,X into accumulator
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	PLX				  ; FA | Pull X register from stack
	BEQ $F6			  ; F0 F6 | Branch if equal
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	SEP #$EF			 ; E2 EF | Set processor status bits
	SEP #$EF			 ; E2 EF | Set processor status bits
	SEP #$EF			 ; E2 EF | Set processor status bits
	DEC $DF			  ; C6 DF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ASL $0EC3			; 0E C3 0E | Arithmetic shift left (absolute)
	CMP $09			  ; C5 09 | Compare accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($F1),Y		  ; 11 F1 | Logical OR with accumulator ((zero page),Y)
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	WDM #$7E			 ; 42 7E | Reserved instruction

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_090
; Address: $FE9D0E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_090:
	JSR $7D3F			; 20 3F 7D | Jump to subroutine
	ROL $BEFF			; 2E FF BE | Rotate left (absolute)
	STA $CDFF,X		  ; 9D FF CD | Store accumulator to absolute,X
	ADC ($FD),Y		  ; 71 FD | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_092
; Address: $FE9D2E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_092:
	JSR $03A7			; 20 A7 03 | Jump to subroutine
	STX $FFFF			; 8E FF FF | Store X register to absolute address
	CMP $DDFF,X		  ; DD FF DD | Compare accumulator (absolute,X)
	DEC $01FF,X		  ; DE FF 01 | Decrement (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	STZ $7E43,X		  ; 9E 43 7E | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	ASL $3EF0,X		  ; 1E F0 3E | Arithmetic shift left (absolute,X)
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	SBC $73FF,Y		  ; F9 FF 73 | Subtract with carry (absolute,Y)
	INC $FEA3,X		  ; FE A3 FE | Increment (absolute,X)
	STA $F01FF8		  ; 8F F8 1F F0 | Store accumulator to absolute long address
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	LDY $BC18,X		  ; BC 18 BC | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_093
; Address: $FE9D6D
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_093:
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BEQ $FF			  ; F0 FF | Branch if equal
	ASL $0EFF,X		  ; 1E FF 0E | Arithmetic shift left (absolute,X)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CMP #$C2			 ; C9 C2 | Compare accumulator (immediate)
	CMP ($D2,X)		  ; C1 D2 | Compare accumulator ((zero page,X))
	CPY $D1			  ; C4 D1 | Compare Y register (zero page)
	CPY $D9			  ; C4 D9 | Compare Y register (zero page)
	CPY #$D9			 ; C0 D9 | Compare Y register (immediate)
	REP #$D8			 ; C2 D8 | Reset processor status bits
	REP #$DC			 ; C2 DC | Reset processor status bits
	REP #$DC			 ; C2 DC | Reset processor status bits
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $7F			  ; C6 7F | Decrement (zero page)
	CPY $7F			  ; C4 7F | Compare Y register (zero page)
	CPY $887F			; CC 7F 88 | Compare Y register (absolute)
	BRA $5F			  ; 80 5F | Branch always
	BRA $5F			  ; 80 5F | Branch always
	BRA $CF			  ; 80 CF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	AND $1BFF,X		  ; 3D FF 1B | Logical AND with accumulator (absolute,X)
	SBC $FE05,X		  ; FD 05 FE | Subtract with carry (absolute,X)
	ASL $33FF,X		  ; 1E FF 33 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_094
; Address: $FE9E11
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_094:
	JSR $04E7			; 20 E7 04 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	SBC $FC18,Y		  ; F9 18 FC | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	BRA $F5			  ; 80 F5 | Branch always
	BIT #$8A			 ; 89 8A | Test bits in accumulator (immediate)
	AND $57			  ; 25 57 | Logical AND with accumulator (zero page)
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_095
; Address: $FE9E29
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_095:
	STA ($77,X)		  ; 81 77 | Store accumulator to (zero page,X)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SBC $03FA,X		  ; FD FA 03 | Subtract with carry (absolute,X)
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$91			 ; E0 91 | Compare X register (immediate)
	BEQ $91			  ; F0 91 | Branch if equal
	SBC ($D1),Y		  ; F1 D1 | Subtract with carry ((zero page),Y)
	SBC ($8A),Y		  ; F1 8A | Subtract with carry ((zero page),Y)
	TSX				  ; BA | Transfer stack pointer to X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E0 5F F0 | Load from absolute long,X into accumulator
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	SBC ($6E),Y		  ; F1 6E | Subtract with carry ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $F966,X		  ; FE 66 F9 | Increment (absolute,X)
	ADC #$FE			 ; 69 FE | Add with carry (immediate)
	LSR $A0E0,X		  ; 5E E0 A0 | Logical shift right (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA				  ; 9F 91 DE 42 | Store accumulator to absolute long,X
	SBC $FF24,X		  ; FD 24 FF | Subtract with carry (absolute,X)
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	ASL $20E0,X		  ; 1E E0 20 | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_097
; Address: $FE9E92
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_097:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	DEC $DF			  ; C6 DF | Decrement (zero page)
	DEC $DF			  ; C6 DF | Decrement (zero page)
	DEC $DF			  ; C6 DF | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	LDA				  ; BF 00 BF 84 | Load from absolute long,X into accumulator
	STY $EF			  ; 84 EF | Store Y register to zero page
	REP #$F8			 ; C2 F8 | Reset processor status bits
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	SBC $FDC0,X		  ; FD C0 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_098
; Address: $FE9F03
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_098:
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	STA $FF1FDF		  ; 8F DF 1F FF | Store accumulator to absolute long address
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 0F 3F 0F | Store accumulator to absolute long,X
	DEC $90D1,X		  ; DE D1 90 | Decrement (absolute,X)
	SBC ($A0,X)		  ; E1 A0 | Subtract with carry ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	INC $F01F,X		  ; FE 1F F0 | Increment (absolute,X)
	ORA ($E0),Y		  ; 11 E0 | Game work RAM access
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ROR $00E4,X		  ; 7E E4 00 | Rotate right (absolute,X)
	SBC $F300,Y		  ; F9 00 F3 | Subtract with carry (absolute,Y)
	INC $00			  ; E6 00 | Increment (zero page)
	CMP $BF04,X		  ; DD 04 BF | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA $32			  ; 05 32 | Logical OR with accumulator (zero page)
	ADC ($0D,X)		  ; 61 0D | Add with carry ((zero page,X))
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX #$2C			 ; E0 2C | Compare X register (immediate)
	CPY $04FE			; CC FE 04 | Compare Y register (absolute)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_099
; Address: $FE9FD8
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_099:
	PEA #$F70F		   ; F4 0F F7 | Push effective address to stack
	INC $FFFA,X		  ; FE FA FF | Increment (absolute,X)
	ADC $CBDB,X		  ; 7D DB CB | Add with carry (absolute,X)
	BRA $07			  ; 80 07 | Branch always
	DEC $91			  ; C6 91 | Decrement (zero page)
	ORA ($3C),Y		  ; 11 3C | Logical OR with accumulator ((zero page),Y)
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	BRA $DF			  ; 80 DF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	PLX				  ; FA | Pull X register from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PLX				  ; FA | Pull X register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	LSR $DE			  ; 46 DE | Logical shift right (zero page)
	ADC $FD			  ; 65 FD | Add with carry (zero page)
	SBC $DD			  ; E5 DD | Subtract with carry (zero page)
	DEC $DC			  ; C6 DC | Decrement (zero page)
	LDX $AEFA			; AE FA AE | Load from absolute address into X register
	PLX				  ; FA | Pull X register from stack
	INC $EEFA			; EE FA EE | Increment (absolute)
	PLX				  ; FA | Pull X register from stack
	INC $BD97,X		  ; FE 97 BD | Increment (absolute,X)
	AND $1CF7,X		  ; 3D F7 1C | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $18			  ; 66 18 | Rotate right (zero page)
	PHY				  ; 5A | Push Y register to stack
	BIT $BD			  ; 24 BD | Test bits in accumulator (zero page)
	WDM #$BD			 ; 42 BD | Reserved instruction
	WDM #$5A			 ; 42 5A | Reserved instruction
	BIT $66			  ; 24 66 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_09A
; Address: $FEA064
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_09A:
	JSL $3E411C		  ; 22 1C 41 3E | Jump to subroutine long
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_09B
; Address: $FEA06C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_09B:
	JSL $3EC0DD		  ; 22 DD C0 3E | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_09E
; Address: $FEA094
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_09E:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $2F			  ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_09F
; Address: $FEA0A2
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_09F:
	JSR $005F			; 20 5F 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	BRA $7E			  ; 80 7E | Branch always
	INC $0021,X		  ; FE 21 00 | Increment (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A0
; Address: $FEA10E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A0:
	JSL $00001C		  ; 22 1C 00 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	PHB				  ; 8B | Push data bank register to stack
	CPX $27			  ; E4 27 | Compare X register (zero page)
	CPY $4F			  ; C4 4F | Compare Y register (zero page)
	BIT #$8F			 ; 89 8F | Test bits in accumulator (immediate)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ROR $FA07,X		  ; 7E 07 FA | Rotate right (absolute,X)
	PEA #$E41F		   ; F4 1F E4 | Push effective address to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A1
; Address: $FEA13B
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A1:
	DEY				  ; 88 | Decrement Y register
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPY $8CE3			; CC E3 8C | Compare Y register (absolute)
	CPY #$99			 ; C0 99 | Compare Y register (immediate)
	DEC $99			  ; C6 99 | Decrement (zero page)
	STX $19			  ; 86 19 | Store X register to zero page
	STA $0133			; 8D 33 01 | Store accumulator to absolute address
	ORA $F733			; 0D 33 F7 | Logical OR with accumulator (absolute)
	DEC $DE3F,X		  ; DE 3F DE | Decrement (absolute,X)
	DEC $FF3F,X		  ; DE 3F FF | Decrement (absolute,X)
	CPY $7F			  ; C4 7F | Compare Y register (zero page)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	LDA				  ; BF 95 DF C0 | Load from absolute long,X into accumulator
	CPX $80			  ; E4 80 | Compare X register (zero page)
	BRA $4E			  ; 80 4E | Branch always
	BRA $7B			  ; 80 7B | Branch always
	BRA $3F			  ; 80 3F | Branch always
	BRA $6A			  ; 80 6A | Branch always
	BRA $4A			  ; 80 4A | Branch always
	BRA $A7			  ; 80 A7 | Branch always
	SBC $BC			  ; E5 BC | Subtract with carry (zero page)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	CPX $BC			  ; E4 BC | Compare X register (zero page)
	BIT #$38			 ; 89 38 | Test bits in accumulator (immediate)
	EOR #$78			 ; 49 78 | Exclusive OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	LDA $38EF38		  ; AF 38 EF 38 | Load from absolute long address into accumulator
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	LDY $D724			; AC 24 D7 | Load from absolute address into Y register
	PLX				  ; FA | Pull X register from stack
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A2
; Address: $FEA1DA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A2:
	PEA #$FA2C		   ; F4 2C FA | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $0C12			; 0D 12 0C | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $7E			  ; 80 7E | Branch always
	BRA $7E			  ; 80 7E | Branch always
	PLX				  ; FA | Pull X register from stack
	BIT $DA			  ; 24 DA | Test bits in accumulator (zero page)
	BMI $CC			  ; 30 CC | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $78			  ; 84 78 | Store Y register to zero page
	STY $02			  ; 84 02 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A3
; Address: $FEA244
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A3:
	JSR $245F			; 20 5F 24 | Jump to subroutine
	BIT $5B			  ; 24 5B | Test bits in accumulator (zero page)
	BIT $2A53			; 2C 53 2A | Test bits in accumulator (absolute)
	AND $4042,X		  ; 3D 42 40 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A4
; Address: $FEA26D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A4:
	JSR $A040			; 20 40 A0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A6
; Address: $FEA27A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A6:
	JSR $2000			; 20 00 20 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A7
; Address: $FEA2A0
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A7:
	RTI				  ; 40 | Return from interrupt
	LDX $FE00,Y		  ; BE 00 FE | Load from absolute,Y into X register
	BRA $7E			  ; 80 7E | Branch always
	BRA $7E			  ; 80 7E | Branch always
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	BMI $CC			  ; 30 CC | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 64 9B 24 | Load from absolute long,X into accumulator
	BIT $3A53			; 2C 53 3A | Test bits in accumulator (absolute)
	EOR $3D			  ; 45 3D | Exclusive OR with accumulator (zero page)
	WDM #$1C			 ; 42 1C | Reserved instruction
	ASL $8021,X		  ; 1E 21 80 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0A8
; Address: $FEA2E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0A8:
	JSR $A040			; 20 40 A0 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0AC
; Address: $FEA2FC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0AC:
	JSR $4000			; 20 00 40 | Jump to subroutine
	JMP $9030			; 4C 30 90 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0AD
; Address: $FEA304
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0AD:
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA $7AFF,X		  ; 1D FF 7A | Logical OR with accumulator (absolute,X)
	STA				  ; 9F FF BF FF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0AE
; Address: $FEA331
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0AE:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	SBC $FDFC,X		  ; FD FC FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0AF
; Address: $FEA347
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0AF:
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	BEQ $FA			  ; F0 FA | Branch if equal
	BEQ $F6			  ; F0 F6 | Branch if equal
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	LDY $BC7F,X		  ; BC 7F BC | Load from absolute,X into Y register
	LDY $787F,X		  ; BC 7F 78 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDX $FEBE,Y		  ; BE BE FE | Load from absolute,Y into X register
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	INC $FEFA,X		  ; FE FA FE | Increment (absolute,X)
	SBC $41FD,Y		  ; F9 FD 41 | Subtract with carry (absolute,Y)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	SBC ($02),Y		  ; F1 02 | Subtract with carry ((zero page),Y)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STY $94B8			; 8C B8 94 | Store Y register to absolute address
	BEQ $16			  ; F0 16 | Branch if equal
	BVS $96			  ; 70 96 | Branch if overflow set
	BEQ $96			  ; F0 96 | Branch if equal
	BEQ $27			  ; F0 27 | Branch if equal
	CPX #$27			 ; E0 27 | Compare X register (immediate)
	SEP #$27			 ; E2 27 | Set processor status bits
	SEP #$6F			 ; E2 6F | Set processor status bits
	SEC				  ; 38 | Set carry flag
	BEQ $DF			  ; F0 DF | Branch if equal
	BEQ $5F			  ; F0 5F | Branch if equal
	BEQ $5F			  ; F0 5F | Branch if equal
	BEQ $BF			  ; F0 BF | Branch if equal
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	BVS $FF			  ; 70 FF | Branch if overflow set
	ROL $3FFF,X		  ; 3E FF 3F | Rotate left (absolute,X)
	INC $FF05,X		  ; FE 05 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B1
; Address: $FEA3E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B1:
	PHA				  ; 48 | Push accumulator to stack
	BMI $A4			  ; 30 A4 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	REP #$8C			 ; C2 8C | Reset processor status bits
	STY $D1			  ; 84 D1 | Store Y register to zero page
	DEC $C9			  ; C6 C9 | Decrement (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B2
; Address: $FEA3F3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B2:
	BEQ $80			  ; F0 80 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	ORA $0D12			; 0D 12 0D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B4
; Address: $FEA409
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B4:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B6
; Address: $FEA418
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B6:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $08			  ; 80 08 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B7
; Address: $FEA438
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B7:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $1721,X		  ; 1E 21 17 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $2F			  ; 50 2F | Branch if overflow clear
	BVC $23			  ; 50 23 | Branch if overflow clear
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B8
; Address: $FEA454
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B8:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0B9
; Address: $FEA46F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0B9:
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $0C12			; 0D 12 0C | Logical OR with accumulator (absolute)
	ORA $1D22,X		  ; 1D 22 1D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0BA
; Address: $FEA489
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0BA:
	JSL $3F201F		  ; 22 1F 20 3F | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0BC
; Address: $FEA49A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0BC:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $70			  ; 84 70 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $04			  ; 80 04 | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0BD
; Address: $FEA4BA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0BD:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $2F			  ; 50 2F | Branch if overflow clear
	BVC $2F			  ; 50 2F | Branch if overflow clear
	BVC $20			  ; 50 20 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0BE
; Address: $FEA4E9
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0BE:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 7F 3F FF | Store accumulator to absolute long,X
	PEA #$F8FF		   ; F4 FF F8 | Push effective address to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	SBC $FFF8,X		  ; FD F8 FF | Subtract with carry (absolute,X)
	INC $DEC0			; EE C0 DE | Increment (absolute)
	BRA $BC			  ; 80 BC | Branch always
	BPL $FC			  ; 10 FC | Branch if positive
	BMI $F4			  ; 30 F4 | Branch if negative
	BVS $F4			  ; 70 F4 | Branch if overflow set
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA $14CF,Y		  ; 19 CF 14 | Logical OR with accumulator (absolute,Y)
	BIT $E4			  ; 24 E4 | Test bits in accumulator (zero page)
	BIT $E4			  ; 24 E4 | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0BF
; Address: $FEA580
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0BF:
	BEQ $F9			  ; F0 F9 | Branch if equal
	CPY $F5			  ; C4 F5 | Compare Y register (zero page)
	SBC $90			  ; E5 90 | Subtract with carry (zero page)
	BCC $93			  ; 90 93 | Branch if carry clear
	STA ($97),Y		  ; 91 97 | Store accumulator to (zero page),Y
	STA ($9F),Y		  ; 91 9F | Store accumulator to (zero page),Y
	LDX $FF0F,Y		  ; BE 0F FF | Load from absolute,Y into X register
	ROR $6EFF			; 6E FF 6E | Rotate right (absolute)
	ADC $69FF			; 6D FF 69 | Add with carry (absolute)
	INC $C247,X		  ; FE 47 C2 | Increment (absolute,X)
	REP #$4F			 ; C2 4F | Reset processor status bits
	DEC $AF			  ; C6 AF | Decrement (zero page)
	STX $AF			  ; 86 AF | Store X register to zero page
	STX $5F			  ; 86 5F | Store X register to zero page
	ASL $0E5F			; 0E 5F 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C0
; Address: $FEA5AF
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C0:
	ASL $C07F			; 0E 7F C0 | Arithmetic shift left (absolute)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ASL $047F			; 0E 7F 04 | Arithmetic shift left (absolute)
	ORA ($7B,X)		  ; 01 7B | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY $D9			  ; C4 D9 | Compare Y register (zero page)
	CPY $D9			  ; C4 D9 | Compare Y register (zero page)
	CPY $D9			  ; C4 D9 | Compare Y register (zero page)
	REP #$DC			 ; C2 DC | Reset processor status bits
	DEC $D2DC			; CE DC D2 | Decrement (absolute)
	BNE $D2			  ; D0 D2 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $13			  ; F0 13 | Branch if equal
	BEQ $13			  ; F0 13 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	ASL $1C61,X		  ; 1E 61 1C | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C1
; Address: $FEA623
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C1:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	ASL $1E01,X		  ; 1E 01 1E | Arithmetic shift left (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C2
; Address: $FEA632
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C2:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C3
; Address: $FEA669
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C3:
	STA				  ; 9F FF 3F FF | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CPX $ECE0			; EC E0 EC | Compare X register (absolute)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	SEP #$FB			 ; E2 FB | Set processor status bits
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C4
; Address: $FEA6C2
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C4:
	JSR $1F3F			; 20 3F 1F | Jump to subroutine
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	ORA $FC			  ; 05 FC | Logical OR with accumulator (zero page)
	BEQ $DF			  ; F0 DF | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	INC $FD08,X		  ; FE 08 FD | Increment (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDA				  ; BF 1E BF 1E | Load from absolute long,X into accumulator
	ROL $3E7F,X		  ; 3E 7F 3E | Rotate left (absolute,X)
	INC $FE7E,X		  ; FE 7E FE | Increment (absolute,X)
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 0F 3F 0F | Store accumulator to absolute long,X
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C5
; Address: $FEA760
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C5:
	JSR $7020			; 20 20 70 | Jump to subroutine
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $11			  ; F0 11 | Branch if equal
	SBC #$33			 ; E9 33 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C6
; Address: $FEA76B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C6:
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	ORA $0026,Y		  ; 19 26 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C8
; Address: $FEA775
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C8:
	BEQ $90			  ; F0 90 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	ORA ($89,X)		  ; 01 89 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0C9
; Address: $FEA77E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0C9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BCC $50			  ; 90 50 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0CB
; Address: $FEA7CA
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0CB:
	INX				  ; E8 | Increment X register
	BPL $E8			  ; 10 E8 | Branch if positive
	BPL $F4			  ; 10 F4 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $FDFF,Y		  ; F9 FF FD | Subtract with carry (absolute,Y)
	INC $1F3F,X		  ; FE 3F 1F | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA $FFFFFF		  ; 8F FF FF FF | Store accumulator to absolute long address
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FAFE,X		  ; FE FE FA | Increment (absolute,X)
	PEA #$E8F9		   ; F4 F9 E8 | Push effective address to stack
	BNE $FF			  ; D0 FF | Branch if not equal
	LDA				  ; BF C0 C0 00 | Load from absolute long,X into accumulator
	INC $F009,X		  ; FE 09 F0 | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0CC
; Address: $FEA882
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0CC:
	SED				  ; F8 | Set decimal mode flag
	BVS $17			  ; 70 17 | Branch if overflow set
	ASL $3FC0			; 0E C0 3F | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA $FF0F,Y		  ; 19 0F FF | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F FF 7F 7F | Store accumulator to absolute long,X
	ASL $1E31			; 0E 31 1E | Arithmetic shift left (absolute)
	AND ($1D,X)		  ; 21 1D | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0CD
; Address: $FEA8A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0CD:
	JSL $07221D		  ; 22 1D 22 07 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0CF
; Address: $FEA8B6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0CF:
	JSR $1800			; 20 00 18 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	BEQ $09			  ; F0 09 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BVS $8C			  ; 70 8C | Branch if overflow set
	BVS $30			  ; 70 30 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $7000			; 8C 00 70 | Store Y register to absolute address
	BPL $17			  ; 10 17 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PEA #$E808		   ; F4 08 E8 | Push effective address to stack
	BPL $E8			  ; 10 E8 | Branch if positive
	BPL $90			  ; 10 90 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D1
; Address: $FEA909
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D1:
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $E406,Y		  ; 19 06 E4 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BPL $A0			  ; 10 A0 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D2
; Address: $FEA94C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D2:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $6404,Y		  ; 19 04 64 | Logical OR with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	AND $C406,Y		  ; 39 06 C4 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D3
; Address: $FEA98A
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D3:
	JSR $0040			; 20 40 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FE04,X		  ; FD 04 FE | Subtract with carry (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	INC $FF05,X		  ; FE 05 FF | Increment (absolute,X)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	BPL $A4			  ; 10 A4 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	REP #$8C			 ; C2 8C | Reset processor status bits
	CPY $E1			  ; C4 E1 | Compare Y register (zero page)
	INC $E9			  ; E6 E9 | Increment (zero page)
	SEP #$E9			 ; E2 E9 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	BEQ $80			  ; F0 80 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BPL $2F			  ; 10 2F | Branch if positive
	BPL $5F			  ; 10 5F | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D4
; Address: $FEA9ED
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D4:
	JSR $205F			; 20 5F 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	INY				  ; C8 | Increment Y register
	BMI $F4			  ; 30 F4 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PEA #$FA08		   ; F4 08 FA | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D5
; Address: $FEAA1D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D5:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D6
; Address: $FEAA2D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D6:
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $0068,X		  ; 1E 68 00 | Arithmetic shift left (absolute,X)
	BCC $40			  ; 90 40 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D7
; Address: $FEAA64
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D7:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	BMI $31			  ; 30 31 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D8
; Address: $FEAAC2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D8:
	JSR $8040			; 20 40 80 | Jump to subroutine
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 BF 00 | Store accumulator to absolute long,X
	LDA				  ; BF 00 FF FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0D9
; Address: $FEAAF1
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0D9:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF BF FF | Store accumulator to absolute long,X
	LDA				  ; BF FF FF 9F | Load from absolute long,X into accumulator
	STA				  ; 9F 02 9F 02 | Store accumulator to absolute long,X
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	STA $BF00,X		  ; 9D 00 BF | Store accumulator to absolute,X
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC #$E2			 ; E9 E2 | Subtract with carry (immediate)
	SBC #$E0			 ; E9 E0 | Game work RAM access
	SBC $E8			  ; E5 E8 | Subtract with carry (zero page)
	SBC $E8			  ; E5 E8 | Subtract with carry (zero page)
	SBC $E5E8			; ED E8 E5 | Subtract with carry (absolute)
	CPY #$D5			 ; C0 D5 | Compare Y register (immediate)
	BNE $C5			  ; D0 C5 | Branch if not equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $17			  ; F0 17 | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0DA
; Address: $FEAB41
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0DA:
	JSR $205F			; 20 5F 20 | Jump to subroutine
	BPL $2F			  ; 10 2F | Branch if positive
	BPL $13			  ; 10 13 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	PEA #$F408		   ; F4 08 F4 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BMI $0F			  ; 30 0F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0DB
; Address: $FEABDC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0DB:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $0F			  ; 70 0F | Branch if overflow set
	BRA $7F			  ; 80 7F | Branch always
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0302			; 0D 02 03 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0303			; 0D 03 03 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	STA ($FD,X)		  ; 81 FD | Store accumulator to (zero page,X)
	SBC $F287,Y		  ; F9 87 F2 | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0DC
; Address: $FEAC4E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0DC:
	AND $FF20			; 2D 20 FF | Logical AND with accumulator (absolute)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $7F			  ; F0 7F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0DD
; Address: $FEAC5F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0DD:
	JSR $0010			; 20 10 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	SBC $F287,Y		  ; F9 87 F2 | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0DE
; Address: $FEACAE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0DE:
	AND $FF20			; 2D 20 FF | Logical AND with accumulator (absolute)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $7F			  ; F0 7F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0DF
; Address: $FEACBF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0DF:
	JSR $013B			; 20 3B 01 | Jump to subroutine
	STA $0E1F07		  ; 8F 07 1F 0E | Store accumulator to absolute long address
	ASL $3FFF,X		  ; 1E FF 3F | Arithmetic shift left (absolute,X)
	CMP $C2			  ; C5 C2 | Compare accumulator (zero page)
	REP #$80			 ; C2 80 | Reset processor status bits
	REP #$80			 ; C2 80 | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0E0
; Address: $FEACF4
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0E0:
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $0F			  ; 70 0F | Branch if overflow set
	BRA $7F			  ; 80 7F | Branch always
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	ASL $3FC0			; 0E C0 3F | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA $FF0F,Y		  ; 19 0F FF | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F FF 7F 7F | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0E1
; Address: $FEADE0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0E1:
	JSR $471F			; 20 1F 47 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 60 3F C0 | Store accumulator to absolute long,X
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0E3
; Address: $FEAE0A
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0E3:
	STA				  ; 9F 60 9F 60 | Store accumulator to absolute long,X
	STA				  ; 9F 60 07 07 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STA $708F70		  ; 8F 70 8F 70 | Store accumulator to absolute long address
	STA $708F70		  ; 8F 70 8F 70 | Store accumulator to absolute long address
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	BEQ $10			  ; F0 10 | Branch if equal
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	JMP $0F00F0		  ; 5C F0 00 0F | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	STY $80			  ; 84 80 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	AND #$56			 ; 29 56 | Logical AND with accumulator (immediate)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	REP #$3D			 ; C2 3D | Reset processor status bits
	PHY				  ; 5A | Push Y register to stack
	LDA $85			  ; A5 85 | Load from zero page into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	PLY				  ; 7A | Pull Y register from stack
	BMI $74			  ; 30 74 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0E5
; Address: $FEAEE0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0E5:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0E8
; Address: $FEAF00
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0E8:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0E9
; Address: $FEAF72
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0E9:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0EA
; Address: $FEAF83
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0EA:
	JSR $1807			; 20 07 18 | Jump to subroutine
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0EB
; Address: $FEAF92
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0EB:
	JSR $1000			; 20 00 10 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $0C			  ; F0 0C | Branch if equal
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX $FA04			; EC 04 FA | Compare X register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	STA $FE			  ; 85 FE | Store accumulator to zero page
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0EC
; Address: $FEB066
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0EC:
	BRA $70			  ; 80 70 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0ED
; Address: $FEB098
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0ED:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $48			  ; B0 48 | Branch if carry set
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0EE
; Address: $FEB0AD
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0EE:
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $EE0E			; EC 0E EE | Compare X register (absolute)
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0EF
; Address: $FEB12F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0EF:
	PEA #$001C		   ; F4 1C 00 | Push effective address to stack
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F0
; Address: $FEB152
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F0:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BNE $28			  ; D0 28 | Branch if not equal
	BNE $28			  ; D0 28 | Branch if not equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F1
; Address: $FEB18F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F1:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F2
; Address: $FEB1AA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F2:
	BRA $70			  ; 80 70 | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	BMI $90			  ; 30 90 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $71EC,X		  ; 9E EC 71 | Store zero to absolute,X
	LDA ($C1),Y		  ; B1 C1 | Load from (zero page),Y into accumulator
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	CPX #$9D			 ; E0 9D | Compare X register (immediate)
	BPL $DD			  ; 10 DD | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $B61E			; EE 1E B6 | Increment (absolute)
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F3
; Address: $FEB1FC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F3:
	AND $38FB,Y		  ; 39 FB 38 | Logical AND with accumulator (absolute,Y)
	CMP ($21,X)		  ; C1 21 | PPU graphics register access
	CMP ($11,X)		  ; C1 11 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $4F			  ; 06 4F | Arithmetic shift left (zero page)
	ORA $323F			; 0D 3F 32 | Logical OR with accumulator (absolute)
	STZ $FE			  ; 64 FE | Store zero to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $F1FF,Y		  ; F9 FF F1 | Subtract with carry (absolute,Y)
	REP #$FF			 ; C2 FF | Reset processor status bits
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F4
; Address: $FEB21F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F4:
	JSR $0007			; 20 07 00 | Jump to subroutine
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0D11			; 0E 11 0D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F7
; Address: $FEB22F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F7:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0F9
; Address: $FEB23E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0F9:
	JSR $0800			; 20 00 08 | Jump to subroutine
	PEA #$E810		   ; F4 10 E8 | Push effective address to stack
	BMI $C8			  ; 30 C8 | Branch if negative
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0FA
; Address: $FEB258
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0FA:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $2F			  ; 10 2F | Branch if positive
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0FB
; Address: $FEB27A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0FB:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PEA #$3DC2		   ; F4 C2 3D | Push effective address to stack
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $0E0E			; EC 0E 0E | Compare X register (absolute)
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	INC $9B04,X		  ; FE 04 9B | Increment (absolute,X)
	WDM #$C7			 ; 42 C7 | Reserved instruction

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0FC
; Address: $FEB2B0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0FC:
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	AND $1CFF,X		  ; 3D FF 1C | Logical AND with accumulator (absolute,X)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0FD
; Address: $FEB2E2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0FD:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BPL $30			  ; 10 30 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_0FE
; Address: $FEB2EA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_0FE:
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $D0			  ; F0 D0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_100
; Address: $FEB2F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_100:
	JSR $2078			; 20 78 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	BPL $F8			  ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_101
; Address: $FEB2FD
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_101:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	SBC $FAFB,X		  ; FD FB FA | Subtract with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $BE			  ; 80 BE | Branch always
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	LDY $00DC,X		  ; BC DC 00 | Load from absolute,X into Y register
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA $0BF7			; 0D F7 0B | Logical OR with accumulator (absolute)
	SBC $FB05,X		  ; FD 05 FB | Subtract with carry (absolute,X)
	LDA $07EF87		  ; AF 87 EF 07 | Load from absolute long address into accumulator
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $F807,X		  ; FD 07 F8 | Subtract with carry (absolute,X)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_102
; Address: $FEB359
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_102:
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	LDY $D81C,X		  ; BC 1C D8 | Load from absolute,X into Y register
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	REP #$C2			 ; C2 C2 | Reset processor status bits
	CPX $24			  ; E4 24 | Compare X register (zero page)
	PEA #$F814		   ; F4 14 F8 | Push effective address to stack
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	STX $4E			  ; 86 4E | Store X register to zero page
	AND $F0FB,Y		  ; 39 FB F0 | Logical AND with accumulator (absolute,Y)
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	LDY $FC04,X		  ; BC 04 FC | Load from absolute,X into Y register
	AND ($DF),Y		  ; 31 DF | Logical AND with accumulator ((zero page),Y)
	REP #$FC			 ; C2 FC | Reset processor status bits
	CPX $F0B3			; EC B3 F0 | Compare X register (absolute)
	LDA $E1F8E0		  ; AF E0 F8 E1 | Load from absolute long address into accumulator
	LDX $81			  ; A6 81 | Load from zero page into X register
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $0708			; 0D 08 07 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $7F00			; 0E 00 7F | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $01			  ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_103
; Address: $FEB3F2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_103:
	ASL $7000			; 0E 00 70 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	INX				  ; E8 | Increment X register
	BMI $C8			  ; 30 C8 | Branch if negative
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_104
; Address: $FEB41C
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_104:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BMI $4F			  ; 30 4F | Branch if negative
	AND $100F			; 2D 0F 10 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	BIT $1000			; 2C 00 10 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCS $10			  ; B0 10 | Branch if carry set
	INX				  ; E8 | Increment X register
	BNE $28			  ; D0 28 | Branch if not equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA $3F3F4F		  ; 8F 4F 3F 3F | Store accumulator to absolute long address
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	NOP				  ; EA | No operation
	CPX $D8			  ; E4 D8 | Compare X register (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA $12			  ; A5 12 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	CMP ($CC,X)		  ; C1 CC | Compare accumulator ((zero page,X))
	CPY $BE			  ; C4 BE | Compare Y register (zero page)
	BPL $BF			  ; 10 BF | Branch if positive
	AND $797D,Y		  ; 39 7D 79 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_105
; Address: $FEB49F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_105:
	AND ($8F),Y		  ; 31 8F | Logical AND with accumulator ((zero page),Y)
	STX $D89F			; 8E 9F D8 | Store X register to absolute address
	SBC ($BF,X)		  ; E1 BF | Subtract with carry ((zero page,X))
	LDA				  ; BF AC F7 F0 | Load from absolute long,X into accumulator
	SBC ($E6),Y		  ; F1 E6 | Subtract with carry ((zero page),Y)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	DEC $E87F			; CE 7F E8 | Decrement (absolute)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_106
; Address: $FEB4BD
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_106:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SBC $DBFC,X		  ; FD FC DB | Subtract with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	STA $1E5C,X		  ; 9D 5C 1E | Store accumulator to absolute,X
	ROL $DB2E			; 2E 2E DB | Rotate left (absolute)
	INC				  ; 1A | Increment accumulator
	SED				  ; F8 | Set decimal mode flag
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	CPY $F7			  ; C4 F7 | Compare Y register (zero page)
	REP #$F7			 ; C2 F7 | Reset processor status bits
	SBC $03			  ; E5 03 | Subtract with carry (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_108
; Address: $FEB504
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_108:
	STA $3707E1		  ; 8F E1 07 37 | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $F7			  ; F0 F7 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LSR $8FFF			; 4E FF 8F | Logical shift right (absolute)
	STA $9BFF,X		  ; 9D FF 9B | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_109
; Address: $FEB52C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_109:
	INC $FE8E,X		  ; FE 8E FE | Increment (absolute,X)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $F909,Y		  ; F9 09 F9 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SBC $E808,Y		  ; F9 08 E8 | Subtract with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BNE $D0			  ; D0 D0 | Branch if not equal
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_10B
; Address: $FEB54C
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_10B:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BVS $50			  ; 70 50 | Branch if overflow set
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	INC $8E6E			; EE 6E 8E | Increment (absolute)
	INC $CFF2,X		  ; FE F2 CF | Increment (absolute,X)
	STA $ECBE62		  ; 8F 62 BE EC | Store accumulator to absolute long address
	LDA $3931,X		  ; BD 31 39 | Load from absolute,X into accumulator
	AND ($08),Y		  ; 31 08 | Logical AND with accumulator ((zero page),Y)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ORA #$2D			 ; 09 2D | Logical OR with accumulator (immediate)
	AND $2B			  ; 25 2B | Logical AND with accumulator (zero page)
	ASL $4CC6			; 0E C6 4C | Arithmetic shift left (absolute)
	CPY $5C64			; CC 64 5C | Compare Y register (absolute)
	BNE $B0			  ; D0 B0 | Branch if not equal
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	TSX				  ; BA | Transfer stack pointer to X register
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_10C
; Address: $FEB599
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_10C:
	BRA $00			  ; 80 00 | Branch always
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	ORA ($3D),Y		  ; 11 3D | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_10E
; Address: $FEB5AF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_10E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_10F
; Address: $FEB5BE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_10F:
	JSR $0E00			; 20 00 0E | Jump to subroutine
	SBC ($1C),Y		  ; F1 1C | Subtract with carry ((zero page),Y)
	SEP #$38			 ; E2 38 | Set processor status bits
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0718			; 0D 18 07 | Logical OR with accumulator (absolute)
	BPL $2F			  ; 10 2F | Branch if positive
	AND $4738			; 2D 38 47 | Logical AND with accumulator (absolute)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_110
; Address: $FEB5F6
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_110:
	JSR $2100			; 20 00 21 | PPU graphics register access
	PLP				  ; 28 | Pull processor status from stack
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	DEC $38			  ; C6 38 | Decrement (zero page)
	ROR $0680,X		  ; 7E 80 06 | Rotate right (absolute,X)
	SBC $6E90,Y		  ; F9 90 6E | Subtract with carry (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $0600,Y		  ; 19 00 06 | Logical OR with accumulator (absolute,Y)
	STA $FD			  ; 85 FD | Store accumulator to zero page
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	LDA $EBEFF3		  ; AF F3 EF EB | Load from absolute long address into accumulator
	SBC $FBF7,Y		  ; F9 F7 FB | Subtract with carry (absolute,Y)
	ROL $0703,X		  ; 3E 03 07 | Rotate left (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($E6),Y		  ; F1 E6 | Subtract with carry ((zero page),Y)
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	INC $E4			  ; E6 E4 | Increment (zero page)
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	LDA				  ; BF 1F BF 1F | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_111
; Address: $FEB659
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_111:
	ASL $383A,X		  ; 1E 3A 38 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_112
; Address: $FEB65F
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_112:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC $FDF4,X		  ; FD F4 FD | Subtract with carry (absolute,X)
	INC $D6DC,X		  ; FE DC D6 | Increment (absolute,X)
	CMP $EDCE,X		  ; DD CE ED | Compare accumulator (absolute,X)
	INC $7AFD			; EE FD 7A | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $0F8E,X		  ; FD 8E 0F | Subtract with carry (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	SEP #$18			 ; E2 18 | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FD0E,X		  ; FE 0E FD | Increment (absolute,X)
	ORA $233F			; 0D 3F 23 | Logical OR with accumulator (absolute)
	ASL $3A1D,X		  ; 1E 1D 3A | Arithmetic shift left (absolute,X)
	ORA #$B9			 ; 09 B9 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDY $FC04,X		  ; BC 04 FC | Load from absolute,X into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $23FF			; 0D FF 23 | Logical OR with accumulator (absolute)
	INC $FF09,X		  ; FE 09 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVC $20			  ; 50 20 | Branch if overflow clear
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_113
; Address: $FEB6F6
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_113:
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $10			  ; 70 10 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	TAX				  ; AA | Transfer accumulator to X register
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ORA $221D,X		  ; 1D 1D 22 | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	AND $05			  ; 25 05 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $2000,Y		  ; 19 00 20 | Logical OR with accumulator (absolute,Y)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $CF			  ; 30 CF | Branch if negative
	ADC #$E0			 ; 69 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ASL $9C0C,X		  ; 1E 0C 9C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BRA $00			  ; 80 00 | Branch always
	PLX				  ; FA | Pull X register from stack
	LSR $DD31,X		  ; 5E 31 DD | Logical shift right (absolute,X)
	STZ $5CD0,X		  ; 9E D0 5C | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_114
; Address: $FEB76E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_114:
	JSR $0538			; 20 38 05 | Jump to subroutine
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$24			 ; E0 24 | Compare X register (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	BCS $C8			  ; B0 C8 | Branch if carry set
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_115
; Address: $FEB790
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_115:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPY #$10			 ; C0 10 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_116
; Address: $FEB7B4
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_116:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	SBC $FDF6,X		  ; FD F6 FD | Subtract with carry (absolute,X)
	INC $76FC,X		  ; FE FC 76 | Increment (absolute,X)
	LDX $ED			  ; A6 ED | Load from zero page into X register
	ASL $FEFD			; 0E FD FE | Arithmetic shift left (absolute)
	LDA $F4BE,X		  ; BD BE F4 | Load from absolute,X into accumulator
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$E406		   ; F4 06 E4 | Push effective address to stack
	ORA $CE			  ; 05 CE | Logical OR with accumulator (zero page)
	STA				  ; 9F 01 BC 00 | Store accumulator to absolute long,X
	LDA				  ; BF 0F 7F 1F | Load from absolute long,X into accumulator
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BPL $14			  ; 10 14 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $05			  ; 84 05 | Store Y register to zero page
	WDM #$C2			 ; 42 C2 | Reserved instruction
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	BMI $F0			  ; 30 F0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	INC $38C0			; EE C0 38 | Increment (absolute)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_117
; Address: $FEB834
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_117:
	BEQ $8E			  ; F0 8E | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF31,X		  ; FE 31 FF | Increment (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_119
; Address: $FEB84E
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_119:
	ROL $18			  ; 26 18 | Rotate left (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	SBC $F9FE,X		  ; FD FE F9 | Subtract with carry (absolute,X)
	INC $FCFB,X		  ; FE FB FC | Increment (absolute,X)
	INC $F9E5,X		  ; FE E5 F9 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $48			  ; F0 48 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA $1EFF			; 0D FF 1E | Logical OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	ROR $0F			  ; 66 0F | Rotate right (zero page)
	CPX $F8D7			; EC D7 F8 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $4F			  ; F0 4F | Branch if equal
	BEQ $DF			  ; F0 DF | Branch if equal
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FDFC,Y		  ; F9 FC FD | Subtract with carry (absolute,Y)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	STA $02			  ; 85 02 | Store accumulator to zero page
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $8F			  ; F0 8F | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_11A
; Address: $FEB8F6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_11A:
	INC $FFE1,X		  ; FE E1 FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	BPL $44			  ; 10 44 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_11B
; Address: $FEB90E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_11B:
	JSL $800004		  ; 22 04 00 80 | Jump to subroutine long
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $7C			  ; 80 7C | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	EOR $44			  ; 45 44 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	SBC $03F8,Y		  ; F9 F8 03 | Subtract with carry (absolute,Y)
	ASL $BB08,X		  ; 1E 08 BB | Arithmetic shift left (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	LDY $E1FF,X		  ; BC FF E1 | Load from absolute,X into Y register
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	CPY $9C1E			; CC 1E 9C | Compare Y register (absolute)
	ASL $3E18,X		  ; 1E 18 3E | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDA $7D18,X		  ; BD 18 7D | Load from absolute,X into accumulator
	BMI $7F			  ; 30 7F | Branch if negative
	BMI $FB			  ; 30 FB | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_11C
; Address: $FEB951
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_11C:
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	STX $3E			  ; 86 3E | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	BCC $30			  ; 90 30 | Branch if carry clear
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ADC $3EFE,Y		  ; 79 FE 3E | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_11D
; Address: $FEB9BB
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_11D:
	SEC				  ; 38 | Set carry flag
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	SBC #$E2			 ; E9 E2 | Subtract with carry (immediate)
	ORA $0912,Y		  ; 19 12 09 | Logical OR with accumulator (absolute,Y)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $EF			  ; F0 EF | Branch if equal
	BPL $1F			  ; 10 1F | Branch if positive
	SBC $FB30,X		  ; FD 30 FB | Subtract with carry (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA				  ; 9F FF 7F FF | Store accumulator to absolute long,X
	INC $E0F0,X		  ; FE F0 E0 | Game work RAM access
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $CF			  ; F0 CF | Branch if equal
	INC $F3FC,X		  ; FE FC F3 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $E1			  ; 05 E1 | Logical OR with accumulator (zero page)
	BRA $7F			  ; 80 7F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $FF07,X		  ; FD 07 FF | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_11E
; Address: $FEBA65
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_11E:
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ROR $C0E3,X		  ; 7E E3 C0 | Rotate right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $FF			  ; D0 FF | Branch if not equal
	PEA #$9DFF		   ; F4 FF 9D | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BEQ $EF			  ; F0 EF | Branch if equal
	SBC $FEE7,Y		  ; F9 E7 FE | Subtract with carry (absolute,Y)
	INC $FF			  ; E6 FF | Increment (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_11F
; Address: $FEBAF3
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_11F:
	SBC $1F1F,Y		  ; F9 1F 1F | Subtract with carry (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $1E0E			; EC 0E 1E | Compare X register (absolute)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	BRA $BB			  ; 80 BB | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL $00F0			; 2E F0 00 | Rotate left (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $00F3,X		  ; 1D F3 00 | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_122
; Address: $FEBB76
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_122:
	JSR $7000			; 20 00 70 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_123
; Address: $FEBB7D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_123:
	JSR $20F8			; 20 F8 20 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $6C			  ; 70 6C | Branch if overflow set
	SBC ($98,X)		  ; E1 98 | Subtract with carry ((zero page,X))
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	BRA $71			  ; 80 71 | Branch always
	STA ($7B,X)		  ; 81 7B | Store accumulator to (zero page,X)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STX $78			  ; 86 78 | Store X register to zero page
	ORA $86			  ; 05 86 | Logical OR with accumulator (zero page)
	SBC $FF1D,X		  ; FD 1D FF | Subtract with carry (absolute,X)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_124
; Address: $FEBBD1
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_124:
	SEI				  ; 78 | Set interrupt disable flag
	INC $FB06,X		  ; FE 06 FB | Increment (absolute,X)
	INC $F8E4,X		  ; FE E4 F8 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	WDM #$82			 ; 42 82 | Reserved instruction
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	LDA $3779,Y		  ; B9 79 37 | Load from absolute,Y into accumulator
	SBC $DAE7,Y		  ; F9 E7 DA | Subtract with carry (absolute,Y)
	CMP $98			  ; C5 98 | Compare accumulator (zero page)
	SBC $FF86			; ED 86 FF | Subtract with carry (absolute)
	DEC $FFC8			; CE C8 FF | Decrement (absolute)
	STZ $E684			; 9C 84 E6 | Store zero to absolute
	LDA $7F39,X		  ; BD 39 7F | Load from absolute,X into accumulator
	ADC $317D,Y		  ; 79 7D 31 | Add with carry (absolute,Y)
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF AE BF 80 | Load from absolute long,X into accumulator
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BMI $7F			  ; 30 7F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	LSR $201F			; 4E 1F 20 | Logical shift right (absolute)
	BRA $F0			  ; 80 F0 | Branch always
	BNE $F0			  ; D0 F0 | Branch if not equal
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_125
; Address: $FEBC25
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_125:
	JSR $60F0			; 20 F0 60 | Jump to subroutine
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_126
; Address: $FEBC31
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_126:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FBFB,X		  ; FE FB FB | Increment (absolute,X)
	BCS $48			  ; B0 48 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	ASL $0301			; 0E 01 03 | Arithmetic shift left (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_127
; Address: $FEBC65
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_127:
	BMI $6F			  ; 30 6F | Branch if negative
	BVS $DF			  ; 70 DF | Branch if overflow set
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA				  ; BF C0 BF C0 | Load from absolute long,X into accumulator
	LDA				  ; BF C3 3F E6 | Load from absolute long,X into accumulator
	ASL $1CE4,X		  ; 1E E4 1C | Arithmetic shift left (absolute,X)
	SBC $FB09,Y		  ; F9 09 FB | Subtract with carry (absolute,Y)
	SBC $FA07,X		  ; FD 07 FA | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PEA #$F00F		   ; F4 0F F0 | Push effective address to stack
	INX				  ; E8 | Increment X register
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	PEA #$40C0		   ; F4 C0 40 | Push effective address to stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	CPY $CC44			; CC 44 CC | Compare Y register (absolute)
	CPY $CC44			; CC 44 CC | Compare Y register (absolute)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	BIT $CC			  ; 24 CC | Test bits in accumulator (zero page)
	LDA $ABEFF3		  ; AF F3 EF AB | Load from absolute long address into accumulator
	LDA $BA57,Y		  ; B9 57 BA | Load from absolute,Y into accumulator
	DEC				  ; 3A | Decrement accumulator
	PEA #$E206		   ; F4 06 E2 | Push effective address to stack
	ORA $E1			  ; 05 E1 | Logical OR with accumulator (zero page)
	ORA $E0			  ; 05 E0 | Game work RAM access
	BEQ $EF			  ; F0 EF | Branch if equal
	SBC $FFEE,Y		  ; F9 EE FF | Subtract with carry (absolute,Y)
	SBC ($D8),Y		  ; F1 D8 | Subtract with carry ((zero page),Y)
	DEC $A4			  ; C6 A4 | Decrement (zero page)
	STZ $B090			; 9C 90 B0 | Store zero to absolute
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $1F			  ; 90 1F | Branch if carry clear
	STA $3F1F,Y		  ; 99 1F 3F | Store accumulator to absolute,Y
	ROL $787A,X		  ; 3E 7A 78 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_128
; Address: $FEBCFF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_128:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_129
; Address: $FEBD14
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_129:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC $FAFB,X		  ; FD FB FA | Subtract with carry (absolute,X)
	CMP $2EDC,X		  ; DD DC 2E | Compare accumulator (absolute,X)
	BIT $5E9E			; 2C 9E 5E | Test bits in accumulator (absolute)
	BIT $072A			; 2C 2A 07 | Test bits in accumulator (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	DEC $C1EE			; CE EE C1 | Decrement (absolute)
	BEQ $C7			  ; F0 C7 | Branch if equal
	SBC ($C7),Y		  ; F1 C7 | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	INC $F02F			; EE 2F F0 | Increment (absolute)
	BEQ $2F			  ; F0 2F | Branch if equal
	BEQ $6F			  ; F0 6F | Branch if equal
	BEQ $97			  ; F0 97 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 87 7F 06 | Store accumulator to absolute long,X
	STA $1BFF			; 8D FF 1B | Store accumulator to absolute address
	INC $DDC2,X		  ; FE C2 DD | Increment (absolute,X)
	ORA $C0FF			; 0D FF C0 | Logical OR with accumulator (absolute)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FF02,X		  ; FE 02 FF | Increment (absolute,X)
	ORA ($E8,X)		  ; 01 E8 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BNE $D0			  ; D0 D0 | Branch if not equal
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_12B
; Address: $FEBD8C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_12B:
	BRA $80			  ; 80 80 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $50			  ; 70 50 | Branch if overflow set
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	STZ $5FD3,X		  ; 9E D3 5F | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_12C
; Address: $FEBDA4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_12C:
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	CPX $DC			  ; E4 DC | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$25			 ; E0 25 | Compare X register (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	BCS $C8			  ; B0 C8 | Branch if carry set
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CMP $3C17,X		  ; DD 17 3C | Compare accumulator (absolute,X)
	CPY $CECC			; CC CC CE | Compare Y register (absolute)
	SBC $F87B,X		  ; FD 7B F8 | Subtract with carry (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $EEFF,X		  ; FD FF EE | Subtract with carry (absolute,X)
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	INC $FF07			; EE 07 FF | Increment (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_12E
; Address: $FEBE0A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_12E:
	JSR $6018			; 20 18 60 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	AND $FE01,X		  ; 3D 01 FE | Logical AND with accumulator (absolute,X)
	BIT $062C			; 2C 2C 06 | Test bits in accumulator (absolute)
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	ORA $4F			  ; 05 4F | Logical OR with accumulator (zero page)
	STA				  ; 9F 00 FF 01 | Store accumulator to absolute long,X
	INC $FC02,X		  ; FE 02 FC | Increment (absolute,X)
	BIT $06FC			; 2C FC 06 | Test bits in accumulator (absolute)
	INC $FF05,X		  ; FE 05 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_131
; Address: $FEBE4F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_131:
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $CF			  ; F0 CF | Branch if equal
	LDX $ED			  ; A6 ED | Load from zero page into X register
	ASL $FEFC			; 0E FC FE | Arithmetic shift left (absolute)
	LDA $F1BE,X		  ; BD BE F1 | Load from absolute,X into accumulator
	INC $07CB,X		  ; FE CB 07 | Increment (absolute,X)
	ORA $E3FF			; 0D FF E3 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_132
; Address: $FEBE88
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_132:
	JSL $38C338		  ; 22 38 C3 38 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BMI $F7			  ; 30 F7 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $BF			  ; F0 BF | Branch if equal
	STA				  ; 9F 07 FF 00 | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $A150			; 0E 50 A1 | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	STY $C2			  ; 84 C2 | Store Y register to zero page
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $80			  ; F0 80 | Branch if equal
	ROR $3FC0,X		  ; 7E C0 3F | Rotate right (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_135
; Address: $FEBF0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_135:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_136
; Address: $FEBF19
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_136:
	SED				  ; F8 | Set decimal mode flag
	BRA $7E			  ; 80 7E | Branch always
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	SBC $F9			  ; E5 F9 | Subtract with carry (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $48			  ; F0 48 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR $44			  ; 45 44 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	LDY $E1FF,X		  ; BC FF E1 | Load from absolute,X into Y register
	BMI $87			  ; 30 87 | Branch if negative
	BEQ $0F			  ; F0 0F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_137
; Address: $FEBF46
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_137:
	ASL $1EE0			; 0E E0 1E | Arithmetic shift left (absolute)
	CPY #$3D			 ; C0 3D | Compare Y register (immediate)
	BRA $3B			  ; 80 3B | Branch always
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	BEQ $4F			  ; F0 4F | Branch if equal
	BEQ $DF			  ; F0 DF | Branch if equal
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA				  ; 9F 07 1F 0F | Store accumulator to absolute long,X
	INC $F9FF,X		  ; FE FF F9 | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BCS $FF			  ; B0 FF | Branch if carry set
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	BRA $18			  ; 80 18 | Branch always
	STA ($1D,X)		  ; 81 1D | Store accumulator to (zero page,X)
	ROL $3E82,X		  ; 3E 82 3E | Rotate left (absolute,X)
	STY $3C			  ; 84 3C | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $3EFE,X		  ; 1D FE 3E | Logical OR with accumulator (absolute,X)
	INC $FC3E,X		  ; FE 3E FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_138
; Address: $FEBFC0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_138:
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	SBC ($EA),Y		  ; F1 EA | Subtract with carry ((zero page),Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA $E3FC			; 0D FC E3 | Logical OR with accumulator (absolute)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $38FF			; 0E FF 38 | Arithmetic shift left (absolute)
	ORA $3FFF			; 0D FF 3F | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $C7			  ; F0 C7 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $F1F9			; 0E F9 F1 | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_139
; Address: $FEC047
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_139:
	ORA ($C1),Y		  ; 11 C1 | Logical OR with accumulator ((zero page),Y)
	BRA $7F			  ; 80 7F | Branch always
	SED				  ; F8 | Set decimal mode flag
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BCS $20			  ; B0 20 | Branch if carry set
	BNE $C0			  ; D0 C0 | Branch if not equal
	BPL $D0			  ; 10 D0 | Branch if positive
	BEQ $98			  ; F0 98 | Branch if equal
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BNE $FE			  ; D0 FE | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	DEC $F3FF			; CE FF F3 | Decrement (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_13A
; Address: $FEC098
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_13A:
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_13B
; Address: $FEC0E6
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_13B:
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $6F			  ; 80 6F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BMI $04			  ; 30 04 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $0B24,X		  ; FE 24 0B | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $80			  ; 30 80 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_13C
; Address: $FEC168
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_13C:
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $30			  ; 70 30 | Branch if overflow set
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $0C			  ; 30 0C | Branch if negative
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BRA $7C			  ; 80 7C | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_13D
; Address: $FEC1AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_13D:
	CLC				  ; 18 | Clear carry flag
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_13E
; Address: $FEC1C8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_13E:
	BRA $77			  ; 80 77 | Branch always
	CMP $730C,X		  ; DD 0C 73 | Compare accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_13F
; Address: $FEC20A
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_13F:
	JSR $5C18			; 20 18 5C | Jump to subroutine
	BRA $67			  ; 80 67 | Branch always
	STA $031E01		  ; 8F 01 1E 03 | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BRA $87			  ; 80 87 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	STZ $41			  ; 64 41 | Store zero to zero page
	LDX #$42			 ; A2 42 | Hardware register operation
	LDY #$46			 ; A0 46 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $87			  ; F0 87 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F4F0			; 0E F0 F4 | Arithmetic shift left (absolute)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BEQ $8F			  ; F0 8F | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_140
; Address: $FEC2AB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_140:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $82			  ; 80 82 | Branch always
	BRA $8C			  ; 80 8C | Branch always
	BRA $9C			  ; 80 9C | Branch always
	CMP ($FD,X)		  ; C1 FD | Compare accumulator ((zero page,X))
	WDM #$7A			 ; 42 7A | Reserved instruction
	WDM #$7A			 ; 42 7A | Reserved instruction
	BRA $FF			  ; 80 FF | Branch always
	STY $9CFF			; 8C FF 9C | Store Y register to absolute address
	SBC $7A7E,X		  ; FD 7E 7A | Subtract with carry (absolute,X)
	ROR $3C7A,X		  ; 7E 7A 3C | Rotate right (absolute,X)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_141
; Address: $FEC2E3
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_141:
	JSR $607F			; 20 7F 60 | Jump to subroutine
	LDA				  ; BF A0 1F 11 | Load from absolute long,X into accumulator
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STX $717F			; 8E 7F 71 | Store X register to absolute address
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	BRA $01			  ; 80 01 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $71FF			; 0E FF 71 | Arithmetic shift left (absolute)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	BRA $03			  ; 80 03 | Branch always
	BRA $FD			  ; 80 FD | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $1E0A			; 0E 0A 1E | Arithmetic shift left (absolute)
	ASL $C0E0,X		  ; 1E E0 C0 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_142
; Address: $FEC36A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_142:
	JSR $4019			; 20 19 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	JMP ($B800)		  ; 6C 00 B8 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_143
; Address: $FEC383
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_143:
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	ASL $83			  ; 06 83 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ADC ($1F),Y		  ; 71 1F | Add with carry ((zero page),Y)
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	CMP ($0C,X)		  ; C1 0C | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_144
; Address: $FEC396
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_144:
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_145
; Address: $FEC3A3
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_145:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $CF			  ; 10 CF | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_148
; Address: $FEC41C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_148:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $FE			  ; 30 FE | Branch if negative
	SEC				  ; 38 | Set carry flag
	SBC $F37D,X		  ; FD 7D F3 | Subtract with carry (absolute,X)
	STA				  ; 9F 07 FF 00 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_149
; Address: $FEC460
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_149:
	PHP				  ; 08 | Push processor status to stack
	BPL $0B			  ; 10 0B | Branch if positive
	BPL $06			  ; 10 06 | Branch if positive
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $0E0C,X		  ; 1E 0C 0E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $370E,X		  ; 1E 0E 37 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_14A
; Address: $FEC4BA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_14A:
	BVS $0F			  ; 70 0F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_14B
; Address: $FEC4C7
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_14B:
	JSR $2020			; 20 20 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $FE7F,Y		  ; F9 7F FE | Subtract with carry (absolute,Y)
	SBC $7D00,X		  ; FD 00 7D | Subtract with carry (absolute,X)
	LDX $DE00,Y		  ; BE 00 DE | Load from absolute,Y into X register
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ADC $C901			; 6D 01 C9 | Add with carry (absolute)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FC7F,X		  ; FE 7F FC | Increment (absolute,X)
	BRA $67			  ; 80 67 | Branch always
	STA ($6E,X)		  ; 81 6E | Store accumulator to (zero page,X)
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	CMP $DD02,X		  ; DD 02 DD | Compare accumulator (absolute,X)
	ASL $D9			  ; 06 D9 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ROL $7DC1,X		  ; 3E C1 7D | Rotate left (absolute,X)
	ADC $FD83,X		  ; 7D 83 FD | Add with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	INC $FE07,X		  ; FE 07 FE | Increment (absolute,X)
	INC $FE07,X		  ; FE 07 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_14C
; Address: $FEC560
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_14C:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVS $70			  ; 70 70 | Branch if overflow set
	BEQ $70			  ; F0 70 | Branch if equal
	BVS $30			  ; 70 30 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BMI $B8			  ; 30 B8 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FAFB,X		  ; FD FB FA | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CMP $2BDD,X		  ; DD DD 2B | Compare accumulator (absolute,X)
	ORA ($D0),Y		  ; 11 D0 | Logical OR with accumulator ((zero page),Y)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_14D
; Address: $FEC5AC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_14D:
	STA				  ; 9F 20 BF A0 | Store accumulator to absolute long,X
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_14E
; Address: $FEC5DF
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_14E:
	BMI $00			  ; 30 00 | Branch if negative
	ADC $9F60			; 6D 60 9F | Add with carry (absolute)
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	SEP #$1D			 ; E2 1D | Set processor status bits
	BVS $8F			  ; 70 8F | Branch if overflow set
	SBC #$97			 ; E9 97 | Subtract with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($1000)		  ; 6C 00 10 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	INY				  ; C8 | Increment Y register
	BMI $E4			  ; 30 E4 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX $E31C			; EC 1C E3 | Compare X register (absolute)
	ROL $EFD1			; 2E D1 EF | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$3F			 ; E0 3F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_150
; Address: $FEC647
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_150:
	JSR $111F			; 20 1F 11 | Jump to subroutine
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_152
; Address: $FEC656
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_152:
	JSR $113F			; 20 3F 11 | Jump to subroutine
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_153
; Address: $FEC676
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_153:
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	JMP $303E			; 4C 3E 30 | Jump to address
	AND $F021,Y		  ; 39 21 F0 | Logical AND with accumulator (absolute,Y)
	CPY #$66			 ; C0 66 | Compare Y register (immediate)
	LSR $65			  ; 46 65 | Logical shift right (zero page)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BCS $FF			  ; B0 FF | Branch if carry set
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_154
; Address: $FEC696
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_154:
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	STA $9BE6,Y		  ; 99 E6 9B | Store accumulator to absolute,Y
	CPX $03			  ; E4 03 | Compare X register (zero page)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	SEP #$1B			 ; E2 1B | Set processor status bits
	CPY #$36			 ; C0 36 | Compare Y register (immediate)
	ORA ($6E,X)		  ; 01 6E | Logical OR with accumulator ((zero page,X))
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	SBC ($8C,X)		  ; E1 8C | Subtract with carry ((zero page,X))
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	CMP ($0D,X)		  ; C1 0D | Compare accumulator ((zero page,X))
	ASL $FAED,X		  ; 1E ED FA | Arithmetic shift left (absolute,X)
	LDA				  ; BF EE 5F DE | Load from absolute long,X into accumulator
	STY $807F			; 8C 7F 80 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	BMI $67			  ; 30 67 | Branch if negative
	LDY $9F78,X		  ; BC 78 9F | Load from absolute,X into Y register
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 30 EF 3C | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 70 5E D1 | Load from absolute long,X into accumulator
	DEC $0CD1,X		  ; DE D1 0C | Decrement (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	BEQ $DF			  ; F0 DF | Branch if equal
	BEQ $DF			  ; F0 DF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive
	BPL $FC			  ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_155
; Address: $FEC707
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_155:
	JSR $8276			; 20 76 82 | Jump to subroutine
	ROL $C2			  ; 26 C2 | Rotate left (zero page)
	BIT $2CC4			; 2C C4 2C | Test bits in accumulator (absolute)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	BRA $7E			  ; 80 7E | Branch always
	BRA $7E			  ; 80 7E | Branch always
	BRA $3E			  ; 80 3E | Branch always
	REP #$1E			 ; C2 1E | Reset processor status bits
	SEP #$1C			 ; E2 1C | Set processor status bits
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	CPX $EF			  ; E4 EF | Compare X register (zero page)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_157
; Address: $FEC735
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_157:
	JSR $243C			; 20 3C 24 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $10			  ; F0 10 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	STY $CF04			; 8C 04 CF | Store Y register to absolute address
	BNE $DF			  ; D0 DF | Branch if not equal
	BNE $EB			  ; D0 EB | Branch if not equal
	CPX $F3F2			; EC F2 F3 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $1FF0,X		  ; FD F0 1F | Subtract with carry (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	EOR ($3F,X)		  ; 41 3F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_158
; Address: $FEC759
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_158:
	JSR $080F			; 20 0F 08 | Jump to subroutine
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ASL $0011			; 0E 11 00 | Arithmetic shift left (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ROL $2000			; 2E 00 20 | Rotate left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $83			  ; 10 83 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_159
; Address: $FEC7A1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_159:
	JSR $C03F			; 20 3F C0 | Jump to subroutine
	BRA $1F			  ; 80 1F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_15A
; Address: $FEC7AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_15A:
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_15B
; Address: $FEC7BC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_15B:
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_15D
; Address: $FEC7DE
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_15D:
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_15E
; Address: $FEC7E5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_15E:
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ADC $79F2,X		  ; 7D F2 79 | Add with carry (absolute,X)
	STZ $F9			  ; 64 F9 | Store zero to zero page
	ROR $B9			  ; 66 B9 | Rotate right (zero page)
	ROR $B8			  ; 66 B8 | Rotate right (zero page)
	LDY $BE63,X		  ; BC 63 BE | Load from absolute,X into Y register
	ADC ($32,X)		  ; 61 32 | Add with carry ((zero page,X))
	CMP $BF70,X		  ; DD 70 BF | Compare accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_162
; Address: $FEC820
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_162:
	BRA $43			  ; 80 43 | Branch always
	BRA $42			  ; 80 42 | Hardware register operation
	BRA $46			  ; 80 46 | Branch always
	STA ($EC,X)		  ; 81 EC | Store accumulator to (zero page,X)
	CMP ($7C,X)		  ; C1 7C | Compare accumulator ((zero page,X))
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 1F 63 0F | Load from absolute long,X into accumulator
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $03			  ; F0 03 | Branch if equal
	CPX $ECEA			; EC EA EC | Compare X register (absolute)
	NOP				  ; EA | No operation
	INX				  ; E8 | Increment X register
	BIT $1CE8			; 2C E8 1C | Test bits in accumulator (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	BIT $34D8			; 2C D8 34 | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_163
; Address: $FEC874
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_163:
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	CPX $18			  ; E4 18 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	CPY $3A			  ; C4 3A | Compare Y register (zero page)
	REP #$0C			 ; C2 0C | Reset processor status bits
	PEA #$F808		   ; F4 08 F8 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PEA #$FC04		   ; F4 04 FC | Push effective address to stack
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	INC $BEBD,X		  ; FE BD BE | Increment (absolute,X)
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)
	INC $04CC,X		  ; FE CC 04 | Increment (absolute,X)
	ORA $FFFF			; 0D FF FF | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BMI $03			  ; 30 03 | Branch if negative
	REP #$F1			 ; C2 F1 | Reset processor status bits
	SBC ($D9),Y		  ; F1 D9 | Subtract with carry ((zero page),Y)
	SBC $FFE7,Y		  ; F9 E7 FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $03			  ; F0 03 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BMI $DF			  ; 30 DF | Branch if negative
	BMI $DF			  ; 30 DF | Branch if negative
	BMI $EF			  ; 30 EF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	AND $3016,X		  ; 3D 16 30 | Logical AND with accumulator (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_165
; Address: $FEC921
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_165:
	LDA				  ; BF E0 3F E0 | Load from absolute long,X into accumulator
	BNE $2F			  ; D0 2F | Branch if not equal
	INC $EF11			; EE 11 EF | Increment (absolute)
	BPL $F7			  ; 10 F7 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_167
; Address: $FEC934
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_167:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	BNE $39			  ; D0 39 | Branch if not equal
	BCC $59			  ; 90 59 | Branch if carry clear
	BCS $69			  ; B0 69 | Branch if carry set
	BCS $69			  ; B0 69 | Branch if carry set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_169
; Address: $FEC970
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_169:
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $DF			  ; 70 DF | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_16B
; Address: $FEC97A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_16B:
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	REP #$3A			 ; C2 3A | Reset processor status bits
	REP #$3A			 ; C2 3A | Reset processor status bits
	REP #$7A			 ; C2 7A | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	STX $FA			  ; 86 FA | Store X register to zero page
	ASL $F4			  ; 06 F4 | Arithmetic shift left (zero page)
	PEA #$060C		   ; F4 0C 06 | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_16C
; Address: $FEC9AA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_16C:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $2F			  ; 10 2F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_16D
; Address: $FEC9BE
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_16D:
	JSR $7000			; 20 00 70 | Jump to subroutine
	STA $1E01FE		  ; 8F FE 01 1E | Store accumulator to absolute long address
	SBC ($0E,X)		  ; E1 0E | Subtract with carry ((zero page,X))
	SBC ($1C),Y		  ; F1 1C | Subtract with carry ((zero page),Y)
	SEP #$1C			 ; E2 1C | Set processor status bits
	SEP #$7C			 ; E2 7C | Set processor status bits
	CLD				  ; D8 | Clear decimal mode flag
	BIT $8F			  ; 24 8F | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3409			; 0E 09 34 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $EB23,X		  ; FE 23 EB | Increment (absolute,X)
	LDY $4CB3			; AC B3 4C | Load from absolute address into Y register
	STY $9C63			; 8C 63 9C | Store Y register to absolute address
	SBC ($BF,X)		  ; E1 BF | Subtract with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	ADC $9C82,X		  ; 7D 82 9C | Add with carry (absolute,X)
	REP #$E6			 ; C2 E6 | Reset processor status bits
	ADC ($F9),Y		  ; 71 F9 | Add with carry ((zero page),Y)
	INC $FF3E,X		  ; FE 3E FF | Increment (absolute,X)
	DEC $F779,X		  ; DE 79 F7 | Decrement (absolute,X)
	ROR $3FFD,X		  ; 7E FD 3F | Rotate right (absolute,X)
	INC $FF3F,X		  ; FE 3F FF | Increment (absolute,X)
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	ROL $FC31,X		  ; 3E 31 FC | Rotate left (absolute,X)
	REP #$F8			 ; C2 F8 | Reset processor status bits
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STY $7F			  ; 84 7F | Store Y register to zero page
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_16E
; Address: $FECA79
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_16E:
	LDA				  ; BF F0 3F C0 | Load from absolute long,X into accumulator
	SBC ($86,X)		  ; E1 86 | Subtract with carry ((zero page,X))
	BIT $0CC3			; 2C C3 0C | Test bits in accumulator (absolute)
	STX $59			  ; 86 59 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	BPL $6F			  ; 10 6F | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	ROR $6E96			; 6E 96 6E | Rotate right (absolute)
	SBC $DD2D			; ED 2D DD | Subtract with carry (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	PHX				  ; DA | Push X register to stack
	AND #$D9			 ; 29 D9 | Logical AND with accumulator (immediate)
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	BCS $0E			  ; B0 0E | Branch if carry set
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	SBC $FD1F,X		  ; FD 1F FD | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $F03F,Y		  ; F9 3F F0 | Subtract with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_170
; Address: $FECACC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_170:
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $0340,X		  ; FE 40 03 | Increment (absolute,X)
	ROL $59			  ; 26 59 | Rotate left (zero page)
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	BRA $7E			  ; 80 7E | Branch always
	STA ($FC,X)		  ; 81 FC | Store accumulator to (zero page,X)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_171
; Address: $FECAEE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_171:
	JSR $2018			; 20 18 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	BMI $C8			  ; 30 C8 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_173
; Address: $FECB05
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_173:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_176
; Address: $FECB28
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_176:
	AND $1E3E,Y		  ; 39 3E 1E | Logical AND with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_178
; Address: $FECB38
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_178:
	ROL $1F27,X		  ; 3E 27 1F | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA $31E6,Y		  ; 19 E6 31 | Logical OR with accumulator (absolute,Y)
	DEC $8E71			; CE 71 8E | Decrement (absolute)
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	ADC ($96,X)		  ; 61 96 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_179
; Address: $FECB4E
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_179:
	BCS $4C			  ; B0 4C | Branch if carry set
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC $F302,X		  ; FD 02 F3 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	WDM #$70			 ; 42 70 | Reserved instruction
	PHB				  ; 8B | Push data bank register to stack
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	BRA $5F			  ; 80 5F | Branch always
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)
	CPX $B800			; EC 00 B8 | Compare X register (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX $B87F			; EC 7F B8 | Compare X register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_17A
; Address: $FECBE2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_17A:
	LDA ($60),Y		  ; B1 60 | Load from (zero page),Y into accumulator
	AND #$A0			 ; 29 A0 | Logical AND with accumulator (immediate)
	EOR #$40			 ; 49 40 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	JMP $8C40			; 4C 40 8C | Jump to address
	BRA $8C			  ; 80 8C | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_17B
; Address: $FECBF5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_17B:
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $5E			  ; 80 5E | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA $15DF27		  ; AF 27 DF 15 | Load from absolute long address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$E7			 ; 09 E7 | Logical OR with accumulator (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_17C
; Address: $FECC13
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_17C:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00FF00		  ; 8F 00 FF 00 | Store accumulator to absolute long address
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	SBC $FA04,X		  ; FD 04 FA | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC $70			  ; E5 70 | Subtract with carry (zero page)
	PHB				  ; 8B | Push data bank register to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $FB07,X		  ; FD 07 FB | Subtract with carry (absolute,X)
	INC $FB00,X		  ; FE 00 FB | Increment (absolute,X)
	LDA				  ; BF 00 7F 00 | Load from absolute long,X into accumulator
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_17D
; Address: $FECCC0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_17D:
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	REP #$02			 ; C2 02 | Reset processor status bits
	REP #$04			 ; C2 04 | Reset processor status bits
	STY $04			  ; 84 04 | Store Y register to zero page
	STY $04			  ; 84 04 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	REP #$FF			 ; C2 FF | Reset processor status bits
	REP #$FF			 ; C2 FF | Reset processor status bits
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	AND $7100,Y		  ; 39 00 71 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_181
; Address: $FECD0D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_181:
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $FE3E,Y		  ; F9 3E FE | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_182
; Address: $FECD6A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_182:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	INC $3EC0,X		  ; FE C0 3E | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_183
; Address: $FECDA5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_183:
	STZ $0CF0,X		  ; 9E F0 0C | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FE3F,X		  ; FE 3F FE | Increment (absolute,X)
	INC $FC0F,X		  ; FE 0F FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	BPL $27			  ; 10 27 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_184
; Address: $FECDC7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_184:
	JSR $222F			; 20 2F 22 | Jump to subroutine
	LSR $7F44,X		  ; 5E 44 7F | Logical shift right (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_185
; Address: $FECDD7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_185:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $E7			  ; 80 E7 | Branch always
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 07 7F 0F | Load from absolute long,X into accumulator
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	CMP ($CF,X)		  ; C1 CF | Compare accumulator ((zero page,X))
	CMP ($CF,X)		  ; C1 CF | Compare accumulator ((zero page,X))
	STA				  ; 9F 8E BF 1E | Store accumulator to absolute long,X
	ASL $00FF,X		  ; 1E FF 00 | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_186
; Address: $FECE36
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_186:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $F7F7,X		  ; FE F7 F7 | Increment (absolute,X)
	SBC $FEFC,X		  ; FD FC FE | Subtract with carry (absolute,X)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BVS $07			  ; 70 07 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	SBC $FF1E,Y		  ; F9 1E FF | Subtract with carry (absolute,Y)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $F205,Y		  ; F9 05 F2 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $F73C			; CD 3C F7 | Compare accumulator (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $FA0F,X		  ; FD 0F FA | Subtract with carry (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $031F83		  ; 8F 83 1F 03 | Store accumulator to absolute long address
	ROL $FEFE,X		  ; 3E FE FE | Rotate left (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PEA #$DFFF		   ; F4 FF DF | Push effective address to stack
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	ASL $3FC0			; 0E C0 3F | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $E7			  ; 80 E7 | Branch always
	ORA $FF0F,Y		  ; 19 0F FF | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F FF 7F 7F | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_187
; Address: $FECF26
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_187:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $C8			  ; 06 C8 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ROL $38			  ; 26 38 | Rotate left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	BIT $16			  ; 24 16 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_188
; Address: $FECFAC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_188:
	JSL $789816		  ; 22 16 98 78 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_18A
; Address: $FECFC9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_18A:
	JSR $D048			; 20 48 D0 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BNE $32			  ; D0 32 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ROL $3854,X		  ; 3E 54 38 | Rotate left (absolute,X)
	ROL $76			  ; 26 76 | Rotate left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_18B
; Address: $FECFEF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_18B:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BNE $E4			  ; D0 E4 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_18C
; Address: $FED005
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_18C:
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	BIT $2C26			; 2C 26 2C | Test bits in accumulator (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_18D
; Address: $FED018
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_18D:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STX $01			  ; 86 01 | Store X register to zero page
	AND #$31			 ; 29 31 | Logical AND with accumulator (immediate)
	EOR ($29),Y		  ; 51 29 | Exclusive OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	EOR $4B83,X		  ; 5D 83 4B | Exclusive OR with accumulator (absolute,X)
	CPY $44			  ; C4 44 | Compare Y register (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	BCC $E4			  ; 90 E4 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	LDY $46			  ; A4 46 | Load from zero page into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STX $5101			; 8E 01 51 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_18E
; Address: $FED063
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_18E:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BPL $89			  ; 10 89 | Branch if positive
	STY $0F			  ; 84 0F | Store Y register to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $00			  ; 86 00 | Store X register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $22			  ; 10 22 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_18F
; Address: $FED08A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_18F:
	WDM #$E0			 ; 42 E0 | Game work RAM access
	CPY #$A4			 ; C0 A4 | Compare Y register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	STA $2000,X		  ; 9D 00 20 | Store accumulator to absolute,X
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	STA $03			  ; 85 03 | Store accumulator to zero page
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_190
; Address: $FED0C8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_190:
	JSL $400000		  ; 22 00 00 40 | Jump to subroutine long
	BRA $42			  ; 80 42 | Hardware register operation
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0A06			; 0E 06 0A | Arithmetic shift left (absolute)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_191
; Address: $FED180
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_191:
	JSL $162416		  ; 22 16 24 16 | Jump to subroutine long
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ROL $01			  ; 26 01 | Rotate left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BNE $48			  ; D0 48 | Branch if not equal
	BNE $10			  ; D0 10 | Branch if not equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_192
; Address: $FED1A5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_192:
	JSR $D020			; 20 20 D0 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	ROL $76			  ; 26 76 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	ROL $4F17,X		  ; 3E 17 4F | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $2C			  ; 26 2C | Rotate left (zero page)
	BIT $DCC8			; 2C C8 DC | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_193
; Address: $FED1E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_193:
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	BNE $E4			  ; D0 E4 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_194
; Address: $FED1F4
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_194:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY $44			  ; C4 44 | Compare Y register (zero page)
	PLP				  ; 28 | Pull processor status from stack
	EOR $2951,X		  ; 5D 51 29 | Exclusive OR with accumulator (absolute,X)
	AND #$31			 ; 29 31 | Logical AND with accumulator (immediate)
	STX $01			  ; 86 01 | Store X register to zero page
	LSR $44			  ; 46 44 | Logical shift right (zero page)
	LDY $28			  ; A4 28 | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BCC $E4			  ; 90 E4 | Branch if carry clear
	REP #$00			 ; C2 00 | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	STY $0F			  ; 84 0F | Store Y register to zero page
	BIT #$0C			 ; 89 0C | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	EOR ($20),Y		  ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
	STX $0001			; 8E 01 00 | Store X register to absolute address
	CPY #$42			 ; C0 42 | Hardware register operation
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_195
; Address: $FED267
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_195:
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_196
; Address: $FED28A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_196:
	JSR $9D40			; 20 40 9D | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_197
; Address: $FED2A4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_197:
	JSL $000200		  ; 22 00 02 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_198
; Address: $FED305
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_198:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	BCC $70			  ; 90 70 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_199
; Address: $FED329
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_199:
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_19A
; Address: $FED33C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_19A:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	BPL $D6			  ; 10 D6 | Branch if positive
	SEC				  ; 38 | Set carry flag
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	ORA ($39),Y		  ; 11 39 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_19B
; Address: $FED38A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_19B:
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_19C
; Address: $FED3AC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_19C:
	ORA $163D,X		  ; 1D 3D 16 | Logical OR with accumulator (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BPL $54			  ; 10 54 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $93EF			; EE EF 93 | Increment (absolute)
	PLB				  ; AB | Pull data bank register from stack
	AND #$EF			 ; 29 EF | Logical AND with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $D0			  ; F0 D0 | Branch if equal
	BNE $A8			  ; D0 A8 | Branch if not equal
	BCS $70			  ; B0 70 | Branch if carry set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_19E
; Address: $FED3F8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_19E:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA $3A1E,Y		  ; 19 1E 3A | Logical OR with accumulator (absolute,Y)
	BIT $1E			  ; 24 1E | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $22			  ; 50 22 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $C7			  ; 10 C7 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CPX $11FF			; EC FF 11 | Compare X register (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $82			  ; 10 82 | Branch if positive
	ADC $EEEE			; 6D EE EE | Add with carry (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_19F
; Address: $FED445
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_19F:
	DEY				  ; 88 | Decrement Y register
	BMI $F0			  ; 30 F0 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	BVS $48			  ; 70 48 | Branch if overflow set
	BEQ $A0			  ; F0 A0 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	JMP $1000			; 4C 00 10 | Jump to address

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A0
; Address: $FED465
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A0:
	JSR $0020			; 20 20 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $20			  ; 50 20 | Branch if overflow clear
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A1
; Address: $FED488
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A1:
	JSR $2100			; 20 00 21 | PPU graphics register access
	STY $2222			; 8C 22 22 | Store Y register to absolute address
	BCC $00			  ; 90 00 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A2
; Address: $FED4A5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A2:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $60			  ; 50 60 | Branch if overflow clear
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A4
; Address: $FED4E5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A4:
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	INC $EE6C			; EE 6C EE | Increment (absolute)
	EOR $C6			  ; 45 C6 | Exclusive OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $C6			  ; 45 C6 | Exclusive OR with accumulator (zero page)
	JMP ($82EE)		  ; 6C EE 82 | Jump to address (absolute indirect)
	INC $1139			; EE 39 11 | Increment (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $3800,X		  ; FE 00 38 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A7
; Address: $FED54A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A7:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A8
; Address: $FED564
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A8:
	LDX #$7E			 ; A2 7E | Load immediate value into X register
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	LDX #$7E			 ; A2 7E | Load immediate value into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1A9
; Address: $FED56D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1A9:
	DEC				  ; 3A | Decrement accumulator
	ROL $0001,X		  ; 3E 01 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDY $8A98			; AC 98 8A | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1AA
; Address: $FED5A8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1AA:
	TXA				  ; 8A | Transfer X register to accumulator
	LDY $D898			; AC 98 D8 | Load from absolute address into Y register
	CLV				  ; B8 | Clear overflow flag
	BNE $F8			  ; D0 F8 | Branch if not equal
	INX				  ; E8 | Increment X register
	AND ($65,X)		  ; 21 65 | Logical AND with accumulator ((zero page,X))
	AND $63			  ; 25 63 | Logical AND with accumulator (zero page)
	AND $63			  ; 25 63 | Logical AND with accumulator (zero page)
	ADC $23			  ; 65 23 | Add with carry (zero page)
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1AB
; Address: $FED5CF
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1AB:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FEEE			; EE EE FE | Increment (absolute)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $1100,X		  ; FE 00 11 | Increment (absolute,X)
	STY $4C08			; 8C 08 4C | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	STY $7E70			; 8C 70 7E | Store Y register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	STY $884C			; 8C 4C 88 | Store Y register to absolute address
	STY $1408			; 8C 08 14 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($4D,X)		  ; 01 4D | Logical OR with accumulator ((zero page,X))
	BRA $01			  ; 80 01 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	BVC $DC			  ; 50 DC | Branch if overflow clear
	STA $508E			; 8D 8E 50 | Store accumulator to absolute address
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1AE
; Address: $FED656
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1AE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BCC $08			  ; 90 08 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1AF
; Address: $FED6A3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1AF:
	INC $38D6,X		  ; FE D6 38 | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1B0
; Address: $FED6C6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1B0:
	BPL $00			  ; 10 00 | Branch if positive
	ORA $2B3D,X		  ; 1D 3D 2B | Logical OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1B1
; Address: $FED6EC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1B1:
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	AND #$44			 ; 29 44 | Logical AND with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	INC $54EF			; EE EF 54 | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BVS $78			  ; 70 78 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $D0			  ; B0 D0 | Branch if carry set
	BNE $B8			  ; D0 B8 | Branch if not equal
	BEQ $54			  ; F0 54 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1B2
; Address: $FED734
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1B2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $1E			  ; 24 1E | Test bits in accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	ORA $0C1E,Y		  ; 19 1E 0C | Logical OR with accumulator (absolute,Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC $107C			; 6D 7C 10 | Add with carry (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	CPX $C7FF			; EC FF C7 | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$D8			 ; A0 D8 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	BEQ $B8			  ; F0 B8 | Branch if equal
	BVS $30			  ; 70 30 | Branch if overflow set
	BEQ $60			  ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1B6
; Address: $FED7C0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1B6:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BVC $20			  ; 50 20 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1B8
; Address: $FED7E5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1B8:
	JSR $0090			; 20 90 00 | Jump to subroutine
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	AND ($5F,X)		  ; 21 5F | Logical AND with accumulator ((zero page,X))
	BIT $51BF			; 2C BF 51 | Test bits in accumulator (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1B9
; Address: $FED84B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1B9:
	JSR $017F			; 20 7F 01 | Jump to subroutine
	INC $0006,X		  ; FE 06 00 | Increment (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDA				  ; BF 51 DF AC | Load from absolute long,X into accumulator
	ADC $0E0F			; 6D 0F 0E | Add with carry (absolute)
	BRA $80			  ; 80 80 | Branch always
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	STA				  ; 9F FF F0 0F | Store accumulator to absolute long,X
	INC $FF06,X		  ; FE 06 FF | Increment (absolute,X)
	STA ($77,X)		  ; 81 77 | Store accumulator to (zero page,X)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	LDY $0000			; AC 00 00 | Load from absolute address into Y register
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1BA
; Address: $FED92E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1BA:
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	LDY $536F			; AC 6F 53 | Load from absolute address into Y register
	ORA $031A,X		  ; 1D 1A 03 | Logical OR with accumulator (absolute,X)
	BEQ $70			  ; F0 70 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1BB
; Address: $FED9A7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1BB:
	BRA $1F			  ; 80 1F | Branch always
	BEQ $30			  ; F0 30 | Branch if equal
	STZ $637F			; 9C 7F 63 | Store zero to absolute
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1BC
; Address: $FEDA0D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1BC:
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BEQ $30			  ; F0 30 | Branch if equal
	LDA				  ; BF 80 F8 18 | Load from absolute long,X into accumulator
	ORA #$3C			 ; 09 3C | Logical OR with accumulator (immediate)
	BIT $70			  ; 24 70 | Test bits in accumulator (zero page)
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1BD
; Address: $FEDA4F
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1BD:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	BRA $80			  ; 80 80 | Branch always
	ROL $1F26,X		  ; 3E 26 1F | Rotate left (absolute,X)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA				  ; BF 80 FF 3F | Load from absolute long,X into accumulator
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STZ $1F			  ; 64 1F | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $BE			  ; 30 BE | Branch if negative
	STX $00			  ; 86 00 | Store X register to zero page
	LSR $CF76			; 4E 76 CF | Logical shift right (absolute)
	SBC $727E,X		  ; FD 7E 72 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	BVS $B0			  ; 70 B0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX $FF86,Y		  ; BE 86 FF | Load from absolute,Y into X register
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ROR $3C66,X		  ; 7E 66 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1BE
; Address: $FEDC20
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1BE:
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1BF
; Address: $FEDC6B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1BF:
	JSR $10F0			; 20 F0 10 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $3C14			; 2C 14 3C | Test bits in accumulator (absolute)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $2F			  ; 30 2F | Branch if negative
	BMI $2F			  ; 30 2F | Branch if negative
	BVS $6F			  ; 70 6F | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	STY $8C7C			; 8C 7C 8C | Store Y register to absolute address
	ROR $FE8E,X		  ; 7E 8E FE | Rotate right (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BEQ $10			  ; F0 10 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C0
; Address: $FEDD21
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C0:
	BVS $7F			  ; 70 7F | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0303			; 0E 03 03 | Arithmetic shift left (absolute)
	INC $FE1E,X		  ; FE 1E FE | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	PEA #$C8F8		   ; F4 F8 C8 | Push effective address to stack
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C1
; Address: $FEDD6D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C1:
	JSR $98F8			; 20 F8 98 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C2
; Address: $FEDD83
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C2:
	JSR $0F0F			; 20 0F 0F | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C4
; Address: $FEDDAD
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C4:
	CLC				  ; 18 | Clear carry flag
	LDY $00A4,X		  ; BC A4 00 | Load from absolute,X into Y register
	ROL $0F26,X		  ; 3E 26 0F | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	ORA $7D03,X		  ; 1D 03 7D | Logical OR with accumulator (absolute,X)
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0B00			; 0E 00 0B | Arithmetic shift left (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C5
; Address: $FEDEA4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C5:
	JSL $013601		  ; 22 01 36 01 | Jump to subroutine long
	ROL $E911			; 2E 11 E9 | Rotate left (absolute)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BIT $1310			; 2C 10 13 | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($6E,X)		  ; 01 6E | Logical OR with accumulator ((zero page,X))
	ORA ($E0),Y		  ; 11 E0 | Game work RAM access
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	STA				  ; 9F FF 00 00 | Store accumulator to absolute long,X
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0C01,X		  ; 1E 01 0C | Arithmetic shift left (absolute,X)
	STZ $6303			; 9C 03 63 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C6
; Address: $FEDF6D
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C6:
	STA				  ; 9F 9F FF 00 | Store accumulator to absolute long,X
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	STY $3C03			; 8C 03 3C | Store Y register to absolute address
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $1907,Y		  ; 19 07 19 | Logical OR with accumulator (absolute,Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C7
; Address: $FEE06C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C7:
	STA				  ; 9F 7F 9F 7F | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	STZ $00			  ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C8
; Address: $FEE085
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C8:
	JSR $1728			; 20 28 17 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($5410)		  ; 6C 10 54 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	SEC				  ; 38 | Set carry flag
	JMP ($1010)		  ; 6C 10 10 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $C6			  ; 10 C6 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($1010)		  ; 6C 10 10 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1C9
; Address: $FEE18C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1C9:
	PHB				  ; 8B | Push data bank register to stack
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 7F 1F FF | Load from absolute long,X into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0200,Y		  ; 19 00 02 | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $40E3			; 9C E3 40 | Store zero to absolute
	LDA				  ; BF 7F 9F 7F | Load from absolute long,X into accumulator
	LDA				  ; BF 7F 3F FF | Load from absolute long,X into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $39			  ; 10 39 | Branch if positive
	EOR $5F16,Y		  ; 59 16 5F | Exclusive OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	BNE $EC			  ; D0 EC | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	INC $EE6C			; EE 6C EE | Increment (absolute)
	CPX $CECF			; EC CF CE | Compare X register (absolute)
	STA				  ; 9F 9E 00 00 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $A0			  ; B0 A0 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	BVC $DC			  ; 50 DC | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1CA
; Address: $FEE2EE
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1CA:
	LDY $00BC,X		  ; BC BC 00 | Load from absolute,X into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $28			  ; 10 28 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $7C44,X		  ; FE 44 7C | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	JMP ($827C)		  ; 6C 7C 82 | Jump to address (absolute indirect)
	INC $7C6C,X		  ; FE 6C 7C | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0302			; 0E 02 03 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $7D1C,X		  ; 1D 1C 7D | Logical OR with accumulator (absolute,X)
	ADC $FAFA,X		  ; 7D FA FA | Add with carry (absolute,X)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SEP #$00			 ; E2 00 | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $0305			; 0D 05 03 | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1CB
; Address: $FEE3C1
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1CB:
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$E8F4		   ; F4 F4 E8 | Push effective address to stack
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $3828,X		  ; FE 28 38 | Increment (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	DEC $FE			  ; C6 FE | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $44			  ; 10 44 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	JMP ($107C)		  ; 6C 7C 10 | Jump to address (absolute indirect)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA $030E			; 0D 0E 03 | Logical OR with accumulator (absolute)
	ORA $0009,Y		  ; 19 09 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BCS $A0			  ; B0 A0 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	BCS $78			  ; B0 78 | Branch if carry set
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1CC
; Address: $FEE46A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1CC:
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BCS $A0			  ; B0 A0 | Branch if carry set
	BVS $60			  ; 70 60 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BNE $D0			  ; D0 D0 | Branch if not equal
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1CF
; Address: $FEE4D2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1CF:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BNE $D0			  ; D0 D0 | Branch if not equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D0
; Address: $FEE512
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D0:
	JSR $4000			; 20 00 40 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7007			; 0E 07 70 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F E0 30 CF | Store accumulator to absolute long,X
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	BPL $17			  ; 10 17 | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	AND ($0F,X)		  ; 21 0F | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $38FE,X		  ; 1E FE 38 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	STA ($9C,X)		  ; 81 9C | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D1
; Address: $FEE5AE
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D1:
	CLC				  ; 18 | Clear carry flag
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	ROR $7E			  ; 66 7E | Rotate right (zero page)
	LSR $8C7E			; 4E 7E 8C | Logical shift right (absolute)
	JMP $4CBC			; 4C BC 4C | Jump to address
	LDY $007F,X		  ; BC 7F 00 | Load from absolute,X into Y register
	LSR $1E01,X		  ; 5E 01 1E | Logical shift right (absolute,X)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	AND $3107,Y		  ; 39 07 31 | Logical AND with accumulator (absolute,Y)
	INC $1E			  ; E6 1E | Increment (zero page)
	INC $1E			  ; E6 1E | Increment (zero page)
	INC $1E			  ; E6 1E | Increment (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	BMI $0F			  ; 30 0F | Branch if negative
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC $02			  ; 65 02 | Add with carry (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FD			  ; 24 FD | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $11			  ; 24 11 | Test bits in accumulator (zero page)
	EOR ($55),Y		  ; 51 55 | Exclusive OR with accumulator ((zero page),Y)
	STX $CE64			; 8E 64 CE | Store X register to absolute address
	BIT $C4			  ; 24 C4 | Test bits in accumulator (zero page)
	BIT $C4			  ; 24 C4 | Test bits in accumulator (zero page)
	BIT $C4			  ; 24 C4 | Test bits in accumulator (zero page)
	BIT $C4			  ; 24 C4 | Test bits in accumulator (zero page)
	BIT $E6			  ; 24 E6 | Test bits in accumulator (zero page)
	ASL $EE			  ; 06 EE | Arithmetic shift left (zero page)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0D04,X		  ; 1D 04 0D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D2
; Address: $FEE698
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D2:
	ORA $0D04			; 0D 04 0D | Logical OR with accumulator (absolute)
	ORA $0D04			; 0D 04 0D | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($15),Y		  ; 11 15 | Logical OR with accumulator ((zero page),Y)
	EOR ($55),Y		  ; 51 55 | Exclusive OR with accumulator ((zero page),Y)
	ASL $4E64			; 0E 64 4E | Arithmetic shift left (absolute)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $66			  ; 24 66 | Test bits in accumulator (zero page)
	ASL $6E			  ; 06 6E | Arithmetic shift left (zero page)
	ASL $0501			; 0E 01 05 | Arithmetic shift left (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC $24			  ; E5 24 | Subtract with carry (zero page)
	ROL $67			  ; 26 67 | Rotate left (zero page)
	ROL $77			  ; 26 77 | Rotate left (zero page)
	ROL $3E7F,X		  ; 3E 7F 3E | Rotate left (absolute,X)
	ROL $FBFF,X		  ; 3E FF FB | Rotate left (absolute,X)
	LDA				  ; BF FB BB FB | Load from absolute long,X into accumulator
	ROR $6E0E			; 6E 0E 6E | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D3
; Address: $FEE773
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D3:
	ASL $1F7F			; 0E 7F 1F | Arithmetic shift left (absolute)
	ROR $FF1E,X		  ; 7E 1E FF | Rotate right (absolute,X)
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	STA				  ; 9F FF 9F 1F | Store accumulator to absolute long,X
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	ASL $1E1F,X		  ; 1E 1F 1E | Arithmetic shift left (absolute,X)
	ASL $0203,X		  ; 1E 03 02 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $6E0E			; 6E 0E 6E | Rotate right (absolute)
	ASL $1F7F			; 0E 7F 1F | Arithmetic shift left (absolute)
	ROR $7F1E,X		  ; 7E 1E 7F | Rotate right (absolute,X)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	ASL $0F0F			; 0E 0F 0F | Arithmetic shift left (absolute)
	ASL $0F0E			; 0E 0E 0F | Arithmetic shift left (absolute)
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
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	DEY				  ; 88 | Decrement Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	BIT #$9B			 ; 89 9B | Test bits in accumulator (immediate)
	LDA $EDBF			; AD BF ED | Load from absolute address into accumulator
	SBC $FFFF			; ED FF FF | Subtract with carry (absolute)
	LDX $BEFF,Y		  ; BE FF BE | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D4
; Address: $FEE855
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D4:
	LDX $BEFF,Y		  ; BE FF BE | Load from absolute,Y into X register
	INC $DABE,X		  ; FE BE DA | Increment (absolute,X)
	LDX $BE9A,Y		  ; BE 9A BE | Load from absolute,Y into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $FB8A,Y		  ; BE 8A FB | Load from absolute,Y into X register
	DEX				  ; CA | Decrement X register
	CPY #$BB			 ; C0 BB | Compare Y register (immediate)
	CPY #$BB			 ; C0 BB | Compare Y register (immediate)
	CPY $BF			  ; C4 BF | Compare Y register (zero page)
	CPY $BF			  ; C4 BF | Compare Y register (zero page)
	INC $9D			  ; E6 9D | Increment (zero page)
	INC $FF95			; EE 95 FF | Increment (absolute)
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	STA				  ; 9F FF 9F FB | Store accumulator to absolute long,X
	STA				  ; 9F FB 9F FB | Store accumulator to absolute long,X
	STA				  ; 9F FB 9F 1A | Store accumulator to absolute long,X
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA $0D1F			; 0D 1F 0D | Logical OR with accumulator (absolute)
	ORA $1F1F			; 0D 1F 1F | Logical OR with accumulator (absolute)
	ASL $1E1F,X		  ; 1E 1F 1E | Arithmetic shift left (absolute,X)
	ASL $1E1F,X		  ; 1E 1F 1E | Arithmetic shift left (absolute,X)
	ASL $1A1E,X		  ; 1E 1E 1A | Arithmetic shift left (absolute,X)
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $0202,X		  ; 1E 02 02 | Arithmetic shift left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROR $1D			  ; 66 1D | Rotate right (zero page)
	ROR $7F15			; 6E 15 7F | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0F05			; 0E 05 0F | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D5
; Address: $FEE925
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D5:
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
	ORA ($E5,X)		  ; 01 E5 | Logical OR with accumulator ((zero page,X))
	SBC $FD67,X		  ; FD 67 FD | Subtract with carry (absolute,X)
	SBC $ED73			; ED 73 ED | Subtract with carry (absolute)
	SBC $5B			  ; E5 5B | Subtract with carry (zero page)
	SBC $5B			  ; E5 5B | Subtract with carry (zero page)
	SBC $9A			  ; E5 9A | Subtract with carry (zero page)
	LDX $BE9A,Y		  ; BE 9A BE | Load from absolute,Y into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $BE9A,Y		  ; BE 9A BE | Load from absolute,Y into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $BE9A,Y		  ; BE 9A BE | Load from absolute,Y into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $FFDB,Y		  ; BE DB FF | Load from absolute,Y into X register
	ROR $2E95			; 6E 95 2E | Rotate right (absolute)
	STY $3A			  ; 84 3A | Store Y register to zero page
	STA $BB			  ; 85 BB | Store accumulator to zero page
	STA				  ; 9F FB 9F FB | Store accumulator to absolute long,X
	STA				  ; 9F FB 9F FB | Store accumulator to absolute long,X
	STA				  ; 9F FB 9F FB | Store accumulator to absolute long,X
	STA				  ; 9F FB 9F 05 | Store accumulator to absolute long,X
	ORA $1D07,X		  ; 1D 07 1D | Logical OR with accumulator (absolute,X)
	ORA $0D13			; 0D 13 0D | Logical OR with accumulator (absolute)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $1F1B,X		  ; 1E 1B 1F | Arithmetic shift left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D6
; Address: $FEE9AB
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D6:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ROR $2E15			; 6E 15 2E | Rotate right (absolute)
	DEC				  ; 3A | Decrement accumulator
	ORA $3B			  ; 05 3B | Logical OR with accumulator (zero page)
	ASL $0E05			; 0E 05 0E | Arithmetic shift left (absolute)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
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
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $D9			  ; 65 D9 | Add with carry (zero page)
	ADC $C9			  ; 65 C9 | Add with carry (zero page)
	ADC $C8			  ; 65 C8 | Add with carry (zero page)
	ADC $EC			  ; 65 EC | Add with carry (zero page)
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	EOR ($DB,X)		  ; 41 DB | Exclusive OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	DEX				  ; CA | Decrement X register
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	INC $62			  ; E6 62 | Increment (zero page)
	INC $FB6A			; EE 6A FB | Increment (absolute)
	STA				  ; 9F BB 9F BB | Store accumulator to absolute long,X
	STA				  ; 9F BB 9F BB | Store accumulator to absolute long,X
	STA				  ; 9F BB 9F 99 | Store accumulator to absolute long,X
	STA				  ; 9F 91 9F 1B | Store accumulator to absolute long,X
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1D7
; Address: $FEEA87
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1D7:
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROR $62			  ; 66 62 | Rotate right (zero page)
	ROR $7B6A			; 6E 6A 7B | Rotate right (absolute)
	ORA $111F,Y		  ; 19 1F 11 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $0B0A			; 0E 0A 0B | Arithmetic shift left (absolute)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	LDY $41			  ; A4 41 | Load from zero page into Y register
	ROL $43			  ; 26 43 | Rotate left (zero page)
	ROL $43			  ; 26 43 | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	CMP $D9FF,Y		  ; D9 FF D9 | Compare accumulator (absolute,Y)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ROR $6E6A			; 6E 6A 6E | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	STA ($9F),Y		  ; 91 9F | Store accumulator to (zero page),Y
	CMP ($DF),Y		  ; D1 DF | Compare accumulator ((zero page),Y)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CMP ($DF,X)		  ; C1 DF | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1DB
; Address: $FEEB61
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1DB:
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $191F,Y		  ; 19 1F 19 | Logical OR with accumulator (absolute,Y)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROR $6E6A			; 6E 6A 6E | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	EOR ($5F),Y		  ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	EOR ($5F,X)		  ; 41 5F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1DE
; Address: $FEEBC0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1DE:
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1DF
; Address: $FEEC10
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1DF:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($DB,X)		  ; 01 DB | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $C99A,Y		  ; D9 9A C9 | Compare accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	INY				  ; C8 | Increment Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	CPX $ACBE			; EC BE AC | Compare X register (absolute)
	LDX $BEAC,Y		  ; BE AC BE | Load from absolute,Y into X register
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	NOP				  ; EA | No operation
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$FB			 ; A0 FB | Load immediate value into Y register
	LDY #$FB			 ; A0 FB | Load immediate value into Y register
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	STX $FD			  ; 86 FD | Store X register to zero page
	STX $60F5			; 8E F5 60 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1E2
; Address: $FEEC58
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1E2:
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $091A,Y		  ; 19 1A 09 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1E3
; Address: $FEEC78
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1E3:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1E4
; Address: $FEECA4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1E4:
	JSR $207B			; 20 7B 20 | Jump to subroutine
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	ASL $7D			  ; 06 7D | Arithmetic shift left (zero page)
	ASL $6075			; 0E 75 60 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1E7
; Address: $FEECB8
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1E7:
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0005			; 0E 05 00 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $BE			  ; A4 BE | Load from zero page into Y register
	ROL $BC			  ; 26 BC | Rotate left (zero page)
	ROL $BC			  ; 26 BC | Rotate left (zero page)
	LDY $AC32			; AC 32 AC | Load from absolute address into Y register
	DEC				  ; 3A | Decrement accumulator
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	SBC $65			  ; E5 65 | Subtract with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	ASL $4EF5			; 0E F5 4E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1E8
; Address: $FEED25
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1E8:
	LDY $5A			  ; A4 5A | Load from zero page into Y register
	LDA $DB			  ; A5 DB | Load from zero page into accumulator
	BIT $FB			  ; 24 FB | Test bits in accumulator (zero page)
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	ASL $1C06,X		  ; 1E 06 1C | Arithmetic shift left (absolute,X)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $4E75			; 0E 75 4E | Arithmetic shift left (absolute)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	AND $5B			  ; 25 5B | Logical AND with accumulator (zero page)
	BIT $7B			  ; 24 7B | Test bits in accumulator (zero page)
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	ASL $0E05			; 0E 05 0E | Arithmetic shift left (absolute)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1E9
; Address: $FEEDE7
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1E9:
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
	ORA ($DB,X)		  ; 01 DB | Logical OR with accumulator ((zero page,X))
	ADC $DB			  ; 65 DB | Add with carry (zero page)
	ADC $D9			  ; 65 D9 | Add with carry (zero page)
	ADC $C9			  ; 65 C9 | Add with carry (zero page)
	ADC $C8			  ; 65 C8 | Add with carry (zero page)
	ADC $EC			  ; 65 EC | Add with carry (zero page)
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	NOP				  ; EA | No operation
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	LDY $00			  ; A4 00 | Load from zero page into Y register
	LDY $00			  ; A4 00 | Load from zero page into Y register
	STX $02			  ; 86 02 | Store X register to zero page
	STX $640A			; 8E 0A 64 | Store X register to absolute address
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	STZ $FB			  ; 64 FB | Store zero to zero page
	ROR $F9			  ; 66 F9 | Rotate right (zero page)
	ROR $1BF1			; 6E F1 1B | Rotate right (absolute)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1EA
; Address: $FEEE61
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1EA:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1EB
; Address: $FEEE84
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1EB:
	JSR $2004			; 20 04 20 | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $640A			; 0E 0A 64 | Arithmetic shift left (absolute)
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	STZ $7B			  ; 64 7B | Store zero to zero page
	ROR $79			  ; 66 79 | Rotate right (zero page)
	ROR $0A71			; 6E 71 0A | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $040A			; 0E 0A 04 | Arithmetic shift left (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0201			; 0E 01 02 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	ROL $43			  ; 26 43 | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	CMP #$3E			 ; C9 3E | Compare accumulator (immediate)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CMP ($0E,X)		  ; C1 0E | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1EC
; Address: $FEEF21
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1EC:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $5B4A			; 4E 4A 5B | Logical shift right (absolute)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	ROR $2EF1			; 6E F1 2E | Rotate right (absolute)
	SBC ($3F),Y		  ; F1 3F | Subtract with carry ((zero page),Y)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	SBC ($BF,X)		  ; E1 BF | Subtract with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1ED
; Address: $FEEF3A
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1ED:
	STA				  ; 9F 60 9F 60 | Store accumulator to absolute long,X
	STA				  ; 9F 60 04 01 | Store accumulator to absolute long,X
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $5B4A			; 4E 4A 5B | Logical shift right (absolute)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	ROR $2E71			; 6E 71 2E | Rotate right (absolute)
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1F2
; Address: $FEEFA0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1F2:
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $0F01			; 0E 01 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1F3
; Address: $FEEFD1
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1F3:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $C99A,Y		  ; D9 9A C9 | Compare accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	INY				  ; C8 | Increment Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	CPX $ACBE			; EC BE AC | Compare X register (absolute)
	LDX $BEAC,Y		  ; BE AC BE | Load from absolute,Y into X register
	LDX $BE41,Y		  ; BE 41 BE | Load from absolute,Y into X register
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	EOR ($EA,X)		  ; 41 EA | Exclusive OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$FB			 ; A0 FB | Load immediate value into Y register
	LDY #$FB			 ; A0 FB | Load immediate value into Y register
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	STX $FD			  ; 86 FD | Store X register to zero page
	STX $9FF5			; 8E F5 9F | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1F4
; Address: $FEF032
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1F4:
	STA				  ; 9F 60 9F 60 | Store accumulator to absolute long,X
	STA				  ; 9F 60 9B 60 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1F7
; Address: $FEF041
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1F7:
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $091A,Y		  ; 19 1A 09 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1F8
; Address: $FEF04F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1F8:
	ASL $011E,X		  ; 1E 1E 01 | Arithmetic shift left (absolute,X)
	ASL $1E01,X		  ; 1E 01 1E | Arithmetic shift left (absolute,X)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($6A,X)		  ; 01 6A | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_1F9
; Address: $FEF084
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_1F9:
	JSR $207B			; 20 7B 20 | Jump to subroutine
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	ASL $7D			  ; 06 7D | Arithmetic shift left (zero page)
	ASL $1F75			; 0E 75 1F | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_201
; Address: $FEF0A0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_201:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0F05			; 0E 05 0F | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	LDY $BE			  ; A4 BE | Load from zero page into Y register
	ROL $BC			  ; 26 BC | Rotate left (zero page)
	ROL $BC			  ; 26 BC | Rotate left (zero page)
	LDY $AC36			; AC 36 AC | Load from absolute address into Y register
	ROL $3EA4,X		  ; 3E A4 3E | Rotate left (absolute,X)
	LDY $7F			  ; A4 7F | Load from zero page into Y register
	SBC $9A			  ; E5 9A | Subtract with carry (zero page)
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	EOR ($9E,X)		  ; 41 9E | Exclusive OR with accumulator ((zero page,X))
	EOR $9E			  ; 45 9E | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_202
; Address: $FEF0FB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_202:
	EOR $BE			  ; 45 BE | Exclusive OR with accumulator (zero page)
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	BIT $0E			  ; 24 0E | Test bits in accumulator (zero page)
	LSR $5FB5			; 4E B5 5F | Logical shift right (absolute)
	LDY $5E			  ; A4 5E | Load from zero page into Y register
	LDA $DF			  ; A5 DF | Load from zero page into accumulator
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_204
; Address: $FEF114
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_204:
	STA				  ; 9F 64 9F 64 | Store accumulator to absolute long,X
	STA				  ; 9F 64 9F 64 | Store accumulator to absolute long,X
	STA				  ; 9F 64 9F 64 | Store accumulator to absolute long,X
	ASL $1C06,X		  ; 1E 06 1C | Arithmetic shift left (absolute,X)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ASL $1E04,X		  ; 1E 04 1E | Arithmetic shift left (absolute,X)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $4E75			; 0E 75 4E | Arithmetic shift left (absolute)
	BIT $5E			  ; 24 5E | Test bits in accumulator (zero page)
	AND $5F			  ; 25 5F | Logical AND with accumulator (zero page)
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_206
; Address: $FEF175
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_206:
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $0E			  ; 64 0E | Store zero to zero page
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $0F05			; 0E 05 0F | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_207
; Address: $FEF1C3
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_207:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
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
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	ADC $FD			  ; 65 FD | Add with carry (zero page)
	ADC $ED			  ; 65 ED | Add with carry (zero page)
	ADC $EC			  ; 65 EC | Add with carry (zero page)
	ADC $C8			  ; 65 C8 | Add with carry (zero page)
	ADC $88			  ; 65 88 | Add with carry (zero page)
	ADC $88			  ; 65 88 | Add with carry (zero page)
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $EE			  ; 24 EE | Test bits in accumulator (zero page)
	LDX $A404			; AE 04 A4 | Load from absolute address into X register
	LDY $04			  ; A4 04 | Load from zero page into Y register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ASL $8A			  ; 06 8A | Arithmetic shift left (zero page)
	ASL $649F			; 0E 9F 64 | Arithmetic shift left (absolute)
	STA				  ; 9F 64 9F 64 | Store accumulator to absolute long,X
	STA				  ; 9F 64 9F 64 | Store accumulator to absolute long,X
	STA				  ; 9F 64 9D 64 | Store accumulator to absolute long,X
	STZ $1F			  ; 64 1F | Store zero to zero page
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_208
; Address: $FEF247
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_208:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROR $2E04			; 6E 04 2E | Rotate right (absolute)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_209
; Address: $FEF268
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_209:
	JSR $2004			; 20 04 20 | Jump to subroutine
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $641F			; 0E 1F 64 | Arithmetic shift left (absolute)
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1F			  ; 64 1F | Store zero to zero page
	STZ $1D			  ; 64 1D | Store zero to zero page
	STZ $15			  ; 64 15 | Store zero to zero page
	STZ $0E			  ; 64 0E | Store zero to zero page
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $040F			; 0E 0F 04 | Arithmetic shift left (absolute)
	ORA $0504			; 0D 04 05 | Logical OR with accumulator (absolute)
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
	BRA $65			  ; 80 65 | Branch always
	ASL $3E7B,X		  ; 1E 7B 3E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	BIT $FD			  ; 24 FD | Test bits in accumulator (zero page)
	BIT $FD			  ; 24 FD | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $ED			  ; 24 ED | Test bits in accumulator (zero page)
	BIT $E5			  ; 24 E5 | Test bits in accumulator (zero page)
	BIT $E5			  ; 24 E5 | Test bits in accumulator (zero page)
	BIT $E5			  ; 24 E5 | Test bits in accumulator (zero page)
	BIT $0A			  ; 24 0A | Test bits in accumulator (zero page)
	ASL $4E4A			; 0E 4A 4E | Arithmetic shift left (absolute)
	LSR $DF5A,X		  ; 5E 5A DF | Logical shift right (absolute,X)
	STZ $D5			  ; 64 D5 | Store zero to zero page
	BIT $C4			  ; 24 C4 | Test bits in accumulator (zero page)
	BIT $C5			  ; 24 C5 | Test bits in accumulator (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_20A
; Address: $FEF31C
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_20A:
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $1E1B,X		  ; 1E 1B 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $1D04,X		  ; 1D 04 1D | Logical OR with accumulator (absolute,X)
	ORA $0D04			; 0D 04 0D | Logical OR with accumulator (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $4E4A			; 0E 4A 4E | Arithmetic shift left (absolute)
	LSR $5F5A,X		  ; 5E 5A 5F | Logical shift right (absolute,X)
	STZ $55			  ; 64 55 | Store zero to zero page
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $45			  ; 24 45 | Test bits in accumulator (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL $0F0A			; 0E 0A 0F | Arithmetic shift left (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_20B
; Address: $FEF3EB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_20B:
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	BCC $65			  ; 90 65 | Branch if carry clear
	BIT $65			  ; 24 65 | Test bits in accumulator (zero page)
	BIT $65			  ; 24 65 | Test bits in accumulator (zero page)
	BIT $65			  ; 24 65 | Test bits in accumulator (zero page)
	BIT $65			  ; 24 65 | Test bits in accumulator (zero page)
	BIT $65			  ; 24 65 | Test bits in accumulator (zero page)
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	BIT $60			  ; 24 60 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_20C
; Address: $FEF3FF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_20C:
	JSR $FBFF			; 20 FF FB | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_20D
; Address: $FEF421
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_20D:
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	CPY #$64			 ; C0 64 | Compare Y register (immediate)
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_20E
; Address: $FEF47E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_20E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $64			  ; F0 64 | Branch if equal
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_20F
; Address: $FEF4B0
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_20F:
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	INC $F001,X		  ; FE 01 F0 | Increment (absolute,X)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BMI $0F			  ; 30 0F | Branch if negative
	ASL $0501,X		  ; 1E 01 05 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA $060AC0		  ; AF C0 0A 06 | Load from absolute long address into accumulator
	BEQ $01			  ; F0 01 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BPL $1E			  ; 10 1E | Branch if positive
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_212
; Address: $FEF5D4
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_212:
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $0701			; 0E 01 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $6D52			; 6D 52 6D | Add with carry (absolute)
	LDA $BDC2,X		  ; BD C2 BD | Load from absolute,X into accumulator
	REP #$C2			 ; C2 C2 | Reset processor status bits
	BCC $C2			  ; 90 C2 | Branch if carry clear
	BCC $C2			  ; 90 C2 | Branch if carry clear
	BCC $C2			  ; 90 C2 | Branch if carry clear
	BCC $C2			  ; 90 C2 | Branch if carry clear
	BCC $C2			  ; 90 C2 | Branch if carry clear
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $DF			  ; 90 DF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_214
; Address: $FEF665
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_214:
	JSL $BD22DF		  ; 22 DF 22 BD | Jump to subroutine long
	LDA $DF02,X		  ; BD 02 DF | Load from absolute,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$60			 ; 42 60 | Reserved instruction
	WDM #$60			 ; 42 60 | Reserved instruction
	WDM #$60			 ; 42 60 | Reserved instruction
	WDM #$60			 ; 42 60 | Reserved instruction
	WDM #$60			 ; 42 60 | Reserved instruction
	WDM #$60			 ; 42 60 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_216
; Address: $FEF680
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_216:
	LDA $C0AFC0		  ; AF C0 AF C0 | Load from absolute long address into accumulator
	LDA $C0AFC0		  ; AF C0 AF C0 | Load from absolute long address into accumulator
	BCC $7F			  ; 90 7F | Branch if carry clear
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $52			  ; 90 52 | Branch if carry clear
	BRA $52			  ; 80 52 | Branch always
	BRA $52			  ; 80 52 | Branch always
	BRA $52			  ; 80 52 | Branch always
	BRA $BD			  ; 80 BD | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_21E
; Address: $FEF6BE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_21E:
	JSR $BD40			; 20 40 BD | Jump to subroutine
	LDA $BD00,X		  ; BD 00 BD | Load from absolute,X into accumulator
	LDA $AF00,X		  ; BD 00 AF | Load from absolute,X into accumulator
	LDA $527F02		  ; AF 02 7F 52 | Load from absolute long address into accumulator
	BRA $52			  ; 80 52 | Branch always
	BRA $52			  ; 80 52 | Branch always
	BRA $52			  ; 80 52 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $DF			  ; 80 DF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA $BD60,X		  ; BD 60 BD | Load from absolute,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_21F
; Address: $FEF6ED
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_21F:
	JSL $6222DF		  ; 22 DF 22 62 | Jump to subroutine long
	WDM #$02			 ; 42 02 | Reserved instruction
	WDM #$02			 ; 42 02 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ADC $6D52			; 6D 52 6D | Add with carry (absolute)
	ADC $6D52			; 6D 52 6D | Add with carry (absolute)
	LDA $BDC2,X		  ; BD C2 BD | Load from absolute,X into accumulator
	REP #$AF			 ; C2 AF | Reset processor status bits
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $90			  ; 80 90 | Branch always
	BPL $90			  ; 10 90 | Branch if positive
	BPL $92			  ; 10 92 | Branch if positive
	LDA $BD02,X		  ; BD 02 BD | Load from absolute,X into accumulator
	LDA $BD02,X		  ; BD 02 BD | Load from absolute,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA $BD60,X		  ; BD 60 BD | Load from absolute,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_224
; Address: $FEF73D
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_224:
	JSL $7F2200		  ; 22 00 22 7F | Jump to subroutine long
	BCC $7F			  ; 90 7F | Branch if carry clear
	BCC $7F			  ; 90 7F | Branch if carry clear
	BCC $7F			  ; 90 7F | Branch if carry clear
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $BD			  ; 90 BD | Branch if carry clear
	LDA $C200,X		  ; BD 00 C2 | Load from absolute,X into accumulator
	REP #$52			 ; C2 52 | Reset processor status bits
	REP #$52			 ; C2 52 | Reset processor status bits
	REP #$52			 ; C2 52 | Reset processor status bits
	REP #$52			 ; C2 52 | Reset processor status bits
	REP #$52			 ; C2 52 | Reset processor status bits
	REP #$52			 ; C2 52 | Reset processor status bits
	REP #$52			 ; C2 52 | Reset processor status bits
	LDA $02AF02		  ; AF 02 AF 02 | Load from absolute long address into accumulator
	LDA $02AF02		  ; AF 02 AF 02 | Load from absolute long address into accumulator
	ADC $6D52			; 6D 52 6D | Add with carry (absolute)
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	BCC $42			  ; 90 42 | Hardware register operation
	LDA $BDC2,X		  ; BD C2 BD | Load from absolute,X into accumulator
	REP #$BD			 ; C2 BD | Reset processor status bits
	REP #$BD			 ; C2 BD | Reset processor status bits
	REP #$AF			 ; C2 AF | Reset processor status bits
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BCC $7F			  ; 90 7F | Branch if carry clear
	BCC $10			  ; 90 10 | Branch if carry clear
	WDM #$10			 ; 42 10 | Reserved instruction
	WDM #$10			 ; 42 10 | Reserved instruction
	WDM #$10			 ; 42 10 | Reserved instruction
	WDM #$10			 ; 42 10 | Reserved instruction
	WDM #$10			 ; 42 10 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$6D			 ; 42 6D | Reserved instruction
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $6D			  ; 90 6D | Branch if carry clear
	BCC $BD			  ; 90 BD | Branch if carry clear
	LDA $AF00,X		  ; BD 00 AF | Load from absolute,X into accumulator
	LDA $420002		  ; AF 02 00 42 | Hardware register operation
	WDM #$00			 ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_225
; Address: $FEF7B5
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_225:
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$90			 ; 42 90 | Reserved instruction
	BCC $D2			  ; 90 D2 | Branch if carry clear
	BNE $92			  ; D0 92 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	BIT $131B			; 2C 1B 13 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $0001			; 0D 01 00 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BIT $001F			; 2C 1F 00 | Test bits in accumulator (absolute)
	ASL $003F,X		  ; 1E 3F 00 | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_226
; Address: $FEF822
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_226:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_227
; Address: $FEF828
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_227:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CPX #$50			 ; E0 50 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_229
; Address: $FEF835
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_229:
	JSR $2040			; 20 40 20 | Jump to subroutine
	BVC $20			  ; 50 20 | Branch if overflow clear
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_22A
; Address: $FEF849
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_22A:
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	BRA $40			  ; 80 40 | Branch always
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $D0			  ; F0 D0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_22B
; Address: $FEF86B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_22B:
	JSR $40F0			; 20 F0 40 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BRA $D0			  ; 80 D0 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STY $04F8			; 8C F8 04 | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ASL $1C0E			; 0E 0E 1C | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_22C
; Address: $FEF8CE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_22C:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BPL $0C			  ; 10 0C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $7F2A			; 6E 2A 7F | Rotate right (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $ECD6,X		  ; FE D6 EC | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $00			  ; 10 00 | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_22D
; Address: $FEF8F7
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_22D:
	SEC				  ; 38 | Set carry flag
	ADC $54FE,X		  ; 7D FE 54 | Add with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $6E			  ; 10 6E | Branch if positive
	JMP ($6800)		  ; 6C 00 68 | Jump to address (absolute indirect)
	BVC $10			  ; 50 10 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $54			  ; 10 54 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $54			  ; 10 54 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $54			  ; 10 54 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $1D22,X		  ; 1D 22 1D | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_22E
; Address: $FEF989
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_22E:
	JSR $2040			; 20 40 20 | Jump to subroutine
	BRA $54			  ; 80 54 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $060F			; 0D 0F 06 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ASL $071F			; 0E 1F 07 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CMP ($23,X)		  ; C1 23 | Compare accumulator ((zero page,X))
	REP #$27			 ; C2 27 | Reset processor status bits
	DEC $07			  ; C6 07 | Decrement (zero page)
	STX $8C45			; 8E 45 8C | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)
	CMP ($A5,X)		  ; C1 A5 | Compare accumulator ((zero page,X))
	REP #$81			 ; C2 81 | Reset processor status bits
	DEC $C1			  ; C6 C1 | Decrement (zero page)
	STX $8C82			; 8E 82 8C | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_231
; Address: $FEFA0A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_231:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	INX				  ; E8 | Increment X register
	LDY $C4			  ; A4 C4 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_232
; Address: $FEFA10
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_232:
	JSR $20F0			; 20 F0 20 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	BRA $F8			  ; 80 F8 | Branch always
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	BRA $18			  ; 80 18 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_233
; Address: $FEFA4E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_233:
	CLC				  ; 18 | Clear carry flag
	BRA $F8			  ; 80 F8 | Branch always
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BEQ $88			  ; F0 88 | Branch if equal
	BVS $D8			  ; 70 D8 | Branch if overflow set
	BMI $78			  ; 30 78 | Branch if negative
	BMI $18			  ; 30 18 | Branch if negative
	BPL $18			  ; 10 18 | Branch if positive
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $0A0A			; 0E 0A 0A | Arithmetic shift left (absolute)
	ROL $3020			; 2E 20 30 | Rotate left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C0E			; 0E 0E 0C | Arithmetic shift left (absolute)
	ASL $1E0E			; 0E 0E 1E | Arithmetic shift left (absolute)
	ASL $1C06,X		  ; 1E 06 1C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_234
; Address: $FEFAAE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_234:
	BMI $10			  ; 30 10 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BPL $08			  ; 10 08 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_235
; Address: $FEFABE
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_235:
	JSR $0100			; 20 00 01 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA $1817			; 0D 17 18 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROL $2E01			; 2E 01 2E | Rotate left (absolute)
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	DEY				  ; 88 | Decrement Y register
	BCS $6C			  ; B0 6C | Branch if carry set
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_236
; Address: $FEFB34
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_236:
	JSL $38C61C		  ; 22 1C C6 38 | Jump to subroutine long
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	EOR #$7A			 ; 49 7A | Exclusive OR with accumulator (immediate)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	AND ($F8,X)		  ; 21 F8 | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_237
; Address: $FEFB51
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_237:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $6F			  ; 30 6F | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_238
; Address: $FEFB57
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_238:
	BMI $2F			  ; 30 2F | Branch if negative
	BVS $3F			  ; 70 3F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_23A
; Address: $FEFB5E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_23A:
	STA				  ; 9F 60 D4 78 | Store accumulator to absolute long,X
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $CABA			; CC BA CA | Compare Y register (absolute)
	LDY $AAC2,X		  ; BC C2 AA | Load from absolute,X into Y register
	CLD				  ; D8 | Clear decimal mode flag
	ASL $68C6,X		  ; 1E C6 68 | Arithmetic shift left (absolute,X)
	STY $F0			  ; 84 F0 | Store Y register to zero page
	PEA #$F60C		   ; F4 0C F6 | Push effective address to stack
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D0A			; 0E 0A 0D | Arithmetic shift left (absolute)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BMI $EC			  ; 30 EC | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_23B
; Address: $FEFBA5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_23B:
	JSR $2C28			; 20 28 2C | Jump to subroutine
	BMI $34			  ; 30 34 | Branch if negative
	STZ $E4B4			; 9C B4 E4 | Store zero to absolute
	CPY $9A			  ; C4 9A | Compare Y register (zero page)
	BIT $D8			  ; 24 D8 | Test bits in accumulator (zero page)
	INY				  ; C8 | Increment Y register
	LDY $D8			  ; A4 D8 | Load from zero page into Y register
	LDY $B4D0			; AC D0 B4 | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ROR $98			  ; 66 98 | Rotate right (zero page)
	ROR $0380,X		  ; 7E 80 03 | Rotate right (absolute,X)
	ORA $3B11,Y		  ; 19 11 3B | Logical OR with accumulator (absolute,Y)
	ROL $39			  ; 26 39 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0106,Y		  ; 19 06 01 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_23C
; Address: $FEFBCE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_23C:
	JSR $0439			; 20 39 04 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ORA $1C13			; 0D 13 1C | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	WDM #$3F			 ; 42 3F | Reserved instruction
	PLY				  ; 7A | Pull Y register from stack
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_23D
; Address: $FEFBE5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_23D:
	BMI $70			  ; 30 70 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_23E
; Address: $FEFBEB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_23E:
	JSR $7000			; 20 00 70 | Jump to subroutine
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $B0			  ; 30 B0 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_23F
; Address: $FEFC0D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_23F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STY $78			  ; 84 78 | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	BMI $D8			  ; 30 D8 | Branch if negative

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_240
; Address: $FEFC1B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_240:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_243
; Address: $FEFC2E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_243:
	JSR $8020			; 20 20 80 | Jump to subroutine
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_244
; Address: $FEFC3B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_244:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND $0C3F,Y		  ; 39 3F 0C | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $7C25,X		  ; 3E 25 7C | Rotate left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_246
; Address: $FEFC4F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_246:
	RTI				  ; 40 | Return from interrupt
	ROL $1F			  ; 26 1F | Rotate left (zero page)
	ROL $3C3B,X		  ; 3E 3B 3C | Rotate left (absolute,X)
	STZ $38			  ; 64 38 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	BVS $50			  ; 70 50 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_247
; Address: $FEFC5D
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_247:
	JSR $0040			; 20 40 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SBC ($A1,X)		  ; E1 A1 | Subtract with carry ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $32			  ; 26 32 | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BPL $61			  ; 10 61 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($06),Y		  ; 31 06 | Logical AND with accumulator ((zero page),Y)
	ORA $17E8,Y		  ; 19 E8 17 | Logical OR with accumulator (absolute,Y)
	ADC $E096,Y		  ; 79 96 E0 | Game work RAM access
	STA $FC899E		  ; 8F 9E 89 FC | Store accumulator to absolute long address
	XBA				  ; EB | Exchange accumulator bytes
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	INX				  ; E8 | Increment X register
	BEQ $EF			  ; F0 EF | Branch if equal
	STA				  ; 9F 60 DF 20 | Store accumulator to absolute long,X
	BMI $CF			  ; 30 CF | Branch if negative
	BMI $AF			  ; 30 AF | Branch if negative
	BPL $AF			  ; 10 AF | Branch if positive
	BPL $9F			  ; 10 9F | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	CPY $4C			  ; C4 4C | Compare Y register (zero page)
	CPY #$4E			 ; C0 4E | Compare Y register (immediate)
	REP #$4C			 ; C2 4C | Reset processor status bits
	CPY #$4D			 ; C0 4D | Compare Y register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$B9			 ; C0 B9 | Compare Y register (immediate)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $1000,X		  ; FE 00 10 | Increment (absolute,X)
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_248
; Address: $FEFCE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_248:
	JSR $7050			; 20 50 70 | Jump to subroutine
	BCC $D0			  ; 90 D0 | Branch if carry clear
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_249
; Address: $FEFCEC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_249:
	BRA $C0			  ; 80 C0 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_24A
; Address: $FEFCF4
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_24A:
	JSR $6000			; 20 00 60 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	BPL $1B			  ; 10 1B | Branch if positive
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	ASL $0E11			; 0E 11 0E | Arithmetic shift left (absolute)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	CPY #$15			 ; C0 15 | Compare Y register (immediate)
	SEP #$95			 ; E2 95 | Set processor status bits
	ADC $D99B			; 6D 9B D9 | Add with carry (absolute)
	STA ($57),Y		  ; 91 57 | Store accumulator to (zero page),Y
	BIT #$1A			 ; 89 1A | Test bits in accumulator (immediate)
	CMP $76			  ; C5 76 | Compare accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_24C
; Address: $FEFD94
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_24C:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($D9,X)		  ; 01 D9 | Logical OR with accumulator ((zero page,X))
	SBC $1558,Y		  ; F9 58 15 | Subtract with carry (absolute,Y)
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	SBC #$67			 ; E9 67 | Subtract with carry (immediate)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	ORA ($8B),Y		  ; 11 8B | Logical OR with accumulator ((zero page),Y)
	EOR ($9D,X)		  ; 41 9D | Exclusive OR with accumulator ((zero page,X))
	STA $077A,Y		  ; 99 7A 07 | Store accumulator to absolute,Y
	SEP #$1F			 ; E2 1F | Set processor status bits
	STA				  ; 9F 02 FF 06 | Store accumulator to absolute long,X
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BNE $E8			  ; D0 E8 | Branch if not equal
	INX				  ; E8 | Increment X register
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	BEQ $EF			  ; F0 EF | Branch if equal
	ROL $EC			  ; 26 EC | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ASL $1C18,X		  ; 1E 18 1C | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_24E
; Address: $FEFE13
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_24E:
	ASL $1C0E			; 0E 0E 1C | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	ORA $081E,Y		  ; 19 1E 08 | Logical OR with accumulator (absolute,Y)
	ORA $0D07,Y		  ; 19 07 0D | Logical OR with accumulator (absolute,Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $E0AE,Y		  ; B9 AE E0 | Game work RAM access
	LDA $CD47CA		  ; AF CA 47 CD | Load from absolute long address into accumulator
	STZ $E89F			; 9C 9F E8 | Store zero to absolute
	BPL $30			  ; 10 30 | Branch if positive
	ASL $9EE1,X		  ; 1E E1 9E | Arithmetic shift left (absolute,X)
	ADC ($7E,X)		  ; 61 7E | Add with carry ((zero page,X))
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA #$BA			 ; 09 BA | Logical OR with accumulator (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	REP #$FE			 ; C2 FE | Reset processor status bits
	STX $54			  ; 86 54 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	STZ $24			  ; 64 24 | Store zero to zero page
	BIT $005A			; 2C 5A 00 | Test bits in accumulator (absolute)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	INC $6C01,X		  ; FE 01 6C | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	BRA $C0			  ; 80 C0 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BPL $80			  ; 10 80 | Branch if positive
	BEQ $D0			  ; F0 D0 | Branch if equal
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_24F
; Address: $FEFE97
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_24F:
	BRA $80			  ; 80 80 | Branch always
	INC				  ; 1A | Increment accumulator
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	CMP $F717,X		  ; DD 17 F7 | Compare accumulator (absolute,X)
	DEC $F3			  ; C6 F3 | Decrement (zero page)
	LDA $9FBF,Y		  ; B9 BF 9F | Load from absolute,Y into accumulator
	STA ($E5,X)		  ; 81 E5 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_250
; Address: $FEFECB
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_250:
	CMP $010D,Y		  ; D9 0D 01 | Compare accumulator (absolute,Y)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	STA $CD02,X		  ; 9D 02 CD | Store accumulator to absolute,X
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	LDA $8146,Y		  ; B9 46 81 | Load from absolute,Y into accumulator
	ROR $3E41,X		  ; 7E 41 3E | Rotate right (absolute,X)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $FD			  ; 80 FD | Branch always
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	STA $8870,Y		  ; 99 70 88 | Store accumulator to absolute,Y
	LDY $CC			  ; A4 CC | Load from zero page into Y register
	BCS $35			  ; B0 35 | Branch if carry set
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_251
; Address: $FEFF0C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_251:
	BRA $C0			  ; 80 C0 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $9A2D			; ED 2D 9A | Subtract with carry (absolute)
	BRA $42			  ; 80 42 | Hardware register operation
	BPL $6E			  ; 10 6E | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer
	CPX $D4			  ; E4 D4 | Compare X register (zero page)
	INC $DE21			; EE 21 DE | Increment (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	ADC $798E,X		  ; 7D 8E 79 | Add with carry (absolute,X)
	STX $4471			; 8E 71 44 | Store X register to absolute address
	ROR $2E11			; 6E 11 2E | Rotate right (absolute)
	DEC $09CB,X		  ; DE CB 09 | Decrement (absolute,X)
	STA $1C1D,X		  ; 9D 1D 1C | Store accumulator to absolute,X
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $5D58			; 9C 58 5D | Store zero to absolute
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_252
; Address: $FEFF6F
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_252:
	ROL $F00F,X		  ; 3E 0F F0 | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$E01E		   ; F4 1E E0 | Game work RAM access
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$5E			 ; E0 5E | Compare X register (immediate)
	LDY #$3C			 ; A0 3C | Load immediate value into Y register
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	STA ($41,X)		  ; 81 41 | Store accumulator to (zero page,X)
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	PHB				  ; 8B | Push data bank register to stack
	ORA $651F,X		  ; 1D 1F 65 | Logical OR with accumulator (absolute,X)
	BVS $60			  ; 70 60 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $190F,X		  ; 1E 0F 19 | Arithmetic shift left (absolute,X)
	ROL $629C,X		  ; 3E 9C 62 | Rotate left (absolute,X)
	BMI $28			  ; 30 28 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_253
; Address: $FEFFA3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_253:
	BVS $E0			  ; 70 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_254
; Address: $FEFFB3
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_254:
	JSR $E040			; 20 40 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $343F			; 0D 3F 34 | Logical OR with accumulator (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $B8			  ; F0 B8 | Branch if equal
	LDY $0000			; AC 00 00 | Load from absolute address into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7C_DmaFunction_255
; Address: $FEFFFA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7C_DmaFunction_255:
	JSR $08F0			; 20 F0 08 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
