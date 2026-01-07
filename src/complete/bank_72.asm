;==============================================================================
; Dragon Quest III - Bank $72
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F90000-$F97FFF
; Instructions: 8833
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_72"

;------------------------------------------------------------------------------
; Bank72_DmaFunction_000
; Address: $F98007
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_000:
	CPY $7644			; CC 44 76 | Compare Y register (absolute)
	STY $A2			  ; 84 A2 | Store Y register to zero page
	LDY #$F4			 ; A0 F4 | Load immediate value into Y register
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	STY $DC00			; 8C 00 DC | Store Y register to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_002
; Address: $F9802B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_002:
	BVS $2E			  ; 70 2E | Branch if overflow set
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPX $D6E4			; EC E4 D6 | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	ASL $E674			; 0E 74 E6 | Arithmetic shift left (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	BIT $3000			; 2C 00 30 | Test bits in accumulator (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	JMP $009C13		  ; 5C 13 9C 00 | Jump to address long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $2201,Y		  ; 19 01 22 | Logical OR with accumulator (absolute,Y)
	STZ $04			  ; 64 04 | Store zero to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_003
; Address: $F98087
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_003:
	BEQ $A0			  ; F0 A0 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack
	CPX $A8			  ; E4 A8 | Compare X register (zero page)
	DEC				  ; 3A | Decrement accumulator
	INY				  ; C8 | Increment Y register
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_005
; Address: $F9809A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_005:
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $44			  ; 80 44 | Branch always
	ROL $20			  ; 26 20 | Rotate left (zero page)
	AND $3C15			; 2D 15 3C | Logical AND with accumulator (absolute)
	JMP $2E5E2C		  ; 5C 2C 5E 2E | Jump to address long
	ROR $7706,X		  ; 7E 06 77 | Rotate right (absolute,X)
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND $3200,Y		  ; 39 00 32 | Logical AND with accumulator (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ROR $4B4B			; 6E 4B 4B | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_006
; Address: $F980CA
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_006:
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	LDX $EF00,Y		  ; BE 00 EF | Load from absolute,Y into X register
	CPX $3900			; EC 00 39 | Compare X register (absolute)
	ADC $BE34,X		  ; 7D 34 BE | Add with carry (absolute,X)
	BNE $7F			  ; D0 7F | Branch if not equal
	EOR $46			  ; 45 46 | Exclusive OR with accumulator (zero page)
	JMP $550023		  ; 5C 23 00 55 | Jump to address long
	JMP ($2C06)		  ; 6C 06 2C | Jump to address (absolute indirect)
	STX $3E00			; 8E 00 3E | Store X register to absolute address
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	STZ $2CBE			; 9C BE 2C | Store zero to absolute
	ADC $A938,X		  ; 7D 38 A9 | Add with carry (absolute,X)
	NOP				  ; EA | No operation
	INC $AD6F,X		  ; FE 6F AD | Increment (absolute,X)
	LDX #$62			 ; A2 62 | Load immediate value into X register
	CPX $3AC4			; EC C4 3A | Compare X register (absolute)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_007
; Address: $F98113
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_007:
	JSR $6036			; 20 36 60 | Jump to subroutine
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BCC $80			  ; 90 80 | Branch if carry clear
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_008
; Address: $F9811F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_008:
	JSR $7E34			; 20 34 7E | Jump to subroutine
	BCC $5F			  ; 90 5F | Branch if carry clear
	SBC $A6			  ; E5 A6 | Subtract with carry (zero page)
	JMP $0435			; 4C 35 04 | Jump to address
	JMP $6C06			; 4C 06 6C | Jump to address
	ROL $9E00			; 2E 00 9E | Rotate left (absolute)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BIT $3C7E			; 2C 7E 3C | Test bits in accumulator (absolute)
	LDA $09E8			; AD E8 09 | Load from absolute address into accumulator
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_009
; Address: $F98148
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_009:
	LDX $65A7			; AE A7 65 | Load from absolute address into X register
	NOP				  ; EA | No operation
	REP #$3C			 ; C2 3C | Reset processor status bits
	CPY $AC32			; CC 32 AC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_00A
; Address: $F98151
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_00A:
	JSR $6032			; 20 32 60 | Jump to subroutine
	ADC $9400,Y		  ; 79 00 94 | Add with carry (absolute,Y)
	BRA $38			  ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_00B
; Address: $F9815D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_00B:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BCS $1F			  ; B0 1F | Branch if carry set
	CMP $66			  ; C5 66 | Compare accumulator (zero page)
	JMP $0E6C13		  ; 5C 13 6C 0E | Jump to address long
	JMP $6E00			; 4C 00 6E | Jump to address
	ROL $C900,X		  ; 3E 00 C9 | Rotate left (absolute,X)
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_00C
; Address: $F9817E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_00C:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX $F80D			; EC 0D F8 | Compare X register (absolute)
	ADC #$AA			 ; 69 AA | Add with carry (immediate)
	ROR $ED			  ; 66 ED | Rotate right (zero page)
	DEC $38			  ; C6 38 | Decrement (zero page)
	CPY $3A			  ; C4 3A | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	BVS $2C			  ; 70 2C | Branch if overflow set
	BRA $34			  ; 80 34 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_00D
; Address: $F98199
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_00D:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	CPY $BC63			; CC 63 BC | Compare Y register (absolute)
	JMP $131C63		  ; 5C 63 1C 13 | Jump to address long
	JMP ($3C03)		  ; 6C 03 3C | Jump to address (absolute indirect)
	ASL $7914			; 0E 14 79 | Arithmetic shift left (absolute)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	CPY $2C04			; CC 04 2C | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SBC ($AA,X)		  ; E1 AA | Subtract with carry ((zero page,X))
	DEC $3D			  ; C6 3D | Decrement (zero page)
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	DEC $38			  ; C6 38 | Decrement (zero page)
	INY				  ; C8 | Increment Y register
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BVS $28			  ; 70 28 | Branch if overflow set
	STZ $4C80,X		  ; 9E 80 4C | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank72_DmaFunction_00E
; Address: $F981D5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_00E:
	JSR $2034			; 20 34 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	CPY $AC73			; CC 73 AC | Compare Y register (absolute)
	JMP $131C63		  ; 5C 63 1C 13 | Jump to address long
	JMP ($6C12)		  ; 6C 12 6C | Jump to address (absolute indirect)
	ASL $3C34			; 0E 34 3C | Arithmetic shift left (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEC $C637			; CE 37 C6 | Decrement (absolute)
	AND $3AC5,X		  ; 3D C5 3A | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_00F
; Address: $F98208
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_00F:
	DEC $38			  ; C6 38 | Decrement (zero page)
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	BVS $2C			  ; 70 2C | Branch if overflow set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_010
; Address: $F98211
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_010:
	JSR $0018			; 20 18 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BCC $80			  ; 90 80 | Branch if carry clear
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	LSR $9AD3,X		  ; 5E D3 9A | Logical shift right (absolute,X)
	JMP $9B9C5B		  ; 5C 5B 9C 9B | Jump to address long
	LSR $BE59,X		  ; 5E 59 BE | Logical shift right (absolute,X)
	LDA ($7C),Y		  ; B1 7C | Load from (zero page),Y into accumulator
	ADC $00			  ; 65 00 | Add with carry (zero page)
	LDY $6A00			; AC 00 6A | Load from absolute address into Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	DEC $8C00			; CE 00 8C | Decrement (absolute)
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	PLX				  ; FA | Pull X register from stack
	AND $B5			  ; 25 B5 | Logical AND with accumulator (zero page)
	INC $FB24			; EE 24 FB | Increment (absolute)
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	PLY				  ; 7A | Pull Y register from stack
	STA $16			  ; 85 16 | Store accumulator to zero page
	EOR $DA00			; 4D 00 DA | Exclusive OR with accumulator (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	STA $00			  ; 85 00 | Store accumulator to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BMI $4C			  ; 30 4C | Branch if negative
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_011
; Address: $F982C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_011:
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BMI $6C			  ; 30 6C | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_012
; Address: $F982E5
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_012:
	BCC $E0			  ; 90 E0 | Game work RAM access
	BPL $C0			  ; 10 C0 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	ASL $0C04			; 0E 04 0C | Arithmetic shift left (absolute)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BVS $20			  ; 70 20 | Branch if overflow set
	BMI $60			  ; 30 60 | Branch if negative
	BMI $40			  ; 30 40 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_013
; Address: $F98327
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_013:
	BCC $E0			  ; 90 E0 | Game work RAM access
	BPL $C0			  ; 10 C0 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	ASL $0C04			; 0E 04 0C | Arithmetic shift left (absolute)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0C14			; 0E 14 0C | Arithmetic shift left (absolute)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BVS $28			  ; 70 28 | Branch if overflow set
	BMI $60			  ; 30 60 | Branch if negative
	BMI $40			  ; 30 40 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_015
; Address: $F98389
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_015:
	BPL $C0			  ; 10 C0 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $2F			  ; F0 2F | Branch if equal
	LDY #$5F			 ; A0 5F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_016
; Address: $F983C6
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_016:
	JSR $E9DF			; 20 DF E9 | Jump to subroutine
	ROR $BBE9,X		  ; 7E E9 BB | Rotate right (absolute,X)
	ORA $D300,X		  ; 1D 00 D3 | Logical OR with accumulator (absolute,X)
	NOP				  ; EA | No operation
	PHA				  ; 48 | Push accumulator to stack
	BRA $82			  ; 80 82 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	AND $3FDD,X		  ; 3D DD 3F | Logical AND with accumulator (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $1E06,X		  ; 1E 06 1E | Arithmetic shift left (absolute,X)
	ORA $1702,X		  ; 1D 02 17 | Logical OR with accumulator (absolute,X)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	BCS $A8			  ; B0 A8 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_017
; Address: $F98476
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_017:
	BCS $00			  ; B0 00 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_018
; Address: $F9847E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_018:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ROL $1F			  ; 26 1F | Rotate left (zero page)
	BIT $5B3B			; 2C 3B 5B | Test bits in accumulator (absolute)
	AND $2479,Y		  ; 39 79 24 | Logical AND with accumulator (absolute,Y)
	STZ $0A			  ; 64 0A | Store zero to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	AND $3300,Y		  ; 39 00 33 | Logical AND with accumulator (absolute,Y)
	STZ $00			  ; 64 00 | Store zero to zero page
	LSR $5F00			; 4E 00 5F | Logical shift right (absolute)
	LDA				  ; BF B0 FF 50 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_019
; Address: $F984A7
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_019:
	JSR $708F			; 20 8F 70 | Jump to subroutine
	STA $98E770		  ; 8F 70 E7 98 | Store accumulator to absolute long address
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	LDA $00DF00		  ; AF 00 DF 00 | Load from absolute long address into accumulator
	LDA $00AF00		  ; AF 00 AF 00 | Load from absolute long address into accumulator
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SBC $FF0D,X		  ; FD 0D FF | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	ORA $17EF,Y		  ; 19 EF 17 | Logical OR with accumulator (absolute,Y)
	INC $F800			; EE 00 F8 | Increment (absolute)
	BMI $38			  ; 30 38 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	STZ $F8			  ; 64 F8 | Store zero to zero page
	PHX				  ; DA | Push X register to stack
	STZ $249E			; 9C 9E 24 | Store zero to absolute
	ROL $50			  ; 26 50 | Rotate left (zero page)
	BIT $26			  ; 24 26 | Test bits in accumulator (zero page)
	INY				  ; C8 | Increment Y register
	STZ $CC00			; 9C 00 CC | Store zero to absolute
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLX				  ; FA | Pull X register from stack
	INC $FA00,X		  ; FE 00 FA | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_01A
; Address: $F98522
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_01A:
	JSR $7F60			; 20 60 7F | Jump to subroutine
	STA				  ; 9F 6C C8 4B | Store accumulator to absolute long,X
	ADC ($62,X)		  ; 61 62 | Add with carry ((zero page,X))
	LDX $8EAC			; AE AC 8E | Load from absolute address into X register
	STY $3F			  ; 84 3F | Store Y register to zero page
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_01B
; Address: $F98543
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_01B:
	BRA $3C			  ; 80 3C | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_01D
; Address: $F985A0
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_01D:
	JSL $622262		  ; 22 62 22 62 | Jump to subroutine long
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	EOR $0F3D			; 4D 3D 0F | Exclusive OR with accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $541E,Y		  ; 19 1E 54 | Logical OR with accumulator (absolute,Y)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	PHB				  ; 8B | Push data bank register to stack
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	INC $EE00			; EE 00 EE | Increment (absolute)
	NOP				  ; EA | No operation
	SBC $BD00,Y		  ; F9 00 BD | Subtract with carry (absolute,Y)
	AND $CE00,X		  ; 3D 00 CE | Logical AND with accumulator (absolute,X)
	ROL $7898,X		  ; 3E 98 78 | Rotate left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register
	SBC $1F0D,X		  ; FD 0D 1F | Subtract with carry (absolute,X)
	SEP #$D1			 ; E2 D1 | Set processor status bits
	ROR $CA00			; 6E 00 CA | Rotate right (absolute)
	ADC $4400,X		  ; 7D 00 44 | Add with carry (absolute,X)
	LSR $44			  ; 46 44 | Logical shift right (zero page)
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	ASL $ACA8			; 0E A8 AC | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	LDY $F290,X		  ; BC 90 F2 | Load from absolute,X into Y register
	BEQ $CF			  ; F0 CF | Branch if equal
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CPY $6800			; CC 00 68 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	AND $0A00,Y		  ; 39 00 0A | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $2909,Y		  ; 19 09 29 | Logical OR with accumulator (absolute,Y)
	ORA $142D,Y		  ; 19 2D 14 | Logical OR with accumulator (absolute,Y)
	ROL $3A11			; 2E 11 3A | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_01E
; Address: $F9862D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_01E:
	ORA $38			  ; 05 38 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1A00			; 0E 00 1A | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	LDY $3CA0			; AC A0 3C | Load from absolute address into Y register
	BPL $58			  ; 10 58 | Branch if positive
	BVS $58			  ; 70 58 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_01F
; Address: $F98647
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_01F:
	JSR $80F8			; 20 F8 80 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BVS $30			  ; 70 30 | Branch if overflow set
	CPY $8684			; CC 84 86 | Compare Y register (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	PLY				  ; 7A | Pull Y register from stack
	DEC $66B3			; CE B3 66 | Decrement (absolute)
	ORA $5D62,Y		  ; 19 62 5D | Logical OR with accumulator (absolute,Y)
	ADC ($4E),Y		  ; 71 4E | Add with carry ((zero page),Y)
	AND $1722,X		  ; 3D 22 17 | Logical AND with accumulator (absolute,X)
	ORA $7D72,Y		  ; 19 72 7D | Logical OR with accumulator (absolute,Y)
	CPX #$54			 ; E0 54 | Compare X register (immediate)
	NOP				  ; EA | No operation
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	AND $BD			  ; 25 BD | Logical AND with accumulator (zero page)
	CMP $DB2F			; CD 2F DB | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	STX $B9			  ; 86 B9 | Store X register to zero page
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	JMP ($DA00)		  ; 6C 00 DA | Jump to address (absolute indirect)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	AND #$26			 ; 29 26 | Logical AND with accumulator (immediate)
	ROL $26			  ; 26 26 | Rotate left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_020
; Address: $F986BA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_020:
	LDX $5F00			; AE 00 5F | Load from absolute address into X register
	ORA $F300			; 0D 00 F3 | Logical OR with accumulator (absolute)
	STA $18E6			; 8D E6 18 | Store accumulator to absolute address
	LSR $BA			  ; 46 BA | Logical shift right (zero page)
	STX $BC72			; 8E 72 BC | Store X register to absolute address
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_021
; Address: $F986CC
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_021:
	LSR $FFBE			; 4E BE FF | Logical shift right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	EOR $CB00			; 4D 00 CB | Exclusive OR with accumulator (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	AND $3713			; 2D 13 37 | Logical AND with accumulator (absolute)
	ORA #$26			 ; 09 26 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ORA $070B			; 0D 0B 07 | Logical OR with accumulator (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF BF 3F 3D | Load from absolute long,X into accumulator
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	REP #$00			 ; C2 00 | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SEP #$EE			 ; E2 EE | Set processor status bits
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA $C700,X		  ; 1D 00 C7 | Logical OR with accumulator (absolute,X)
	BEQ $90			  ; F0 90 | Branch if equal
	STZ $2624			; 9C 24 26 | Store zero to absolute
	PHY				  ; 5A | Push Y register to stack
	BEQ $00			  ; F0 00 | Branch if equal
	JMP ($FA00)		  ; 6C 00 FA | Jump to address (absolute indirect)
	SBC $AC00,X		  ; FD 00 AC | Subtract with carry (absolute,X)
	PEA #$3FC0		   ; F4 C0 3F | Push effective address to stack
	ADC $FEE2,X		  ; 7D E2 FE | Add with carry (absolute,X)
	LDY $8800			; AC 00 88 | Load from absolute address into Y register
	AND $1C00,X		  ; 3D 00 1C | Logical AND with accumulator (absolute,X)
	STA $43BC,X		  ; 9D BC 43 | Store accumulator to absolute,X
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	BRA $00			  ; 80 00 | Branch always
	LSR $B5			  ; 46 B5 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_022
; Address: $F987A2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_022:
	AND $02C2,X		  ; 3D C2 02 | Logical AND with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $004200		  ; 8F 00 42 00 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	BNE $2F			  ; D0 2F | Branch if not equal
	LDX $7F47,Y		  ; BE 47 7F | Load from absolute,Y into X register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LDY $3800,X		  ; BC 00 38 | Load from absolute,X into Y register
	CPX $1F			  ; E4 1F | Compare X register (zero page)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BMI $3F			  ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_025
; Address: $F9882F
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_025:
	CPX #$87			 ; E0 87 | Compare X register (immediate)
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $FE01,X		  ; FD 01 FE | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	BVC $50			  ; 50 50 | Branch if overflow clear
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA $DADD8F		  ; 8F 8F DD DA | Store accumulator to absolute long address
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $7000,X		  ; 7E 00 70 | Rotate right (absolute,X)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_026
; Address: $F98883
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_026:
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $A0			  ; F0 A0 | Branch if equal
	BCS $D0			  ; B0 D0 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_027
; Address: $F98898
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_027:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $6F00			; 2C 00 6F | Test bits in accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ORA ($B5,X)		  ; 01 B5 | Logical OR with accumulator ((zero page,X))
	LDX #$9A			 ; A2 9A | Load immediate value into X register
	LDA ($C8),Y		  ; B1 C8 | Load from (zero page),Y into accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_028
; Address: $F988EC
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_028:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0E02			; 0D 02 0E | Logical OR with accumulator (absolute)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_02A
; Address: $F98927
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_02A:
	BCS $1F			  ; B0 1F | Branch if carry set
	BPL $4F			  ; 10 4F | Branch if positive
	RTI				  ; 40 | Return from interrupt
	STA $848788		  ; 8F 88 87 84 | Store accumulator to absolute long address
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank72_DmaFunction_02B
; Address: $F9893A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_02B:
	LDA				  ; BF 00 77 00 | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ADC $C882,X		  ; 7D 82 C8 | Add with carry (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ADC $CA00,X		  ; 7D 00 CA | Add with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	LDY $7C00,X		  ; BC 00 7C | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	JMP ($34F8)		  ; 6C F8 34 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $1E00,X		  ; FE 00 1E | Increment (absolute,X)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BEQ $94			  ; F0 94 | Branch if equal
	CPY $FC00			; CC 00 FC | Compare Y register (absolute)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $F89E			; 9C 9E F8 | Store zero to absolute
	PEA #$1EE8		   ; F4 E8 1E | Push effective address to stack
	BEQ $6E			  ; F0 6E | Branch if equal
	DEY				  ; 88 | Decrement Y register
	LDY $F3			  ; A4 F3 | Load from zero page into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_02C
; Address: $F989CF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_02C:
	TAX				  ; AA | Transfer accumulator to X register
	BPL $00			  ; 10 00 | Branch if positive
	STY $7400			; 8C 00 74 | Store Y register to absolute address
	PHY				  ; 5A | Push Y register to stack
	CPY $5500			; CC 00 55 | Compare Y register (absolute)
	BVC $30			  ; 50 30 | Branch if overflow clear
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_02D
; Address: $F989EF
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_02D:
	DEC				  ; 3A | Decrement accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	INY				  ; C8 | Increment Y register
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	BPL $30			  ; 10 30 | Branch if positive
	AND $2F19,Y		  ; 39 19 2F | Logical AND with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA $EDED,X		  ; 1D ED ED | Logical OR with accumulator (absolute,X)
	AND $657A			; 2D 7A 65 | Logical AND with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$D20B		   ; F4 0B D2 | Push effective address to stack
	NOP				  ; EA | No operation
	SBC $D200,X		  ; FD 00 D2 | Subtract with carry (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	TXA				  ; 8A | Transfer X register to accumulator
	BIT $23			  ; 24 23 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	AND $5BB5			; 2D B5 5B | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_02E
; Address: $F98A74
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_02E:
	LDA				  ; BF 00 A5 00 | Load from absolute long,X into accumulator
	LDY $00			  ; A4 00 | Load from zero page into Y register
	DEC $DB00,X		  ; DE 00 DB | Decrement (absolute,X)
	BMI $A7			  ; 30 A7 | Branch if negative
	LDX $97			  ; A6 97 | Load from zero page into X register
	STA $DF9A,X		  ; 9D 9A DF | Store accumulator to absolute,X
	EOR ($77),Y		  ; 51 77 | Exclusive OR with accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	PLX				  ; FA | Pull X register from stack
	EOR $6B00,Y		  ; 59 00 6B | Exclusive OR with accumulator (absolute,Y)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	LDX $6400			; AE 00 64 | Load from absolute address into X register
	CLI				  ; 58 | Clear interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $824A			; CC 4A 82 | Compare Y register (absolute)
	AND $102D			; 2D 2D 10 | Logical AND with accumulator (absolute)
	BPL $88			  ; 10 88 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY $B600			; AC 00 B6 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_02F
; Address: $F98AB8
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_02F:
	ADC $FE00,X		  ; 7D 00 FE | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	PEA #$A034		   ; F4 34 A0 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR				  ; 6A | Rotate right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BEQ $BF			  ; F0 BF | Branch if equal
	LDA				  ; BF 00 DF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 8B 00 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ASL $1F1E			; 0E 1E 1F | Arithmetic shift left (absolute)
	PEA #$00E4		   ; F4 E4 00 | Push effective address to stack
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BCS $B0			  ; B0 B0 | Branch if carry set
	STZ $00			  ; 64 00 | Store zero to zero page
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	JMP $B6B4			; 4C B4 B6 | Jump to address
	LDX #$A3			 ; A2 A3 | Load immediate value into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	PEA #$FA00		   ; F4 00 FA | Push effective address to stack
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_030
; Address: $F98BAB
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_030:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $6F			  ; 90 6F | Branch if carry clear
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	WDM #$FD			 ; 42 FD | Reserved instruction
	LDA $FEB2,X		  ; BD B2 FE | Load from absolute,X into accumulator
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	ASL $F800			; 0E 00 F8 | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	JMP $0000			; 4C 00 00 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	SED				  ; F8 | Set decimal mode flag
	ADC $0FF0			; 6D F0 0F | Add with carry (absolute)
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	BMI $59			  ; 30 59 | Branch if negative
	LDX $81			  ; A6 81 | Load from zero page into X register
	ROR $BF42,X		  ; 7E 42 BF | Rotate right (absolute,X)
	LDA $7F49,Y		  ; B9 49 7F | Load from absolute,Y into accumulator
	ROR $BD00,X		  ; 7E 00 BD | Rotate right (absolute,X)
	DEC $5800			; CE 00 58 | Decrement (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0CF5			; 0D F5 0C | Logical OR with accumulator (absolute)
	PEA #$52AA		   ; F4 AA 52 | Push effective address to stack
	PLY				  ; 7A | Pull Y register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1D05,X		  ; 1D 05 1D | Logical OR with accumulator (absolute,X)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ORA $0500,X		  ; 1D 00 05 | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_031
; Address: $F98C83
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_031:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $1F			  ; 80 1F | Branch always
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	SBC $FF2D,X		  ; FD 2D FF | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0502,X		  ; FE 02 05 | Increment (absolute,X)
	PEA #$FE00		   ; F4 00 FE | Push effective address to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	ROL $25			  ; 26 25 | Rotate left (zero page)
	LDA				  ; BF B1 F5 EA | Load from absolute long,X into accumulator
	ADC $5A			  ; 65 5A | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_032
; Address: $F98CD0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_032:
	SBC $DA00,X		  ; FD 00 DA | Subtract with carry (absolute,X)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $1500			; 4E 00 15 | Logical shift right (absolute)
	LDA $BA00			; AD 00 BA | Load from absolute address into accumulator
	ASL $3E86,X		  ; 1E 86 3E | Arithmetic shift left (absolute,X)
	CPY $13EF			; CC EF 13 | Compare Y register (absolute)
	STA $B7C2,X		  ; 9D C2 B7 | Store accumulator to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $6B			  ; 64 6B | Store zero to zero page
	SBC ($BE),Y		  ; F1 BE | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	STA $00			  ; 85 00 | Store accumulator to zero page
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP $7000,Y		  ; D9 00 70 | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_034
; Address: $F98D1A
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_034:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ASL $020E			; 0E 0E 02 | Arithmetic shift left (absolute)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	AND $7809,Y		  ; 39 09 78 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0A00			; 0E 00 0A | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	INC $FF02,X		  ; FE 02 FF | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	PHX				  ; DA | Push X register to stack
	INC				  ; 1A | Increment accumulator
	CMP #$49			 ; C9 49 | Compare accumulator (immediate)
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	STY $7B			  ; 84 7B | Store Y register to zero page
	XBA				  ; EB | Exchange accumulator bytes
	BPL $F8			  ; 10 F8 | Branch if positive
	PEA #$FCA8		   ; F4 A8 FC | Push effective address to stack
	LDY #$16			 ; A0 16 | Load immediate value into Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	ORA $A8			  ; 05 A8 | Logical OR with accumulator (zero page)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BNE $D0			  ; D0 D0 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $00			  ; 64 00 | Store zero to zero page
	BVC $00			  ; 50 00 | Branch if overflow clear
	BNE $00			  ; D0 00 | Branch if not equal
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_035
; Address: $F98DCC
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_035:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $50			  ; 30 50 | Branch if negative
	INC $17			  ; E6 17 | Increment (zero page)
	INC				  ; 1A | Increment accumulator
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	TAX				  ; AA | Transfer accumulator to X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $E500,Y		  ; 19 00 E5 | Logical OR with accumulator (absolute,Y)
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $27278F		  ; 8F 8F 27 27 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	LDX $11FE			; AE FE 11 | Load from absolute address into X register
	LDY $0043,X		  ; BC 43 00 | Load from absolute,X into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	LDA				  ; BF 00 AE 00 | Load from absolute long,X into accumulator
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	INC $BD00			; EE 00 BD | Increment (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_036
; Address: $F98E23
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_036:
	JSL $7B5D5F		  ; 22 5F 5D 7B | Jump to subroutine long
	ROL $95FA,X		  ; 3E FA 95 | Rotate left (absolute,X)
	CMP $EF13,X		  ; DD 13 EF | Compare accumulator (absolute,X)
	INC $0056,X		  ; FE 56 00 | Increment (absolute,X)
	CMP $A200,X		  ; DD 00 A2 | Compare accumulator (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_037
; Address: $F98E3A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_037:
	JSL $003000		  ; 22 00 30 00 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDY $FA			  ; A4 FA | Load from zero page into Y register
	LDY $EA			  ; A4 EA | Load from zero page into Y register
	INC $E13F,X		  ; FE 3F E1 | Increment (absolute,X)
	SBC ($D6,X)		  ; E1 D6 | Subtract with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $86			  ; 86 86 | Store X register to zero page
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $00EC00		  ; 5C 00 EC 00 | Jump to address long
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_038
; Address: $F98E78
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_038:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BMI $10			  ; 30 10 | Branch if negative
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $08			  ; 10 08 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$FD			 ; 42 FD | Reserved instruction
	LDA $FEB2,X		  ; BD B2 FE | Load from absolute,X into accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $F800			; 0E 00 F8 | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	JMP $0000			; 4C 00 00 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	ADC $0FF0			; 6D F0 0F | Add with carry (absolute)
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	LDA				  ; BF 57 0D F2 | Load from absolute long,X into accumulator
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	WDM #$BF			 ; 42 BF | Reserved instruction
	LDA $7F49,Y		  ; B9 49 7F | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_039
; Address: $F98F34
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_039:
	TAY				  ; A8 | Transfer accumulator to Y register
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_03A
; Address: $F98F6B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_03A:
	JSR $6040			; 20 40 60 | Jump to subroutine
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3A05			; 0E 05 3A | Arithmetic shift left (absolute)
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PLX				  ; FA | Pull X register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $001F,Y		  ; F9 1F 00 | Subtract with carry (absolute,Y)
	JMP ($BF00)		  ; 6C 00 BF | Jump to address (absolute indirect)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDY $0600			; AC 00 06 | Load from absolute address into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ADC $7F69,X		  ; 7D 69 7F | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_03B
; Address: $F98FD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_03B:
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	ORA $3838,Y		  ; 19 38 38 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	STZ $24			  ; 64 24 | Store zero to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_03C
; Address: $F98FEE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_03C:
	STZ $24			  ; 64 24 | Store zero to zero page
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BCS $A8			  ; B0 A8 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_03D
; Address: $F9901A
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_03D:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $3110,X		  ; 1E 10 31 | Arithmetic shift left (absolute,X)
	BMI $F8			  ; 30 F8 | Branch if negative
	STY $178B			; 8C 8B 17 | Store Y register to absolute address
	BPL $00			  ; 10 00 | Branch if positive
	ASL $2F00,X		  ; 1E 00 2F | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_040
; Address: $F99081
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_040:
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $080F			; 0E 0F 08 | Arithmetic shift left (absolute)
	ORA $1818,Y		  ; 19 18 18 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_041
; Address: $F990B2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_041:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLV				  ; B8 | Clear overflow flag
	BEQ $4F			  ; F0 4F | Branch if equal
	BNE $2F			  ; D0 2F | Branch if not equal
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	BCS $AF			  ; B0 AF | Branch if carry set
	CPX $4800			; EC 00 48 | Compare X register (absolute)
	BCS $00			  ; B0 00 | Branch if carry set
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_042
; Address: $F990DC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_042:
	JSR $5000			; 20 00 50 | Jump to subroutine
	SBC $FF01,X		  ; FD 01 FF | Subtract with carry (absolute,X)
	BCC $E5			  ; 90 E5 | Branch if carry clear
	INC				  ; 1A | Increment accumulator
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	STA $38			  ; 85 38 | Store accumulator to zero page
	BNE $28			  ; D0 28 | Branch if not equal
	BNE $2D			  ; D0 2D | Branch if not equal
	SBC $7900			; ED 00 79 | Subtract with carry (absolute)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_044
; Address: $F99121
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_044:
	JSL $742262		  ; 22 62 22 74 | Jump to subroutine long
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	ORA $1F0D,X		  ; 1D 0D 1F | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $38			  ; 30 38 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	INY				  ; C8 | Increment Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INC $EE00			; EE 00 EE | Increment (absolute)
	NOP				  ; EA | No operation
	SBC $BD00,Y		  ; F9 00 BD | Subtract with carry (absolute,Y)
	AND $0E00,X		  ; 3D 00 0E | Logical AND with accumulator (absolute,X)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ROL $7F0A,X		  ; 3E 0A 7F | Rotate left (absolute,X)
	LSR $A12D,X		  ; 5E 2D A1 | Logical shift right (absolute,X)
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $BC28,X		  ; 3E 28 BC | Rotate left (absolute,X)
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_046
; Address: $F99189
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_046:
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $C0			  ; 30 C0 | Branch if negative
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_048
; Address: $F991C0
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_048:
	JSL $222222		  ; 22 22 22 22 | Jump to subroutine long
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	ORA $5D			  ; 05 5D | Logical OR with accumulator (zero page)
	AND $2A5F			; 2D 5F 2A | Logical AND with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	BMI $3F			  ; 30 3F | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX $EC00			; EC 00 EC | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	LDA $3D00,X		  ; BD 00 3D | Load from absolute,X into accumulator
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	PEA #$6C7A		   ; F4 7A 6C | Push effective address to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_049
; Address: $F9923A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_049:
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_04A
; Address: $F99256
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_04A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $AF			  ; E5 AF | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_04B
; Address: $F9926D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_04B:
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	LDX $5700			; AE 00 57 | Load from absolute address into X register
	ORA $9A00			; 0D 00 9A | Logical OR with accumulator (absolute)
	BVC $20			  ; 50 20 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	SBC $A5			  ; E5 A5 | Subtract with carry (zero page)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	LSR $DF00,X		  ; 5E 00 DF | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_04C
; Address: $F992A7
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_04C:
	BRA $40			  ; 80 40 | Branch always
	BCS $80			  ; B0 80 | Branch if carry set
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY $914C			; CC 4C 91 | Compare Y register (absolute)
	ORA ($81),Y		  ; 11 81 | Logical OR with accumulator ((zero page),Y)
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	STA $003F8C		  ; 8F 8C 3F 00 | Store accumulator to absolute long address
	LDA				  ; BF 00 FE 00 | Load from absolute long,X into accumulator
	INC $B800,X		  ; FE 00 B8 | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BCC $00			  ; 90 00 | Branch if carry clear
	BCS $C0			  ; B0 C0 | Branch if carry set
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	SEP #$EE			 ; E2 EE | Set processor status bits

;------------------------------------------------------------------------------
; Bank72_DmaFunction_04F
; Address: $F99314
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_04F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $A700,X		  ; 1D 00 A7 | Logical OR with accumulator (absolute,X)
	SBC ($F7),Y		  ; F1 F7 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_050
; Address: $F99327
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_050:
	JSR $292E			; 20 2E 29 | Jump to subroutine
	ROR $FF79,X		  ; 7E 79 FF | Rotate right (absolute,X)
	CPX #$2A			 ; E0 2A | Compare X register (immediate)
	STX $F700			; 8E 00 F7 | Store X register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	TSX				  ; BA | Transfer stack pointer to X register
	LDA				  ; BF 65 BF 44 | Load from absolute long,X into accumulator
	CPY $12			  ; C4 12 | Compare Y register (zero page)
	SBC $9768			; ED 68 97 | Subtract with carry (absolute)
	LDX $5700			; AE 00 57 | Load from absolute address into X register
	ORA $9A00			; 0D 00 9A | Logical OR with accumulator (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	INY				  ; C8 | Increment Y register
	EOR $A4FF			; 4D FF A4 | Exclusive OR with accumulator (absolute)
	LDA $2477			; AD 77 24 | Load from absolute address into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	LDY $00			  ; A4 00 | Load from zero page into Y register
	PLY				  ; 7A | Pull Y register from stack
	STZ $F8			  ; 64 F8 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	JMP $58F0			; 4C F0 58 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $90			  ; 70 90 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	BMI $D0			  ; 30 D0 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA				  ; BF 00 0F 00 | Load from absolute long,X into accumulator
	LDA $F13100		  ; AF 00 31 F1 | Load from absolute long address into accumulator
	CMP $3E29,Y		  ; D9 29 3E | Compare accumulator (absolute,Y)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_051
; Address: $F993C1
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_051:
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 98 9F 90 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank72_DmaFunction_052
; Address: $F99405
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_052:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$67			 ; E0 67 | Compare X register (immediate)
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	AND $DA			  ; 25 DA | Logical AND with accumulator (zero page)
	LSR $F4A1,X		  ; 5E A1 F4 | Logical shift right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	CPX $FB07			; EC 07 FB | Compare X register (absolute)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CMP $3F2D,X		  ; DD 2D 3F | Compare accumulator (absolute,X)
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA $1F0D			; 0D 0D 1F | Logical OR with accumulator (absolute)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($D8FE)		  ; 6C FE D8 | Jump to address (absolute indirect)
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_053
; Address: $F994BE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_053:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_057
; Address: $F994EC
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_057:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $FE0C,X		  ; 1E 0C FE | Arithmetic shift left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND $7FC3,X		  ; 3D C3 7F | Logical AND with accumulator (absolute,X)
	AND ($7F),Y		  ; 31 7F | Logical AND with accumulator ((zero page),Y)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $9C			  ; 80 9C | Branch always
	ADC $7C			  ; 65 7C | Add with carry (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $07			  ; F0 07 | Branch if equal
	DEC $3F1F			; CE 1F 3F | Decrement (absolute)
	BVS $FC			  ; 70 FC | Branch if overflow set
	LDY $D0FF			; AC FF D0 | Load from absolute address into Y register
	EOR ($5F,X)		  ; 41 5F | Exclusive OR with accumulator ((zero page,X))
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_058
; Address: $F99585
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_058:
	JSR $D0C0			; 20 C0 D0 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$10			 ; C0 10 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_059
; Address: $F99592
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_059:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BIT $3C10			; 2C 10 3C | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BIT $4820			; 2C 20 48 | Test bits in accumulator (absolute)
	BPL $58			  ; 10 58 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_05A
; Address: $F995AE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_05A:
	JSR $0AB8			; 20 B8 0A | Jump to subroutine
	BMI $14			  ; 30 14 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_05B
; Address: $F995BE
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_05B:
	PLP				  ; 28 | Pull processor status from stack
	BNE $00			  ; D0 00 | Branch if not equal
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_05C
; Address: $F99612
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_05C:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $1E			  ; 80 1E | Branch always
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	BPL $0B			  ; 10 0B | Branch if positive
	ORA $11			  ; 05 11 | Logical OR with accumulator (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $0E11			; 0D 11 0E | Logical OR with accumulator (absolute)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $3D02			; 0D 02 3D | Logical OR with accumulator (absolute)
	LDA $7878,X		  ; BD 78 78 | Load from absolute,X into accumulator
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	LDX $7943,Y		  ; BE 43 79 | Load from absolute,Y into X register
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$2B			 ; 09 2B | Logical OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	STX $80			  ; 86 80 | Store X register to zero page
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	LSR $805E,X		  ; 5E 5E 80 | Logical shift right (absolute,X)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_05D
; Address: $F9966A
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_05D:
	JSR $A0E9			; 20 E9 A0 | Jump to subroutine
	LDA $3022,Y		  ; B9 22 30 | Load from absolute,Y into accumulator
	SBC $7FFF,X		  ; FD FF 7F | Subtract with carry (absolute,X)
	STZ $61FF,X		  ; 9E FF 61 | Store zero to absolute,X
	LDX $7E87,Y		  ; BE 87 7E | Load from absolute,Y into X register
	INC $1C			  ; E6 1C | Increment (zero page)
	ROR $DC			  ; 66 DC | Rotate right (zero page)
	LDA $9FDC			; AD DC 9F | Load from absolute address into accumulator
	LDA				  ; BF A2 7F 0B | Load from absolute long,X into accumulator
	SBC $FC17,X		  ; FD 17 FC | Subtract with carry (absolute,X)
	PEA #$68BD		   ; F4 BD 68 | Push effective address to stack
	SBC $C06D,X		  ; FD 6D C0 | Subtract with carry (absolute,X)
	EOR $F480,X		  ; 5D 80 F4 | Exclusive OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	BCC $E0			  ; 90 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank72_DmaFunction_05E
; Address: $F996A2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_05E:
	INY				  ; C8 | Increment Y register
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_05F
; Address: $F996AC
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_05F:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	AND $252F			; 2D 2F 25 | Logical AND with accumulator (absolute)
	AND $B7			  ; 25 B7 | Logical AND with accumulator (zero page)
	LDA				  ; BF 01 00 0A | Load from absolute long,X into accumulator
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BVC $18			  ; 50 18 | Branch if overflow clear
	BCS $34			  ; B0 34 | Branch if carry set
	JMP ($8872)		  ; 6C 72 88 | Jump to address (absolute indirect)
	BRA $DF			  ; 80 DF | Branch always
	BRA $00			  ; 80 00 | Branch always
	ADC ($60),Y		  ; 71 60 | Add with carry ((zero page),Y)
	STX $E018			; 8E 18 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	STZ $54AB			; 9C AB 54 | Store zero to absolute
	BRA $00			  ; 80 00 | Branch always
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $97			  ; 06 97 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC #$59			 ; 69 59 | Add with carry (immediate)
	STA ($AA),Y		  ; 91 AA | Store accumulator to (zero page),Y
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $0312			; 0D 12 03 | Logical OR with accumulator (absolute)
	STX $19			  ; 86 19 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_060
; Address: $F99729
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_060:
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_063
; Address: $F99750
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_063:
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_064
; Address: $F9975B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_064:
	BRA $60			  ; 80 60 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $02			  ; 80 02 | Branch always
	ROL $3C10,X		  ; 3E 10 3C | Rotate left (absolute,X)
	AND ($7D,X)		  ; 21 7D | Logical AND with accumulator ((zero page,X))
	AND $1E13			; 2D 13 1E | Logical AND with accumulator (absolute)
	AND $1B42,X		  ; 3D 42 1B | Logical AND with accumulator (absolute,X)
	STZ $06			  ; 64 06 | Store zero to zero page
	AND $100F,Y		  ; 39 0F 10 | Logical AND with accumulator (absolute,Y)
	WDM #$70			 ; 42 70 | Reserved instruction
	LSR $78			  ; 46 78 | Logical shift right (zero page)
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $EF			  ; 80 EF | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	EOR $49BC			; 4D BC 49 | Exclusive OR with accumulator (absolute)
	BCS $AE			  ; B0 AE | Branch if carry set
	BVC $D9			  ; 50 D9 | Branch if overflow clear
	ROL $AB			  ; 26 AB | Rotate left (zero page)
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_067
; Address: $F997C9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_067:
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($94,X)		  ; 01 94 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_069
; Address: $F997EC
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_069:
	JSR $80C0			; 20 C0 80 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 33 FE 3B | Load from absolute long,X into accumulator
	INC $FE3B,X		  ; FE 3B FE | Increment (absolute,X)
	INC $7E1F,X		  ; FE 1F 7E | Increment (absolute,X)
	ROR $7E1F,X		  ; 7E 1F 7E | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_06A
; Address: $F99853
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_06A:
	JSR $01C0			; 20 C0 01 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	INC $EC28			; EE 28 EC | Increment (absolute)
	BVC $98			  ; 50 98 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank72_DmaFunction_06B
; Address: $F99866
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_06B:
	RTI				  ; 40 | Return from interrupt
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $1850			; AC 50 18 | Load from absolute address into Y register
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $0B02			; 0D 02 0B | Logical OR with accumulator (absolute)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $8002			; 0D 02 80 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_06C
; Address: $F998A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_06C:
	JSR $30A0			; 20 A0 30 | Jump to subroutine
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $60			  ; 90 60 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	BVS $98			  ; 70 98 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_06E
; Address: $F998B5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_06E:
	JSR $E010			; 20 10 E0 | Game work RAM access
	BCC $60			  ; 90 60 | Branch if carry clear
	BCC $60			  ; 90 60 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	BCC $18			  ; 90 18 | Branch if carry clear
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_06F
; Address: $F998D8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_06F:
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FC1F,X		  ; FE 1F FC | Increment (absolute,X)
	STZ $4C77			; 9C 77 4C | Store zero to absolute
	ROR $263F			; 6E 3F 26 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$63			 ; E0 63 | Compare X register (immediate)
	BEQ $B3			  ; F0 B3 | Branch if equal
	BEQ $91			  ; F0 91 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CMP $06F8,Y		  ; D9 F8 06 | Compare accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_070
; Address: $F99940
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_070:
	JSR $00C8			; 20 C8 00 | Jump to subroutine
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BRA $78			  ; 80 78 | Branch always
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	BPL $30			  ; 10 30 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	STY $05			  ; 84 05 | Store Y register to zero page
	ADC $B6B1,X		  ; 7D B1 B6 | Add with carry (absolute,X)
	ROR $FA			  ; 66 FA | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	LDY #$2E			 ; A0 2E | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_072
; Address: $F99996
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_072:
	BCS $4F			  ; B0 4F | Branch if carry set
	STA $F609,X		  ; 9D 09 F6 | Store accumulator to absolute,X
	ROL $D8			  ; 26 D8 | Rotate left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $4C			  ; 50 4C | Branch if overflow clear
	DEC $0080			; CE 80 00 | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$4C			 ; E0 4C | Compare X register (immediate)
	BCS $CE			  ; B0 CE | Branch if carry set
	BMI $9F			  ; 30 9F | Branch if negative
	LDA $F8FFA0		  ; AF A0 FF F8 | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $AC			  ; 65 AC | Add with carry (zero page)
	LDY $8C2F,X		  ; BC 2F 8C | Load from absolute,X into Y register
	DEY				  ; 88 | Decrement Y register
	ADC $7FFD			; 6D FD 7F | Add with carry (absolute)
	ROR $D4FF,X		  ; 7E FF D4 | Rotate right (absolute,X)
	STY $8C73			; 8C 73 8C | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY $8C70			; CC 70 8C | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $20			  ; 30 20 | Branch if negative
	BEQ $2C			  ; F0 2C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $BCF0,X		  ; 1E F0 BC | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDX $FCE8,Y		  ; BE E8 FC | Load from absolute,Y into X register
	DEC $0200			; CE 00 02 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_073
; Address: $F99A38
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_073:
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BMI $7C			  ; 30 7C | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CPX $1EF8			; EC F8 1E | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	ROL $9CF0,X		  ; 3E F0 9C | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_074
; Address: $F99A81
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_074:
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BEQ $DE			  ; F0 DE | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $1E			  ; F0 1E | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_075
; Address: $F99B28
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_075:
	CPX $3E			  ; E4 3E | Compare X register (zero page)
	BEQ $DE			  ; F0 DE | Branch if equal
	BNE $BE			  ; D0 BE | Branch if not equal
	BEQ $FE			  ; F0 FE | Branch if equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_076
; Address: $F99B30
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_076:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $FE			  ; F0 FE | Branch if equal
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	INC $3880,X		  ; FE 80 38 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $3C			  ; F0 3C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	STY $7004			; 8C 04 70 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	REP #$00			 ; C2 00 | Reset processor status bits
	REP #$00			 ; C2 00 | Reset processor status bits
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ROL $7D28			; 2E 28 7D | Rotate left (absolute)
	EOR $00FB,Y		  ; 59 FB 00 | Exclusive OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_077
; Address: $F99BEC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_077:
	BRA $C6			  ; 80 C6 | Branch always
	DEC $0000			; CE 00 00 | Decrement (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_078
; Address: $F99C27
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_078:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $FC			  ; F0 FC | Branch if equal
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_079
; Address: $F99C74
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_079:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STZ $7800			; 9C 00 78 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	ASL $1E08,X		  ; 1E 08 1E | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_07A
; Address: $F99C8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_07A:
	JSR $0064			; 20 64 00 | Jump to subroutine
	STY $0C03			; 8C 03 0C | Store Y register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_07B
; Address: $F99C9B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_07B:
	JSR $5824			; 20 24 58 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $FEBFF6		  ; AF F6 BF FE | Load from absolute long address into accumulator
	STA				  ; 9F EC 1F FD | Store accumulator to absolute long,X
	SBC $FB3F,Y		  ; F9 3F FB | Subtract with carry (absolute,Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_07C
; Address: $F99CD6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_07C:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	STZ $B810			; 9C 10 B8 | Store zero to absolute
	BPL $F8			  ; 10 F8 | Branch if positive
	BCS $F3			  ; B0 F3 | Branch if carry set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_07D
; Address: $F99CE8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_07D:
	JSR $60F6			; 20 F6 60 | Jump to subroutine
	INC $FD48,X		  ; FE 48 FD | Increment (absolute,X)
	BPL $FD			  ; 10 FD | Branch if positive
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_07E
; Address: $F99D09
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_07E:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA ($1B),Y		  ; 11 1B | Logical OR with accumulator ((zero page),Y)
	ORA $1D1F,Y		  ; 19 1F 1D | Logical OR with accumulator (absolute,Y)
	ORA $2BFF			; 0D FF 2B | Logical OR with accumulator (absolute)
	INC $0014,X		  ; FE 14 00 | Increment (absolute,X)
	BIT $2400			; 2C 00 24 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_07F
; Address: $F99D58
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_07F:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_080
; Address: $F99D7E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_080:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $0007			; 0D 07 00 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	CPX $F654			; EC 54 F6 | Compare X register (absolute)
	DEY				  ; 88 | Decrement Y register
	SEP #$08			 ; E2 08 | Set processor status bits
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	LDA $1E00			; AD 00 1E | Load from absolute address into accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX $7410			; EC 10 74 | Compare X register (absolute)
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_081
; Address: $F99DD4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_081:
	LDY #$5E			 ; A0 5E | Load immediate value into Y register
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	LDY $1E13			; AC 13 1E | Load from absolute address into Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $140F			; 0E 0F 14 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	BPL $09			  ; 10 09 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $FF1F			; 0E 1F FF | Arithmetic shift left (absolute)
	INC $EC3F,X		  ; FE 3F EC | Increment (absolute,X)
	SBC ($FD,X)		  ; E1 FD | Subtract with carry ((zero page,X))
	CMP ($B0,X)		  ; C1 B0 | Compare accumulator ((zero page,X))
	LDY $00			  ; A4 00 | Load from zero page into Y register
	LDY $C000			; AC 00 C0 | Load from absolute address into Y register
	ASL $3E7F,X		  ; 1E 7F 3E | Arithmetic shift left (absolute,X)
	BMI $FB			  ; 30 FB | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_082
; Address: $F99E23
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_082:
	PLX				  ; FA | Pull X register from stack
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	BRA $FD			  ; 80 FD | Branch always
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BCC $80			  ; 90 80 | Branch if carry clear
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_083
; Address: $F99E5C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_083:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ROR $6E3F,X		  ; 7E 3F 6E | Rotate right (absolute,X)
	ROR $F43F			; 6E 3F F4 | Rotate right (absolute)
	PEA #$7C1F		   ; F4 1F 7C | Push effective address to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_084
; Address: $F99E90
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_084:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BMI $11			  ; 30 11 | Branch if negative
	BMI $19			  ; 30 19 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($E8,X)		  ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
	AND ($3C,X)		  ; 21 3C | Logical AND with accumulator ((zero page,X))
	ORA $3C7C,Y		  ; 19 7C 3C | Logical OR with accumulator (absolute,Y)
	ROR $7778,X		  ; 7E 78 77 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_085
; Address: $F99ED4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_085:
	BVC $6F			  ; 50 6F | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $3E			  ; 10 3E | Branch if positive
	AND $7828,X		  ; 3D 28 78 | Logical AND with accumulator (absolute,X)
	EOR ($D0,X)		  ; 41 D0 | Exclusive OR with accumulator ((zero page,X))
	STA ($10,X)		  ; 81 10 | Store accumulator to (zero page,X)
	ORA ($30),Y		  ; 11 30 | Logical OR with accumulator ((zero page),Y)
	ORA ($70),Y		  ; 11 70 | Logical OR with accumulator ((zero page),Y)
	BMI $70			  ; 30 70 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BVC $AF			  ; 50 AF | Branch if overflow clear
	BPL $EF			  ; 10 EF | Branch if positive
	BVC $AF			  ; 50 AF | Branch if overflow clear
	BVS $8F			  ; 70 8F | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($62,X)		  ; 01 62 | Logical OR with accumulator ((zero page,X))
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_086
; Address: $F99F62
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_086:
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	BPL $0C			  ; 10 0C | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_087
; Address: $F99F69
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_087:
	JSR $2109			; 20 09 21 | PPU graphics register access
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	PHB				  ; 8B | Push data bank register to stack
	ORA $392B,Y		  ; 19 2B 39 | Logical OR with accumulator (absolute,Y)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	STA $E381			; 8D 81 E3 | Store accumulator to absolute address
	STX $3C8E			; 8E 8E 3C | Store X register to absolute address
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ROR $9EFF,X		  ; 7E FF 9E | Rotate right (absolute,X)
	ADC $708F,X		  ; 7D 8F 70 | Add with carry (absolute,X)
	ADC $781F,Y		  ; 79 1F 78 | Add with carry (absolute,Y)
	STA $1A0FBE		  ; 8F BE 0F 1A | Store accumulator to absolute long address
	EOR $1F			  ; 45 1F | Exclusive OR with accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register
	STX $80			  ; 86 80 | Store X register to zero page
	BRA $8D			  ; 80 8D | Branch always
	BRA $8A			  ; 80 8A | Branch always
	BRA $41			  ; 80 41 | Branch always
	BRA $E5			  ; 80 E5 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	INC				  ; 1A | Increment accumulator
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	WDM #$F4			 ; 42 F4 | Reserved instruction
	LSR $E4			  ; 46 E4 | Logical shift right (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $8EFF,X		  ; FE FF 8E | Increment (absolute,X)
	DEC $465D			; CE 5D 46 | Decrement (absolute)
	ROL $37			  ; 26 37 | Rotate left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	ADC ($F8),Y		  ; 71 F8 | Add with carry ((zero page),Y)
	AND ($F8),Y		  ; 31 F8 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_088
; Address: $F9A016
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_088:
	LDA $F97C,Y		  ; B9 7C F9 | Load from absolute,Y into accumulator
	SBC $FC7F,X		  ; FD 7F FC | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $70			  ; 30 70 | Branch if negative
	ADC $39F8,Y		  ; 79 F8 39 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	LSR $537E			; 4E 7E 53 | Logical shift right (absolute)
	ORA #$D3			 ; 09 D3 | Logical OR with accumulator (immediate)
	BIT $FF00			; 2C 00 FF | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $0300			; 0D 00 03 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $7E7E,X		  ; BC 7E 7E | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 80 7F 00 | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_089
; Address: $F9A0AE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_089:
	JSR $7E68			; 20 68 7E | Jump to subroutine
	ROL $00			  ; 26 00 | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	ROL $18			  ; 26 18 | Rotate left (zero page)
	BMI $08			  ; 30 08 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_08A
; Address: $F9A0BD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_08A:
	JSR $1068			; 20 68 10 | Jump to subroutine
	WDM #$3C			 ; 42 3C | Reserved instruction
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_08C
; Address: $F9A0CA
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_08C:
	JSR $3068			; 20 68 30 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BMI $28			  ; 30 28 | Branch if negative
	BVC $38			  ; 50 38 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BVS $1B			  ; 70 1B | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	LSR $39			  ; 46 39 | Logical shift right (zero page)
	EOR $1B			  ; 45 1B | Exclusive OR with accumulator (zero page)
	ASL $0827			; 0E 27 08 | Arithmetic shift left (absolute)
	ADC $7E01,X		  ; 7D 01 7E | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	STA $8E			  ; 85 8E | Store accumulator to zero page
	STY $8E			  ; 84 8E | Store Y register to zero page
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$86			 ; E0 86 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STX $78			  ; 86 78 | Store X register to zero page
	CPX $DC10			; EC 10 DC | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_08D
; Address: $F9A117
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_08D:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_08E
; Address: $F9A11E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_08E:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $2C18			; 2C 18 2C | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $04			  ; 10 04 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_08F
; Address: $F9A159
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_08F:
	JSR $300C			; 20 0C 30 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_090
; Address: $F9A161
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_090:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $3978,Y		  ; 79 78 39 | Add with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF BC 0F 8C | Load from absolute long,X into accumulator
	ADC $1D8C			; 6D 8C 1D | Add with carry (absolute)
	ORA $057E			; 0D 7E 05 | Logical OR with accumulator (absolute)
	ROL $F708,X		  ; 3E 08 F7 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STZ $8C63			; 9C 63 8C | Store zero to absolute
	STY $7C73			; 8C 73 7C | Store Y register to absolute address
	JMP $132C23		  ; 5C 23 2C 13 | Jump to address long
	ORA $093F			; 0D 3F 09 | Logical OR with accumulator (absolute)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_091
; Address: $F9A1B6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_091:
	PLP				  ; 28 | Pull processor status from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 0B BF 1B | Load from absolute long,X into accumulator
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	BPL $1F			  ; 10 1F | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_092
; Address: $F9A1FA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_092:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $20			  ; 50 20 | Branch if overflow clear
	BCS $40			  ; B0 40 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $80			  ; 30 80 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_093
; Address: $F9A22B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_093:
	JSR $E080			; 20 80 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_096
; Address: $F9A234
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_096:
	BMI $C0			  ; 30 C0 | Branch if negative
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank72_DmaFunction_097
; Address: $F9A23A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_097:
	JSR $A0C0			; 20 C0 A0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_098
; Address: $F9A23F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_098:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVC $60			  ; 50 60 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $40			  ; 90 40 | Branch if carry clear
	BCC $E0			  ; 90 E0 | Game work RAM access
	BEQ $80			  ; F0 80 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	BPL $C0			  ; 10 C0 | Branch if positive
	BNE $10			  ; D0 10 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_099
; Address: $F9A272
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_099:
	BVS $80			  ; 70 80 | Branch if overflow set
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CPX $F609			; EC 09 F6 | Compare X register (absolute)
	CMP $D232			; CD 32 D2 | Compare accumulator (absolute)
	AND ($80,X)		  ; 21 80 | Logical AND with accumulator ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_09A
; Address: $F9A2A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_09A:
	JSR $E070			; 20 70 E0 | Game work RAM access
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $C0			  ; 70 C0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_09B
; Address: $F9A2AC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_09B:
	BRA $10			  ; 80 10 | Branch always
	BNE $A0			  ; D0 A0 | Branch if not equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_09C
; Address: $F9A2B2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_09C:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	BNE $60			  ; D0 60 | Branch if not equal
	BCC $70			  ; 90 70 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank72_DmaFunction_09D
; Address: $F9A2B9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_09D:
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $C0			  ; F0 C0 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $210D,X		  ; 1E 0D 21 | PPU graphics register access
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_09E
; Address: $F9A2E0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_09E:
	JSR $3048			; 20 48 30 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BVC $9C			  ; 50 9C | Branch if overflow clear
	STY $8E			  ; 84 8E | Store Y register to zero page
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDA ($08,X)		  ; A1 08 | Load from (zero page,X) into accumulator
	BVS $38			  ; 70 38 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BEQ $18			  ; F0 18 | Branch if equal
	CPX $84			  ; E4 84 | Compare X register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_09F
; Address: $F9A2FD
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_09F:
	STZ $1FA0,X		  ; 9E A0 1F | Store zero to absolute,X
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL $0602			; 0E 02 06 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $87			  ; 64 87 | Store zero to zero page
	LDA $00FD10		  ; AF 10 FD 00 | Load from absolute long address into accumulator
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0A1
; Address: $F9A354
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0A1:
	JSL $807DDD		  ; 22 DD 7D 80 | Jump to subroutine long
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0A5
; Address: $F9A367
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0A5:
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	CLV				  ; B8 | Clear overflow flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $20			  ; 30 20 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0A7
; Address: $F9A378
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0A7:
	JSR $B0D8			; 20 D8 B0 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	INC				  ; 1A | Increment accumulator
	BMI $43			  ; 30 43 | Branch if negative
	INC $00			  ; E6 00 | Increment (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	ADC $7C03,X		  ; 7D 03 7C | Add with carry (absolute,X)
	SEP #$1C			 ; E2 1C | Set processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0A8
; Address: $F9A3A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0A8:
	JSR $20A8			; 20 A8 20 | Jump to subroutine
	CPX $C218			; EC 18 C2 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	REP #$00			 ; C2 00 | Reset processor status bits
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $2C00,X		  ; 5E 00 2C | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0A9
; Address: $F9A3B0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0A9:
	JSR $20D8			; 20 D8 20 | Jump to subroutine
	BRA $7E			  ; 80 7E | Branch always
	BRA $7E			  ; 80 7E | Branch always
	PHA				  ; 48 | Push accumulator to stack
	JMP $002C22		  ; 5C 22 2C 00 | Jump to address long
	ORA ($E3,X)		  ; 01 E3 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0AA
; Address: $F9A3E0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0AA:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0AD
; Address: $F9A416
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0AD:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	BVC $68			  ; 50 68 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	LDX $0010			; AE 10 00 | Load from absolute address into X register
	PHP				  ; 08 | Push processor status to stack
	ASL $1437,X		  ; 1E 37 14 | Arithmetic shift left (absolute,X)
	ADC $7E15,X		  ; 7D 15 7E | Add with carry (absolute,X)
	AND $0F7F,Y		  ; 39 7F 0F | Logical AND with accumulator (absolute,Y)
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0AE
; Address: $F9A47A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0AE:
	JSR $2002			; 20 02 20 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0AF
; Address: $F9A487
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0AF:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BVS $80			  ; 70 80 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B0
; Address: $F9A494
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B0:
	JSR $9000			; 20 00 90 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	DEC $0F61,X		  ; DE 61 0F | Decrement (absolute,X)
	EOR $0257			; 4D 57 02 | Exclusive OR with accumulator (absolute)
	PEA #$ECA3		   ; F4 A3 EC | Push effective address to stack
	STY $9283			; 8C 83 92 | Store Y register to absolute address
	BIT $2055			; 2C 55 20 | Test bits in accumulator (absolute)
	STZ $B060,X		  ; 9E 60 B0 | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	EOR $0B00,Y		  ; 59 00 0B | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B1
; Address: $F9A4E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B1:
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B2
; Address: $F9A4EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B2:
	BRA $D0			  ; 80 D0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B3
; Address: $F9A4F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B3:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B4
; Address: $F9A4FE
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B4:
	JSR $3900			; 20 00 39 | Jump to subroutine
	AND $0E11,X		  ; 3D 11 0E | Logical AND with accumulator (absolute,X)
	ORA $0702			; 0D 02 07 | Logical OR with accumulator (absolute)
	ORA $0C04			; 0D 04 0C | Logical OR with accumulator (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $0300			; 0D 00 03 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $D0			  ; F0 D0 | Branch if equal
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BEQ $30			  ; F0 30 | Branch if equal
	BIT $E4F4			; 2C F4 E4 | Test bits in accumulator (absolute)
	CPY $34			  ; C4 34 | Compare Y register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $CC00			; 2C 00 CC | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	ORA $8500			; 0D 00 85 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	EOR ($63,X)		  ; 41 63 | Exclusive OR with accumulator ((zero page,X))
	LDX #$63			 ; A2 63 | Load immediate value into X register
	BRA $9C			  ; 80 9C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	ROL $18			  ; 26 18 | Rotate left (zero page)
	LDX $5D00,Y		  ; BE 00 5D | Load from absolute,Y into X register
	BRA $63			  ; 80 63 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B5
; Address: $F9A579
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B5:
	CLC				  ; 18 | Clear carry flag
	LDX $9C00,Y		  ; BE 00 9C | Load from absolute,Y into X register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BMI $40			  ; 30 40 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B7
; Address: $F9A59E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B7:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ASL $1021,X		  ; 1E 21 10 | Arithmetic shift left (absolute,X)
	BPL $37			  ; 10 37 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $98			  ; 10 98 | Branch if positive
	BMI $B8			  ; 30 B8 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPX $F80C			; EC 0C F8 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $60			  ; F0 60 | Branch if equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B8
; Address: $F9A5D4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B8:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	AND ($67,X)		  ; 21 67 | Logical AND with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	BPL $09			  ; 10 09 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0B9
; Address: $F9A604
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0B9:
	BPL $30			  ; 10 30 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	BVS $18			  ; 70 18 | Branch if overflow set
	WDM #$F3			 ; 42 F3 | Reserved instruction
	BIT $FD			  ; 24 FD | Test bits in accumulator (zero page)
	ORA $BF			  ; 05 BF | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0BA
; Address: $F9A613
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0BA:
	BRA $E8			  ; 80 E8 | Branch always
	DEY				  ; 88 | Decrement Y register
	INC $00			  ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0BB
; Address: $F9A61C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0BB:
	JSL $005000		  ; 22 00 50 00 | Jump to subroutine long
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	ADC $3A01,X		  ; 7D 01 3A | Add with carry (absolute,X)
	ORA ($DA,X)		  ; 01 DA | Logical OR with accumulator ((zero page,X))
	STA ($9A,X)		  ; 81 9A | Store accumulator to (zero page,X)
	STA ($9A,X)		  ; 81 9A | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	NOP				  ; EA | No operation
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDX #$7F			 ; A2 7F | Load immediate value into X register
	XBA				  ; EB | Exchange accumulator bytes
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	STZ $00DE			; 9C DE 00 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0BC
; Address: $F9A68B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0BC:
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	STA $5400,X		  ; 9D 00 54 | Store accumulator to absolute,X
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	BVC $D8			  ; 50 D8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0BD
; Address: $F9A6A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0BD:
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $4F			  ; 05 4F | Logical OR with accumulator (zero page)
	AND #$BD			 ; 29 BD | Logical AND with accumulator (immediate)
	BVC $D4			  ; 50 D4 | Branch if overflow clear
	BIT $76			  ; 24 76 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0BE
; Address: $F9A6B2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0BE:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	CMP $2800,Y		  ; D9 00 28 | Compare accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	PEA #$7310		   ; F4 10 73 | Push effective address to stack
	BMI $F3			  ; 30 F3 | Branch if negative
	ADC ($E6,X)		  ; 61 E6 | Add with carry ((zero page,X))
	REP #$C5			 ; C2 C5 | Reset processor status bits
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	BRA $87			  ; 80 87 | Branch always
	CPX $CC00			; EC 00 CC | Compare X register (absolute)
	STA $3A00,Y		  ; 99 00 3A | Store accumulator to absolute,Y
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $08			  ; 70 08 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C0
; Address: $F9A6E6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C0:
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BPL $C0			  ; 10 C0 | Branch if positive
	BPL $80			  ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C1
; Address: $F9A6EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C1:
	JSR $2080			; 20 80 20 | Jump to subroutine
	BRA $8C			  ; 80 8C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C2
; Address: $F9A6FC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C2:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND #$FD			 ; 29 FD | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ROR $3420			; 6E 20 34 | Rotate right (absolute)
	STY $8E01			; 8C 01 8E | Store Y register to absolute address
	WDM #$12			 ; 42 12 | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	STY $00			  ; 84 00 | Store Y register to zero page
	LSR $7E01,X		  ; 5E 01 7E | Logical shift right (absolute,X)
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	AND $0500,X		  ; 3D 00 05 | Logical AND with accumulator (absolute,X)
	AND $FD			  ; 25 FD | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C3
; Address: $F9A722
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C3:
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	REP #$2B			 ; C2 2B | Reset processor status bits
	LDA $B734,X		  ; BD 34 B7 | Load from absolute,X into accumulator
	INC				  ; 1A | Increment accumulator
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$DD			 ; C0 DD | Compare Y register (immediate)
	ASL $9E16			; 0E 16 9E | Arithmetic shift left (absolute)
	JMP $54FC14		  ; 5C 14 FC 54 | Jump to address long
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	STA $2900,X		  ; 9D 00 29 | Store accumulator to absolute,X
	PHB				  ; 8B | Push data bank register to stack
	BIT $2816			; 2C 16 28 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	BIT $0C50			; 2C 50 0C | Test bits in accumulator (absolute)
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $E2			  ; 70 E2 | Branch if overflow set
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $1E			  ; 10 1E | Branch if positive
	ASL $2F00			; 0E 00 2F | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $7B78			; 0D 78 7B | Logical OR with accumulator (absolute)
	ASL $BFFE,X		  ; 1E FE BF | Arithmetic shift left (absolute,X)
	SBC $F30C,X		  ; FD 0C F3 | Subtract with carry (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STY $00			  ; 84 00 | Store Y register to zero page
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA $F302,X		  ; 1D 02 F3 | Logical OR with accumulator (absolute,X)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	LDX $593D,Y		  ; BE 3D 59 | Load from absolute,Y into X register
	STA ($AF,X)		  ; 81 AF | Store accumulator to (zero page,X)
	REP #$DF			 ; C2 DF | Reset processor status bits
	CPY $5DDF			; CC DF 5D | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C4
; Address: $F9A7EE
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C4:
	BCS $86			  ; B0 86 | Branch if carry set
	WDM #$00			 ; 42 00 | Reserved instruction
	ROL $B000,X		  ; 3E 00 B0 | Rotate left (absolute,X)
	STA $3D00			; 8D 00 3D | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	INC $BF11,X		  ; FE 11 BF | Increment (absolute,X)
	LDX $BE92,Y		  ; BE 92 BE | Load from absolute,Y into X register
	LSR $446E			; 4E 6E 44 | Logical shift right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	INC $ED00			; EE 00 ED | Increment (absolute)
	ADC $B100			; 6D 00 B1 | Add with carry (absolute)
	PLB				  ; AB | Pull data bank register from stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BMI $4F			  ; 30 4F | Branch if negative
	PHB				  ; 8B | Push data bank register to stack
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCS $00			  ; B0 00 | Branch if carry set
	ADC $FC00,X		  ; 7D 00 FC | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C5
; Address: $F9A86E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C5:
	JSR $002F			; 20 2F 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ROL $3000			; 2E 00 30 | Rotate left (absolute)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$A7A7		   ; F4 A7 A7 | Push effective address to stack
	SBC $DDEC,X		  ; FD EC DD | Subtract with carry (absolute,X)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	AND $0004,Y		  ; 39 04 00 | Logical AND with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C6
; Address: $F9A89B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C6:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	SBC $DF			  ; E5 DF | Subtract with carry (zero page)
	SBC $69FF			; ED FF 69 | Subtract with carry (absolute)
	PHX				  ; DA | Push X register to stack
	INC $FF1A,X		  ; FE 1A FF | Increment (absolute,X)
	BMI $FD			  ; 30 FD | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C7
; Address: $F9A8B0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C7:
	ROL				  ; 2A | Rotate left (accumulator)
	NOP				  ; EA | No operation
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	JMP $CE00			; 4C 00 CE | Jump to address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C8
; Address: $F9A8C0
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C8:
	JSR $13E0			; 20 E0 13 | Jump to subroutine
	PEA #$E807		   ; F4 07 E8 | Push effective address to stack
	INX				  ; E8 | Increment X register
	CPX #$4F			 ; E0 4F | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $0F			  ; 80 0F | Branch always
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	DEY				  ; 88 | Decrement Y register
	BVS $18			  ; 70 18 | Branch if overflow set
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	ROL $78			  ; 26 78 | Rotate left (zero page)
	STX $30			  ; 86 30 | Store X register to zero page
	DEC $CFAF			; CE AF CF | Decrement (absolute)
	LSR $A791,X		  ; 5E 91 A7 | Logical shift right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDY $3F00,X		  ; BC 00 3F | Load from absolute,X into Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	EOR $3100,Y		  ; 59 00 31 | Exclusive OR with accumulator (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BEQ $14			  ; F0 14 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0C9
; Address: $F9A938
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0C9:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	INX				  ; E8 | Increment X register
	CPX $6800			; EC 00 68 | Compare X register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	DEC $BC2C,X		  ; DE 2C BC | Decrement (absolute,X)
	ASL $3443,X		  ; 1E 43 34 | Arithmetic shift left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0CA
; Address: $F9A951
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0CA:
	JSR $002D			; 20 2D 00 | Jump to subroutine
	LDY $E900,X		  ; BC 00 E9 | Load from absolute,X into Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	REP #$E7			 ; C2 E7 | Reset processor status bits
	STA $AC			  ; 85 AC | Store accumulator to zero page
	EOR #$18			 ; 49 18 | Exclusive OR with accumulator (immediate)
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	PHY				  ; 5A | Push Y register to stack
	JMP $CCAB			; 4C AB CC | Jump to address
	CPY $13			  ; C4 13 | Compare Y register (zero page)
	ROR $6A00			; 6E 00 6A | Rotate right (absolute)
	CPX $8E00			; EC 00 8E | Compare X register (absolute)
	DEC $E9C8			; CE C8 E9 | Decrement (absolute)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	BRA $07			  ; 80 07 | Branch always
	EOR ($8F,X)		  ; 41 8F | Exclusive OR with accumulator ((zero page,X))
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	DEC $7E			  ; C6 7E | Decrement (zero page)
	ADC $0071,X		  ; 7D 71 00 | Add with carry (absolute,X)
	STA $F800			; 8D 00 F8 | Store accumulator to absolute address
	BVS $00			  ; 70 00 | Branch if overflow set
	STX $00			  ; 86 00 | Store X register to zero page
	LDA $0300,Y		  ; B9 00 03 | Load from absolute,Y into accumulator
	ASL $7C80			; 0E 80 7C | Arithmetic shift left (absolute)
	CPX $D949			; EC 49 D9 | Compare X register (absolute)
	STZ $F818,X		  ; 9E 18 F8 | Store zero to absolute,X
	STA $001B00		  ; 8F 00 1B 00 | Store accumulator to absolute long address
	ADC $E300			; 6D 00 E3 | Add with carry (absolute)
	STA $E760,X		  ; 9D 60 E7 | Store accumulator to absolute,X
	CMP $37B2,X		  ; DD B2 37 | Compare accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	EOR $57FE,X		  ; 5D FE 57 | Exclusive OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	LDX $7D31,Y		  ; BE 31 7D | Load from absolute,Y into X register
	WDM #$FB			 ; 42 FB | Reserved instruction
	BIT $C540			; 2C 40 C5 | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0CC
; Address: $F9A9E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0CC:
	PHP				  ; 08 | Push processor status to stack
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BVS $E4			  ; 70 E4 | Branch if overflow set
	STX $0090			; 8E 90 00 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0CD
; Address: $F9A9F6
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0CD:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	STY $1A00			; 8C 00 1A | Store Y register to absolute address
	CPX #$8D			 ; E0 8D | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $3E00,X		  ; 1D 00 3E | Logical OR with accumulator (absolute,X)
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	JMP $00104E		  ; 5C 4E 10 00 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	BPL $88			  ; 10 88 | Branch if positive
	CPY $CFB7			; CC B7 CF | Compare Y register (absolute)
	LSR $4701			; 4E 01 47 | Logical shift right (absolute)
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	INC $61			  ; E6 61 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	BCC $AF			  ; 90 AF | Branch if carry clear
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	ROR $F9			  ; 66 F9 | Rotate right (zero page)
	CMP ($DF,X)		  ; C1 DF | Compare accumulator ((zero page,X))
	ASL $2980,X		  ; 1E 80 29 | Arithmetic shift left (absolute,X)
	ASL $7E00			; 0E 00 7E | Arithmetic shift left (absolute)
	STA $3E06,Y		  ; 99 06 3E | Store accumulator to absolute,Y
	SBC $DD55,X		  ; FD 55 DD | Subtract with carry (absolute,X)
	CMP $ADD5			; CD D5 AD | Compare accumulator (absolute)
	LDA				  ; BF 08 3B C9 | Load from absolute long,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	STA $8E			  ; 85 8E | Store accumulator to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	TAX				  ; AA | Transfer accumulator to X register
	PHP				  ; 08 | Push processor status to stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	PEA #$3400		   ; F4 00 34 | Push effective address to stack
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0CE
; Address: $F9AA81
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0CE:
	ROL $78			  ; 26 78 | Rotate left (zero page)
	STX $B0			  ; 86 B0 | Store X register to zero page
	DEC $ECD1			; CE D1 EC | Decrement (absolute)
	STA $27D19E		  ; 8F 9E D1 27 | Store accumulator to absolute long address
	CLV				  ; B8 | Clear overflow flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	EOR $3100,Y		  ; 59 00 31 | Exclusive OR with accumulator (absolute,Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	AND ($0E,X)		  ; 21 0E | Logical AND with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0CF
; Address: $F9AAC0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0CF:
	JSR $207F			; 20 7F 20 | Jump to subroutine
	LDA				  ; BF 38 BF 1E | Load from absolute long,X into accumulator
	STA				  ; 9F 0F CF 43 | Store accumulator to absolute long,X
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	STA				  ; 9F 00 5F 00 | Store accumulator to absolute long,X
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ROR $6F00,X		  ; 7E 00 6F | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $03			  ; 84 03 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D0
; Address: $F9AB3E
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D0:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	INC				  ; 1A | Increment accumulator
	WDM #$96			 ; 42 96 | Reserved instruction
	EOR #$B8			 ; 49 B8 | Exclusive OR with accumulator (immediate)
	BCS $33			  ; B0 33 | Branch if carry set
	CPX #$67			 ; E0 67 | Compare X register (immediate)
	REP #$4E			 ; C2 4E | Reset processor status bits
	JMP $083D			; 4C 3D 08 | Jump to address
	AND $5700			; 2D 00 57 | Logical AND with accumulator (absolute)
	JMP $9800			; 4C 00 98 | Jump to address
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	WDM #$00			 ; 42 00 | Reserved instruction
	PEA #$B000		   ; F4 00 B0 | Push effective address to stack
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ROR $1A8F			; 6E 8F 1A | Rotate right (absolute)
	LDA				  ; BF 65 7F C9 | Load from absolute long,X into accumulator
	JMP $3100			; 4C 00 31 | Jump to address
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	BCC $C3			  ; 90 C3 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	STA $C68EA6		  ; 8F A6 8E C6 | Store accumulator to absolute long address
	LDX $3646,Y		  ; BE 46 36 | Load from absolute,Y into X register
	BVC $23			  ; 50 23 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CMP $0100,X		  ; DD 00 01 | Compare accumulator (absolute,X)
	EOR ($CF,X)		  ; 41 CF | Exclusive OR with accumulator ((zero page,X))
	ADC ($17,X)		  ; 61 17 | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	STY $B8			  ; 84 B8 | Store Y register to zero page
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	STZ $F760,X		  ; 9E 60 F7 | Store zero to absolute,X
	BCS $00			  ; B0 00 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D2
; Address: $F9ABCD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D2:
	JSR $489C			; 20 9C 48 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D4
; Address: $F9ABDC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D4:
	CLD				  ; D8 | Clear decimal mode flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D5
; Address: $F9ABEC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D5:
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	ASL $FF00			; 0E 00 FF | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D6
; Address: $F9ABFC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D6:
	BMI $00			  ; 30 00 | Branch if negative
	EOR #$31			 ; 49 31 | Exclusive OR with accumulator (immediate)
	LDA $3B04,Y		  ; B9 04 3B | Load from absolute,Y into accumulator
	ASL $6C26,X		  ; 1E 26 6C | Arithmetic shift left (absolute,X)
	STY $84			  ; 84 84 | Store Y register to zero page
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT $996C			; 2C 6C 99 | Test bits in accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	ORA ($75,X)		  ; 01 75 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D7
; Address: $F9AC2A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D7:
	JSL $D7C4EB		  ; 22 EB C4 D7 | Jump to subroutine long
	STY $F4BF			; 8C BF F4 | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	INC $B832			; EE 32 B8 | Increment (absolute)
	NOP				  ; EA | No operation
	SBC $FB6C,Y		  ; F9 6C FB | Subtract with carry (absolute,Y)
	ADC $DDFA			; 6D FA DD | Add with carry (absolute)
	PLX				  ; FA | Pull X register from stack
	CMP $C7FA,X		  ; DD FA C7 | Compare accumulator (absolute,X)
	ORA $4F00,Y		  ; 19 00 4F | Logical OR with accumulator (absolute,Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0D9
; Address: $F9AC66
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0D9:
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF 00 1F 00 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0DA
; Address: $F9AC7A
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0DA:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ORA $3D62,X		  ; 1D 62 3D | Logical OR with accumulator (absolute,X)
	WDM #$39			 ; 42 39 | Reserved instruction
	LSR $7A			  ; 46 7A | Logical shift right (zero page)
	STY $72			  ; 84 72 | Store Y register to zero page
	STY $8874			; 8C 74 88 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack
	BCC $90			  ; 90 90 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	STA ($95),Y		  ; 91 95 | Store accumulator to (zero page),Y
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	BPL $30			  ; 10 30 | Branch if positive
	ORA $AD39,Y		  ; 19 39 AD | Logical OR with accumulator (absolute,Y)
	LDX $F976,Y		  ; BE 76 F9 | Load from absolute,Y into X register
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($89,X)		  ; 01 89 | Logical OR with accumulator ((zero page,X))
	ASL $D9			  ; 06 D9 | Arithmetic shift left (zero page)
	LDA ($EF,X)		  ; A1 EF | Load from (zero page,X) into accumulator
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	WDM #$7E			 ; 42 7E | Reserved instruction
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	STX $1C7E			; 8E 7E 1C | Store X register to absolute address
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0DB
; Address: $F9AD12
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0DB:
	LSR $2C00,X		  ; 5E 00 2C | Logical shift right (absolute,X)
	EOR $BD00,X		  ; 5D 00 BD | Exclusive OR with accumulator (absolute,X)
	CMP $7120,Y		  ; D9 20 71 | Compare accumulator (absolute,Y)
	BRA $E3			  ; 80 E3 | Branch always
	BVC $23			  ; 50 23 | Branch if overflow clear
	BVS $07			  ; 70 07 | Branch if overflow set
	ADC ($07),Y		  ; 71 07 | Add with carry ((zero page),Y)
	SBC ($17,X)		  ; E1 17 | Subtract with carry ((zero page,X))
	SBC $1B			  ; E5 1B | Subtract with carry (zero page)
	INC $1A			  ; E6 1A | Increment (zero page)
	INC $1A			  ; E6 1A | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $FB00,X		  ; DD 00 FB | Compare accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	DEY				  ; 88 | Decrement Y register
	EOR #$D6			 ; 49 D6 | Exclusive OR with accumulator (immediate)
	CPX $EB			  ; E4 EB | Compare X register (zero page)
	CMP $CB			  ; C5 CB | Compare accumulator (zero page)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	ROR $7781,X		  ; 7E 81 77 | Rotate right (absolute,X)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	INC				  ; 1A | Increment accumulator
	AND $8EC4,Y		  ; 39 C4 8E | Logical AND with accumulator (absolute,Y)
	BCS $C8			  ; B0 C8 | Branch if carry set
	BNE $C8			  ; D0 C8 | Branch if not equal
	BNE $88			  ; D0 88 | Branch if not equal
	BCC $08			  ; 90 08 | Branch if carry clear
	BPL $0E			  ; 10 0E | Branch if positive
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0DD
; Address: $F9AD7E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0DD:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $271E			; 0E 1E 27 | Arithmetic shift left (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	STA $8FAF			; 8D AF 8F | Store accumulator to absolute address
	LDA $848E8E		  ; AF 8E 8E 84 | Load from absolute long address into accumulator
	STY $C0			  ; 84 C0 | Store Y register to zero page
	CPY #$A1			 ; C0 A1 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0DE
; Address: $F9ADAB
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0DE:
	SBC ($4F,X)		  ; E1 4F | Subtract with carry ((zero page,X))
	BVC $00			  ; 50 00 | Branch if overflow clear
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LSR $B000,X		  ; 5E 00 B0 | Logical shift right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $56			  ; 70 56 | Branch if overflow set
	ADC ($D6),Y		  ; 71 D6 | Add with carry ((zero page),Y)
	SBC ($96),Y		  ; F1 96 | Subtract with carry ((zero page),Y)
	SBC ($96),Y		  ; F1 96 | Subtract with carry ((zero page),Y)
	SBC ($37),Y		  ; F1 37 | Subtract with carry ((zero page),Y)
	BEQ $37			  ; F0 37 | Branch if equal
	BEQ $AD			  ; F0 AD | Branch if equal
	LDA $00AE00		  ; AF 00 AE 00 | Load from absolute long address into accumulator
	BIT $6C00			; 2C 00 6C | Test bits in accumulator (absolute)
	JMP ($CC00)		  ; 6C 00 CC | Jump to address (absolute indirect)
	DEC $0C00			; CE 00 0C | Decrement (absolute)
	AND $5C			  ; 25 5C | Logical AND with accumulator (zero page)
	AND ($5C,X)		  ; 21 5C | Logical AND with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	STY $72			  ; 84 72 | Store Y register to zero page
	STY $8874			; 8C 74 88 | Store Y register to absolute address
	STZ $98			  ; 64 98 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BCC $83			  ; 90 83 | Branch if carry clear
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BPL $D0			  ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0DF
; Address: $F9AE03
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0DF:
	JSR $20D0			; 20 D0 20 | Jump to subroutine
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $0F1F			; 0E 1F 0F | Arithmetic shift left (absolute)
	ORA ($32),Y		  ; 11 32 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0C00			; 0D 00 0C | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $01			  ; F0 01 | Branch if equal
	INC $7FA0,X		  ; FE A0 7F | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E0
; Address: $F9AE52
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E0:
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $E0			  ; 80 E0 | Game work RAM access
	SBC #$F8			 ; E9 F8 | Subtract with carry (immediate)
	BEQ $C7			  ; F0 C7 | Branch if equal
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	STA ($CA,X)		  ; 81 CA | Store accumulator to (zero page,X)
	ADC $3B00			; 6D 00 3B | Add with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FC06,X		  ; FE 06 FC | Increment (absolute,X)
	ORA $FC			  ; 05 FC | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $90			  ; 70 90 | Branch if overflow set
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	SEP #$00			 ; E2 00 | Set processor status bits
	ROR $7E81,X		  ; 7E 81 7E | Rotate right (absolute,X)
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	BRA $3F			  ; 80 3F | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL $1C00,X		  ; 3E 00 1C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E1
; Address: $F9AEAB
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E1:
	JSR $201C			; 20 1C 20 | Jump to subroutine
	BVS $7E			  ; 70 7E | Branch if overflow set
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)
	LDX $FC00,Y		  ; BE 00 FC | Load from absolute,Y into X register
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BPL $20			  ; 10 20 | Branch if positive
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BVS $7F			  ; 70 7F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E3
; Address: $F9AEEB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E3:
	RTI				  ; 40 | Return from interrupt
	BIT $3E1F			; 2C 1F 3E | Test bits in accumulator (absolute)
	AND ($58,X)		  ; 21 58 | Logical AND with accumulator ((zero page,X))
	JMP $008F03		  ; 5C 03 8F 00 | Jump to address long
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 00 BF 00 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E4
; Address: $F9AEFE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E4:
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	CPX $0113			; EC 13 01 | Compare X register (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	CPX $00FE			; EC FE 00 | Compare X register (absolute)
	INC $3800,X		  ; FE 00 38 | Increment (absolute,X)
	BEQ $77			  ; F0 77 | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	INC $FB01,X		  ; FE 01 FB | Increment (absolute,X)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	BCC $50			  ; 90 50 | Branch if carry clear
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E5
; Address: $F9AF45
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E5:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E6
; Address: $F9AF8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E6:
	JSR $0020			; 20 20 00 | Jump to subroutine
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E7
; Address: $F9AF9B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E7:
	BRA $DC			  ; 80 DC | Branch always
	BIT $0800			; 2C 00 08 | Test bits in accumulator (absolute)
	SBC $F87B,X		  ; FD 7B F8 | Subtract with carry (absolute,X)
	BEQ $F2			  ; F0 F2 | Branch if equal
	CPY #$CC			 ; C0 CC | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ROL $C201,X		  ; 3E 01 C2 | Rotate left (absolute,X)
	ORA $3300			; 0D 00 33 | Logical OR with accumulator (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $E100,X		  ; 1E 00 E1 | Arithmetic shift left (absolute,X)
	ASL $403E,X		  ; 1E 3E 40 | Arithmetic shift left (absolute,X)
	BPL $20			  ; 10 20 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $04			  ; 30 04 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E8
; Address: $F9AFF4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E8:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $11			  ; F0 11 | Branch if equal
	BMI $17			  ; 30 17 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $2800			; 0E 00 28 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $207E,X		  ; 1E 7E 20 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0E9
; Address: $F9B04A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0E9:
	JSR $1010			; 20 10 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	JMP $000100		  ; 5C 00 01 00 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$DD			 ; C2 DD | Reset processor status bits
	CLD				  ; D8 | Clear decimal mode flag
	STA ($9A,X)		  ; 81 9A | Store accumulator to (zero page,X)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0EA
; Address: $F9B070
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0EA:
	JSR $2400			; 20 00 24 | Jump to subroutine
	STZ $00			  ; 64 00 | Store zero to zero page
	CPY $DC00			; CC 00 DC | Compare Y register (absolute)
	LDY $1800,X		  ; BC 00 18 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1F01			; 0E 01 1F | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEP #$61			 ; E2 61 | Set processor status bits

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0EB
; Address: $F9B0C4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0EB:
	JSL $23DC5D		  ; 22 5D DC 23 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $AF			  ; 90 AF | Branch if carry clear
	ROL $6F17			; 2E 17 6F | Rotate left (absolute)
	ORA $C300			; 0D 00 C3 | Logical OR with accumulator (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0EC
; Address: $F9B0DA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0EC:
	BVC $00			  ; 50 00 | Branch if overflow clear
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $9C			  ; 80 9C | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPX $10			  ; E4 10 | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0ED
; Address: $F9B0F4
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0ED:
	BCC $00			  ; 90 00 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	CPX $2000			; EC 00 20 | Compare X register (absolute)
	BRA $00			  ; 80 00 | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL $0C7D,X		  ; 3E 7D 0C | Rotate left (absolute,X)
	ASL $6700			; 0E 00 67 | Arithmetic shift left (absolute)
	STY $1800			; 8C 00 18 | Store Y register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	INY				  ; C8 | Increment Y register
	STA ($78,X)		  ; 81 78 | Store accumulator to (zero page,X)
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	STY $F00C			; 8C 0C F0 | Store Y register to absolute address
	BVS $80			  ; 70 80 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	STX $00			  ; 86 00 | Store X register to zero page
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0EE
; Address: $F9B158
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0EE:
	JSR $8000			; 20 00 80 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	STX $20AE			; 8E AE 20 | Store X register to absolute address
	LDA				  ; BF 00 51 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0EF
; Address: $F9B1A6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0EF:
	REP #$3D			 ; C2 3D | Reset processor status bits
	BVS $0C			  ; 70 0C | Branch if overflow set
	BVS $71			  ; 70 71 | Branch if overflow set
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	REP #$00			 ; C2 00 | Reset processor status bits
	STX $0000			; 8E 00 00 | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0F0
; Address: $F9B1C8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0F0:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $190A,Y		  ; 19 0A 19 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $311A,Y		  ; 39 1A 31 | Logical AND with accumulator (absolute,Y)
	BMI $11			  ; 30 11 | Branch if negative
	BVS $30			  ; 70 30 | Branch if overflow set
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROL $0F00			; 2E 00 0F | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	DEC $04F8			; CE F8 04 | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0F2
; Address: $F9B224
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0F2:
	JSR $4040			; 20 40 40 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVC $14			  ; 50 14 | Branch if overflow clear
	WDM #$0E			 ; 42 0E | Reserved instruction
	ADC ($2D,X)		  ; 61 2D | Add with carry ((zero page,X))
	ADC ($2D,X)		  ; 61 2D | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0F3
; Address: $F9B249
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0F3:
	ROL $4EC0			; 2E C0 4E | Rotate left (absolute)
	CPY #$4E			 ; C0 4E | Compare Y register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0F4
; Address: $F9B252
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0F4:
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0F6
; Address: $F9B264
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0F6:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	BRA $A0			  ; 80 A0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0F9
; Address: $F9B27E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0F9:
	JSR $C800			; 20 00 C8 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	BMI $07			  ; 30 07 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	AND $0A00,Y		  ; 39 00 0A | Logical AND with accumulator (absolute,Y)
	STX $FCB0			; 8E B0 FC | Store X register to absolute address
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0FA
; Address: $F9B2C1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0FA:
	JSR $60E0			; 20 E0 60 | Jump to subroutine
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	CPY #$47			 ; C0 47 | Compare Y register (immediate)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0FB
; Address: $F9B2CC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0FB:
	BMI $00			  ; 30 00 | Branch if negative
	ROL $3800,X		  ; 3E 00 38 | Rotate left (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BVS $80			  ; 70 80 | Branch if overflow set
	BVS $80			  ; 70 80 | Branch if overflow set
	BMI $C0			  ; 30 C0 | Branch if negative
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0FC
; Address: $F9B2E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0FC:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0FE
; Address: $F9B2F4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0FE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$37			 ; 09 37 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	AND $2400			; 2D 00 24 | Logical AND with accumulator (absolute)
	BNE $F0			  ; D0 F0 | Branch if not equal
	CLV				  ; B8 | Clear overflow flag
	BVS $18			  ; 70 18 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	ROL $04FF			; 2E FF 04 | Rotate left (absolute)
	LDA $FD24,X		  ; BD 24 FD | Load from absolute,X into accumulator
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_0FF
; Address: $F9B33A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_0FF:
	JSR $5200			; 20 00 52 | Jump to subroutine
	BRA $1C			  ; 80 1C | Branch always
	BRA $3C			  ; 80 3C | Branch always
	BRA $3C			  ; 80 3C | Branch always
	BRA $3C			  ; 80 3C | Branch always
	BRA $3E			  ; 80 3E | Branch always
	BRA $3F			  ; 80 3F | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_103
; Address: $F9B366
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_103:
	JSR $0040			; 20 40 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BMI $B0			  ; 30 B0 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BVS $7C			  ; 70 7C | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_104
; Address: $F9B376
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_104:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $05			  ; F0 05 | Branch if equal
	CPX $07			  ; E4 07 | Compare X register (zero page)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $1B00			; 0E 00 1B | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $4A00			; 0D 00 4A | Logical OR with accumulator (absolute)
	ROR $EF68,X		  ; 7E 68 EF | Rotate right (absolute,X)
	INC $3A20,X		  ; FE 20 3A | Increment (absolute,X)
	ORA $86			  ; 05 86 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($5C,X)		  ; 01 5C | Logical OR with accumulator ((zero page,X))
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	ADC $7500,X		  ; 7D 00 75 | Add with carry (absolute,X)
	AND #$AD			 ; 29 AD | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	BIT $2302			; 2C 02 23 | Test bits in accumulator (absolute)
	LDA $B734,X		  ; BD 34 B7 | Load from absolute,X into accumulator
	BRA $08			  ; 80 08 | Branch always
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPY #$CD			 ; C0 CD | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL $0640			; 0E 40 06 | Arithmetic shift left (absolute)
	BMI $0E			  ; 30 0E | Branch if negative
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_105
; Address: $F9B410
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_105:
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC $3100,Y		  ; 79 00 31 | Add with carry (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0A00			; 0E 00 0A | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	STA				  ; 9F 03 C3 02 | Store accumulator to absolute long,X
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_106
; Address: $F9B43C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_106:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	PEA #$F607		   ; F4 07 F6 | Push effective address to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ASL $471E,X		  ; 1E 1E 47 | Arithmetic shift left (absolute,X)
	STA				  ; 9F FF BB FF | Store accumulator to absolute long,X
	PEA #$00FF		   ; F4 FF 00 | Push effective address to stack
	ASL $6100,X		  ; 1E 00 61 | Arithmetic shift left (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_107
; Address: $F9B49A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_107:
	RTI				  ; 40 | Return from interrupt
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	BMI $80			  ; 30 80 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_108
; Address: $F9B4CF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_108:
	JSR $000D			; 20 0D 00 | Jump to subroutine
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	PEA #$FCFF		   ; F4 FF FC | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_109
; Address: $F9B4FC
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_109:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $F0			  ; 80 F0 | Branch always
	BCS $7E			  ; B0 7E | Branch if carry set
	LSR $C6			  ; 46 C6 | Logical shift right (zero page)
	PEA #$E062		   ; F4 62 E0 | Game work RAM access
	ASL $0018,X		  ; 1E 18 00 | Arithmetic shift left (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	LDA $6B00,Y		  ; B9 00 6B | Load from absolute,Y into accumulator
	STZ $E200,X		  ; 9E 00 E2 | Store zero to absolute,X
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$A7A7		   ; F4 A7 A7 | Push effective address to stack
	SBC $DDEC,X		  ; FD EC DD | Subtract with carry (absolute,X)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	AND $0034,Y		  ; 39 34 00 | Logical AND with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_10A
; Address: $F9B55B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_10A:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STY $4E9C			; 8C 9C 4E | Store Y register to absolute address
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	DEC $01			  ; C6 01 | Decrement (zero page)
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $3E			  ; 80 3E | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_10B
; Address: $F9B5D0
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_10B:
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($EE,X)		  ; E1 EE | Subtract with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LSR $4050			; 4E 50 40 | Logical shift right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BMI $28			  ; 30 28 | Branch if negative
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	LDA				  ; BF 00 CF 00 | Load from absolute long,X into accumulator
	INY				  ; C8 | Increment Y register
	XBA				  ; EB | Exchange accumulator bytes
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	EOR ($4E,X)		  ; 41 4E | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	JMP $902E3C		  ; 5C 3C 2E 90 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($A7,X)		  ; 01 A7 | Logical OR with accumulator ((zero page,X))
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	PEA #$A41A		   ; F4 1A A4 | Push effective address to stack
	LSR $0E78,X		  ; 5E 78 0E | Logical shift right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	INC $1C00,X		  ; FE 00 1C | Increment (absolute,X)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $0C06			; 0E 06 0C | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT #$01			 ; 89 01 | Test bits in accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $0C06			; 0E 06 0C | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_10C
; Address: $F9B6FF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_10C:
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_10D
; Address: $F9B71E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_10D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $3F7D,X		  ; 7D 7D 3F | Add with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $0637			; 0E 37 06 | Arithmetic shift left (absolute)
	AND $7F03,X		  ; 3D 03 7F | Logical AND with accumulator (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	AND $027F,Y		  ; 39 7F 02 | Logical AND with accumulator (absolute,Y)
	AND $1E01,X		  ; 3D 01 1E | Logical AND with accumulator (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_10E
; Address: $F9B794
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_10E:
	JSR $3000			; 20 00 30 | Jump to subroutine
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_10F
; Address: $F9B7A1
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_10F:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BEQ $70			  ; F0 70 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $18			  ; F0 18 | Branch if equal
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $08			  ; 80 08 | Branch always
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0003,X		  ; 1E 03 00 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 1F 7F | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_110
; Address: $F9B7F2
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_110:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $F5			  ; F0 F5 | Branch if equal
	BEQ $F5			  ; F0 F5 | Branch if equal
	SBC ($EB,X)		  ; E1 EB | Subtract with carry ((zero page,X))
	INC $EF			  ; E6 EF | Increment (zero page)
	SBC $F0ED			; ED ED F0 | Subtract with carry (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	ASL $1800,X		  ; 1E 00 18 | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	BNE $D0			  ; D0 D0 | Branch if not equal
	BEQ $40			  ; F0 40 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_111
; Address: $F9B838
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_111:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $7C			  ; 64 7C | Store zero to zero page
	INC $BD45			; EE 45 BD | Increment (absolute)
	ASL $8CFF			; 0E FF 8C | Arithmetic shift left (absolute)
	CMP $2AFE			; CD FE 2A | Compare accumulator (absolute)
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	JMP ($BA10)		  ; 6C 10 BA | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $32			  ; 80 32 | Branch always
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_113
; Address: $F9B8A0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_113:
	ORA $0302			; 0D 02 03 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0C1F			; 0E 1F 0C | Arithmetic shift left (absolute)
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	STY $64			  ; 84 64 | Store Y register to zero page
	PEA #$F404		   ; F4 04 F4 | Push effective address to stack
	PEA #$7404		   ; F4 04 74 | Push effective address to stack
	PEA #$9A00		   ; F4 00 9A | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	ROL $FA00,X		  ; 3E 00 FA | Rotate left (absolute,X)
	SBC $F10A,X		  ; FD 0A F1 | Subtract with carry (absolute,X)
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ROR $3F7E,X		  ; 7E 7E 3F | Rotate right (absolute,X)
	LDA				  ; BF 1F DF 8E | Load from absolute long,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_115
; Address: $F9B91A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_115:
	JSR $7000			; 20 00 70 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	STX $00FE			; 8E FE 00 | Store X register to absolute address
	BMI $F0			  ; 30 F0 | Branch if negative
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	LDY #$AF			 ; A0 AF | Load immediate value into Y register
	BVC $5F			  ; 50 5F | Branch if overflow clear
	EOR ($5F,X)		  ; 41 5F | Exclusive OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	LDA $00BE00		  ; AF 00 BE 00 | Load from absolute long address into accumulator
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_117
; Address: $F9B963
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_117:
	CPX $70			  ; E4 70 | Compare X register (zero page)
	BVS $F2			  ; 70 F2 | Branch if overflow set
	BEQ $F2			  ; F0 F2 | Branch if equal
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	STA ($18,X)		  ; 81 18 | Store accumulator to (zero page,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	ROR $1600,X		  ; 7E 00 16 | Rotate right (absolute,X)
	ORA $1207,Y		  ; 19 07 12 | Logical OR with accumulator (absolute,Y)
	ADC ($53,X)		  ; 61 53 | Add with carry ((zero page,X))
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND $2B00,X		  ; 3D 00 2B | Logical AND with accumulator (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	BIT $2500			; 2C 00 25 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	SBC $F190,Y		  ; F9 90 F1 | Subtract with carry (absolute,Y)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_118
; Address: $F9B9AD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_118:
	STZ $FEB6			; 9C B6 FE | Store zero to absolute
	PHX				  ; DA | Push X register to stack
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	BRA $F7			  ; 80 F7 | Branch always
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_119
; Address: $F9B9C3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_119:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_11A
; Address: $F9B9D8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_11A:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_11B
; Address: $F9B9DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_11B:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $000B			; 0E 0B 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_11C
; Address: $F9B9FC
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_11C:
	ASL $3D00,X		  ; 1E 00 3D | Arithmetic shift left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	DEC				  ; 3A | Decrement accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	AND $7D33,X		  ; 3D 33 7D | Logical AND with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C61,X		  ; 1E 61 0C | Arithmetic shift left (absolute,X)
	STA				  ; 9F A0 D3 CC | Store accumulator to absolute long,X
	LDY $94A3,X		  ; BC A3 94 | Load from absolute,X into Y register
	STA ($B2,X)		  ; 81 B2 | Store accumulator to (zero page,X)
	DEY				  ; 88 | Decrement Y register
	JMP $003000		  ; 5C 00 30 00 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	EOR $0000			; 4D 00 00 | Exclusive OR with accumulator (absolute)
	STX $3880			; 8E 80 38 | Store X register to absolute address
	STA ($46,X)		  ; 81 46 | Store accumulator to (zero page,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	STA ($9D,X)		  ; 81 9D | Store accumulator to (zero page,X)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	AND $8000,Y		  ; 39 00 80 | Logical AND with accumulator (absolute,Y)
	ROR $9C00,X		  ; 7E 00 9C | Rotate right (absolute,X)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	STZ $0CFF,X		  ; 9E FF 0C | Store zero to absolute,X
	SBC $F909,X		  ; FD 09 F9 | Subtract with carry (absolute,X)
	ORA $0EFF,X		  ; 1D FF 0E | Logical OR with accumulator (absolute,X)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_11D
; Address: $F9BA9C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_11D:
	BEQ $00			  ; F0 00 | Branch if equal
	SEP #$00			 ; E2 00 | Set processor status bits
	BRA $A6			  ; 80 A6 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_11E
; Address: $F9BAA4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_11E:
	ORA #$C5			 ; 09 C5 | Logical OR with accumulator (immediate)
	ASL $1586			; 0E 86 15 | Arithmetic shift left (absolute)
	AND ($4D),Y		  ; 31 4D | Logical AND with accumulator ((zero page),Y)
	EOR $9F00,Y		  ; 59 00 9F | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_11F
; Address: $F9BAB4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_11F:
	DEC				  ; 3A | Decrement accumulator
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEP #$00			 ; E2 00 | Set processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	CPY $BCFE			; CC FE BC | Compare Y register (absolute)
	INC $FD04,X		  ; FE 04 FD | Increment (absolute,X)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_120
; Address: $F9BAD6
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_120:
	JSR $3000			; 20 00 30 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PLX				  ; FA | Pull X register from stack
	REP #$38			 ; C2 38 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ADC $0605,Y		  ; 79 05 06 | Add with carry (absolute,Y)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $60			  ; 84 60 | Store Y register to zero page
	BMI $71			  ; 30 71 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	LDX $77BE			; AE BE 77 | Load from absolute address into X register
	JMP $008E00		  ; 5C 00 8E 00 | Jump to address long
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	AND $FFFF,X		  ; 3D FF FF | Logical AND with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SBC $C200,Y		  ; F9 00 C2 | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ORA $0301			; 0D 01 03 | Logical OR with accumulator (absolute)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	SBC $5918,X		  ; FD 18 59 | Subtract with carry (absolute,X)
	AND ($7E,X)		  ; 21 7E | Logical AND with accumulator ((zero page,X))
	DEC $1839			; CE 39 18 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_121
; Address: $F9BB70
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_121:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA				  ; 9F 00 D6 00 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $9E06,X		  ; 1E 06 9E | Arithmetic shift left (absolute,X)
	JMP $9CFC			; 4C FC 9C | Jump to address
	PHP				  ; 08 | Push processor status to stack
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	AND #$A9			 ; 29 A9 | Logical AND with accumulator (immediate)
	AND $7B00,Y		  ; 39 00 7B | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $2CD0			; 2C D0 2C | Test bits in accumulator (absolute)
	BNE $4C			  ; D0 4C | Branch if not equal
	BCS $48			  ; B0 48 | Branch if carry set
	BCS $08			  ; B0 08 | Branch if carry set
	BEQ $98			  ; F0 98 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_122
; Address: $F9BBD0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_122:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank72_DmaFunction_124
; Address: $F9BBE8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_124:
	JSR $52BB			; 20 BB 52 | Jump to subroutine
	INC $FF43			; EE 43 FF | Increment (absolute)
	ROR $1DFE,X		  ; 7E FE 1D | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	JMP $102D00		  ; 5C 00 2D 10 | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $99			  ; 80 99 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY $10			  ; C4 10 | Compare Y register (zero page)
	BEQ $C4			  ; F0 C4 | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 F1 05 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_125
; Address: $F9BC22
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_125:
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_126
; Address: $F9BC28
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_126:
	JSR $295F			; 20 5F 29 | Jump to subroutine
	SBC ($2F),Y		  ; F1 2F | Subtract with carry ((zero page),Y)
	STA				  ; 9F FA 00 FA | Store accumulator to absolute long,X
	INC $BF00,X		  ; FE 00 BF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	DEC $5C10			; CE 10 5C | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_127
; Address: $F9BC3F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_127:
	JSR $FE1C			; 20 1C FE | Jump to subroutine
	BVS $F3			  ; 70 F3 | Branch if overflow set
	SBC ($E2,X)		  ; E1 E2 | Subtract with carry ((zero page,X))
	LDY $F4B3,X		  ; BC B3 F4 | Load from absolute,X into Y register
	CPX $00E3			; EC E3 00 | Compare X register (absolute)
	STY $1D00			; 8C 00 1D | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_128
; Address: $F9BC58
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_128:
	JSL $004200		  ; 22 00 42 00 | Jump to subroutine long
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	SBC $F105,Y		  ; F9 05 F1 | Subtract with carry (absolute,Y)
	ORA $1EE0			; 0D E0 1E | Logical OR with accumulator (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CLV				  ; B8 | Clear overflow flag
	PLY				  ; 7A | Pull Y register from stack
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	CMP $12			  ; C5 12 | Compare accumulator (zero page)
	STX $FF			  ; 86 FF | Store X register to zero page
	CPY $78FD			; CC FD 78 | Compare Y register (absolute)
	ADC $8A00,X		  ; 7D 00 8A | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	DEC $38			  ; C6 38 | Decrement (zero page)
	CPX $7810			; EC 10 78 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $7F			  ; 10 7F | Branch if positive
	ROR $3CFF,X		  ; 7E FF 3C | Rotate right (absolute,X)
	LDY $FF43,X		  ; BC 43 FF | Load from absolute,X into Y register
	EOR $59E7,Y		  ; 59 E7 59 | Exclusive OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ROL $18			  ; 26 18 | Rotate left (zero page)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_129
; Address: $F9BCC9
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_129:
	BEQ $81			  ; F0 81 | Branch if equal
	LDX $BC80,Y		  ; BE 80 BC | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $0F			  ; 30 0F | Branch if negative
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	CPX $27			  ; E4 27 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$4F			 ; E0 4F | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $0F			  ; 80 0F | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	BPL $E0			  ; 10 E0 | Game work RAM access
	BVS $80			  ; 70 80 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_12A
; Address: $F9BD27
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_12A:
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_12B
; Address: $F9BD36
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_12B:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ADC ($20,X)		  ; 61 20 | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ASL $2800,X		  ; 1E 00 28 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $26F1			; 0E F1 26 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	AND $BCD9,Y		  ; 39 D9 BC | Logical AND with accumulator (absolute,Y)
	BIT $053F			; 2C 3F 05 | Test bits in accumulator (absolute)
	LDA				  ; BF FF F6 8E | Load from absolute long,X into accumulator
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	LSR $20			  ; 46 20 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_12C
; Address: $F9BD7C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_12C:
	RTI				  ; 40 | Return from interrupt
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	INC $5F			  ; E6 5F | Increment (zero page)
	LDX $F0FE,Y		  ; BE FE F0 | Load from absolute,Y into X register
	BEQ $E0			  ; F0 E0 | Game work RAM access
	STA ($8E,X)		  ; 81 8E | Store accumulator to (zero page,X)
	SEI				  ; 78 | Set interrupt disable flag
	STA $7020,Y		  ; 99 20 70 | Store accumulator to absolute,Y
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	STA $1C92			; 8D 92 1C | Store accumulator to absolute address
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	LDY #$03			 ; A0 03 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_12D
; Address: $F9BDAC
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_12D:
	JSR $1000			; 20 00 10 | Jump to subroutine
	ASL $00B3			; 0E B3 00 | Arithmetic shift left (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	CPY $1E00			; CC 00 1E | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	ASL $3DF0			; 0E F0 3D | Arithmetic shift left (absolute)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BMI $D4			  ; 30 D4 | Branch if negative
	BNE $80			  ; D0 80 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	CPY $2C00			; CC 00 2C | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $0600,Y		  ; 19 00 06 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_12E
; Address: $F9BE18
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_12E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F F0 0F 6F | Store accumulator to absolute long,X
	BRA $03			  ; 80 03 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_12F
; Address: $F9BE38
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_12F:
	BEQ $00			  ; F0 00 | Branch if equal
	STY $1000			; 8C 00 10 | Store Y register to absolute address
	BPL $04			  ; 10 04 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	STY $00E0			; 8C E0 00 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $00			  ; E6 00 | Increment (zero page)
	CPX $7000			; EC 00 70 | Compare X register (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BVC $08			  ; 50 08 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	BMI $3E			  ; 30 3E | Branch if negative
	ORA $067B			; 0D 7B 06 | Logical OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $03			  ; 10 03 | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_130
; Address: $F9BEDA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_130:
	JSR $2000			; 20 00 20 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	AND ($14),Y		  ; 31 14 | Logical AND with accumulator ((zero page),Y)
	AND $0E			  ; 25 0E | Logical AND with accumulator (zero page)
	ORA $0606,Y		  ; 19 06 06 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_131
; Address: $F9BEF4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_131:
	ORA $0700,Y		  ; 19 00 07 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	LDY #$E3			 ; A0 E3 | Load immediate value into Y register
	LDY #$57			 ; A0 57 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	CMP ($26,X)		  ; C1 26 | Compare accumulator ((zero page,X))
	ROL $1818			; 2E 18 18 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_133
; Address: $F9BF15
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_133:
	JSR $0080			; 20 80 00 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	EOR $17			  ; 45 17 | Exclusive OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $0C7D,X		  ; 3E 7D 0C | Rotate left (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	INY				  ; C8 | Increment Y register
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_134
; Address: $F9BFF2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_134:
	JSR $8000			; 20 00 80 | Jump to subroutine
	ORA $0A0B			; 0D 0B 0A | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_135
; Address: $F9C014
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_135:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BMI $28			  ; 30 28 | Branch if negative
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $FE51,X		  ; FD 51 FE | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	AND $07			  ; 25 07 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_137
; Address: $F9C052
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_137:
	JSR $0001			; 20 01 00 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_138
; Address: $F9C06E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_138:
	JSR $10E8			; 20 E8 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_139
; Address: $F9C0A3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_139:
	SEC				  ; 38 | Set carry flag
	ROL $26			  ; 26 26 | Rotate left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP $844C			; 4C 4C 84 | Jump to address
	STY $D0			  ; 84 D0 | Store Y register to zero page
	BNE $F8			  ; D0 F8 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	JMP $8400			; 4C 00 84 | Jump to address
	BNE $00			  ; D0 00 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_13A
; Address: $F9C0EC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_13A:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_13B
; Address: $F9C0FB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_13B:
	BRA $DC			  ; 80 DC | Branch always
	BIT $0800			; 2C 00 08 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $3918,Y		  ; 39 18 39 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	AND $3818,Y		  ; 39 18 38 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_13C
; Address: $F9C10F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_13C:
	JSR $0014			; 20 14 00 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $D8			  ; 10 D8 | Branch if positive
	BPL $D8			  ; 10 D8 | Branch if positive
	BPL $F8			  ; 10 F8 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_13D
; Address: $F9C130
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_13D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_13E
; Address: $F9C162
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_13E:
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	STX $86			  ; 86 86 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	LDY $38BC,X		  ; BC BC 38 | Load from absolute,X into Y register
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	LDY $3800,X		  ; BC 00 38 | Load from absolute,X into Y register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	JMP ($111D)		  ; 6C 1D 11 | Jump to address (absolute indirect)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC $D9			  ; C6 D9 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	DEC $C7CE			; CE CE C7 | Decrement (absolute)
	SEP #$00			 ; E2 00 | Set processor status bits
	BCC $00			  ; 90 00 | Branch if carry clear
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $30			  ; 80 30 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack
	STZ $C830			; 9C 30 C8 | Store zero to absolute
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_13F
; Address: $F9C1FC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_13F:
	JSR $4000			; 20 00 40 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_140
; Address: $F9C23A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_140:
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 00 2A 01 | Load from absolute long,X into accumulator
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	EOR $7D			  ; 45 7D | Exclusive OR with accumulator (zero page)
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	TSX				  ; BA | Transfer stack pointer to X register
	INC $46BB,X		  ; FE BB 46 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $38			  ; 45 38 | Exclusive OR with accumulator (zero page)
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator
	STA ($99),Y		  ; 91 99 | Store accumulator to (zero page),Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_141
; Address: $F9C26A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_141:
	EOR #$5D			 ; 49 5D | Exclusive OR with accumulator (immediate)
	STY $4CE8			; 8C E8 4C | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	PEA #$7AFC		   ; F4 FC 7A | Push effective address to stack
	ROR $3F3E,X		  ; 7E 3E 3F | Rotate right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	PEA #$3A00		   ; F4 00 3A | Push effective address to stack
	STA $00			  ; 85 00 | Store accumulator to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_142
; Address: $F9C2A1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_142:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $1E02,X		  ; 1D 02 1E | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $5C00,X		  ; 3D 00 5C | Logical AND with accumulator (absolute,X)
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX $04			  ; E4 04 | Compare X register (zero page)
	BMI $04			  ; 30 04 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_143
; Address: $F9C2D8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_143:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_145
; Address: $F9C2E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_145:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_146
; Address: $F9C2F5
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_146:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ASL $023E,X		  ; 1E 3E 02 | Arithmetic shift left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ROL $0200,X		  ; 3E 00 02 | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $07			  ; 10 07 | Branch if positive
	BPL $03			  ; 10 03 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	ROL $3F1F			; 2E 1F 3F | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_148
; Address: $F9C364
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_148:
	JSR $E0D8			; 20 D8 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_149
; Address: $F9C36E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_149:
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	ROL $9800,X		  ; 3E 00 98 | Rotate left (absolute,X)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_14A
; Address: $F9C382
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_14A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_14B
; Address: $F9C398
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_14B:
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $181E,X		  ; 1E 1E 18 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_14C
; Address: $F9C3AE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_14C:
	JSR $1712			; 20 12 17 | Jump to subroutine
	BIT $2800			; 2C 00 28 | Test bits in accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND $C000			; 2D 00 C0 | Logical AND with accumulator (absolute)
	PEA #$F4C4		   ; F4 C4 F4 | Push effective address to stack
	CMP ($F9),Y		  ; D1 F9 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_14D
; Address: $F9C3C6
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_14D:
	JSL $1C113C		  ; 22 3C 11 1C | Jump to subroutine long
	ORA $5F49,Y		  ; 19 49 5F | Logical OR with accumulator (absolute,Y)
	SBC $001F,X		  ; FD 1F 00 | Subtract with carry (absolute,X)
	ASL $C700			; 0E 00 C7 | Arithmetic shift left (absolute)
	INC $A000			; EE 00 A0 | Increment (absolute)
	INC $7CAB,X		  ; FE AB 7C | Increment (absolute,X)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	JMP ($7C10)		  ; 6C 10 7C | Jump to address (absolute indirect)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	JMP $673873		  ; 5C 73 38 67 | Jump to address long
	PHA				  ; 48 | Push accumulator to stack
	BMI $6E			  ; 30 6E | Branch if negative
	ADC ($DF,X)		  ; 61 DF | Add with carry ((zero page,X))
	LDA $8C00			; AD 00 8C | Load from absolute address into accumulator
	LDY $9800			; AC 00 98 | Load from absolute address into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_14E
; Address: $F9C41C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_14E:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	ORA #$81			 ; 09 81 | Logical OR with accumulator (immediate)
	STA ($65,X)		  ; 81 65 | Store accumulator to (zero page,X)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ROR $3F00,X		  ; 7E 00 3F | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	ROR $FFFE,X		  ; 7E FE FF | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	ROL $BE			  ; 26 BE | Rotate left (zero page)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	BIT $4C7C			; 2C 7C 4C | Test bits in accumulator (absolute)
	STZ $18DC			; 9C DC 18 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank72_DmaFunction_14F
; Address: $F9C46D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_14F:
	EOR $3819,Y		  ; 59 19 38 | Exclusive OR with accumulator (absolute,Y)
	CMP $5900,Y		  ; D9 00 59 | Compare accumulator (absolute,Y)
	LDX $00			  ; A6 00 | Load from zero page into X register
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	JMP $48B0			; 4C B0 48 | Jump to address
	BCS $88			  ; B0 88 | Branch if carry set
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $10			  ; 70 10 | Branch if overflow set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BRA $40			  ; 80 40 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $70			  ; 80 70 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $0F			  ; 30 0F | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDA				  ; BF 00 9F 00 | Load from absolute long,X into accumulator
	BCC $80			  ; 90 80 | Branch if carry clear
	BNE $C0			  ; D0 C0 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_150
; Address: $F9C4C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_150:
	JSR $6040			; 20 40 60 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_151
; Address: $F9C4D2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_151:
	JSR $E000			; 20 00 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BVC $0E			  ; 50 0E | Branch if overflow clear
	BVC $1E			  ; 50 1E | Branch if overflow clear
	PHX				  ; DA | Push X register to stack
	LDA $9CA9,Y		  ; B9 A9 9C | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 8E 1F 0E | Store accumulator to absolute long,X
	ASL $0071			; 0E 71 00 | Arithmetic shift left (absolute)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CPX $0600			; EC 00 06 | Compare X register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	PEA #$F6F8		   ; F4 F8 F6 | Push effective address to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_152
; Address: $F9C50A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_152:
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	DEC $00			  ; C6 00 | Decrement (zero page)
	INC $E800,X		  ; FE 00 E8 | Increment (absolute,X)
	BVC $00			  ; 50 00 | Branch if overflow clear
	ORA ($D7,X)		  ; 01 D7 | Logical OR with accumulator ((zero page,X))
	BPL $BC			  ; 10 BC | Branch if positive
	CPY $10EF			; CC EF 10 | Compare Y register (absolute)
	INC $B900			; EE 00 B9 | Increment (absolute)
	BIT $8000			; 2C 00 80 | Test bits in accumulator (absolute)
	JMP ($9800)		  ; 6C 00 98 | Jump to address (absolute indirect)
	INC $6170			; EE 70 61 | Increment (absolute)
	SBC ($CE),Y		  ; F1 CE | Subtract with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	STZ $9B			  ; 64 9B | Store zero to zero page
	BMI $F3			  ; 30 F3 | Branch if negative
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	STZ $1100,X		  ; 9E 00 11 | Store zero to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_153
; Address: $F9C558
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_153:
	STZ $00			  ; 64 00 | Store zero to zero page
	CMP $3000			; CD 00 30 | Compare accumulator (absolute)
	SEP #$12			 ; E2 12 | Set processor status bits
	SED				  ; F8 | Set decimal mode flag
	INC $8700,X		  ; FE 00 87 | Increment (absolute,X)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $ED00			; 8C 00 ED | Store Y register to absolute address
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	SBC $E200,Y		  ; F9 00 E2 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BCS $40			  ; B0 40 | Branch if carry set
	BRA $F0			  ; 80 F0 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BCS $00			  ; B0 00 | Branch if carry set
	REP #$C1			 ; C2 C1 | Reset processor status bits
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	CMP #$27			 ; C9 27 | Compare accumulator (immediate)
	INX				  ; E8 | Increment X register
	CPX #$6F			 ; E0 6F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_154
; Address: $F9C5AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_154:
	BRA $0F			  ; 80 0F | Branch always
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	BMI $C0			  ; 30 C0 | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_155
; Address: $F9C5C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_155:
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_156
; Address: $F9C5D0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_156:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $6C			  ; 80 6C | Branch always
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $1800,X		  ; 3E 00 18 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_157
; Address: $F9C608
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_157:
	BMI $73			  ; 30 73 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	LDX $77BE			; AE BE 77 | Load from absolute address into X register
	CLI				  ; 58 | Clear interrupt disable flag
	STY $CF00			; 8C 00 CF | Store Y register to absolute address
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	BRA $83			  ; 80 83 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)
	LDX $00FF,Y		  ; BE FF 00 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SEP #$1C			 ; E2 1C | Set processor status bits
	REP #$04			 ; C2 04 | Reset processor status bits
	STY $06			  ; 84 06 | Store Y register to zero page
	BRA $06			  ; 80 06 | Branch always
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($E3,X)		  ; 01 E3 | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $2800,X		  ; FE 00 28 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ROR $79			  ; 66 79 | Rotate right (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	AND $BF38,X		  ; 3D 38 BF | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 00 BB 04 | Load from absolute long,X into accumulator
	STA $8806,Y		  ; 99 06 88 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank72_DmaFunction_159
; Address: $F9C681
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_159:
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STY $E4FE			; 8C FE E4 | Store Y register to absolute address
	INC $FE74,X		  ; FE 74 FE | Increment (absolute,X)
	JMP $FF06FD		  ; 5C FD 06 FF | Jump to address long
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ADC ($30,X)		  ; 61 30 | Add with carry ((zero page,X))
	BPL $09			  ; 10 09 | Branch if positive
	AND ($15),Y		  ; 31 15 | Logical AND with accumulator ((zero page),Y)
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $78			  ; 26 78 | Rotate left (zero page)
	ADC $B099,Y		  ; 79 99 B0 | Add with carry (absolute,Y)
	BIT $053F			; 2C 3F 05 | Test bits in accumulator (absolute)
	DEC $00FF			; CE FF 00 | Decrement (absolute)
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)
	INC $5F			  ; E6 5F | Increment (zero page)
	LDX $F8FE,Y		  ; BE FE F8 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	STA ($8E,X)		  ; 81 8E | Store accumulator to (zero page,X)
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	STA $7020,Y		  ; 99 20 70 | Store accumulator to absolute,Y
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	ASL $3021,X		  ; 1E 21 30 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_15A
; Address: $F9C70A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_15A:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $0E			  ; 10 0E | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_15C
; Address: $F9C71C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_15C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BMI $D4			  ; 30 D4 | Branch if negative
	BNE $88			  ; D0 88 | Branch if not equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	CPY $2C00			; CC 00 2C | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $7F			  ; 30 7F | Branch if negative
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ROL $79			  ; 26 79 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_15D
; Address: $F9C76A
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_15D:
	JSR $217F			; 20 7F 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	ASL $1900,X		  ; 1E 00 19 | Arithmetic shift left (absolute,X)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $2000,X		  ; 1E 00 20 | Arithmetic shift left (absolute,X)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA $B887F0		  ; 8F F0 87 B8 | Store accumulator to absolute long address
	STA ($BE,X)		  ; 81 BE | Store accumulator to (zero page,X)
	ASL $E0E0,X		  ; 1E E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SBC $E3FF,X		  ; FD FF E3 | Subtract with carry (absolute,X)
	INC $0201,X		  ; FE 01 02 | Increment (absolute,X)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	STZ $EE91,X		  ; 9E 91 EE | Store zero to absolute,X
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	ROR $1600			; 6E 00 16 | Rotate right (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	AND $19BE,Y		  ; 39 BE 19 | Logical AND with accumulator (absolute,Y)
	STZ $9F18,X		  ; 9E 18 9F | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank72_DmaFunction_15F
; Address: $F9C7EE
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_15F:
	JSR $4623			; 20 23 46 | Jump to subroutine
	ORA ($66,X)		  ; 01 66 | Logical OR with accumulator ((zero page,X))
	ORA ($67,X)		  ; 01 67 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $9C00			; 8C 00 9C | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA $FC			  ; 85 FC | Store accumulator to zero page
	SBC $02FC,Y		  ; F9 FC 02 | Subtract with carry (absolute,Y)
	CPY $30CC			; CC CC 30 | Compare Y register (absolute)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	CPY $7B30			; CC 30 7B | Compare Y register (absolute)
	AND $0E			  ; 25 0E | Logical AND with accumulator (zero page)
	ORA $0706,Y		  ; 19 06 07 | Logical OR with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA $0700,Y		  ; 19 00 07 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	LDY #$E3			 ; A0 E3 | Load immediate value into Y register
	BCS $46			  ; B0 46 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	ADC $2641,X		  ; 7D 41 26 | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	JMP $30C900		  ; 5C 00 C9 30 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $30			  ; F0 30 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR $17			  ; 45 17 | Exclusive OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA $0F00,Y		  ; 19 00 0F | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_160
; Address: $F9C8C7
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_160:
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $07			  ; 80 07 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BPL $6F			  ; 10 6F | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA ($68),Y		  ; 91 68 | Store accumulator to (zero page),Y
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $80			  ; 84 80 | Store Y register to zero page
	JMP $C07E80		  ; 5C 80 7E C0 | Jump to address long
	ROL $3EC0,X		  ; 3E C0 3E | Rotate left (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	INC $7B00,X		  ; FE 00 7B | Increment (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $18			  ; 30 18 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_161
; Address: $F9C96A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_161:
	BMI $C0			  ; 30 C0 | Branch if negative
	BVS $80			  ; 70 80 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank72_DmaFunction_163
; Address: $F9C97E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_163:
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_165
; Address: $F9C9A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_165:
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BVS $FC			  ; 70 FC | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_166
; Address: $F9C9B7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_166:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL $4FFF,X		  ; 1E FF 4F | Arithmetic shift left (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $FC			  ; 84 FC | Store Y register to zero page
	INC $FE7E,X		  ; FE 7E FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_167
; Address: $F9C9EC
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_167:
	JSL $EF21FE		  ; 22 FE 21 EF | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $EF00,X		  ; FE 00 EF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $70			  ; 10 70 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BMI $70			  ; 30 70 | Branch if negative
	INC $18FF,X		  ; FE FF 18 | Increment (absolute,X)
	SBC $F808,Y		  ; F9 08 F8 | Subtract with carry (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	INC $3000,X		  ; FE 00 30 | Increment (absolute,X)
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BCS $B0			  ; B0 B0 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_168
; Address: $F9CA59
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_168:
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $0C7D,X		  ; 3E 7D 0C | Rotate left (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STY $1800			; 8C 00 18 | Store Y register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	INY				  ; C8 | Increment Y register
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	STY $F00C			; 8C 0C F0 | Store Y register to absolute address
	BVS $80			  ; 70 80 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX $7000			; EC 00 70 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_169
; Address: $F9CAB6
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_169:
	JSR $8000			; 20 00 80 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	AND $073D			; 2D 3D 07 | Logical AND with accumulator (absolute)
	ASL $00C0			; 0E C0 00 | Arithmetic shift left (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	ADC $0800,X		  ; 7D 00 08 | Add with carry (absolute,X)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	AND $DF3C,X		  ; 3D 3C DF | Logical AND with accumulator (absolute,X)
	ADC $186D			; 6D 6D 18 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_16A
; Address: $F9CB18
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_16A:
	JSR $8800			; 20 00 88 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_16B
; Address: $F9CB2E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_16B:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_16C
; Address: $F9CB42
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_16C:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0705			; 0E 05 07 | Arithmetic shift left (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	STX $00FE			; 8E FE 00 | Store X register to absolute address
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3F0C			; 0E 0C 3F | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3F00			; 0E 00 3F | Arithmetic shift left (absolute)
	INC $FEF0,X		  ; FE F0 FE | Increment (absolute,X)
	BRA $9F			  ; 80 9F | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STY $87			  ; 84 87 | Store Y register to zero page
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	STA ($F7),Y		  ; 91 F7 | Store accumulator to (zero page),Y
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $1EFE,X		  ; FE FE 1E | Increment (absolute,X)
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	ORA $0119,Y		  ; 19 19 01 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $1E00,X		  ; FE 00 1E | Increment (absolute,X)
	ORA $0100,Y		  ; 19 00 01 | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BPL $10			  ; 10 10 | Branch if positive
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_16D
; Address: $F9CC31
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_16D:
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	ROL $3918,X		  ; 3E 18 39 | Rotate left (absolute,X)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_16F
; Address: $F9CC71
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_16F:
	JSR $00A8			; 20 A8 00 | Jump to subroutine
	STA $007000		  ; 8F 00 70 00 | Store accumulator to absolute long address
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_170
; Address: $F9CC90
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_170:
	JSR $E000			; 20 00 E0 | Game work RAM access
	JMP $2B41			; 4C 41 2B | Jump to address
	SEC				  ; 38 | Set carry flag
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $7C60			; 6E 60 7C | Rotate right (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$77			 ; C0 77 | Compare Y register (immediate)
	LDY $703F,X		  ; BC 3F 70 | Load from absolute,X into Y register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_171
; Address: $F9CD62
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_171:
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ASL $0F06,X		  ; 1E 06 0F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ROL $0911			; 2E 11 09 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_172
; Address: $F9CD89
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_172:
	JSR $0019			; 20 19 00 | Jump to subroutine
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F02			; 0E 02 1F | Arithmetic shift left (absolute)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_174
; Address: $F9CDA5
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_174:
	JSR $55F5			; 20 F5 55 | Jump to subroutine
	STY $AA7E			; 8C 7E AA | Store Y register to absolute address
	LDX $7A26			; AE 26 7A | Load from absolute address into X register
	CMP ($5F,X)		  ; C1 5F | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ROL				  ; 2A | Rotate left (accumulator)
	INC $FF33,X		  ; FE 33 FF | Increment (absolute,X)
	ORA $0CFF,Y		  ; 19 FF 0C | Logical OR with accumulator (absolute,Y)
	INC $8000			; EE 00 80 | Increment (absolute)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $10BC,X		  ; BC BC 10 | Load from absolute,X into Y register
	BVC $40			  ; 50 40 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_175
; Address: $F9CDD4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_175:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $1E			  ; 80 1E | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_176
; Address: $F9CE01
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_176:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	LDA $037FC5		  ; AF C5 7F 03 | Load from absolute long address into accumulator
	PLX				  ; FA | Pull X register from stack
	BMI $0C			  ; 30 0C | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	BMI $7F			  ; 30 7F | Branch if negative
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC $07FE,X		  ; DE FE 07 | Decrement (absolute,X)
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	ASL $C0F7,X		  ; 1E F7 C0 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	DEC $0700,X		  ; DE 00 07 | Decrement (absolute,X)
	ROR $F700,X		  ; 7E 00 F7 | Rotate right (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BVS $FE			  ; 70 FE | Branch if overflow set
	ASL $037F,X		  ; 1E 7F 03 | Arithmetic shift left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $7FFE,X		  ; FE FE 7F | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $73			  ; F0 73 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	ASL $2A			  ; 06 2A | Arithmetic shift left (zero page)
	ROL $9C98			; 2E 98 9C | Rotate left (absolute)
	LDA $71A9,Y		  ; B9 A9 71 | Load from absolute,Y into accumulator
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ASL $3B80			; 0E 80 3B | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_177
; Address: $F9CF42
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_177:
	BMI $BF			  ; 30 BF | Branch if negative
	ADC $7E61,X		  ; 7D 61 7E | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDY $B880,X		  ; BC 80 B8 | Load from absolute,X into Y register
	BRA $64			  ; 80 64 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	STZ $BF00,X		  ; 9E 00 BF | Store zero to absolute,X
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_178
; Address: $F9CF61
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_178:
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $2C2E			; 2C 2E 2C | Test bits in accumulator (absolute)
	EOR ($C7,X)		  ; 41 C7 | Exclusive OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BNE $00			  ; D0 00 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEP #$E2			 ; E2 E2 | Set processor status bits
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_179
; Address: $F9CF88
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_179:
	JSR $401E			; 20 1E 40 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_17A
; Address: $F9CF8D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_17A:
	JSR $4080			; 20 80 40 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	BIT $FEE0			; 2C E0 FE | Test bits in accumulator (absolute)
	INC $001F,X		  ; FE 1F 00 | Increment (absolute,X)
	BIT $FE00			; 2C 00 FE | Test bits in accumulator (absolute)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	STY $38			  ; 84 38 | Store Y register to zero page
	ORA $0002,X		  ; 1D 02 00 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	ORA $03FF,Y		  ; 19 FF 03 | Logical OR with accumulator (absolute,Y)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	CPY $03C0			; CC C0 03 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_17B
; Address: $F9D03E
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_17B:
	BMI $00			  ; 30 00 | Branch if negative
	TSX				  ; BA | Transfer stack pointer to X register
	INC $FCF5,X		  ; FE F5 FC | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	SBC $E72C,Y		  ; F9 2C E7 | Subtract with carry (absolute,Y)
	CPX $80FF			; EC FF 80 | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $E701,Y		  ; 19 01 E7 | Logical OR with accumulator (absolute,Y)
	STY $CF			  ; 84 CF | Store Y register to zero page
	DEX				  ; CA | Decrement X register
	LDA $037FC5		  ; AF C5 7F 03 | Load from absolute long address into accumulator
	PLX				  ; FA | Pull X register from stack
	BMI $0C			  ; 30 0C | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	BMI $7F			  ; 30 7F | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $3FF7			; CC F7 3F | Compare Y register (absolute)
	LDA $007FC3		  ; AF C3 7F 00 | Load from absolute long address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	BMI $7F			  ; 30 7F | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	DEC $E6			  ; C6 E6 | Decrement (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	INC $F8E8,X		  ; FE E8 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $EF			  ; 70 EF | Branch if overflow set
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $70			  ; 10 70 | Branch if positive
	LDY $DC8E			; AC 8E DC | Load from absolute address into Y register
	ASL $FCD8,X		  ; 1E D8 FC | Arithmetic shift left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_17D
; Address: $F9D12A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_17D:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_17E
; Address: $F9D13C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_17E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_17F
; Address: $F9D182
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_17F:
	JSR $70A0			; 20 A0 70 | Jump to subroutine
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $3711,X		  ; 1D 11 37 | Logical OR with accumulator (absolute,X)
	ASL $1800			; 0E 00 18 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $330E			; 0E 0E 33 | Arithmetic shift left (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	BEQ $FE			  ; F0 FE | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $F93E,X		  ; 3E 3E F9 | Rotate left (absolute,X)
	CMP ($E6,X)		  ; C1 E6 | Compare accumulator ((zero page,X))
	STZ $B81E			; 9C 1E B8 | Store zero to absolute
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	ROL $F800,X		  ; 3E 00 F8 | Rotate left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $0B09			; 0D 09 0B | Logical OR with accumulator (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_180
; Address: $F9D214
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_180:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 3F FF FF | Load from absolute long,X into accumulator
	PEA #$D0DF		   ; F4 DF D0 | Push effective address to stack
	BEQ $E7			  ; F0 E7 | Branch if equal
	CMP $9DC2,Y		  ; D9 C2 9D | Compare accumulator (absolute,Y)
	LDY #$0E			 ; A0 0E | Load immediate value into Y register
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_181
; Address: $F9D236
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_181:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	JMP $C0FB			; 4C FB C0 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	INC $DFFE,X		  ; FE FE DF | Increment (absolute,X)
	SBC ($09,X)		  ; E1 09 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_182
; Address: $F9D254
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_182:
	JSR $08E0			; 20 E0 08 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	INC $BF64,X		  ; FE 64 BF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_183
; Address: $F9D265
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_183:
	JSR $A0A0			; 20 A0 A0 | Jump to subroutine
	BRA $A0			  ; 80 A0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_184
; Address: $F9D281
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_184:
	JSL $104200		  ; 22 00 42 10 | Jump to subroutine long
	WDM #$30			 ; 42 30 | Reserved instruction
	STY $34			  ; 84 34 | Store Y register to zero page
	PEA #$F474		   ; F4 74 F4 | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCS $B0			  ; B0 B0 | Branch if carry set
	BCS $B0			  ; B0 B0 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_185
; Address: $F9D2A6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_185:
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STZ $C4			  ; 64 C4 | Store zero to zero page
	BPL $42			  ; 10 42 | Hardware register operation
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_186
; Address: $F9D2B6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_186:
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LSR $2D5E,X		  ; 5E 5E 2D | Logical shift right (absolute,X)
	BIT $1514			; 2C 14 15 | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_187
; Address: $F9D312
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_187:
	JSR $2100			; 20 00 21 | PPU graphics register access
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $3F28,X		  ; 1E 28 3F | Arithmetic shift left (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	INC $0202,X		  ; FE 02 02 | Increment (absolute,X)
	BEQ $4E			  ; F0 4E | Branch if equal
	LDY #$5E			 ; A0 5E | Load immediate value into Y register
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PEA #$F2F4		   ; F4 F4 F2 | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_188
; Address: $F9D350
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_188:
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$84			 ; C0 84 | Compare Y register (immediate)
	CPX #$C4			 ; E0 C4 | Compare X register (immediate)
	BEQ $E8			  ; F0 E8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR ($C2),Y		  ; 51 C2 | Exclusive OR with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	BRA $22			  ; 80 22 | Branch always
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_189
; Address: $F9D3A0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_189:
	BVS $80			  ; 70 80 | Branch if overflow set
	EOR $15			  ; 45 15 | Exclusive OR with accumulator (zero page)
	STX $24			  ; 86 24 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank72_DmaFunction_18A
; Address: $F9D3A6
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_18A:
	JSL $480802		  ; 22 02 08 48 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FC14,X		  ; FE 14 FC | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_18B
; Address: $F9D3EC
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_18B:
	BPL $30			  ; 10 30 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BMI $0E			  ; 30 0E | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $74			  ; 80 74 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BEQ $0E			  ; F0 0E | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	ADC ($20,X)		  ; 61 20 | Add with carry ((zero page,X))
	EOR ($50),Y		  ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	JMP $5F0C7F		  ; 5C 7F 0C 5F | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	WDM #$A0			 ; 42 A0 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	BPL $08			  ; 10 08 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP ($364E)		  ; 6C 4E 36 | Jump to address (absolute indirect)
	ROL $783F,X		  ; 3E 3F 78 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BCS $F4			  ; B0 F4 | Branch if carry set
	ROR $FE			  ; 66 FE | Rotate right (zero page)
	BCS $F8			  ; B0 F8 | Branch if carry set
	INY				  ; C8 | Increment Y register
	CPX $C0C0			; EC C0 C0 | Compare X register (absolute)
	BRA $07			  ; 80 07 | Branch always
	BRA $4F			  ; 80 4F | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_18C
; Address: $F9D4E1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_18C:
	JSR $7823			; 20 23 78 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BVC $1B			  ; 50 1B | Branch if overflow clear
	BVC $2E			  ; 50 2E | Branch if overflow clear
	ADC $E707			; 6D 07 E7 | Add with carry (absolute)
	BNE $F0			  ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_18D
; Address: $F9D4F6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_18D:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	BPL $03			  ; 10 03 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BRA $08			  ; 80 08 | Branch always
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	EOR $9694,X		  ; 5D 94 96 | Exclusive OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BRA $69			  ; 80 69 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $C0			  ; 10 C0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BCC $78			  ; 90 78 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $0D			  ; 10 0D | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_18E
; Address: $F9D561
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_18E:
	JSR $7823			; 20 23 78 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_190
; Address: $F9D574
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_190:
	JSR $1007			; 20 07 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BRA $08			  ; 80 08 | Branch always
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	AND $1E98			; 2D 98 1E | Logical AND with accumulator (absolute)
	SBC ($74),Y		  ; F1 74 | Subtract with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_191
; Address: $F9D595
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_191:
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPY #$21			 ; C0 21 | PPU graphics register access
	CPY #$0B			 ; C0 0B | Compare Y register (immediate)
	BRA $4B			  ; 80 4B | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BPL $F8			  ; 10 F8 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	AND ($18),Y		  ; 31 18 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ASL $071E			; 0E 1E 07 | Arithmetic shift left (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $8C9C			; 9C 9C 8C | Store zero to absolute
	STY $5858			; 8C 58 58 | Store Y register to absolute address
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_193
; Address: $F9D5F2
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_193:
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $03			  ; 10 03 | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $1639			; 2D 39 16 | Logical AND with accumulator (absolute)
	ASL $2CA8,X		  ; 1E A8 2C | Arithmetic shift left (absolute,X)
	BVC $10			  ; 50 10 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ROR $E6			  ; 66 E6 | Rotate right (zero page)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA $8E00,Y		  ; 19 00 8E | Logical OR with accumulator (absolute,Y)
	EOR $4A61			; 4D 61 4A | Exclusive OR with accumulator (absolute)
	CMP ($C7),Y		  ; D1 C7 | Compare accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	BMI $1F			  ; 30 1F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_194
; Address: $F9D650
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_194:
	STZ $9C00,X		  ; 9E 00 9C | Store zero to absolute,X
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_196
; Address: $F9D660
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_196:
	JSR $08F8			; 20 F8 08 | Jump to subroutine
	CPX $F6D4			; EC D4 F6 | Compare X register (absolute)
	INC $FCB0,X		  ; FE B0 FC | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_197
; Address: $F9D66B
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_197:
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $0E1C			; 0D 1C 0E | Logical OR with accumulator (absolute)
	ASL $0F07,X		  ; 1E 07 0F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$78			 ; 29 78 | Logical AND with accumulator (immediate)
	LDX $473E,Y		  ; BE 3E 47 | Load from absolute,Y into X register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BVS $E0			  ; 70 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SBC #$69			 ; E9 69 | Subtract with carry (immediate)
	STA ($62),Y		  ; 91 62 | Store accumulator to (zero page),Y
	STY $87			  ; 84 87 | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $9C00			; 6E 00 9C | Rotate right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $F8			  ; 10 F8 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	INC $FD44,X		  ; FE 44 FD | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_198
; Address: $F9D6E9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_198:
	CPX $F0C0			; EC C0 F0 | Compare X register (absolute)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $071E			; 0E 1E 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $0F0F,X		  ; 3D 0F 0F | Logical AND with accumulator (absolute,X)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ROL $06F0,X		  ; 3E F0 06 | Rotate left (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $E7			  ; E4 E7 | Compare X register (zero page)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_199
; Address: $F9D745
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_199:
	STA $813FA0		  ; 8F A0 3F 81 | Store accumulator to absolute long address
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	INC $F614,X		  ; FE 14 F6 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_19A
; Address: $F9D767
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_19A:
	CPX $F0E0			; EC E0 F0 | Compare X register (absolute)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_19B
; Address: $F9D7AF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_19B:
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $00FF,X		  ; 1E FF 00 | Arithmetic shift left (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_19C
; Address: $F9D801
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_19C:
	JSR $5020			; 20 20 50 | Jump to subroutine
	BMI $4C			  ; 30 4C | Branch if negative
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_19D
; Address: $F9D810
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_19D:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $F8FF			; 0E FF F8 | Arithmetic shift left (absolute)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_19E
; Address: $F9D862
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_19E:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_19F
; Address: $F9D8A1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_19F:
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $ACAC			; 2C AC AC | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1A1
; Address: $F9D8B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1A1:
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1A2
; Address: $F9D8C0
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1A2:
	JSR $2070			; 20 70 20 | Jump to subroutine
	BVS $30			  ; 70 30 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1A3
; Address: $F9D8FD
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1A3:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	ASL $140F,X		  ; 1E 0F 14 | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $1400,X		  ; 1E 00 14 | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	BCS $E0			  ; B0 E0 | Game work RAM access
	BCS $A0			  ; B0 A0 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1A7
; Address: $F9D9A6
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1A7:
	JSR $A030			; 20 30 A0 | Jump to subroutine
	BMI $B0			  ; 30 B0 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0201			; 0E 01 02 | Arithmetic shift left (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $0E04,X		  ; 1E 04 0E | Arithmetic shift left (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ASL $0E0E,X		  ; 1E 0E 0E | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1A8
; Address: $F9DA77
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1A8:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	ORA $190F,Y		  ; 19 0F 19 | Logical OR with accumulator (absolute,Y)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	ASL $0401			; 0E 01 04 | Arithmetic shift left (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $70			  ; 80 70 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC				  ; 1A | Increment accumulator
	ORA $190F,Y		  ; 19 0F 19 | Logical OR with accumulator (absolute,Y)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	ASL $0401			; 0E 01 04 | Arithmetic shift left (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $F0			  ; 80 F0 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1A9
; Address: $F9DAF8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1A9:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $FF1F,Y		  ; 19 1F FF | Logical OR with accumulator (absolute,Y)
	BEQ $6F			  ; F0 6F | Branch if equal
	INX				  ; E8 | Increment X register
	LDA				  ; BF B0 D0 C7 | Load from absolute long,X into accumulator
	STA $1DA2,Y		  ; 99 A2 1D | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1AA
; Address: $F9DB2F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1AA:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $1F			  ; 10 1F | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1AB
; Address: $F9DB3A
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1AB:
	JSR $48FF			; 20 FF 48 | Jump to subroutine
	CPY $E2FB			; CC FB E2 | Compare Y register (absolute)
	ASL $E1ED,X		  ; 1E ED E1 | Arithmetic shift left (absolute,X)
	INC $EFFE,X		  ; FE FE EF | Increment (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	BVS $08			  ; 70 08 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INC $FF24,X		  ; FE 24 FF | Increment (absolute,X)
	LDA				  ; BF 00 00 80 | Load from absolute long,X into accumulator
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BRA $A0			  ; 80 A0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BMI $F0			  ; 30 F0 | Branch if negative
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $848C			; 9C 8C 84 | Store zero to absolute
	STY $C8			  ; 84 C8 | Store Y register to zero page
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1AC
; Address: $F9DBAC
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1AC:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BRA $70			  ; 80 70 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	ORA $330C			; 0D 0C 33 | Logical OR with accumulator (absolute)
	ORA $0301			; 0D 01 03 | Logical OR with accumulator (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $7E00,X		  ; 3E 00 7E | Rotate left (absolute,X)
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	ROL $0C00,X		  ; 3E 00 0C | Rotate left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	STZ $0C0C			; 9C 0C 0C | Store zero to absolute
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BMI $F0			  ; 30 F0 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1AD
; Address: $F9DBF8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1AD:
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1AE
; Address: $F9DC01
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1AE:
	BEQ $30			  ; F0 30 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ASL $0F06,X		  ; 1E 06 0F | Arithmetic shift left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BEQ $78			  ; F0 78 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1AF
; Address: $F9DC38
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1AF:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	ASL $5401			; 0E 01 54 | Arithmetic shift left (absolute)
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	BIT #$28			 ; 89 28 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B0
; Address: $F9DCA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B0:
	JSR $0402			; 20 02 04 | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B1
; Address: $F9DCB8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B1:
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $46			  ; 05 46 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B2
; Address: $F9DCC7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B2:
	JSL $000828		  ; 22 28 08 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B4
; Address: $F9DCF0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B4:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ORA $190F,Y		  ; 19 0F 19 | Logical OR with accumulator (absolute,Y)
	BPL $02			  ; 10 02 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BEQ $58			  ; F0 58 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B5
; Address: $F9DD34
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B5:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $B0			  ; D0 B0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BCS $F8			  ; B0 F8 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	JMP $FC5EFC		  ; 5C FC 5E FC | Jump to address long
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BMI $E0			  ; 30 E0 | Game work RAM access
	BVS $A0			  ; 70 A0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	JMP $005E00		  ; 5C 00 5E 00 | Jump to address long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SEP #$A2			 ; E2 A2 | Set processor status bits
	BVS $70			  ; 70 70 | Branch if overflow set
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	SEP #$00			 ; E2 00 | Set processor status bits
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B6
; Address: $F9DE22
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B6:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	PEA #$2E1B		   ; F4 1B 2E | Push effective address to stack
	LSR $3E05,X		  ; 5E 05 3E | Logical shift right (absolute,X)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	PEA #$2E00		   ; F4 00 2E | Push effective address to stack
	LSR $3E00,X		  ; 5E 00 3E | Logical shift right (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BEQ $68			  ; F0 68 | Branch if equal
	INX				  ; E8 | Increment X register
	LDX $BF66,Y		  ; BE 66 BF | Load from absolute,Y into X register
	BVS $DC			  ; 70 DC | Branch if overflow set
	BVS $E8			  ; 70 E8 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BIT $2000			; 2C 00 20 | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	LDX $BF00,Y		  ; BE 00 BF | Load from absolute,Y into X register
	INX				  ; E8 | Increment X register
	BIT $2000			; 2C 00 20 | Test bits in accumulator (absolute)
	ROR $77			  ; 66 77 | Rotate right (zero page)
	STZ $7907			; 9C 07 79 | Store zero to absolute
	ORA $3B37			; 0D 37 3B | Logical OR with accumulator (absolute)
	ASL $3B			  ; 06 3B | Arithmetic shift left (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STZ $7900			; 9C 00 79 | Store zero to absolute
	INC $FB9B,X		  ; FE 9B FB | Increment (absolute,X)
	LDX $37D9			; AE D9 37 | Load from absolute address into X register
	PLB				  ; AB | Pull data bank register from stack
	LDA $B64D,X		  ; BD 4D B6 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR $9B			  ; 46 9B | Logical shift right (zero page)
	LDX $3700			; AE 00 37 | Load from absolute address into X register
	PLB				  ; AB | Pull data bank register from stack
	LDA $B600,X		  ; BD 00 B6 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B7
; Address: $F9DEC3
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B7:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	AND $0A3F			; 2D 3F 0A | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $123F,X		  ; 1E 3F 12 | Arithmetic shift left (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STY $04FC			; 8C FC 04 | Store Y register to absolute address
	INC $FE76,X		  ; FE 76 FE | Increment (absolute,X)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $FC			  ; 70 FC | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BEQ $18			  ; F0 18 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BIT $7C			  ; 24 7C | Test bits in accumulator (zero page)
	JMP $7878			; 4C 78 78 | Jump to address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B8
; Address: $F9DF28
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B8:
	JSR $0020			; 20 20 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $7C			  ; 30 7C | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1B9
; Address: $F9DF39
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1B9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $0F0F,X		  ; 1E 0F 0F | Arithmetic shift left (absolute,X)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1BA
; Address: $F9DF63
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1BA:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHY				  ; 5A | Push Y register to stack
	LSR $6B2F			; 4E 2F 6B | Logical shift right (absolute)
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	ORA $8080,Y		  ; 19 80 80 | Logical OR with accumulator (absolute,Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$4A			 ; E0 4A | Compare X register (immediate)
	ROL $1918,X		  ; 3E 18 19 | Rotate left (absolute,X)
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	INY				  ; C8 | Increment Y register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	NOP				  ; EA | No operation
	LDY $7E			  ; A4 7E | Load from zero page into Y register
	BVC $FC			  ; 50 FC | Branch if overflow clear
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BPL $F8			  ; 10 F8 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	NOP				  ; EA | No operation
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1BC
; Address: $F9E01C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1BC:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1BD
; Address: $F9E084
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1BD:
	JSR $0020			; 20 20 00 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	PEA #$FC14		   ; F4 14 FC | Push effective address to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1BE
; Address: $F9E095
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1BE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INX				  ; E8 | Increment X register
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	BRA $FC			  ; 80 FC | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	PEA #$80F4		   ; F4 F4 80 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	DEX				  ; CA | Decrement X register
	BRA $F6			  ; 80 F6 | Branch always
	PEA #$8000		   ; F4 00 80 | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1C3
; Address: $F9E119
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1C3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $13			  ; 10 13 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1C5
; Address: $F9E146
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1C5:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BMI $90			  ; 30 90 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BCC $18			  ; 90 18 | Branch if carry clear
	BCC $18			  ; 90 18 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $17			  ; 10 17 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1CD
; Address: $F9E188
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1CD:
	JSR $A030			; 20 30 A0 | Jump to subroutine
	BMI $B0			  ; 30 B0 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BCS $38			  ; B0 38 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ORA $3C3F,Y		  ; 19 3F 3C | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1CE
; Address: $F9E1C7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1CE:
	ORA $7FFF,X		  ; 1D FF 7F | Logical OR with accumulator (absolute,X)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FFE2,X		  ; FE E2 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ORA $3E19,X		  ; 1D 19 3E | Logical OR with accumulator (absolute,X)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	JMP $D8F8			; 4C F8 D8 | Jump to address
	ORA $3E18,X		  ; 1D 18 3E | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	BMI $7C			  ; 30 7C | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1D3
; Address: $F9E21D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1D3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BIT $3838			; 2C 38 38 | Test bits in accumulator (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $3C			  ; 10 3C | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $07			  ; 10 07 | Branch if positive
	ASL $0705			; 0E 05 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $27			  ; 10 27 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1D4
; Address: $F9E2C3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1D4:
	JSR $2027			; 20 27 20 | Jump to subroutine
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	CPX #$FC			 ; E0 FC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1D5
; Address: $F9E2EA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1D5:
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1D7
; Address: $F9E30A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1D7:
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1D8
; Address: $F9E30E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1D8:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1D9
; Address: $F9E31E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1D9:
	JSR $0060			; 20 60 00 | Jump to subroutine
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1F1F,Y		  ; 19 1F 1F | Logical OR with accumulator (absolute,Y)
	DEC $DFC0,X		  ; DE C0 DF | Decrement (absolute,X)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	ORA $3F22,Y		  ; 19 22 3F | Logical OR with accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1DA
; Address: $F9E35A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1DA:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $88			  ; 30 88 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	INC $FF04,X		  ; FE 04 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1DC
; Address: $F9E388
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1DC:
	BCC $90			  ; 90 90 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1DD
; Address: $F9E39C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1DD:
	BRA $80			  ; 80 80 | Branch always
	BMI $F0			  ; 30 F0 | Branch if negative
	ORA $0303			; 0D 03 03 | Logical OR with accumulator (absolute)
	LDA				  ; BF BF 5E 41 | Load from absolute long,X into accumulator
	EOR ($84,X)		  ; 41 84 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1DE
; Address: $F9E3C8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1DE:
	JSL $040229		  ; 22 29 02 04 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1DF
; Address: $F9E3D8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1DF:
	RTI				  ; 40 | Return from interrupt
	ORA $66			  ; 05 66 | Logical OR with accumulator (zero page)
	WDM #$82			 ; 42 82 | Reserved instruction
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1E3
; Address: $F9E413
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1E3:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $5E00			; 0D 00 5E | Logical OR with accumulator (absolute)
	EOR ($D4,X)		  ; 41 D4 | Exclusive OR with accumulator ((zero page,X))
	EOR ($84,X)		  ; 41 84 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1E4
; Address: $F9E428
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1E4:
	JSL $040229		  ; 22 29 02 04 | Jump to subroutine long
	CPY $A0FB			; CC FB A0 | Compare Y register (absolute)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1E6
; Address: $F9E443
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1E6:
	ORA $66			  ; 05 66 | Logical OR with accumulator (zero page)
	WDM #$82			 ; 42 82 | Reserved instruction
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 0A FF 2B | Load from absolute long,X into accumulator
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1E7
; Address: $F9E462
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1E7:
	PHP				  ; 08 | Push processor status to stack
	ORA $1906			; 0D 06 19 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $290A,Y		  ; 19 0A 29 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	ASL $0B0E			; 0E 0E 0B | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $290A,Y		  ; 19 0A 29 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	ASL $0D0E			; 0E 0E 0D | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $190E,X		  ; 1D 0E 19 | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	ASL $130E			; 0E 0E 13 | Arithmetic shift left (absolute)
	EOR #$81			 ; 49 81 | Exclusive OR with accumulator (immediate)
	LSR $12			  ; 46 12 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1E8
; Address: $F9E4E5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1E8:
	JSR $1004			; 20 04 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1E9
; Address: $F9E4F6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1E9:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	BPL $07			  ; 10 07 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	ROR $0081,X		  ; 7E 81 00 | Rotate right (absolute,X)
	BCC $82			  ; 90 82 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	STZ $02			  ; 64 02 | Store zero to zero page
	BPL $04			  ; 10 04 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1EA
; Address: $F9E52C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1EA:
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BRA $7E			  ; 80 7E | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1EB
; Address: $F9E548
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1EB:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	ASL $160E			; 0E 0E 16 | Arithmetic shift left (absolute)
	ASL $3F37,X		  ; 1E 37 3F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $1C18,X		  ; 1D 18 1C | Logical OR with accumulator (absolute,X)
	AND $3A			  ; 25 3A | Logical AND with accumulator (zero page)
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHY				  ; 5A | Push Y register to stack
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	STA $FDDF			; 8D DF FD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1EC
; Address: $F9E5AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1EC:
	JSL $A2A3E6		  ; 22 E6 A3 A2 | Jump to subroutine long
	ADC ($FD),Y		  ; 71 FD | Add with carry ((zero page),Y)
	STA $538F			; 8D 8F 53 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1ED
; Address: $F9E5B7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1ED:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$DD			 ; E0 DD | Compare X register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $47			  ; 80 47 | Branch always
	STX $B543			; 8E 43 B5 | Store X register to absolute address
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	LDA				  ; BF 7A FE 44 | Load from absolute long,X into accumulator
	CMP $45			  ; C5 45 | Compare accumulator (zero page)
	STX $C0DF			; 8E DF C0 | Store X register to absolute address
	SBC ($C1),Y		  ; F1 C1 | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	STX $83			  ; 86 83 | Store X register to zero page
	STA $07			  ; 85 07 | Store accumulator to zero page
	DEC				  ; 3A | Decrement accumulator
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1EF
; Address: $F9E5E5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1EF:
	BRA $B8			  ; 80 B8 | Branch always
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	LDY $5C			  ; A4 5C | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F2
; Address: $F9E5F2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F2:
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPX #$5A			 ; E0 5A | Compare X register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $0004			; 0E 04 00 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $080F			; 0E 0F 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $1518			; 0E 18 15 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $09			  ; 30 09 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	BPL $07			  ; 10 07 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F4
; Address: $F9E63A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F4:
	JSR $4007			; 20 07 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0107			; 0E 07 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	ASL $5FC1,X		  ; 1E C1 5F | Arithmetic shift left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	LDA $EB2F65		  ; AF 65 2F EB | Load from absolute long address into accumulator
	BRA $00			  ; 80 00 | Branch always
	LDX $3E00,Y		  ; BE 00 3E | Load from absolute,Y into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	BRA $14			  ; 80 14 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $8D11			; 0E 11 8D | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	CPX $38			  ; E4 38 | Compare X register (zero page)
	INC $0EFC,X		  ; FE FC 0E | Increment (absolute,X)
	ASL $1F1F			; 0E 1F 1F | Arithmetic shift left (absolute)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND ($73,X)		  ; 21 73 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F5
; Address: $F9E6A5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F5:
	LDX $C3BE			; AE BE C3 | Load from absolute address into X register
	SEP #$61			 ; E2 61 | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F6
; Address: $F9E6AC
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F6:
	SEP #$7E			 ; E2 7E | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	STY $D100			; 8C 00 D1 | Store Y register to absolute address
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	CPX #$CE			 ; E0 CE | Compare X register (immediate)
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $04			  ; 80 04 | Branch always
	DEC $75F2			; CE F2 75 | Decrement (absolute)
	ADC $47C3,X		  ; 7D C3 47 | Add with carry (absolute,X)
	STX $06			  ; 86 06 | Store X register to zero page
	LDY $7E47			; AC 47 7E | Load from absolute address into Y register
	PLX				  ; FA | Pull X register from stack
	DEC $B1C0			; CE C0 B1 | Decrement (absolute)
	BRA $8B			  ; 80 8B | Branch always
	ROL $7907,X		  ; 3E 07 79 | Rotate left (absolute,X)
	SBC ($41,X)		  ; E1 41 | Subtract with carry ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	LDA ($17),Y		  ; B1 17 | Load from (zero page),Y into accumulator
	LDX $EDD9			; AE D9 ED | Load from absolute address into X register
	ROL $3F7F,X		  ; 3E 7F 3F | Rotate left (absolute,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $E8			  ; F0 E8 | Branch if equal
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	CPX #$66			 ; E0 66 | Compare X register (immediate)
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	LDX $F4			  ; A6 F4 | Load from zero page into X register
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $7C00,X		  ; 7D 00 7C | Add with carry (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	EOR $2801,Y		  ; 59 01 28 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F7
; Address: $F9E722
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F7:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F8
; Address: $F9E72A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F8:
	JSR $4040			; 20 40 40 | Jump to subroutine
	BVS $E0			  ; 70 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $CA			  ; 80 CA | Branch always
	BRA $3B			  ; 80 3B | Branch always
	ADC $FC9A,X		  ; 7D 9A FC | Add with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	JMP $E0ADE0		  ; 5C E0 AD E0 | Game work RAM access
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	STY $0500			; 8C 00 05 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1F9
; Address: $F9E7A3
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1F9:
	LDX $D77A,Y		  ; BE 7A D7 | Load from absolute,Y into X register
	STA ($7C),Y		  ; 91 7C | Store accumulator to (zero page),Y
	STA ($77),Y		  ; 91 77 | Store accumulator to (zero page),Y
	INY				  ; C8 | Increment Y register
	CMP ($DC),Y		  ; D1 DC | Compare accumulator ((zero page),Y)
	ASL $6E			  ; 06 6E | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ADC $0802			; 6D 02 08 | Add with carry (absolute)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	STA $0660,Y		  ; 99 60 06 | Store accumulator to absolute,Y
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	ADC $EB5E,X		  ; 7D 5E EB | Add with carry (absolute,X)
	BIT #$3E			 ; 89 3E | Test bits in accumulator (immediate)
	BIT #$EA			 ; 89 EA | Test bits in accumulator (immediate)
	BIT #$3B			 ; 89 3B | Test bits in accumulator (immediate)
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	SEP #$40			 ; E2 40 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1FA
; Address: $F9E7DC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1FA:
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX $3F59,Y		  ; BE 59 3F | Load from absolute,Y into X register
	XBA				  ; EB | Exchange accumulator bytes
	JMP $073AC7		  ; 5C C7 3A 07 | Jump to address long
	INC $6FD3			; EE D3 6F | Increment (absolute)
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1FB
; Address: $F9E7F6
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1FB:
	CMP $C0			  ; C5 C0 | Compare accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	ASL $0040,X		  ; 1E 40 00 | Arithmetic shift left (absolute,X)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	STA $7E78,Y		  ; 99 78 7E | Store accumulator to absolute,Y
	SBC $FFEF			; ED EF FF | Subtract with carry (absolute)
	ROR $797F,X		  ; 7E 7F 79 | Rotate right (absolute,X)
	ROR $8E7E,X		  ; 7E 7E 8E | Rotate right (absolute,X)
	BMI $13			  ; 30 13 | Branch if negative
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	LSR $44			  ; 46 44 | Logical shift right (zero page)
	STZ $7090			; 9C 90 70 | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $FC6C,X		  ; FE 6C FC | Increment (absolute,X)
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $36			  ; 10 36 | Branch if positive
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ASL $1C0E			; 0E 0E 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC #$76			 ; 69 76 | Add with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 02 13 00 | Load from absolute long,X into accumulator
	AND $2210			; 2D 10 22 | Logical AND with accumulator (absolute)
	BPL $88			  ; 10 88 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1FC
; Address: $F9E881
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1FC:
	ADC $FC42,X		  ; 7D 42 FC | Add with carry (absolute,X)
	STA $F9			  ; 85 F9 | Store accumulator to zero page
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CMP ($74,X)		  ; C1 74 | Compare accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1FD
; Address: $F9E896
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1FD:
	JSR $2600			; 20 00 26 | Jump to subroutine
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $C444,Y		  ; F9 44 C4 | Subtract with carry (absolute,Y)
	LDA ($B1),Y		  ; B1 B1 | Load from (zero page),Y into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	INX				  ; E8 | Increment X register
	ADC ($F4,X)		  ; 61 F4 | Add with carry ((zero page,X))
	DEC $03F5			; CE F5 03 | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA $F0			  ; 05 F0 | Logical OR with accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	BRA $09			  ; 80 09 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	STA				  ; 9F 22 23 8D | Store accumulator to absolute long,X
	STA $E952			; 8D 52 E9 | Store accumulator to absolute address
	STX $2F			  ; 86 2F | Store X register to zero page
	LDA $A01FC0		  ; AF C0 1F A0 | Load from absolute long address into accumulator
	EOR $9001,X		  ; 5D 01 90 | Exclusive OR with accumulator (absolute,X)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1FE
; Address: $F9E8D5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1FE:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $40			  ; 10 40 | Branch if positive
	BRA $40			  ; 80 40 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_1FF
; Address: $F9E8DD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_1FF:
	BCC $C0			  ; 90 C0 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	LDX $3F42,Y		  ; BE 42 3F | Load from absolute,Y into X register
	LDA ($9F,X)		  ; A1 9F | Load from (zero page,X) into accumulator
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ROL $40			  ; 26 40 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_200
; Address: $F9E8EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_200:
	JSR $4080			; 20 80 40 | Jump to subroutine
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_201
; Address: $F9E8F5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_201:
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	STZ $00			  ; 64 00 | Store zero to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_202
; Address: $F9E901
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_202:
	INC $961E			; EE 1E 96 | Increment (absolute)
	ROR $E21F			; 6E 1F E2 | Rotate right (absolute)
	ORA $40FD,X		  ; 1D FD 40 | Logical OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$DC			 ; E0 DC | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	JMP ($2080)		  ; 6C 80 20 | Jump to address (absolute indirect)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BVS $70			  ; 70 70 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($B9),Y		  ; D1 B9 | Compare accumulator ((zero page),Y)
	STX $2E30			; 8E 30 2E | Store X register to absolute address
	BNE $0D			  ; D0 0D | Branch if not equal
	CPY $8303			; CC 03 83 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA #$F7			 ; 09 F7 | Logical OR with accumulator (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_203
; Address: $F9E9A1
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_203:
	LDY #$4F			 ; A0 4F | Load immediate value into Y register
	LDA				  ; BF 3F F0 F0 | Load from absolute long,X into accumulator
	STA $3F3F0F		  ; 8F 0F 3F 3F | Store accumulator to absolute long address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 1F 27 58 | Store accumulator to absolute long,X
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SBC $FEF8,Y		  ; F9 F8 FE | Subtract with carry (absolute,Y)
	INC $0303,X		  ; FE 03 03 | Increment (absolute,X)
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC $0301,X		  ; FE 01 03 | Increment (absolute,X)
	BPL $EF			  ; 10 EF | Branch if positive
	DEY				  ; 88 | Decrement Y register
	BPL $98			  ; 10 98 | Branch if positive
	BRA $70			  ; 80 70 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	BEQ $08			  ; F0 08 | Branch if equal
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $78			  ; 80 78 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	STX $F801			; 8E 01 F8 | Store X register to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	INC $08F0,X		  ; FE F0 08 | Increment (absolute,X)
	BPL $60			  ; 10 60 | Branch if positive
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_204
; Address: $F9EA27
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_204:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_205
; Address: $F9EA60
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_205:
	JSR $1111			; 20 11 11 | Jump to subroutine
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0B1F,X		  ; 1E 1F 0B | Arithmetic shift left (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $1102			; ED 02 11 | Subtract with carry (absolute)
	STA ($92),Y		  ; 91 92 | Store accumulator to (zero page),Y
	INY				  ; C8 | Increment Y register
	CMP #$2A			 ; C9 2A | Compare accumulator (immediate)
	AND #$C4			 ; 29 C4 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	CPX $6CFF			; EC FF 6C | Compare X register (absolute)
	CPX $64			  ; E4 64 | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	EOR $B04C			; 4D 4C B0 | Exclusive OR with accumulator (absolute)
	BMI $5F			  ; 30 5F | Branch if negative
	BCS $30			  ; B0 30 | Branch if carry set
	STA				  ; 9F 37 87 99 | Store accumulator to absolute long,X
	ROR $4C			  ; 66 4C | Rotate right (zero page)
	BMI $CF			  ; 30 CF | Branch if negative
	CPX #$47			 ; E0 47 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	BMI $CF			  ; 30 CF | Branch if negative
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ASL $FD0E			; 0E 0E FD | Arithmetic shift left (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA $FA0C			; 0D 0C FA | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	SBC $99E0			; ED E0 99 | Subtract with carry (absolute)
	ROR $32			  ; 66 32 | Rotate right (zero page)
	CMP $F10E			; CD 0E F1 | Compare accumulator (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_206
; Address: $F9EAEF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_206:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $B5			  ; 80 B5 | Branch always
	BVC $97			  ; 50 97 | Branch if overflow clear
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_207
; Address: $F9EB0D
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_207:
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $EDFF			; ED FF ED | Subtract with carry (absolute)
	SBC $F5FF			; ED FF F5 | Subtract with carry (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $4030,X		  ; 3E 30 40 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCS $C0			  ; B0 C0 | Branch if carry set
	STZ $2340			; 9C 40 23 | Store zero to absolute
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	INC $20C0,X		  ; FE C0 20 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_208
; Address: $F9EB8F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_208:
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BNE $D0			  ; D0 D0 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	STA $448030		  ; 8F 30 80 44 | Store accumulator to absolute long address
	BRA $27			  ; 80 27 | Branch always
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $88			  ; 90 88 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank72_DmaFunction_209
; Address: $F9EBE4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_209:
	JSR $C010			; 20 10 C0 | Jump to subroutine
	BPL $20			  ; 10 20 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BPL $80			  ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_20A
; Address: $F9EBED
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_20A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BRA $78			  ; 80 78 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_20B
; Address: $F9EC54
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_20B:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	BPL $07			  ; 10 07 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $27			  ; 80 27 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$47			 ; A0 47 | Load immediate value into Y register
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_20C
; Address: $F9ECAD
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_20C:
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	CMP ($18,X)		  ; C1 18 | Compare accumulator ((zero page,X))
	CPX $02			  ; E4 02 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $C7			  ; 80 C7 | Branch always
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_20D
; Address: $F9ED10
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_20D:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BRA $B8			  ; 80 B8 | Branch always
	AND ($80),Y		  ; 31 80 | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_20E
; Address: $F9ED62
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_20E:
	JSR $0018			; 20 18 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_20F
; Address: $F9ED98
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_20F:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $5B21,Y		  ; 39 21 5B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_210
; Address: $F9EDA5
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_210:
	JSR $12BB			; 20 BB 12 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	DEX				  ; CA | Decrement X register
	AND $5E00,Y		  ; 39 00 5E | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	SBC $C3E0			; ED E0 C3 | Subtract with carry (absolute)
	CMP $0000			; CD 00 00 | Compare accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	REP #$E2			 ; C2 E2 | Reset processor status bits
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0D0F			; 0D 0F 0D | Logical OR with accumulator (absolute)
	SBC $1D0F			; ED 0F 1D | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $43			  ; 80 43 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_211
; Address: $F9EE2C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_211:
	JSR $5000			; 20 00 50 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLX				  ; FA | Pull X register from stack
	DEC $7DBF,X		  ; DE BF 7D | Decrement (absolute,X)
	INC $07			  ; E6 07 | Increment (zero page)
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	BEQ $60			  ; F0 60 | Branch if equal
	SBC ($A7,X)		  ; E1 A7 | Subtract with carry ((zero page,X))
	STA $5EFFDE		  ; 8F DE FF 5E | Store accumulator to absolute long address
	ROR $E223,X		  ; 7E 23 E2 | Rotate right (absolute,X)
	LDA ($A0,X)		  ; A1 A0 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_212
; Address: $F9EE6E
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_212:
	SEP #$9E			 ; E2 9E | Set processor status bits
	STA				  ; 9F 9B 58 C0 | Store accumulator to absolute long,X
	ADC ($C0,X)		  ; 61 C0 | Add with carry ((zero page,X))
	LDA ($E0,X)		  ; A1 E0 | Game work RAM access
	CPX #$5E			 ; E0 5E | Compare X register (immediate)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	BRA $67			  ; 80 67 | Branch always
	SBC $F1			  ; E5 F1 | Subtract with carry (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ROR $47C4,X		  ; 7E C4 47 | Rotate right (absolute,X)
	STA $05			  ; 85 05 | Store accumulator to zero page
	LDX $7947			; AE 47 79 | Load from absolute address into X register
	SBC $9AC1			; ED C1 9A | Subtract with carry (absolute)
	STX $03			  ; 86 03 | Store X register to zero page
	STA $07			  ; 85 07 | Store accumulator to zero page
	PLY				  ; 7A | Pull Y register from stack
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	INC $40			  ; E6 40 | Increment (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$18			 ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_213
; Address: $F9EEA6
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_213:
	JSR $AF14			; 20 14 AF | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	DEC $FD7B,X		  ; DE 7B FD | Decrement (absolute,X)
	LDX $E0E0,Y		  ; BE E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $E4			  ; F0 E4 | Branch if equal
	CPX #$EB			 ; E0 EB | Compare X register (immediate)
	CPX #$67			 ; E0 67 | Compare X register (immediate)
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	CPY #$84			 ; C0 84 | Compare Y register (immediate)
	BRA $41			  ; 80 41 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$F5			 ; C0 F5 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	JMP $AEE8			; 4C E8 AE | Jump to address
	BRA $00			  ; 80 00 | Branch always
	SBC $CF00,X		  ; FD 00 CF | Subtract with carry (absolute,X)
	LDA ($01),Y		  ; B1 01 | Load from (zero page),Y into accumulator
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_214
; Address: $F9EEFE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_214:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $303D,Y		  ; 19 3D 30 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_215
; Address: $F9EF0B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_215:
	JSL $322D3B		  ; 22 3B 2D 32 | Jump to subroutine long
	ASL $071F			; 0E 1F 07 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	REP #$F2			 ; C2 F2 | Reset processor status bits
	SEP #$72			 ; E2 72 | Set processor status bits
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	STA $FFDE			; 8D DE FF | Store accumulator to absolute address
	EOR $207C,X		  ; 5D 7C 20 | Exclusive OR with accumulator (absolute,X)
	BIT #$A0			 ; 89 A0 | Test bits in accumulator (immediate)
	SBC $0D0F,X		  ; FD 0F 0D | Subtract with carry (absolute,X)
	STA $5383			; 8D 83 53 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_216
; Address: $F9EF39
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_216:
	CMP ($A1,X)		  ; C1 A1 | Compare accumulator ((zero page,X))
	SEP #$D8			 ; E2 D8 | Set processor status bits
	BVC $8F			  ; 50 8F | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BRA $43			  ; 80 43 | Branch always
	STA $68805F		  ; 8F 5F 80 68 | Store accumulator to absolute long address
	DEY				  ; 88 | Decrement Y register
	CPX $F96C			; EC 6C F9 | Compare X register (absolute)
	BIT #$CF			 ; 89 CF | Test bits in accumulator (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	BNE $0C			  ; D0 0C | Branch if not equal
	ADC ($06),Y		  ; 71 06 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_218
; Address: $F9EF63
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_218:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	BVS $18			  ; 70 18 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	CPY $040C			; CC 0C 04 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	INC $20FC,X		  ; FE FC 20 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_219
; Address: $F9EF71
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_219:
	JSR $70F0			; 20 F0 70 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX #$C2			 ; E0 C2 | Compare X register (immediate)
	BMI $02			  ; 30 02 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $CD			  ; 30 CD | Branch if negative
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_21A
; Address: $F9EFB2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_21A:
	SEC				  ; 38 | Set carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_21B
; Address: $F9EFC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_21B:
	JSL $322D3B		  ; 22 3B 2D 32 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA $0707,X		  ; 1D 07 07 | Logical OR with accumulator (absolute,X)
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_21C
; Address: $F9EFDE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_21C:
	JSL $72E203		  ; 22 03 E2 72 | Jump to subroutine long
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	STA $FDDF			; 8D DF FD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_21D
; Address: $F9EFE9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_21D:
	JSL $62A386		  ; 22 86 A3 62 | Jump to subroutine long
	ADC ($E0),Y		  ; 71 E0 | Game work RAM access
	STA $5383			; 8D 83 53 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_21E
; Address: $F9EFF5
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_21E:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$DD			 ; E0 DD | Compare X register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	BRA $8E			  ; 80 8E | Branch always
	ROR $4700			; 6E 00 47 | Rotate right (absolute)
	STX $B543			; 8E 43 B5 | Store X register to absolute address
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	LDA				  ; BF 7A FE 44 | Load from absolute long,X into accumulator
	ADC ($C5,X)		  ; 61 C5 | Add with carry ((zero page,X))
	LSR $8E			  ; 46 8E | Logical shift right (zero page)
	LDA #$F1			 ; A9 F1 | Load immediate value into accumulator
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	STX $83			  ; 86 83 | Store X register to zero page
	STA $07			  ; 85 07 | Store accumulator to zero page
	DEC				  ; 3A | Decrement accumulator
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $B8			  ; 80 B8 | Branch always
	PHP				  ; 08 | Push processor status to stack
	JMP $803C			; 4C 3C 80 | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	CPX #$4A			 ; E0 4A | Compare X register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	CPY #$A4			 ; C0 A4 | Compare Y register (immediate)
	BRA $44			  ; 80 44 | Branch always
	CPY #$D2			 ; C0 D2 | Compare Y register (immediate)
	INC $FA			  ; E6 FA | Increment (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_21F
; Address: $F9F045
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_21F:
	LDA $ECA1,X		  ; BD A1 EC | Load from absolute,X into accumulator
	WDM #$E9			 ; 42 E9 | Reserved instruction
	ORA $19E3			; 0D E3 19 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	WDM #$03			 ; 42 03 | Reserved instruction
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	STA				  ; 9F 79 E4 84 | Store accumulator to absolute long,X
	ADC ($2B),Y		  ; 71 2B | Add with carry ((zero page),Y)
	BRA $7A			  ; 80 7A | Branch always
	SBC #$EE			 ; E9 EE | Subtract with carry (immediate)
	SEP #$A0			 ; E2 A0 | Set processor status bits
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	BVC $04			  ; 50 04 | Branch if overflow clear
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	BPL $03			  ; 10 03 | Branch if positive
	LSR $9EF9,X		  ; 5E F9 9E | Logical shift right (absolute,X)
	AND ($8E,X)		  ; 21 8E | Logical AND with accumulator ((zero page,X))
	ORA ($5E,X)		  ; 01 5E | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $40			  ; 90 40 | Branch if carry clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_220
; Address: $F9F097
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_220:
	JSR $9020			; 20 20 90 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BRA $B0			  ; 80 B0 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	LDA $3785,X		  ; BD 85 37 | Load from absolute,X into accumulator
	WDM #$97			 ; 42 97 | Reserved instruction
	BCS $C7			  ; B0 C7 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $10			  ; E6 10 | Increment (zero page)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$42			 ; E0 42 | Hardware register operation
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	STA ($DD,X)		  ; 81 DD | Store accumulator to (zero page,X)
	BIT $1FE8			; 2C E8 1F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_221
; Address: $F9F0C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_221:
	LDY $1B			  ; A4 1B | Load from zero page into Y register
	PLY				  ; 7A | Pull Y register from stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_222
; Address: $F9F0D2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_222:
	JSL $00D300		  ; 22 00 D3 00 | Jump to subroutine long
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_225
; Address: $F9F0F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_225:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_227
; Address: $F9F0FA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_227:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	ORA $1C0A,X		  ; 1D 0A 1C | Logical OR with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	CPX $09F8			; EC F8 09 | Compare X register (absolute)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_228
; Address: $F9F112
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_228:
	JSL $032303		  ; 22 03 23 03 | Jump to subroutine long
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	ADC ($F4,X)		  ; 61 F4 | Add with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	STA $58C770		  ; 8F 70 C7 58 | Store accumulator to absolute long address
	PEA #$442F		   ; F4 2F 44 | Push effective address to stack
	STA $800FA4		  ; 8F A4 0F 80 | Store accumulator to absolute long address
	ASL $1C60,X		  ; 1E 60 1C | Arithmetic shift left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_229
; Address: $F9F13A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_229:
	JSR $0050			; 20 50 00 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $1F			  ; F0 1F | Branch if equal
	SBC $F301,X		  ; FD 01 F3 | Subtract with carry (absolute,X)
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	PLX				  ; FA | Pull X register from stack
	SBC $FC01,X		  ; FD 01 FC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_22A
; Address: $F9F150
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_22A:
	ORA $0200			; 0D 00 02 | Logical OR with accumulator (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	REP #$C0			 ; C2 C0 | Reset processor status bits
	LDA $7FBC,X		  ; BD BC 7F | Load from absolute,X into accumulator
	ROR $E0E1,X		  ; 7E E1 E0 | Game work RAM access
	LSR $F5DE,X		  ; 5E DE F5 | Logical shift right (absolute,X)
	ADC $6A2D			; 6D 2D 6A | Add with carry (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	LDY $7E43,X		  ; BC 43 7E | Load from absolute,X into Y register
	STA ($60,X)		  ; 81 60 | Store accumulator to (zero page,X)
	LSR $2B21,X		  ; 5E 21 2B | Logical shift right (absolute,X)
	ASL $3F92,X		  ; 1E 92 3F | Arithmetic shift left (absolute,X)
	ASL $1608			; 0E 08 16 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $4004			; 2E 04 40 | Rotate left (absolute)
	ASL $1700			; 0E 00 17 | Arithmetic shift left (absolute)
	BPL $3B			  ; 10 3B | Branch if positive
	SEC				  ; 38 | Set carry flag
	BVS $40			  ; 70 40 | Branch if overflow set
	BEQ $10			  ; F0 10 | Branch if equal
	INX				  ; E8 | Increment X register
	BPL $B4			  ; 10 B4 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_22B
; Address: $F9F1AA
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_22B:
	REP #$B0			 ; C2 B0 | Reset processor status bits
	BCC $DC			  ; 90 DC | Branch if carry clear
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	BVS $00			  ; 70 00 | Branch if overflow set
	INX				  ; E8 | Increment X register
	BRA $E8			  ; 80 E8 | Branch always
	DEY				  ; 88 | Decrement Y register
	STZ $4E9C			; 9C 9C 4E | Store zero to absolute
	REP #$6E			 ; C2 6E | Reset processor status bits
	CPY #$72			 ; C0 72 | Compare Y register (immediate)
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	SEP #$5C			 ; E2 5C | Set processor status bits
	BEQ $99			  ; F0 99 | Branch if equal
	ASL $A3			  ; 06 A3 | Arithmetic shift left (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	DEY				  ; 88 | Decrement Y register
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	LDX $C77A,Y		  ; BE 7A C7 | Load from absolute,Y into X register
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	CPY #$11			 ; C0 11 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC $40B0,X		  ; DE B0 40 | Decrement (absolute,X)
	SEC				  ; 38 | Set carry flag
	AND $4802			; 2D 02 48 | Logical AND with accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_22C
; Address: $F9F1FC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_22C:
	STA $FF0030		  ; 8F 30 00 FF | Store accumulator to absolute long address
	LSR $5E7D			; 4E 7D 5E | Logical shift right (absolute)
	STY $033F			; 8C 3F 03 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	NOP				  ; EA | No operation
	PEA #$087B		   ; F4 7B 08 | Push effective address to stack
	SEP #$40			 ; E2 40 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $A8			  ; 10 A8 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $48			  ; F0 48 | Branch if equal
	EOR $3A47,X		  ; 5D 47 3A | Exclusive OR with accumulator (absolute,X)
	STA $EE4F,Y		  ; 99 4F EE | Store accumulator to absolute,Y
	INC $F4AE,X		  ; FE AE F4 | Increment (absolute,X)
	INC $F7E8			; EE E8 F7 | Increment (absolute)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_22D
; Address: $F9F234
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_22D:
	CMP $40			  ; C5 40 | Compare accumulator (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($D4,X)		  ; 01 D4 | Logical OR with accumulator ((zero page,X))
	EOR ($5A,X)		  ; 41 5A | Exclusive OR with accumulator ((zero page,X))
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	EOR #$82			 ; 49 82 | Exclusive OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	SBC #$BC			 ; E9 BC | Subtract with carry (immediate)
	SBC $FFB6,X		  ; FD B6 FF | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_22E
; Address: $F9F27D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_22E:
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	SBC $FEF9,Y		  ; F9 F9 FE | Subtract with carry (absolute,Y)
	INC $F8F8,X		  ; FE F8 F8 | Increment (absolute,X)
	INC $F9FE,X		  ; FE FE F9 | Increment (absolute,X)
	SBC $0202,Y		  ; F9 02 02 | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $F901,X		  ; FE 01 F9 | Increment (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	SBC $A010,X		  ; FD 10 A0 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_232
; Address: $F9F2AD
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_232:
	JSR $2040			; 20 40 20 | Jump to subroutine
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	BIT $AFD7			; 2C D7 AF | Test bits in accumulator (absolute)
	LDA $E16E00		  ; AF 00 6E E1 | Load from absolute long address into accumulator
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDA $0F			  ; A5 0F | Load from zero page into accumulator
	LDY $9C0F,X		  ; BC 0F 9C | Load from absolute,X into Y register
	JMP $177C07		  ; 5C 07 7C 17 | Jump to address long
	AND $F80F,X		  ; 3D 0F F8 | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	INC $FD82,X		  ; FE 82 FD | Increment (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_233
; Address: $F9F307
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_233:
	INC $FD02,X		  ; FE 02 FD | Increment (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	INC $FE03,X		  ; FE 03 FE | Increment (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $32A2			; 2E A2 32 | Rotate left (absolute)
	LDY #$33			 ; A0 33 | Load immediate value into Y register
	LDA ($B5,X)		  ; A1 B5 | Load from (zero page,X) into accumulator
	SBC $EDFF			; ED FF ED | Subtract with carry (absolute)
	SBC $DDFF			; ED FF DD | Subtract with carry (absolute)
	LDX $3F59,Y		  ; BE 59 3F | Load from absolute,Y into X register
	XBA				  ; EB | Exchange accumulator bytes
	JMP $063AC6		  ; 5C C6 3A 06 | Jump to address long
	LDY $DE07,X		  ; BC 07 DE | Load from absolute,X into Y register
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_234
; Address: $F9F356
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_234:
	CMP $C0			  ; C5 C0 | Compare accumulator (zero page)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3030,X		  ; 3D 30 30 | Logical AND with accumulator (absolute,X)
	EOR $3300			; 4D 00 33 | Exclusive OR with accumulator (absolute)
	JMP $4E00			; 4C 00 4E | Jump to address
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BEQ $8C			  ; F0 8C | Branch if equal
	STY $804C			; 8C 4C 80 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	JMP $72C0			; 4C C0 72 | Jump to address
	CPY #$72			 ; C0 72 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $11			  ; 80 11 | Branch always
	INC $CE20			; EE 20 CE | Increment (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_235
; Address: $F9F3B3
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_235:
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($58,X)		  ; 01 58 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $619C			; 9C 9C 61 | Store zero to absolute
	AND ($87,X)		  ; 21 87 | Logical AND with accumulator ((zero page,X))
	LDX $520E			; AE 0E 52 | Load from absolute address into X register
	BPL $58			  ; 10 58 | Branch if positive
	JMP $B04F			; 4C 4F B0 | Jump to address
	STZ $2163			; 9C 63 21 | PPU graphics register access
	DEC $F807,X		  ; DE 07 F8 | Decrement (absolute,X)
	ASL $10F1			; 0E F1 10 | Arithmetic shift left (absolute)
	BRA $E8			  ; 80 E8 | Branch always
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	TXA				  ; 8A | Transfer X register to accumulator
	INX				  ; E8 | Increment X register
	SEP #$74			 ; E2 74 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BMI $CC			  ; 30 CC | Branch if negative
	DEY				  ; 88 | Decrement Y register
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BVS $8E			  ; 70 8E | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $A4			  ; A6 A4 | Load from zero page into X register
	BVC $20			  ; 50 20 | Branch if overflow clear
	BMI $20			  ; 30 20 | Branch if negative
	ORA $0F3F,Y		  ; 19 3F 0F | Logical OR with accumulator (absolute,Y)
	ASL $FF97,X		  ; 1E 97 FF | Arithmetic shift left (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	INC $F4AC,X		  ; FE AC F4 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_236
; Address: $F9F43E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_236:
	JSR $4701			; 20 01 47 | Jump to subroutine
	AND ($81),Y		  ; 31 81 | Logical AND with accumulator ((zero page),Y)
	JMP ($530C)		  ; 6C 0C 53 | Jump to address (absolute indirect)
	JMP $A380			; 4C 80 A3 | Jump to address
	ORA $0701,Y		  ; 19 01 07 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	STY $0373			; 8C 73 03 | Store Y register to absolute address
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_237
; Address: $F9F462
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_237:
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	ORA $F30C			; 0D 0C F3 | Logical OR with accumulator (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $4080,X		  ; FE 80 40 | Increment (absolute,X)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $7B			  ; 80 7B | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_238
; Address: $F9F4CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_238:
	ORA $0200,X		  ; 1D 00 02 | Logical OR with accumulator (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $DD06,Y		  ; F9 06 DD | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $DC1A			; EC 1A DC | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_239
; Address: $F9F4EB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_239:
	JSR $E0C0			; 20 C0 E0 | Game work RAM access
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_23A
; Address: $F9F4F2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_23A:
	JSL $0E0A06		  ; 22 06 0A 0E | Jump to subroutine long
	ASL $3E26,X		  ; 1E 26 3E | Arithmetic shift left (absolute,X)
	BMI $E0			  ; 30 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank72_DmaFunction_23B
; Address: $F9F500
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_23B:
	JSL $41A281		  ; 22 81 A2 41 | Jump to subroutine long
	LDA ($40,X)		  ; A1 40 | Load from (zero page,X) into accumulator
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BMI $68			  ; 30 68 | Branch if negative
	BPL $98			  ; 10 98 | Branch if positive
	BRA $70			  ; 80 70 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank72_DmaFunction_23C
; Address: $F9F52E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_23C:
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $78			  ; 80 78 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ADC ($79,X)		  ; 61 79 | Add with carry ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	ADC $79			  ; 65 79 | Add with carry (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ASL $3F1C,X		  ; 1E 1C 3F | Arithmetic shift left (absolute,X)
	LSR $9E0F			; 4E 0F 9E | Logical shift right (absolute)
	LDA				  ; BF 0F A5 07 | Load from absolute long,X into accumulator
	STX $07			  ; 86 07 | Store X register to zero page
	STA $BC9B1F		  ; 8F 1F 9B BC | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$54			 ; E0 54 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$2A			 ; A0 2A | Load immediate value into Y register
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	TAX				  ; AA | Transfer accumulator to X register
	PLX				  ; FA | Pull X register from stack
	XBA				  ; EB | Exchange accumulator bytes
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$6D			 ; C0 6D | Compare Y register (immediate)
	CMP $F0F4,Y		  ; D9 F4 F0 | Compare accumulator (absolute,Y)
	INC $EC			  ; E6 EC | Increment (zero page)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	BVS $05			  ; 70 05 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_23D
; Address: $F9F593
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_23D:
	JSR $2327			; 20 27 23 | Jump to subroutine
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA $1819,Y		  ; 19 19 18 | Logical OR with accumulator (absolute,Y)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	BIT #$08			 ; 89 08 | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_23E
; Address: $F9F5A9
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_23E:
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	INY				  ; C8 | Increment Y register
	CPY #$E4			 ; C0 E4 | Compare Y register (immediate)
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	CPY #$94			 ; C0 94 | Compare Y register (immediate)
	BRA $84			  ; 80 84 | Branch always
	BRA $12			  ; 80 12 | Branch always
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	CMP ($3D,X)		  ; C1 3D | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $0EB8			; 0D B8 0E | Logical OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BCS $C0			  ; B0 C0 | Branch if carry set
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	BIT $4C3C			; 2C 3C 4C | Test bits in accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $0A			  ; 80 0A | Branch always
	REP #$F2			 ; C2 F2 | Reset processor status bits
	SEP #$72			 ; E2 72 | Set processor status bits
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	STA $FDDF			; 8D DF FD | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_241
; Address: $F9F639
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_241:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$DD			 ; E0 DD | Compare X register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $43			  ; 80 43 | Branch always
	STA $438E47		  ; 8F 47 8E 43 | Store accumulator to absolute long address
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	LDA				  ; BF 7A FE 44 | Load from absolute long,X into accumulator
	ADC ($C5,X)		  ; 61 C5 | Add with carry ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	STX $83			  ; 86 83 | Store X register to zero page
	STA $07			  ; 85 07 | Store accumulator to zero page
	DEC				  ; 3A | Decrement accumulator
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BVC $20			  ; 50 20 | Branch if overflow clear
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BVC $98			  ; 50 98 | Branch if overflow clear
	CLV				  ; B8 | Clear overflow flag
	JMP $203C			; 4C 3C 20 | Jump to address

;------------------------------------------------------------------------------
; Bank72_DmaFunction_242
; Address: $F9F671
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_242:
	JSR $70F0			; 20 F0 70 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	CPX #$4A			 ; E0 4A | Compare X register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $000E,X		  ; 1D 0E 00 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	ROR $E100,X		  ; 7E 00 E1 | Rotate right (absolute,X)
	ROR $8908,X		  ; 7E 08 89 | Rotate right (absolute,X)
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	BCC $04			  ; 90 04 | Branch if carry clear
	BCC $04			  ; 90 04 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	ROR $9F7E,X		  ; 7E 7E 9F | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_243
; Address: $F9F6B6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_243:
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_245
; Address: $F9F6C7
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_245:
	JSR $1018			; 20 18 10 | Jump to subroutine
	CPY $B688			; CC 88 B6 | Compare Y register (absolute)
	ASL $0004			; 0E 04 00 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BNE $F0			  ; D0 F0 | Branch if not equal
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $0E0A,Y		  ; BE 0A 0E | Load from absolute,Y into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND $4D10,X		  ; 3D 10 4D | Logical AND with accumulator (absolute,X)
	BPL $9C			  ; 10 9C | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $2F00,X		  ; 1E 00 2F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_246
; Address: $F9F6FB
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_246:
	JSR $606F			; 20 6F 60 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	SBC #$4E			 ; E9 4E | Subtract with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	INY				  ; C8 | Increment Y register
	SBC ($26,X)		  ; E1 26 | Subtract with carry ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	PHY				  ; 5A | Push Y register to stack
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	ORA $0D8C			; 0D 8C 0D | Logical OR with accumulator (absolute)
	BPL $19			  ; 10 19 | Branch if positive
	JMP $D80B			; 4C 0B D8 | Jump to address
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLB				  ; AB | Pull data bank register from stack
	STA				  ; 9F 3F FF 3F | Store accumulator to absolute long,X
	AND $3F9F,X		  ; 3D 9F 3F | Logical AND with accumulator (absolute,X)
	CPY #$94			 ; C0 94 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_247
; Address: $F9F746
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_247:
	CPX $F3			  ; E4 F3 | Compare X register (zero page)
	LDY $E8FB			; AC FB E8 | Load from absolute address into Y register
	SEP #$F9			 ; E2 F9 | Set processor status bits
	INC $FD			  ; E6 FD | Increment (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BVS $20			  ; 70 20 | Branch if overflow set
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_248
; Address: $F9F769
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_248:
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	CLV				  ; B8 | Clear overflow flag
	ORA ($A7,X)		  ; 01 A7 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_249
; Address: $F9F78C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_249:
	JSR $9080			; 20 80 90 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_24B
; Address: $F9F79E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_24B:
	BEQ $90			  ; F0 90 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_24C
; Address: $F9F7AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_24C:
	BIT $0FEC			; 2C EC 0F | Test bits in accumulator (absolute)
	SBC #$80			 ; E9 80 | Subtract with carry (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_24D
; Address: $F9F7B6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_24D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	STZ $1380			; 9C 80 13 | Store zero to absolute
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $3D19,X		  ; 1E 19 3D | Arithmetic shift left (absolute,X)
	BMI $3C			  ; 30 3C | Branch if negative

;------------------------------------------------------------------------------
; Bank72_DmaFunction_24E
; Address: $F9F7C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_24E:
	JSL $623D3B		  ; 22 3B 3D 62 | Jump to subroutine long
	ADC ($7E),Y		  ; 71 7E | Add with carry ((zero page),Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_24F
; Address: $F9F7DA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_24F:
	WDM #$03			 ; 42 03 | Reserved instruction
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	ORA $1C0A,X		  ; 1D 0A 1C | Logical OR with accumulator (absolute,X)
	PHX				  ; DA | Push X register to stack
	BIT $49F8			; 2C F8 49 | Test bits in accumulator (absolute)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_250
; Address: $F9F7F2
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_250:
	JSL $03E303		  ; 22 03 E3 03 | Jump to subroutine long
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	ADC ($E0),Y		  ; 71 E0 | Game work RAM access
	LDX $C77A,Y		  ; BE 7A C7 | Load from absolute,Y into X register
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	ORA ($2A),Y		  ; 11 2A | Logical OR with accumulator ((zero page),Y)
	CPY $8E			  ; C4 8E | Compare Y register (zero page)
	ROR $4700			; 6E 00 47 | Rotate right (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL $42			  ; 06 42 | Hardware register operation
	ORA $1B24			; 0D 24 1B | Logical OR with accumulator (absolute)
	LSR $8E			  ; 46 8E | Logical shift right (zero page)
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	ADC $C031,X		  ; 7D 31 C0 | Add with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEP #$40			 ; E2 40 | Set processor status bits
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	BRA $5C			  ; 80 5C | Branch always
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	EOR $0A77,X		  ; 5D 77 0A | Exclusive OR with accumulator (absolute,X)
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	INC $80A2,X		  ; FE A2 80 | Increment (absolute,X)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	BEQ $F6			  ; F0 F6 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SBC $3002,X		  ; FD 02 30 | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $10C3,X		  ; 7E C3 10 | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_252
; Address: $F9F877
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_252:
	RTI				  ; 40 | Return from interrupt
	BPL $60			  ; 10 60 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	BRA $98			  ; 80 98 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_254
; Address: $F9F88C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_254:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BVC $40			  ; 50 40 | Branch if overflow clear
	BCC $80			  ; 90 80 | Branch if carry clear
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	BRA $0E			  ; 80 0E | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ORA $320C,Y		  ; 19 0C 32 | Logical OR with accumulator (absolute,Y)
	BMI $30			  ; 30 30 | Branch if negative
	XBA				  ; EB | Exchange accumulator bytes
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $00			  ; 66 00 | Rotate right (zero page)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHX				  ; DA | Push X register to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	STA ($78,X)		  ; 81 78 | Store accumulator to (zero page,X)
	STA $30			  ; 85 30 | Store accumulator to zero page
	BMI $23			  ; 30 23 | Branch if negative
	AND $0F			  ; 25 0F | Logical AND with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	BRA $07			  ; 80 07 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	STA				  ; 9F 3F FF 3F | Store accumulator to absolute long,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank72_DmaFunction_255
; Address: $F9F90A
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_255:
	PLX				  ; FA | Pull X register from stack
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	WDM #$F9			 ; 42 F9 | Reserved instruction
	STX $FD			  ; 86 FD | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	SBC $F80C,X		  ; FD 0C F8 | Subtract with carry (absolute,X)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $3E08			; 0E 08 3E | Arithmetic shift left (absolute)
	ROL $208A,X		  ; 3E 8A 20 | Rotate left (absolute,X)
	BIT #$63			 ; 89 63 | Test bits in accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR $5500,X		  ; 5D 00 55 | Exclusive OR with accumulator (absolute,X)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_256
; Address: $F9F976
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_256:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ADC $7669,Y		  ; 79 69 76 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 42 43 3C | Load from absolute long,X into accumulator
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	AND $FC9A,X		  ; 3D 9A FC | Logical AND with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	JMP $E03D60		  ; 5C 60 3D E0 | Game work RAM access
	PLX				  ; FA | Pull X register from stack
	REP #$03			 ; C2 03 | Reset processor status bits
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_257
; Address: $F9F9C0
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_257:
	STA				  ; 9F 2C 17 6F | Store accumulator to absolute long,X
	BRA $6F			  ; 80 6F | Branch always
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA #$C9			 ; A9 C9 | Load immediate value into accumulator
	PHB				  ; 8B | Push data bank register to stack
	STA $04			  ; 85 04 | Store accumulator to zero page
	PLB				  ; AB | Pull data bank register from stack
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	JMP ($A956)		  ; 6C 56 A9 | Jump to address (absolute indirect)
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	PLB				  ; AB | Pull data bank register from stack
	LDA				  ; BF BF 7F 7F | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	BMI $BF			  ; 30 BF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $7C			  ; 80 7C | Branch always
	CLC				  ; 18 | Clear carry flag
	BCS $18			  ; B0 18 | Branch if carry set
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ROR $FC7E,X		  ; 7E 7E FC | Rotate right (absolute,X)
	INC $0301,X		  ; FE 01 03 | Increment (absolute,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ROR $0081,X		  ; 7E 81 00 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_258
; Address: $F9FA4E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_258:
	JSL $000012		  ; 22 12 00 00 | Jump to subroutine long
	ASL $3D1F,X		  ; 1E 1F 3D | Arithmetic shift left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	ORA #$6C			 ; 09 6C | Logical OR with accumulator (immediate)
	ROR $98			  ; 66 98 | Rotate right (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_259
; Address: $F9FA6E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_259:
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	STA				  ; 9F FF 78 F8 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	BVS $80			  ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank72_DmaFunction_25A
; Address: $F9FA89
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_25A:
	BEQ $F2			  ; F0 F2 | Branch if equal
	ORA $0202			; 0D 02 02 | Logical OR with accumulator (absolute)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BIT $FEFC			; 2C FC FE | Test bits in accumulator (absolute)
	INC $0F0F,X		  ; FE 0F 0F | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_25D
; Address: $F9FACC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_25D:
	BMI $20			  ; 30 20 | Branch if negative
	BVC $40			  ; 50 40 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_25F
; Address: $F9FAD4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_25F:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $F0			  ; D0 F0 | Branch if not equal
	BCS $F0			  ; B0 F0 | Branch if carry set
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	BPL $46			  ; 10 46 | Branch if positive

;------------------------------------------------------------------------------
; Bank72_DmaFunction_260
; Address: $F9FAE7
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_260:
	JSR $2243			; 20 43 22 | Jump to subroutine
	WDM #$84			 ; 42 84 | Reserved instruction
	STY $44			  ; 84 44 | Store Y register to zero page
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ROR $7D7E,X		  ; 7E 7E 7D | Rotate right (absolute,X)
	SBC $FBFF,X		  ; FD FF FB | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_261
; Address: $F9FB35
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_261:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SBC $7F80,X		  ; FD 80 7F | Subtract with carry (absolute,X)
	BVS $3E			  ; 70 3E | Branch if overflow set
	BRA $7C			  ; 80 7C | Branch always

;------------------------------------------------------------------------------
; Bank72_DmaFunction_262
; Address: $F9FB52
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_262:
	JSR $0018			; 20 18 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$39F4		   ; F4 F4 39 | Push effective address to stack
	SBC ($1A),Y		  ; F1 1A | Subtract with carry ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	REP #$05			 ; C2 05 | Reset processor status bits
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_263
; Address: $F9FB7C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_263:
	JSR $0007			; 20 07 00 | Jump to subroutine
	SBC $3EF8,Y		  ; F9 F8 3E | Subtract with carry (absolute,Y)
	ROL $0100,X		  ; 3E 00 01 | Rotate left (absolute,X)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ROL $00C1,X		  ; 3E C1 00 | Rotate left (absolute,X)
	AND $15			  ; 25 15 | Logical AND with accumulator (zero page)
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	ADC ($2E,X)		  ; 61 2E | Add with carry ((zero page,X))
	AND $3D70,X		  ; 3D 70 3D | Logical AND with accumulator (absolute,X)
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	EOR $3F3A			; 4D 3A 3F | Exclusive OR with accumulator (absolute)
	AND ($51,X)		  ; 21 51 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_264
; Address: $F9FBB6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_264:
	JSR $2242			; 20 42 22 | Jump to subroutine
	WDM #$22			 ; 42 22 | Reserved instruction
	WDM #$40			 ; 42 40 | Reserved instruction
	LDX #$52			 ; A2 52 | Load immediate value into X register
	LDX #$20			 ; A2 20 | Load immediate value into X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_265
; Address: $F9FBD3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_265:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank72_DmaFunction_266
; Address: $F9FBDE
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_266:
	JSR $0800			; 20 00 08 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1E1F,X		  ; 1E 1F 1E | Arithmetic shift left (absolute,X)
	ASL $1D1F,X		  ; 1E 1F 1D | Arithmetic shift left (absolute,X)
	ORA $501F,X		  ; 1D 1F 50 | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STY $8F80			; 8C 80 8F | Store Y register to absolute address
	STY $1313			; 8C 13 13 | Store Y register to absolute address
	BIT $4C			  ; 24 4C | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $B0			  ; 90 B0 | Branch if carry clear
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	BEQ $7C			  ; F0 7C | Branch if equal
	CPX $DBFF			; EC FF DB | Compare X register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_267
; Address: $F9FC35
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_267:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	BIT #$49			 ; 89 49 | Test bits in accumulator (immediate)
	BIT #$49			 ; 89 49 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $40			  ; 66 40 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_268
; Address: $F9FC62
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_268:
	STA $1E86,X		  ; 9D 86 1E | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank72_DmaFunction_269
; Address: $F9FC67
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_269:
	JSR $4060			; 20 60 40 | Jump to subroutine
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDX $E6			  ; A6 E6 | Load from zero page into X register
	INC $FE			  ; E6 FE | Increment (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $2D			  ; 10 2D | Branch if positive
	BPL $5D			  ; 10 5D | Branch if positive
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ASL $1477,X		  ; 1E 77 14 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_26A
; Address: $F9FCD9
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_26A:
	JSR $7076			; 20 76 70 | Jump to subroutine
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ASL $EB04			; 0E 04 EB | Arithmetic shift left (absolute)
	ASL $00E1,X		  ; 1E E1 00 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $EFED			; 0E ED EF | Arithmetic shift left (absolute)
	BIT $2F18			; 2C 18 2F | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $5E			  ; 10 5E | Branch if positive
	BMI $69			  ; 30 69 | Branch if negative
	BMI $9C			  ; 30 9C | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BVS $72			  ; 70 72 | Branch if overflow set
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $00			  ; 84 00 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_26C
; Address: $F9FD2D
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_26C:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BVS $8E			  ; 70 8E | Branch if overflow set
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BRA $7C			  ; 80 7C | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$D9			 ; C0 D9 | Compare Y register (immediate)
	LSR $4ED8			; 4E D8 4E | Logical shift right (absolute)
	CMP $DD4F,X		  ; DD 4F DD | Compare accumulator (absolute,X)
	LSR $47DC			; 4E DC 47 | Logical shift right (absolute)
	LDX $BE27,Y		  ; BE 27 BE | Load from absolute,Y into X register
	ADC ($51,X)		  ; 61 51 | Add with carry ((zero page,X))
	LDA ($51,X)		  ; A1 51 | Load from (zero page,X) into accumulator
	LDA ($50,X)		  ; A1 50 | Load from (zero page,X) into accumulator
	LDA ($51,X)		  ; A1 51 | Load from (zero page,X) into accumulator
	LDA ($58,X)		  ; A1 58 | Load from (zero page,X) into accumulator
	LDY #$18			 ; A0 18 | Load immediate value into Y register
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPY #$5E			 ; C0 5E | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_270
; Address: $F9FD74
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_270:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BCC $80			  ; 90 80 | Branch if carry clear
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	BRA $13			  ; 80 13 | Branch always
	ORA ($05),Y		  ; 11 05 | Logical OR with accumulator ((zero page),Y)
	ASL $1E0B,X		  ; 1E 0B 1E | Arithmetic shift left (absolute,X)
	ASL $1E0B,X		  ; 1E 0B 1E | Arithmetic shift left (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0A			  ; 10 0A | Branch if positive
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_271
; Address: $F9FDA3
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_271:
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $60			  ; 80 60 | Branch always
	BVS $40			  ; 70 40 | Branch if overflow set
	BEQ $20			  ; F0 20 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BNE $F0			  ; D0 F0 | Branch if not equal
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BPL $80			  ; 10 80 | Branch if positive
	BCC $80			  ; 90 80 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BRA $08			  ; 80 08 | Branch always
	RTI				  ; 40 | Return from interrupt
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	ROL $3E17,X		  ; 3E 17 3E | Rotate left (absolute,X)
	AND $2D17,X		  ; 3D 17 2D | Logical AND with accumulator (absolute,X)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $1E0B,X		  ; 1E 0B 1E | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank72_DmaFunction_272
; Address: $F9FDD5
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_272:
	JSL $092138		  ; 22 38 21 09 | Jump to subroutine long
	AND ($0C),Y		  ; 31 0C | Logical AND with accumulator ((zero page),Y)
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank72_DmaFunction_274
; Address: $F9FE06
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_274:
	JSR $1E1E			; 20 1E 1E | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STY $82			  ; 84 82 | Store Y register to zero page
	ADC ($11,X)		  ; 61 11 | Add with carry ((zero page,X))
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_275
; Address: $F9FE30
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_275:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	SBC $7EFF,X		  ; FD FF 7E | Subtract with carry (absolute,X)
	ASL $201F,X		  ; 1E 1F 20 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $58			  ; 90 58 | Branch if carry clear
	BVC $4C			  ; 50 4C | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	BIT $2C28			; 2C 28 2C | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ORA $6618,Y		  ; 19 18 66 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_277
; Address: $F9FE70
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_277:
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STA $9C00,Y		  ; 99 00 9C | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	BRA $1E			  ; 80 1E | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	STA $7E78,Y		  ; 99 78 7E | Store accumulator to absolute,Y
	ROR $797F,X		  ; 7E 7F 79 | Rotate right (absolute,X)
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank72_DmaFunction_278
; Address: $F9FEA0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_278:
	JSL $444623		  ; 22 23 46 44 | Jump to subroutine long
	STZ $7090			; 9C 90 70 | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $FC6C,X		  ; FE 6C FC | Increment (absolute,X)
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $0B04			; 0D 04 0B | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_279
; Address: $F9FEF4
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_279:
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	BRA $EC			  ; 80 EC | Branch always
	BCC $FC			  ; 90 FC | Branch if carry clear
	BNE $6E			  ; D0 6E | Branch if not equal
	INY				  ; C8 | Increment Y register
	CPX #$37			 ; E0 37 | Compare X register (immediate)
	ORA $0BFC,X		  ; 1D FC 0B | Logical OR with accumulator (absolute,X)
	BPL $12			  ; 10 12 | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	BPL $91			  ; 10 91 | Branch if positive
	BPL $89			  ; 10 89 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	SEP #$06			 ; E2 06 | Set processor status bits
	PEA #$0004		   ; F4 04 00 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $30			  ; 06 30 | Arithmetic shift left (zero page)
	BNE $08			  ; D0 08 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BNE $6C			  ; D0 6C | Branch if not equal
	INY				  ; C8 | Increment Y register
	CPX #$37			 ; E0 37 | Compare X register (immediate)
	ORA $0BFC,X		  ; 1D FC 0B | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank72_DmaFunction_27A
; Address: $F9FF71
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_27A:
	JSR $2024			; 20 24 20 | Jump to subroutine
	BPL $92			  ; 10 92 | Branch if positive
	BPL $89			  ; 10 89 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	SEP #$06			 ; E2 06 | Set processor status bits
	PEA #$0804		   ; F4 04 08 | Push effective address to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank72_DmaFunction_27B
; Address: $F9FF99
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_27B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $ACA8			; AC A8 AC | Load from absolute address into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $505458		  ; 5C 58 54 50 | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank72_DmaFunction_27C
; Address: $F9FFAA
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank72_DmaFunction_27C:
	BEQ $FA			  ; F0 FA | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LSR $FC54,X		  ; 5E 54 FC | Logical shift right (absolute,X)
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	LDY $02FC			; AC FC 02 | Load from absolute address into Y register
	BRA $85			  ; 80 85 | Branch always
	LSR $86			  ; 46 86 | Logical shift right (zero page)
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $00A6			; EE A6 00 | Increment (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	INC $5E			  ; E6 5E | Increment (zero page)
	STX $06			  ; 86 06 | Store X register to zero page
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR $6600,Y		  ; 59 00 66 | Exclusive OR with accumulator (absolute,Y)
	ORA $3980,Y		  ; 19 80 39 | Logical OR with accumulator (absolute,Y)
	BRA $18			  ; 80 18 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
