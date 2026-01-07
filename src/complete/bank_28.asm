;==============================================================================
; Dragon Quest III - Bank $28
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $D40000-$D47FFF
; Instructions: 10745
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_28"

;------------------------------------------------------------------------------
; Bank28_DmaFunction_002
; Address: $D4800C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_002:
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	ROL $2935,X		  ; 3E 35 29 | Rotate left (absolute,X)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $001E			; 4C 1E 00 | Jump to address
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_007
; Address: $D48037
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_007:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $005C			; 4C 5C 00 | Jump to address
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	ROL $2935,X		  ; 3E 35 29 | Rotate left (absolute,X)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0059			; 4C 59 00 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_008
; Address: $D48052
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_008:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	BCS $01			  ; B0 01 | Branch if carry set
	JMP $005F			; 4C 5F 00 | Jump to address
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0094			; 4C 94 00 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $008E			; 4C 8E 00 | Jump to address
	LDA $2201			; AD 01 22 | Load from absolute address into accumulator
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0088			; 4C 88 00 | Jump to address
	LDX $4C01			; AE 01 4C | Load from absolute address into X register
	PHB				  ; 8B | Push data bank register to stack
	LDA $914C01		  ; AF 01 4C 91 | Load from absolute long address into accumulator
	LDY $4C01			; AC 01 4C | Load from absolute address into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_009
; Address: $D48097
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_009:
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $00A5			; 4C A5 00 | Jump to address
	STA $4C01,Y		  ; 99 01 4C | Store accumulator to absolute,Y
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_00E
; Address: $D480C1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_00E:
	JSL $C76BE3		  ; 22 E3 6B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $00D9			; 4C D9 00 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_00F
; Address: $D480CA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_00F:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $00D9			; 4C D9 00 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $00BD			; 4C BD 00 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_011
; Address: $D480E2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_011:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $011C			; 4C 1C 01 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0116			; 4C 16 01 | Jump to address
	LDA ($01),Y		  ; B1 01 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_012
; Address: $D480FB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_012:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $010A			; 4C 0A 01 | Jump to address
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_013
; Address: $D4810E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_013:
	JSR $0C00			; 20 00 0C | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $0119			; 4C 19 01 | Jump to address
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	AND $2201,X		  ; 3D 01 22 | Logical AND with accumulator (absolute,X)
	ORA $CC7B,X		  ; 1D 7B CC | Logical OR with accumulator (absolute,X)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $013A			; 4C 3A 01 | Jump to address
	STA $2201,X		  ; 9D 01 22 | Store accumulator to absolute,X
	ROR $AC			  ; 66 AC | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_014
; Address: $D4812B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_014:
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0137			; 4C 37 01 | Jump to address
	STA				  ; 9F 01 4C 3A | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $0001,X		  ; 9E 01 00 | Store zero to absolute,X
	STZ $6B01			; 9C 01 6B | Store zero to absolute
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $014F			; 4C 4F 01 | Jump to address
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STZ $01			  ; 64 01 | Store zero to zero page
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_015
; Address: $D48152
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_015:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0161			; 4C 61 01 | Jump to address
	LDA ($01,X)		  ; A1 01 | Load from (zero page,X) into accumulator
	JMP $0164			; 4C 64 01 | Jump to address
	LDX #$01			 ; A2 01 | Load immediate value into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_017
; Address: $D4816A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_017:
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $017F			; 4C 7F 01 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_019
; Address: $D4817F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_019:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $40AD			; CD AD 40 | Compare accumulator (absolute)
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $019B			; 4C 9B 01 | Jump to address
	LDY $01			  ; A4 01 | Load from zero page into Y register
	JMP $019E			; 4C 9E 01 | Jump to address
	LDA $01			  ; A5 01 | Load from zero page into accumulator
	LDX $01			  ; A6 01 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_01A
; Address: $D481A1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_01A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $A8			  ; 06 A8 | Arithmetic shift left (zero page)
	CMP $7022			; CD 22 70 | Compare accumulator (absolute)
	STA				  ; 9F CC 22 EE | Store accumulator to absolute long,X
	LDY $00CD			; AC CD 00 | Load from absolute address into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $226B			; CC 6B 22 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_02A
; Address: $D48202
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_02A:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_02B
; Address: $D4820F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_02B:
	JSR $1C00			; 20 00 1C | Jump to subroutine
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_02D
; Address: $D4823C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_02D:
	JSL $CCD70B		  ; 22 0B D7 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$1C			 ; C9 1C | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_02E
; Address: $D48246
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_02E:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0265			; 4C 65 02 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $CA03			; CC 03 CA | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_031
; Address: $D4825E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_031:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $027E			; 4C 7E 02 | Jump to address
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $027E			; 4C 7E 02 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_034
; Address: $D4827F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_034:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0292			; 4C 92 02 | Jump to address
	JMP $0283			; 4C 83 02 | Jump to address
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $02A4			; 4C A4 02 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_036
; Address: $D482A4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_036:
	JSL $CC7B5A		  ; 22 5A 7B CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $02FC			; 4C FC 02 | Jump to address
	LDX #$2F			 ; A2 2F | Load immediate value into X register
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_03E
; Address: $D482CF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_03E:
	JSL $CDDF16		  ; 22 16 DF CD | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_043
; Address: $D48300
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_043:
	JSL $CDAEF1		  ; 22 F1 AE CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BRA $09			  ; 80 09 | Branch always
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_044
; Address: $D48313
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_044:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0323			; 4C 23 03 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_049
; Address: $D48330
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_049:
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0349			; 4C 49 03 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_04A
; Address: $D48342
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_04A:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $0330			; 4C 30 03 | Jump to address
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $037D			; 4C 7D 03 | Jump to address
	LDA #$19			 ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_04C
; Address: $D4835B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_04C:
	JSL $CB2298		  ; 22 98 22 CB | Jump to subroutine long
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0373			; 4C 73 03 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_050
; Address: $D4837D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_050:
	JSL $CDB0C4		  ; 22 C4 B0 CD | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_056
; Address: $D4839F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_056:
	JSL $CDB194		  ; 22 94 B1 CD | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_057
; Address: $D483C1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_057:
	JSL $C736C8		  ; 22 C8 36 C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_058
; Address: $D483CC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_058:
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_05A
; Address: $D483EE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_05A:
	JSL $CA04A9		  ; 22 A9 04 CA | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0477			; 4C 77 04 | Jump to address
	LDA #$19			 ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_05C
; Address: $D48407
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_05C:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	LDX #$1D			 ; A2 1D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_05F
; Address: $D48419
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_05F:
	JSL $CCD767		  ; 22 67 D7 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0473			; 4C 73 04 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_062
; Address: $D48432
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_062:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	LDX #$1F			 ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_065
; Address: $D48444
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_065:
	JSL $CCD767		  ; 22 67 D7 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0473			; 4C 73 04 | Jump to address
	LDA #$17			 ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_067
; Address: $D4845D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_067:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	LDX #$21			 ; A2 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank28_DmaFunction_06C
; Address: $D48478
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_06C:
	JSL $CC7D65		  ; 22 65 7D CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $048A			; 4C 8A 04 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	JMP $0490			; 4C 90 04 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_06D
; Address: $D48490
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_06D:
	JSL $CC7D7A		  ; 22 7A 7D CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $04A2			; 4C A2 04 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	JMP $04A8			; 4C A8 04 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_06E
; Address: $D484A9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_06E:
	LDA $360A			; AD 0A 36 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $04BA			; 4C BA 04 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $AD36,Y		  ; 19 36 AD | Logical OR with accumulator (absolute,Y)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $04CB			; 4C CB 04 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA $AD36,Y		  ; 19 36 AD | Logical OR with accumulator (absolute,Y)
	ASL $C936			; 0E 36 C9 | Arithmetic shift left (absolute)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_06F
; Address: $D484D3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_06F:
	JMP $04DC			; 4C DC 04 | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_077
; Address: $D48503
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_077:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0512			; 4C 12 05 | Jump to address
	JMP $0515			; 4C 15 05 | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_079
; Address: $D48519
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_079:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0528			; 4C 28 05 | Jump to address
	JMP $052B			; 4C 2B 05 | Jump to address
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_07A
; Address: $D4852D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_07A:
	BIT $6B03			; 2C 03 6B | Test bits in accumulator (absolute)
	AND $6B03			; 2D 03 6B | Logical AND with accumulator (absolute)
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $05BC			; 4C BC 05 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_07B
; Address: $D4853F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_07B:
	JSL $CA08F8		  ; 22 F8 08 CA | Jump to subroutine long
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_07E
; Address: $D48551
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_07E:
	JSL $CDB174		  ; 22 74 B1 CD | Jump to subroutine long
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0566			; 4C 66 05 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_081
; Address: $D4856A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_081:
	AND $2203,Y		  ; 39 03 22 | Logical AND with accumulator (absolute,Y)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $0590			; 4C 90 05 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_082
; Address: $D48575
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_082:
	JSL $CA062C		  ; 22 2C 06 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0587			; 4C 87 05 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_085
; Address: $D48590
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_085:
	JSL $CA0647		  ; 22 47 06 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $05A5			; 4C A5 05 | Jump to address
	LDA $C161			; AD 61 C1 | Load from absolute address into accumulator
	STA $BE77			; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_086
; Address: $D4859F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_086:
	JSL $C1A944		  ; 22 44 A9 C1 | Jump to subroutine long
	AND $2203,X		  ; 3D 03 22 | Logical AND with accumulator (absolute,X)
	LDA #$C1			 ; A9 C1 | Load immediate value into accumulator
	ROL $2203,X		  ; 3E 03 22 | Rotate left (absolute,X)
	LDA #$C1			 ; A9 C1 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_088
; Address: $D485B5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_088:
	JSL $CDB0D2		  ; 22 D2 B0 CD | Jump to subroutine long
	JMP $062B			; 4C 2B 06 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $05F3			; 4C F3 05 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_08A
; Address: $D485CF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_08A:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $05E6			; 4C E6 05 | Jump to address
	BMI $03			  ; 30 03 | Branch if negative

;------------------------------------------------------------------------------
; Bank28_DmaFunction_08D
; Address: $D485E9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_08D:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	LDA ($AE),Y		  ; B1 AE | Load from (zero page),Y into accumulator
	CMP $1EA9			; CD A9 1E | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_091
; Address: $D48606
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_091:
	JSL $CDADFB		  ; 22 FB AD CD | Jump to subroutine long
	LDX #$32			 ; A2 32 | Load immediate value into X register
	LDA #$19			 ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_098
; Address: $D4862C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_098:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_099
; Address: $D48638
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_099:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0645			; 4C 45 06 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0646			; 4C 46 06 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_09A
; Address: $D48647
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_09A:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_09B
; Address: $D48650
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_09B:
	JSL $C78C3A		  ; 22 3A 8C C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	JMP $066E			; 4C 6E 06 | Jump to address
	JMP $06A4			; 4C A4 06 | Jump to address
	JMP $06A4			; 4C A4 06 | Jump to address
	JMP $06A4			; 4C A4 06 | Jump to address
	JMP $06A4			; 4C A4 06 | Jump to address
	JMP $06A4			; 4C A4 06 | Jump to address
	JMP $06A4			; 4C A4 06 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $06A4			; 4C A4 06 | Jump to address
	LDA $C195			; AD 95 C1 | Load from absolute address into accumulator
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0658			; 4C 58 06 | Jump to address
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $065B			; 4C 5B 06 | Jump to address
	CMP #$25			 ; C9 25 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $065E			; 4C 5E 06 | Jump to address
	CMP #$1A			 ; C9 1A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0661			; 4C 61 06 | Jump to address
	CMP #$2A			 ; C9 2A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0664			; 4C 64 06 | Jump to address
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0667			; 4C 67 06 | Jump to address
	JMP $066A			; 4C 6A 06 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_09C
; Address: $D486A5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_09C:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $06B6			; 4C B6 06 | Jump to address
	DEC				  ; 3A | Decrement accumulator
	JMP $06E4			; 4C E4 06 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_09D
; Address: $D486B6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_09D:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $06CB			; 4C CB 06 | Jump to address
	JMP $06E4			; 4C E4 06 | Jump to address
	ROL $2203			; 2E 03 22 | Rotate left (absolute)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $06E1			; 4C E1 06 | Jump to address
	BMI $03			  ; 30 03 | Branch if negative

;------------------------------------------------------------------------------
; Bank28_DmaFunction_09E
; Address: $D486DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_09E:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	JMP $06E4			; 4C E4 06 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0A0
; Address: $D486E7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0A0:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0715			; 4C 15 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0A1
; Address: $D486F5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0A1:
	JSL $CDB194		  ; 22 94 B1 CD | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0708			; 4C 08 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0A2
; Address: $D48704
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0A2:
	JSL $CA0837		  ; 22 37 08 CA | Jump to subroutine long
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3436			; 8D 36 34 | Store accumulator to absolute address
	JMP $0760			; 4C 60 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0A5
; Address: $D4871D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0A5:
	JSL $CCD4AA		  ; 22 AA D4 CC | Jump to subroutine long
	LDA $353F			; AD 3F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0752			; 4C 52 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0A6
; Address: $D4872C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0A6:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	STA $3448			; 8D 48 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0AA
; Address: $D48745
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0AA:
	JSL $CCD837		  ; 22 37 D8 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0AD
; Address: $D48762
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0AD:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $078D			; 4C 8D 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0AE
; Address: $D4876D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0AE:
	JSL $CDB194		  ; 22 94 B1 CD | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0780			; 4C 80 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0AF
; Address: $D4877C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0AF:
	JSL $CA0837		  ; 22 37 08 CA | Jump to subroutine long
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3436			; 8D 36 34 | Store accumulator to absolute address
	JMP $07CB			; 4C CB 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0B2
; Address: $D48795
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0B2:
	JSL $CCD4EA		  ; 22 EA D4 CC | Jump to subroutine long
	LDA $353F			; AD 3F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $07C3			; 4C C3 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0B3
; Address: $D487A4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0B3:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	STA $344A			; 8D 4A 34 | Store accumulator to absolute address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0B6
; Address: $D487B9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0B6:
	JSL $CCD837		  ; 22 37 D8 CC | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	SBC ($AE),Y		  ; F1 AE | Subtract with carry ((zero page),Y)
	CMP $9722			; CD 22 97 | Compare accumulator (absolute)
	CPY $026B			; CC 6B 02 | Compare Y register (absolute)
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $07F8			; 4C F8 07 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0B7
; Address: $D487D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0B7:
	JSL $CDB194		  ; 22 94 B1 CD | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0B9
; Address: $D487E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0B9:
	JSL $CA0837		  ; 22 37 08 CA | Jump to subroutine long
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3436			; 8D 36 34 | Store accumulator to absolute address
	JMP $0836			; 4C 36 08 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0BC
; Address: $D48800
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0BC:
	JSL $CCD52A		  ; 22 2A D5 CC | Jump to subroutine long
	LDA $353F			; AD 3F 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $082E			; 4C 2E 08 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0BD
; Address: $D4880F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0BD:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	STA $344C			; 8D 4C 34 | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0C0
; Address: $D48824
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0C0:
	JSL $CCD837		  ; 22 37 D8 CC | Jump to subroutine long
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $F422			; CC 22 F4 | Compare Y register (absolute)
	LDA $6BCD			; AD CD 6B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0C2
; Address: $D4883B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0C2:
	JSL $CDD687		  ; 22 87 D6 CD | Jump to subroutine long
	LDX $342C			; AE 2C 34 | Load from absolute address into X register
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0C6
; Address: $D48852
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0C6:
	JSL $CB2298		  ; 22 98 22 CB | Jump to subroutine long
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0878			; 4C 78 08 | Jump to address
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0872			; 4C 72 08 | Jump to address
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)
	JMP $0875			; 4C 75 08 | Jump to address
	JMP $087E			; 4C 7E 08 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0C7
; Address: $D48878
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0C7:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ADC $01			  ; 65 01 | Add with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0C9
; Address: $D48882
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0C9:
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $08DD			; 4C DD 08 | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0898			; 4C 98 08 | Jump to address
	JMP $08DD			; 4C DD 08 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0CA
; Address: $D48898
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0CA:
	JSL $CCD70B		  ; 22 0B D7 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$AB			 ; C9 AB | Compare accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $08CF			; 4C CF 08 | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$B5			 ; C9 B5 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	JMP $08CF			; 4C CF 08 | Jump to address
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CMP #$CA			 ; C9 CA | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $08CF			; 4C CF 08 | Jump to address
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CMP #$DA			 ; C9 DA | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $08CF			; 4C CF 08 | Jump to address
	JMP $08DD			; 4C DD 08 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0CD
; Address: $D488DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0CD:
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $08F7			; 4C F7 08 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0DD
; Address: $D4892E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0DD:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0DE
; Address: $D4893B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0DE:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BMI $22			  ; 30 22 | Branch if negative

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0E7
; Address: $D48972
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0E7:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0984			; 4C 84 09 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0E8
; Address: $D4897D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0E8:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	CPY $6B03			; CC 03 6B | Compare Y register (absolute)
	CMP $6B03			; CD 03 6B | Compare accumulator (absolute)
	DEC $6B03			; CE 03 6B | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0EB
; Address: $D4899B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0EB:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CMP #$3C			 ; C9 3C | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0EC
; Address: $D489A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0EC:
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $09B6			; 4C B6 09 | Jump to address
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_0FD
; Address: $D489F6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_0FD:
	JSL $C73748		  ; 22 48 37 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0A0B			; 4C 0B 0A | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BIT $A936			; 2C 36 A9 | Test bits in accumulator (absolute)
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0A37			; 4C 37 0A | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$A3			 ; A2 A3 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_102
; Address: $D48A3E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_102:
	EOR ($07),Y		  ; 51 07 | Exclusive OR with accumulator ((zero page),Y)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_103
; Address: $D48A4A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_103:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_104
; Address: $D48A54
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_104:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_105
; Address: $D48A5E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_105:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_106
; Address: $D48A68
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_106:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_10B
; Address: $D48A88
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_10B:
	EOR $6B07,Y		  ; 59 07 6B | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_10D
; Address: $D48A98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_10D:
	LSR $6B07,X		  ; 5E 07 6B | Logical shift right (absolute,X)
	JMP $226B07		  ; 5C 07 6B 22 | Jump to address long
	CMP $6BCA,X		  ; DD CA 6B | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_111
; Address: $D48AB3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_111:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$23			 ; C9 23 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0ACB			; 4C CB 0A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_112
; Address: $D48AC4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_112:
	JSL $CADD59		  ; 22 59 DD CA | Jump to subroutine long
	JMP $0AD2			; 4C D2 0A | Jump to address
	ADC ($07,X)		  ; 61 07 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_115
; Address: $D48AD6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_115:
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_117
; Address: $D48AF6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_117:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0B0C			; 4C 0C 0B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_123
; Address: $D48B3B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_123:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0B5E			; 4C 5E 0B | Jump to address
	ADC $07			  ; 65 07 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_124
; Address: $D48B49
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_124:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0B58			; 4C 58 0B | Jump to address
	ROR $07			  ; 66 07 | Rotate right (zero page)
	JMP $0B5B			; 4C 5B 0B | Jump to address
	JMP $0B61			; 4C 61 0B | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_127
; Address: $D48B6B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_127:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BVC $09			  ; 50 09 | Branch if overflow clear
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_129
; Address: $D48B78
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_129:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0B88			; 4C 88 0B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_12F
; Address: $D48B98
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_12F:
	JSL $CCD346		  ; 22 46 D3 CC | Jump to subroutine long
	LDX #$29			 ; A2 29 | Load immediate value into X register
	LDA #$69			 ; A9 69 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_134
; Address: $D48BB5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_134:
	JSL $CDAF11		  ; 22 11 AF CD | Jump to subroutine long
	LDX #$13			 ; A2 13 | Load immediate value into X register
	LDA #$67			 ; A9 67 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_137
; Address: $D48BC7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_137:
	JSL $CDAF21		  ; 22 21 AF CD | Jump to subroutine long
	LDX #$0E			 ; A2 0E | Load immediate value into X register
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_13D
; Address: $D48BE8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_13D:
	JSL $CDA724		  ; 22 24 A7 CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	BIT $A936			; 2C 36 A9 | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_13E
; Address: $D48C1F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_13E:
	JSL $CDAEB1		  ; 22 B1 AE CD | Jump to subroutine long
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_141
; Address: $D48C3B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_141:
	JSL $CDADED		  ; 22 ED AD CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_143
; Address: $D48C4B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_143:
	JMP ($6B07)		  ; 6C 07 6B | Jump to address (absolute indirect)
	ADC $6B07			; 6D 07 6B | Add with carry (absolute)
	ROR $6B07			; 6E 07 6B | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_14D
; Address: $D48C87
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_14D:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	JMP $0C5F			; 4C 5F 0C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_157
; Address: $D48CBE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_157:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$F4			 ; 69 F4 | Add with carry (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_158
; Address: $D48CCC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_158:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	LDX #$27			 ; A2 27 | Load immediate value into X register
	LDA #$67			 ; A9 67 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_160
; Address: $D48CF5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_160:
	JSL $CDAF21		  ; 22 21 AF CD | Jump to subroutine long
	LDX #$10			 ; A2 10 | Load immediate value into X register
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_16D
; Address: $D48D34
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_16D:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$F4			 ; 69 F4 | Add with carry (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_16E
; Address: $D48D42
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_16E:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	LDX #$2B			 ; A2 2B | Load immediate value into X register
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_173
; Address: $D48D5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_173:
	JSL $CDAE02		  ; 22 02 AE CD | Jump to subroutine long
	LDX #$11			 ; A2 11 | Load immediate value into X register
	LDA #$67			 ; A9 67 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_176
; Address: $D48D71
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_176:
	JSL $CDAE09		  ; 22 09 AE CD | Jump to subroutine long
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_185
; Address: $D48DBB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_185:
	JSL $CA0DC3		  ; 22 C3 0D CA | Jump to subroutine long
	JMP $0DA1			; 4C A1 0D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_199
; Address: $D48E23
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_199:
	JSL $CA0DC3		  ; 22 C3 0D CA | Jump to subroutine long
	JMP $0E09			; 4C 09 0E | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_19D
; Address: $D48E3A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_19D:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0E49			; 4C 49 0E | Jump to address
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1A0
; Address: $D48E4E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1A0:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0EBE			; 4C BE 0E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1A5
; Address: $D48E6D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1A5:
	JSL $CDAEE1		  ; 22 E1 AE CD | Jump to subroutine long
	LDX #$16			 ; A2 16 | Load immediate value into X register
	LDA #$27			 ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1B0
; Address: $D48EA8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1B0:
	JSL $CDAF21		  ; 22 21 AF CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	BIT $2236			; 2C 36 22 | Test bits in accumulator (absolute)
	LSR $CCD3,X		  ; 5E D3 CC | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1B4
; Address: $D48EC4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1B4:
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0F4D			; 4C 4D 0F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1C2
; Address: $D48F0E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1C2:
	JSL $CCD88A		  ; 22 8A D8 CC | Jump to subroutine long
	ADC $2207,Y		  ; 79 07 22 | Add with carry (absolute,Y)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	LDA $22CD			; AD CD 22 | Load from absolute address into accumulator
	ORA ($AF),Y		  ; 11 AF | Logical OR with accumulator ((zero page),Y)
	CMP $8122			; CD 22 81 | Compare accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	CPY $DDA9			; CC A9 DD | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1C6
; Address: $D48F37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1C6:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDX #$16			 ; A2 16 | Load immediate value into X register
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1CB
; Address: $D48F52
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1CB:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$22			 ; C9 22 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0F86			; 4C 86 0F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1CC
; Address: $D48F61
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1CC:
	JSL $CC9081		  ; 22 81 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0F71			; 4C 71 0F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1CE
; Address: $D48F71
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1CE:
	JSL $CC90B2		  ; 22 B2 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0F80			; 4C 80 0F | Jump to address
	ROR $0F			  ; 66 0F | Rotate right (zero page)
	JMP $0F83			; 4C 83 0F | Jump to address
	JMP $0F89			; 4C 89 0F | Jump to address
	ADC $6B07,X		  ; 7D 07 6B | Add with carry (absolute,X)
	ROR $6B07,X		  ; 7E 07 6B | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1CF
; Address: $D48F8E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1CF:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	STZ $01			  ; 64 01 | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1DD
; Address: $D48FCD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1DD:
	JSL $CC73AA		  ; 22 AA 73 CC | Jump to subroutine long
	STY $07			  ; 84 07 | Store Y register to zero page
	LDA #$18			 ; A9 18 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1F9
; Address: $D49067
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1F9:
	JSL $CCD863		  ; 22 63 D8 CC | Jump to subroutine long
	JMP $1089			; 4C 89 10 | Jump to address
	LDA $3420			; AD 20 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1038			; 4C 38 10 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $104A			; 4C 4A 10 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $105C			; 4C 5C 10 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_205
; Address: $D490BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_205:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_212
; Address: $D490F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_212:
	JSL $CDAF71		  ; 22 71 AF CD | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_216
; Address: $D4910D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_216:
	JSL $CDADAB		  ; 22 AB AD CD | Jump to subroutine long
	JMP $10BB			; 4C BB 10 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_21C
; Address: $D4912A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_21C:
	JSL $CCD418		  ; 22 18 D4 CC | Jump to subroutine long
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_228
; Address: $D49166
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_228:
	JSL $CDAF71		  ; 22 71 AF CD | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_22C
; Address: $D4917C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_22C:
	JSL $CDADAB		  ; 22 AB AD CD | Jump to subroutine long
	JMP $1126			; 4C 26 11 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_22F
; Address: $D4918F
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_22F:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_232
; Address: $D4919F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_232:
	STY $6B07			; 8C 07 6B | Store Y register to absolute address
	STA $6B07			; 8D 07 6B | Store accumulator to absolute address
	STX $6B07			; 8E 07 6B | Store X register to absolute address
	STA $226B07		  ; 8F 07 6B 22 | Store accumulator to absolute long address
	PLX				  ; FA | Pull X register from stack
	CPY $2EAD			; CC AD 2E | Compare Y register (absolute)
	CMP #$23			 ; C9 23 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $11C5			; 4C C5 11 | Jump to address
	BCC $07			  ; 90 07 | Branch if carry clear
	JMP $11C8			; 4C C8 11 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_24B
; Address: $D49237
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_24B:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $124D			; 4C 4D 12 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_252
; Address: $D49261
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_252:
	JSL $CDC5C2		  ; 22 C2 C5 CD | Jump to subroutine long
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_256
; Address: $D4927D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_256:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1286			; 4C 86 12 | Jump to address
	JMP $1276			; 4C 76 12 | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_25A
; Address: $D49298
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_25A:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	STZ $2207			; 9C 07 22 | Store zero to absolute
	DEC $CD			  ; C6 CD | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_25C
; Address: $D492A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_25C:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	STA $2207,X		  ; 9D 07 22 | Store accumulator to absolute,X
	DEC $CD			  ; C6 CD | Decrement (zero page)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_260
; Address: $D492C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_260:
	JSL $CDA7EE		  ; 22 EE A7 CD | Jump to subroutine long
	LDA #$1D			 ; A9 1D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_27C
; Address: $D4935C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_27C:
	LDA #$CE			 ; A9 CE | Load immediate value into accumulator
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_28F
; Address: $D493B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_28F:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	LDA #$84			 ; A9 84 | Load immediate value into accumulator
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$18			 ; A0 18 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2A0
; Address: $D49416
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2A0:
	STZ $6B07,X		  ; 9E 07 6B | Store zero to absolute,X
	STA				  ; 9F 07 6B 00 | Store accumulator to absolute long,X
	LDX #$07			 ; A2 07 | Load immediate value into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2A6
; Address: $D49436
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2A6:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	LDY $07			  ; A4 07 | Load from zero page into Y register
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $144F			; 4C 4F 14 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2A7
; Address: $D49448
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2A7:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	LDA $07			  ; A5 07 | Load from zero page into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2AD
; Address: $D49466
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2AD:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$6B			 ; C9 6B | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1481			; 4C 81 14 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA $0236,Y		  ; 19 36 02 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2AF
; Address: $D49486
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2AF:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $149C			; 4C 9C 14 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2B0
; Address: $D49495
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2B0:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $148A			; 4C 8A 14 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $14AB			; 4C AB 14 | Jump to address
	JMP $149C			; 4C 9C 14 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2B6
; Address: $D494C4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2B6:
	LDY $6B07			; AC 07 6B | Load from absolute address into Y register
	LDA $6B07			; AD 07 6B | Load from absolute address into accumulator
	LDA $6B07			; AD 07 6B | Load from absolute address into accumulator
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $14EB			; 4C EB 14 | Jump to address
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	LDX #$6A			 ; A2 6A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2B8
; Address: $D494E4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2B8:
	JSL $CCD863		  ; 22 63 D8 CC | Jump to subroutine long
	JMP $151B			; 4C 1B 15 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $14FB			; 4C FB 14 | Jump to address
	JMP $14EC			; 4C EC 14 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2B9
; Address: $D494FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2B9:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$26			 ; A2 26 | Load immediate value into X register
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2BC
; Address: $D4950D
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2BC:
	JSL $CCD863		  ; 22 63 D8 CC | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $AD6B			; CC 6B AD | Compare Y register (absolute)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $152D			; 4C 2D 15 | Jump to address
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	JMP $1536			; 4C 36 15 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1553			; 4C 53 15 | Jump to address
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	LDX #$6A			 ; A2 6A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2BF
; Address: $D49554
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2BF:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1563			; 4C 63 15 | Jump to address
	JMP $1554			; 4C 54 15 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2C0
; Address: $D49563
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2C0:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$2C			 ; A2 2C | Load immediate value into X register
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2C5
; Address: $D4957E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2C5:
	JSL $CA151C		  ; 22 1C 15 CA | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	LDX $6B07			; AE 07 6B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2C7
; Address: $D49593
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2C7:
	LDA $226B07		  ; AF 07 6B 22 | Load from absolute long address into accumulator
	STX $CA0F			; 8E 0F CA | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2D2
; Address: $D495C6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2D2:
	JSL $CA11AA		  ; 22 AA 11 CA | Jump to subroutine long
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $15DC			; 4C DC 15 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2D3
; Address: $D495D5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2D3:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	CMP ($07),Y		  ; D1 07 | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2D6
; Address: $D495E5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2D6:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $15F4			; 4C F4 15 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2F0
; Address: $D49669
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2F0:
	JSL $CCDADF		  ; 22 DF DA CC | Jump to subroutine long
	LDX #$32			 ; A2 32 | Load immediate value into X register
	LDA #$45			 ; A9 45 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2F2
; Address: $D49678
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2F2:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$2C			 ; A2 2C | Load immediate value into X register
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2F4
; Address: $D49686
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2F4:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	JMP $166E			; 4C 6E 16 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2F6
; Address: $D49697
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2F6:
	LDY $6B07,X		  ; BC 07 6B | Load from absolute,X into Y register
	LDA $6B07,X		  ; BD 07 6B | Load from absolute,X into accumulator
	LDX $6B07,Y		  ; BE 07 6B | Load from absolute,Y into X register
	LDA				  ; BF 07 6B 00 | Load from absolute long,X into accumulator
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2F8
; Address: $D496B1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2F8:
	JSL $CCD95B		  ; 22 5B D9 CC | Jump to subroutine long
	REP #$07			 ; C2 07 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2FD
; Address: $D496CE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2FD:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $16DF			; 4C DF 16 | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	JMP $173C			; 4C 3C 17 | Jump to address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2FE
; Address: $D496E8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2FE:
	JSL $C78238		  ; 22 38 82 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1739			; 4C 39 17 | Jump to address
	CPY $07			  ; C4 07 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_2FF
; Address: $D496F4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_2FF:
	JSL $CA173D		  ; 22 3D 17 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1709			; 4C 09 17 | Jump to address
	CMP $07			  ; C5 07 | Compare accumulator (zero page)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	JMP $1736			; 4C 36 17 | Jump to address
	DEC $07			  ; C6 07 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_300
; Address: $D4970C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_300:
	JSL $CA173D		  ; 22 3D 17 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1721			; 4C 21 17 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	JMP $1736			; 4C 36 17 | Jump to address
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_302
; Address: $D4972A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_302:
	JMP $1733			; 4C 33 17 | Jump to address
	JMP $1715			; 4C 15 17 | Jump to address
	JMP $1736			; 4C 36 17 | Jump to address
	JMP $1709			; 4C 09 17 | Jump to address
	JMP $173C			; 4C 3C 17 | Jump to address
	STZ $07			  ; 64 07 | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_303
; Address: $D4973D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_303:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$56			 ; C9 56 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $175E			; 4C 5E 17 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_304
; Address: $D4974E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_304:
	JSL $CDAC83		  ; 22 83 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $175B			; 4C 5B 17 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $176C			; 4C 6C 17 | Jump to address
	JMP $176B			; 4C 6B 17 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_305
; Address: $D4975E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_305:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $176B			; 4C 6B 17 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $176C			; 4C 6C 17 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_310
; Address: $D4979C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_310:
	JSL $CA0DC3		  ; 22 C3 0D CA | Jump to subroutine long
	JMP $1782			; 4C 82 17 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_312
; Address: $D497AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_312:
	CPY $6B07			; CC 07 6B | Compare Y register (absolute)
	CMP $6B07			; CD 07 6B | Compare accumulator (absolute)
	DEC $6B07			; CE 07 6B | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_314
; Address: $D497C2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_314:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $17D7			; 4C D7 17 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_316
; Address: $D497D7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_316:
	JSL $CCD9B3		  ; 22 B3 D9 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $182C			; 4C 2C 18 | Jump to address
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $17F7			; 4C F7 17 | Jump to address
	JMP $17FD			; 4C FD 17 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_319
; Address: $D49805
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_319:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$22			 ; A2 22 | Load immediate value into X register
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_31E
; Address: $D4981F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_31E:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_31F
; Address: $D4982C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_31F:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $184C			; 4C 4C 18 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1846			; 4C 46 18 | Jump to address
	CPY $4C07			; CC 07 4C | Compare Y register (absolute)
	EOR #$18			 ; 49 18 | Exclusive OR with accumulator (immediate)
	JMP ($4C07)		  ; 6C 07 4C | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	STA ($07),Y		  ; 91 07 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank28_DmaFunction_323
; Address: $D49859
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_323:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1865			; 4C 65 18 | Jump to address
	AND $AD0F,X		  ; 3D 0F AD | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_324
; Address: $D49866
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_324:
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1881			; 4C 81 18 | Jump to address
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1881			; 4C 81 18 | Jump to address
	INX				  ; E8 | Increment X register
	JMP $1902			; 4C 02 19 | Jump to address
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1892			; 4C 92 18 | Jump to address
	CPX $03			  ; E4 03 | Compare X register (zero page)
	JMP $1902			; 4C 02 19 | Jump to address
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $18D3			; 4C D3 18 | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $18B2			; 4C B2 18 | Jump to address
	CPX #$03			 ; E0 03 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_325
; Address: $D498AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_325:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	SEP #$03			 ; E2 03 | Set processor status bits

;------------------------------------------------------------------------------
; Bank28_DmaFunction_32B
; Address: $D498CC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_32B:
	JSL $CC9E4F		  ; 22 4F 9E CC | Jump to subroutine long
	JMP $1902			; 4C 02 19 | Jump to address
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $18FF			; 4C FF 18 | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $18F2			; 4C F2 18 | Jump to address
	DEC $A903,X		  ; DE 03 A9 | Decrement (absolute,X)
	JMP $0035			; 4C 35 00 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_32C
; Address: $D498F5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_32C:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	JMP $1902			; 4C 02 19 | Jump to address
	CMP $6B03,X		  ; DD 03 6B | Compare accumulator (absolute,X)
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_32E
; Address: $D49907
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_32E:
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1918			; 4C 18 19 | Jump to address
	SBC $03			  ; E5 03 | Subtract with carry (zero page)
	JMP $191B			; 4C 1B 19 | Jump to address
	CMP $6B03,Y		  ; D9 03 6B | Compare accumulator (absolute,Y)
	BVS $01			  ; 70 01 | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_331
; Address: $D49929
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_331:
	JSL $CA1AB6		  ; 22 B6 1A CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1938			; 4C 38 19 | Jump to address
	JMP $1942			; 4C 42 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_332
; Address: $D4993B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_332:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_335
; Address: $D4994C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_335:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1980			; 4C 80 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_337
; Address: $D49959
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_337:
	JSL $CDB530		  ; 22 30 B5 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1965			; 4C 65 19 | Jump to address
	JMP $1983			; 4C 83 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_338
; Address: $D49965
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_338:
	JSL $CDB51F		  ; 22 1F B5 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1971			; 4C 71 19 | Jump to address
	JMP $1983			; 4C 83 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_339
; Address: $D49971
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_339:
	JSL $CDB4EE		  ; 22 EE B4 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1980			; 4C 80 19 | Jump to address
	AND $4C0F,X		  ; 3D 0F 4C | Logical AND with accumulator (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $8A4C,Y		  ; 19 4C 8A | Logical OR with accumulator (absolute,Y)
	ORA $3C22,Y		  ; 19 22 3C | Logical OR with accumulator (absolute,Y)
	CMP $4CCA,X		  ; DD CA 4C | Compare accumulator (absolute,X)
	STA ($19),Y		  ; 91 19 | Store accumulator to (zero page),Y
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_33F
; Address: $D499A2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_33F:
	JSL $C754E6		  ; 22 E6 54 C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $19CE			; 4C CE 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_341
; Address: $D499B5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_341:
	JSL $C76A78		  ; 22 78 6A C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $19CB			; 4C CB 19 | Jump to address
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_344
; Address: $D499D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_344:
	JSL $CDADAB		  ; 22 AB AD CD | Jump to subroutine long
	JMP $199F			; 4C 9F 19 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_345
; Address: $D499DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_345:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $19FE			; 4C FE 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_347
; Address: $D499E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_347:
	JSL $CDB530		  ; 22 30 B5 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $19FE			; 4C FE 19 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_34B
; Address: $D49A04
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_34B:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1A1A			; 4C 1A 1A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_34F
; Address: $D49A22
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_34F:
	JSL $CA1A2A		  ; 22 2A 1A CA | Jump to subroutine long
	JMP $1A08			; 4C 08 1A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_358
; Address: $D49A50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_358:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1A69			; 4C 69 1A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_35A
; Address: $D49A5D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_35A:
	JSL $CDB4EE		  ; 22 EE B4 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1A69			; 4C 69 1A | Jump to address
	AND $000F,X		  ; 3D 0F 00 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_35C
; Address: $D49A70
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_35C:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_364
; Address: $D49A9B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_364:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	CMP #$57			 ; C9 57 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1AAE			; 4C AE 1A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $1AAF			; 4C AF 1A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_366
; Address: $D49AB6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_366:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1ADF			; 4C DF 1A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_368
; Address: $D49AC3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_368:
	JSL $CDB530		  ; 22 30 B5 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1AD3			; 4C D3 1A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $1AE0			; 4C E0 1A | Jump to address
	JMP $1ADF			; 4C DF 1A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_369
; Address: $D49AD3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_369:
	JSL $CDB4EE		  ; 22 EE B4 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1ADF			; 4C DF 1A | Jump to address
	AND $180F,X		  ; 3D 0F 18 | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_36A
; Address: $D49AE1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_36A:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1AFD			; 4C FD 1A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_36C
; Address: $D49AEE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_36C:
	JSL $CDB530		  ; 22 30 B5 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1AFD			; 4C FD 1A | Jump to address
	JMP $1B00			; 4C 00 1B | Jump to address
	INC $03			  ; E6 03 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_36E
; Address: $D49B05
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_36E:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_373
; Address: $D49B32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_373:
	JSL $CDC9E8		  ; 22 E8 C9 CD | Jump to subroutine long
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_374
; Address: $D49B3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_374:
	JSL $C78356		  ; 22 56 83 C7 | Jump to subroutine long
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_375
; Address: $D49B46
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_375:
	JSL $C7838C		  ; 22 8C 83 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_378
; Address: $D49B54
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_378:
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1B75			; 4C 75 1B | Jump to address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_37C
; Address: $D49B80
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_37C:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1B96			; 4C 96 1B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_37D
; Address: $D49B8F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_37D:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $1B84			; 4C 84 1B | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1BA5			; 4C A5 1B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_37F
; Address: $D49BA5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_37F:
	JSL $CDAF21		  ; 22 21 AF CD | Jump to subroutine long
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1BBB			; 4C BB 1B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_380
; Address: $D49BB4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_380:
	JSL $CDADD1		  ; 22 D1 AD CD | Jump to subroutine long
	JMP $1B84			; 4C 84 1B | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1BD3			; 4C D3 1B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_383
; Address: $D49BD7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_383:
	JSL $CDD816		  ; 22 16 D8 CD | Jump to subroutine long
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1BEA			; 4C EA 1B | Jump to address
	JMP $1BDB			; 4C DB 1B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_386
; Address: $D49BF1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_386:
	JSL $CCDADF		  ; 22 DF DA CC | Jump to subroutine long
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1C03			; 4C 03 1C | Jump to address
	JMP $1DAF			; 4C AF 1D | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1C29			; 4C 29 1C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_389
; Address: $D49C1C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_389:
	JSL $CA1E1A		  ; 22 1A 1E CA | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1C29			; 4C 29 1C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_38A
; Address: $D49C25
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_38A:
	JSL $CDAE09		  ; 22 09 AE CD | Jump to subroutine long
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1C38			; 4C 38 1C | Jump to address
	JMP $1C29			; 4C 29 1C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_38F
; Address: $D49C4E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_38F:
	JSL $C750BC		  ; 22 BC 50 C7 | Jump to subroutine long
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	LDX #$44			 ; A2 44 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_392
; Address: $D49C60
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_392:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	ORA #$AE			 ; 09 AE | Logical OR with accumulator (immediate)
	CMP $5422			; CD 22 54 | Compare accumulator (absolute)
	LDA ($CD),Y		  ; B1 CD | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_393
; Address: $D49C72
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_393:
	JSL $C1A944		  ; 22 44 A9 C1 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_395
; Address: $D49C7C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_395:
	JSL $CDE073		  ; 22 73 E0 CD | Jump to subroutine long
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	LDX #$3E			 ; A2 3E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_39C
; Address: $D49CA1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_39C:
	JSL $CCD388		  ; 22 88 D3 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1CE6			; 4C E6 1C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3A5
; Address: $D49CDA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3A5:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3AC
; Address: $D49D01
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3AC:
	JSL $CDE1BD		  ; 22 BD E1 CD | Jump to subroutine long
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$46			 ; A2 46 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3AD
; Address: $D49D17
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3AD:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$47			 ; A2 47 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3AF
; Address: $D49D31
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3AF:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3B5
; Address: $D49D6F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3B5:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3B7
; Address: $D49D83
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3B7:
	JSL $CCD34E		  ; 22 4E D3 CC | Jump to subroutine long
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	LDX $342E			; AE 2E 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3BB
; Address: $D49D99
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3BB:
	JSL $CCD346		  ; 22 46 D3 CC | Jump to subroutine long
	LDX #$81			 ; A2 81 | Load immediate value into X register
	LDA #$44			 ; A9 44 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3BE
; Address: $D49DAB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3BE:
	JSL $CCD869		  ; 22 69 D8 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3C1
; Address: $D49DB9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3C1:
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1DDF			; 4C DF 1D | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1DD5			; 4C D5 1D | Jump to address
	BIT #$08			 ; 89 08 | Test bits in accumulator (immediate)
	JMP $1DD8			; 4C D8 1D | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3C2
; Address: $D49DD8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3C2:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	JMP $1E19			; 4C 19 1E | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1E12			; 4C 12 1E | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1E0F			; 4C 0F 1E | Jump to address
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3C4
; Address: $D49DF8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3C4:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1E08			; 4C 08 1E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3C5
; Address: $D49E01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3C5:
	JSL $CA1E1A		  ; 22 1A 1E CA | Jump to subroutine long
	JMP $1E0F			; 4C 0F 1E | Jump to address
	STX $08			  ; 86 08 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3C6
; Address: $D49E0B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3C6:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	JMP $1E19			; 4C 19 1E | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3C9
; Address: $D49E1D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3C9:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1E33			; 4C 33 1E | Jump to address
	PHP				  ; 08 | Push processor status to stack
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	JMP $1E3D			; 4C 3D 1E | Jump to address
	STX $08			  ; 86 08 | Store X register to zero page
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3CB
; Address: $D49E43
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3CB:
	SBC ($08,X)		  ; E1 08 | Subtract with carry ((zero page,X))
	LDA $3540			; AD 40 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1E69			; 4C 69 1E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3CD
; Address: $D49E57
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3CD:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1E66			; 4C 66 1E | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $1E69			; 4C 69 1E | Jump to address
	CPX $08			  ; E4 08 | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3CE
; Address: $D49E6C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3CE:
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)
	AND $6B09,X		  ; 3D 09 6B | Logical AND with accumulator (absolute,X)
	ROL $6B09,X		  ; 3E 09 6B | Rotate left (absolute,X)
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D0
; Address: $D49E94
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D0:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D1
; Address: $D49EB6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D1:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D2
; Address: $D49ED8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D2:
	JSL $C736DB		  ; 22 DB 36 C7 | Jump to subroutine long
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D4
; Address: $D49EFF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D4:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1F15			; 4C 15 1F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D7
; Address: $D49F19
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D7:
	JSL $CCD6ED		  ; 22 ED D6 CC | Jump to subroutine long
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1F47			; 4C 47 1F | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D8
; Address: $D49F2B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D8:
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1F3D			; 4C 3D 1F | Jump to address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $1F44			; 4C 44 1F | Jump to address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $1F63			; 4C 63 1F | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1F5C			; 4C 5C 1F | Jump to address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $1F63			; 4C 63 1F | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3D9
; Address: $D49F64
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3D9:
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3DA
; Address: $D49F82
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3DA:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3DB
; Address: $D49FA4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3DB:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3DC
; Address: $D49FB7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3DC:
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3DD
; Address: $D49FC6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3DD:
	JSL $C736DB		  ; 22 DB 36 C7 | Jump to subroutine long
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3E1
; Address: $D49FF5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3E1:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $200B			; 4C 0B 20 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3E4
; Address: $D4A00F
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3E4:
	JSL $CCD6ED		  ; 22 ED D6 CC | Jump to subroutine long
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $203D			; 4C 3D 20 | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2033			; 4C 33 20 | Jump to address
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $203A			; 4C 3A 20 | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $2059			; 4C 59 20 | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2052			; 4C 52 20 | Jump to address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3E5
; Address: $D4A04C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3E5:
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $2059			; 4C 59 20 | Jump to address
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3E8
; Address: $D4A063
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3E8:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2079			; 4C 79 20 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3EA
; Address: $D4A079
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3EA:
	JSL $CAF3E6		  ; 22 E6 F3 CA | Jump to subroutine long
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3EB
; Address: $D4A085
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3EB:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2096			; 4C 96 20 | Jump to address
	RTI				  ; 40 | Return from interrupt
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	STA $0020,Y		  ; 99 20 00 | Store accumulator to absolute,Y
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)
	EOR ($09,X)		  ; 41 09 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3EC
; Address: $D4A09E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3EC:
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3ED
; Address: $D4A0BC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3ED:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3EF
; Address: $D4A0DE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3EF:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3F0
; Address: $D4A100
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3F0:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3F1
; Address: $D4A122
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3F1:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$39			 ; A9 39 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_3F5
; Address: $D4A151
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_3F5:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2167			; 4C 67 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank28_DmaFunction_407
; Address: $D4A1AF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_407:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $21BE			; 4C BE 21 | PPU graphics register access
	PHA				  ; 48 | Push accumulator to stack
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	CPY $4700			; CC 00 47 | Compare Y register (absolute)
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	LDA $D22221		  ; AF 21 22 D2 | Load from absolute long address into accumulator
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	PEA #$CDAD		   ; F4 AD CD | Push effective address to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_42D
; Address: $D4A279
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_42D:
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C76D			; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_430
; Address: $D4A28A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_430:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2299			; 4C 99 22 | Jump to address
	JMP $228A			; 4C 8A 22 | Jump to address
	LDX #$4E			 ; A2 4E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_431
; Address: $D4A29C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_431:
	JSL $C666FA		  ; 22 FA 66 C6 | Jump to subroutine long
	LDA #$8B			 ; A9 8B | Load immediate value into accumulator
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank28_DmaFunction_433
; Address: $D4A2AF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_433:
	JSL $CC75C2		  ; 22 C2 75 CC | Jump to subroutine long
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_434
; Address: $D4A2C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_434:
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_435
; Address: $D4A2D1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_435:
	JSL $C736BD		  ; 22 BD 36 C7 | Jump to subroutine long
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $22E4			; 4C E4 22 | Jump to address
	JMP $22D5			; 4C D5 22 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_436
; Address: $D4A2E4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_436:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_43C
; Address: $D4A31F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_43C:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	LDA #$20			 ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_44C
; Address: $D4A366
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_44C:
	JSL $C1A944		  ; 22 44 A9 C1 | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_44E
; Address: $D4A374
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_44E:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_457
; Address: $D4A39D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_457:
	JSL $CCD32E		  ; 22 2E D3 CC | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank28_DmaFunction_45A
; Address: $D4A3B5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_45A:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$A8			 ; A0 A8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_45B
; Address: $D4A3C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_45B:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $23D2			; 4C D2 23 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_460
; Address: $D4A3DE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_460:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_461
; Address: $D4A3EB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_461:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $23FB			; 4C FB 23 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_466
; Address: $D4A407
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_466:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_468
; Address: $D4A416
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_468:
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_469
; Address: $D4A434
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_469:
	JSL $C736BD		  ; 22 BD 36 C7 | Jump to subroutine long
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_46B
; Address: $D4A45B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_46B:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_46C
; Address: $D4A468
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_46C:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2478			; 4C 78 24 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_470
; Address: $D4A480
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_470:
	JSL $CDAED1		  ; 22 D1 AE CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STX $35			  ; 86 35 | Store X register to zero page
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_472
; Address: $D4A49C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_472:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$B4			 ; A2 B4 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_476
; Address: $D4A4BE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_476:
	JSL $CAF3E6		  ; 22 E6 F3 CA | Jump to subroutine long
	LDA #$2A			 ; A9 2A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_478
; Address: $D4A4CF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_478:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $24E5			; 4C E5 24 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_47B
; Address: $D4A4E9
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_47B:
	JSL $CCD6FA		  ; 22 FA D6 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$5A			 ; C9 5A | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2504			; 4C 04 25 | Jump to address
	LDA #$39			 ; A9 39 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $250B			; 4C 0B 25 | Jump to address
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_47F
; Address: $D4A51A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_47F:
	JSL $CCD714		  ; 22 14 D7 CC | Jump to subroutine long
	LDA $3430			; AD 30 34 | Load from absolute address into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA $3432			; AD 32 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_480
; Address: $D4A527
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_480:
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDA $9682			; AD 82 96 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2556			; 4C 56 25 | Jump to address
	LDX #$83			 ; A2 83 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_481
; Address: $D4A545
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_481:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDX #$84			 ; A2 84 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_482
; Address: $D4A54F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_482:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $256A			; 4C 6A 25 | Jump to address
	LDX #$85			 ; A2 85 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_483
; Address: $D4A55C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_483:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDX #$86			 ; A2 86 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_487
; Address: $D4A573
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_487:
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_488
; Address: $D4A591
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_488:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_489
; Address: $D4A5B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_489:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_48A
; Address: $D4A5C0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_48A:
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_48B
; Address: $D4A5D5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_48B:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_48C
; Address: $D4A5F7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_48C:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA $3558			; AD 58 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $260D			; 4C 0D 26 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_48D
; Address: $D4A606
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_48D:
	JSL $CA29A9		  ; 22 A9 29 CA | Jump to subroutine long
	JMP $262F			; 4C 2F 26 | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_48F
; Address: $D4A630
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_48F:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2646			; 4C 46 26 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_494
; Address: $D4A652
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_494:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	JMP $2634			; 4C 34 26 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_496
; Address: $D4A65D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_496:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $267B			; 4C 7B 26 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_497
; Address: $D4A677
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_497:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $269C			; 4C 9C 26 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_498
; Address: $D4A698
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_498:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $26BD			; 4C BD 26 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_499
; Address: $D4A6B9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_499:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $26DE			; 4C DE 26 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_49A
; Address: $D4A6DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_49A:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_49B
; Address: $D4A6E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_49B:
	JMP $26FF			; 4C FF 26 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_49C
; Address: $D4A6FB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_49C:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2720			; 4C 20 27 | Jump to address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_49D
; Address: $D4A71C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_49D:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2741			; 4C 41 27 | Jump to address
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_49E
; Address: $D4A73D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_49E:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $3589			; AD 89 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2762			; 4C 62 27 | Jump to address
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_49F
; Address: $D4A75E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_49F:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2783			; 4C 83 27 | Jump to address
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4A0
; Address: $D4A76F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4A0:
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4A1
; Address: $D4A77F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4A1:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $27A4			; 4C A4 27 | Jump to address
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4A2
; Address: $D4A7A0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4A2:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $27C5			; 4C C5 27 | Jump to address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4A3
; Address: $D4A7C1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4A3:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $27E6			; 4C E6 27 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4A7
; Address: $D4A7F0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4A7:
	JSL $C78FB9		  ; 22 B9 8F C7 | Jump to subroutine long
	LDA $3558			; AD 58 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4A8
; Address: $D4A7FC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4A8:
	JMP $2820			; 4C 20 28 | Jump to address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$A3			 ; A2 A3 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4AA
; Address: $D4A815
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4AA:
	JSL $CCD086		  ; 22 86 D0 CC | Jump to subroutine long
	LDX #$96			 ; A2 96 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $02			  ; C6 02 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4AE
; Address: $D4A830
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4AE:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2848			; 4C 48 28 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B3
; Address: $D4A84D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B3:
	LDA $3558			; AD 58 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2865			; 4C 65 28 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B4
; Address: $D4A858
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B4:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	AND #$22			 ; 29 22 | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	CPY $144C			; CC 4C 14 | Compare Y register (absolute)
	AND #$AD			 ; 29 AD | Logical AND with accumulator (immediate)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2886			; 4C 86 28 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B5
; Address: $D4A87E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B5:
	JSR $0C00			; 20 00 0C | Jump to subroutine
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	STA ($28),Y		  ; 91 28 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B6
; Address: $D4A886
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B6:
	JSL $CA2516		  ; 22 16 25 CA | Jump to subroutine long
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B7
; Address: $D4A88E
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B7:
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $2937			; 4C 37 29 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $28A5			; 4C A5 28 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	AND #$AD			 ; 29 AD | Logical AND with accumulator (immediate)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $28D3			; 4C D3 28 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $28CA			; 4C CA 28 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	DEC $2228,X		  ; DE 28 22 | Decrement (absolute,X)
	AND $CA			  ; 25 CA | Logical AND with accumulator (zero page)
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $2937			; 4C 37 29 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2906			; 4C 06 29 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $28FD			; 4C FD 28 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	ORA ($29),Y		  ; 11 29 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B8
; Address: $D4A906
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B8:
	JSL $CA2516		  ; 22 16 25 CA | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	JMP $2937			; 4C 37 29 | Jump to address
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CMP #$62			 ; C9 62 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $286C			; 4C 6C 28 | Jump to address
	CMP #$5A			 ; C9 5A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4B9
; Address: $D4A924
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4B9:
	JMP $2894			; 4C 94 28 | Jump to address
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $28AE			; 4C AE 28 | Jump to address
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $28E1			; 4C E1 28 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4BA
; Address: $D4A938
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4BA:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2956			; 4C 56 29 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4BC
; Address: $D4A949
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4BC:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$AD			 ; 29 AD | Logical AND with accumulator (immediate)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4C0
; Address: $D4A96B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4C0:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4C2
; Address: $D4A991
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4C2:
	JSL $CA29A9		  ; 22 A9 29 CA | Jump to subroutine long
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$22			 ; 29 22 | Logical AND with accumulator (immediate)
	CPX #$AC			 ; E0 AC | Compare X register (immediate)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4C3
; Address: $D4A9B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4C3:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $9684			; 8D 84 96 | Store accumulator to absolute address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4C8
; Address: $D4A9D7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4C8:
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $29F8			; 4C F8 29 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4C9
; Address: $D4A9F4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4C9:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2A19			; 4C 19 2A | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4CA
; Address: $D4AA15
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4CA:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358A			; AD 8A 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2A3A			; 4C 3A 2A | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4CB
; Address: $D4AA36
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4CB:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358B			; AD 8B 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4CC
; Address: $D4AA42
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4CC:
	JMP $2A5B			; 4C 5B 2A | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4CD
; Address: $D4AA57
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4CD:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358B			; AD 8B 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2A7C			; 4C 7C 2A | Jump to address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4CE
; Address: $D4AA78
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4CE:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA $358B			; AD 8B 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2A9D			; 4C 9D 2A | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4D1
; Address: $D4AAA2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4D1:
	JSL $CA2B74		  ; 22 74 2B CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2AB3			; 4C B3 2A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4D8
; Address: $D4AAC5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4D8:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4D9
; Address: $D4AAD3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4D9:
	JMP $2ADF			; 4C DF 2A | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	JMP $2AF4			; 4C F4 2A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4DA
; Address: $D4AADF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4DA:
	JSL $CA2B74		  ; 22 74 2B CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2AF4			; 4C F4 2A | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E0
; Address: $D4AAFD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E0:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2B10			; 4C 10 2B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E1
; Address: $D4AB0C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E1:
	JSL $CDC39C		  ; 22 9C C3 CD | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2B57			; 4C 57 2B | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2B42			; 4C 42 2B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E2
; Address: $D4AB26
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E2:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2B3F			; 4C 3F 2B | Jump to address
	JMP $2B42			; 4C 42 2B | Jump to address
	JMP $2B1B			; 4C 1B 2B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E3
; Address: $D4AB42
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E3:
	JSL $CA3331		  ; 22 31 33 CA | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$28			 ; A9 28 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E6
; Address: $D4AB57
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E6:
	JSL $CA335F		  ; 22 5F 33 CA | Jump to subroutine long
	LDA $C1FD			; AD FD C1 | Load from absolute address into accumulator
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2B70			; 4C 70 2B | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E7
; Address: $D4AB6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E7:
	EOR $2235,Y		  ; 59 35 22 | Exclusive OR with accumulator (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $104C			; CC 4C 10 | Compare Y register (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E8
; Address: $D4AB74
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E8:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2B8F			; 4C 8F 2B | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	JMP $2B90			; 4C 90 2B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4E9
; Address: $D4AB91
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4E9:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BBC			; 4C BC 2B | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BBC			; 4C BC 2B | Jump to address
	LDA $3448			; AD 48 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4EA
; Address: $D4ABAA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4EA:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	LDX #$2D			 ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4ED
; Address: $D4ABC0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4ED:
	JSL $CA3392		  ; 22 92 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2BE5			; 4C E5 2B | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4EE
; Address: $D4ABCF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4EE:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4F2
; Address: $D4ABE6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4F2:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2C11			; 4C 11 2C | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4F4
; Address: $D4ABFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4F4:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	LDX #$2F			 ; A2 2F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4F7
; Address: $D4AC15
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4F7:
	JSL $CA33B5		  ; 22 B5 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2C3A			; 4C 3A 2C | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4F8
; Address: $D4AC24
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4F8:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4FC
; Address: $D4AC3B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4FC:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2C66			; 4C 66 2C | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2C66			; 4C 66 2C | Jump to address
	LDA $344C			; AD 4C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_4FD
; Address: $D4AC54
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_4FD:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	LDX #$31			 ; A2 31 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_500
; Address: $D4AC6A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_500:
	JSL $CA33D8		  ; 22 D8 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2C8F			; 4C 8F 2C | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_501
; Address: $D4AC79
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_501:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$31			 ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_508
; Address: $D4AC9B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_508:
	TAX				  ; AA | Transfer accumulator to X register
	ORA #$AD			 ; 09 AD | Logical OR with accumulator (immediate)
	EOR $2935,Y		  ; 59 35 29 | Exclusive OR with accumulator (absolute,Y)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2CAF			; 4C AF 2C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_509
; Address: $D4ACA8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_509:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_50A
; Address: $D4ACB0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_50A:
	JSL $CA2D78		  ; 22 78 2D CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2CC1			; 4C C1 2C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_511
; Address: $D4ACD3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_511:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2CED			; 4C ED 2C | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	JMP $2CFE			; 4C FE 2C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_512
; Address: $D4ACED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_512:
	JSL $CA2D78		  ; 22 78 2D CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2CFE			; 4C FE 2C | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_517
; Address: $D4AD07
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_517:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2D1A			; 4C 1A 2D | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_518
; Address: $D4AD16
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_518:
	JSL $CDC39C		  ; 22 9C C3 CD | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2D61			; 4C 61 2D | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2D4C			; 4C 4C 2D | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_51A
; Address: $D4AD34
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_51A:
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$68			 ; A2 68 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$18			 ; A0 18 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2D49			; 4C 49 2D | Jump to address
	JMP $2D4C			; 4C 4C 2D | Jump to address
	JMP $2D25			; 4C 25 2D | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_51B
; Address: $D4AD4C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_51B:
	JSL $CA3331		  ; 22 31 33 CA | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_51E
; Address: $D4AD61
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_51E:
	JSL $CA335F		  ; 22 5F 33 CA | Jump to subroutine long
	LDA $C1FD			; AD FD C1 | Load from absolute address into accumulator
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2D74			; 4C 74 2D | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_51F
; Address: $D4AD70
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_51F:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $2D1A			; 4C 1A 2D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_520
; Address: $D4AD78
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_520:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2D93			; 4C 93 2D | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	JMP $2D94			; 4C 94 2D | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_521
; Address: $D4AD95
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_521:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2DC0			; 4C C0 2D | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2DC0			; 4C C0 2D | Jump to address
	LDA $3448			; AD 48 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_522
; Address: $D4ADAE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_522:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDX #$27			 ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_525
; Address: $D4ADC4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_525:
	JSL $CA3392		  ; 22 92 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2DE9			; 4C E9 2D | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_526
; Address: $D4ADD3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_526:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$4D			 ; A2 4D | Load immediate value into X register
	LDA #$27			 ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_52A
; Address: $D4ADEA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_52A:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2E15			; 4C 15 2E | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2E15			; 4C 15 2E | Jump to address
	LDA $344A			; AD 4A 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_52B
; Address: $D4AE03
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_52B:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDX #$29			 ; A2 29 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_52E
; Address: $D4AE19
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_52E:
	JSL $CA33B5		  ; 22 B5 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2E3E			; 4C 3E 2E | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_52F
; Address: $D4AE28
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_52F:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$4D			 ; A2 4D | Load immediate value into X register
	LDA #$29			 ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_533
; Address: $D4AE3F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_533:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2E6A			; 4C 6A 2E | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2E6A			; 4C 6A 2E | Jump to address
	LDA $344C			; AD 4C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_538
; Address: $D4AE6E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_538:
	JSL $CA33D8		  ; 22 D8 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2E93			; 4C 93 2E | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_539
; Address: $D4AE7D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_539:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$4D			 ; A2 4D | Load immediate value into X register
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_541
; Address: $D4AEAB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_541:
	JSL $CA2F73		  ; 22 73 2F CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2EBC			; 4C BC 2E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_548
; Address: $D4AECE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_548:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2EE8			; 4C E8 2E | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	JMP $2EF9			; 4C F9 2E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_549
; Address: $D4AEE8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_549:
	JSL $CA2F73		  ; 22 73 2F CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2EF9			; 4C F9 2E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_54D
; Address: $D4AEFE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_54D:
	JSL $C78FDF		  ; 22 DF 8F C7 | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2F11			; 4C 11 2F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_54F
; Address: $D4AF11
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_54F:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2F5C			; 4C 5C 2F | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2F47			; 4C 47 2F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_550
; Address: $D4AF2B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_550:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$A8			 ; A9 A8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_551
; Address: $D4AF38
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_551:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2F44			; 4C 44 2F | Jump to address
	JMP $2F47			; 4C 47 2F | Jump to address
	JMP $2F20			; 4C 20 2F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_552
; Address: $D4AF47
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_552:
	JSL $CA3331		  ; 22 31 33 CA | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_555
; Address: $D4AF5C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_555:
	JSL $CA335F		  ; 22 5F 33 CA | Jump to subroutine long
	LDA $C1FD			; AD FD C1 | Load from absolute address into accumulator
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2F6F			; 4C 6F 2F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_556
; Address: $D4AF6B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_556:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $2F15			; 4C 15 2F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_557
; Address: $D4AF73
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_557:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2F8E			; 4C 8E 2F | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	JMP $2F8F			; 4C 8F 2F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_559
; Address: $D4AF90
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_559:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2FBB			; 4C BB 2F | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2FBB			; 4C BB 2F | Jump to address
	LDA $3448			; AD 48 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_55A
; Address: $D4AFA9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_55A:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	LDX #$5C			 ; A2 5C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_55D
; Address: $D4AFBF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_55D:
	JSL $CA3392		  ; 22 92 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2FE4			; 4C E4 2F | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_55E
; Address: $D4AFCE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_55E:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$35			 ; A2 35 | Load immediate value into X register
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_562
; Address: $D4AFE5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_562:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3010			; 4C 10 30 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3010			; 4C 10 30 | Jump to address
	LDA $344A			; AD 4A 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_563
; Address: $D4AFFE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_563:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	LDX #$5E			 ; A2 5E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_566
; Address: $D4B014
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_566:
	JSL $CA33B5		  ; 22 B5 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3039			; 4C 39 30 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_56C
; Address: $D4B03A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_56C:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3065			; 4C 65 30 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3065			; 4C 65 30 | Jump to address
	LDA $344C			; AD 4C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_56D
; Address: $D4B053
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_56D:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	LDX #$60			 ; A2 60 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_570
; Address: $D4B069
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_570:
	JSL $CA33D8		  ; 22 D8 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $308E			; 4C 8E 30 | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_571
; Address: $D4B078
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_571:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$35			 ; A2 35 | Load immediate value into X register
	LDA #$60			 ; A9 60 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_577
; Address: $D4B099
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_577:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $30AE			; 4C AE 30 | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	BMI $22			  ; 30 22 | Branch if negative
	LDA $34			  ; A5 34 | Load from zero page into accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_578
; Address: $D4B0B3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_578:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_579
; Address: $D4B0BB
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_579:
	JMP $30C4			; 4C C4 30 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	LDX $6B09			; AE 09 6B | Load from absolute address into X register
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $30D9			; 4C D9 30 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	LDA $AD6B09		  ; AF 09 6B AD | Load from absolute long address into accumulator
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $30EE			; 4C EE 30 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	SBC ($30),Y		  ; F1 30 | Subtract with carry ((zero page),Y)
	BCS $09			  ; B0 09 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_57A
; Address: $D4B0F2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_57A:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3103			; 4C 03 31 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	LDA ($09),Y		  ; B1 09 | Load from (zero page),Y into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_57B
; Address: $D4B107
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_57B:
	JSL $CA31CF		  ; 22 CF 31 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3118			; 4C 18 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_582
; Address: $D4B12A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_582:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3144			; 4C 44 31 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	JMP $3155			; 4C 55 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_583
; Address: $D4B144
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_583:
	JSL $CA31CF		  ; 22 CF 31 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3155			; 4C 55 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_588
; Address: $D4B15E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_588:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3171			; 4C 71 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_589
; Address: $D4B16D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_589:
	JSL $CDC39C		  ; 22 9C C3 CD | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $31B8			; 4C B8 31 | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $31A3			; 4C A3 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_58A
; Address: $D4B187
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_58A:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_58B
; Address: $D4B194
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_58B:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $31A0			; 4C A0 31 | Jump to address
	JMP $31A3			; 4C A3 31 | Jump to address
	JMP $317C			; 4C 7C 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_58C
; Address: $D4B1A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_58C:
	JSL $CA3331		  ; 22 31 33 CA | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$52			 ; A9 52 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_58F
; Address: $D4B1B8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_58F:
	JSL $CA335F		  ; 22 5F 33 CA | Jump to subroutine long
	LDA $C1FD			; AD FD C1 | Load from absolute address into accumulator
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $31CB			; 4C CB 31 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_590
; Address: $D4B1C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_590:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $3171			; 4C 71 31 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_591
; Address: $D4B1CF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_591:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $31EA			; 4C EA 31 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_592
; Address: $D4B1E6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_592:
	SEC				  ; 38 | Set carry flag
	JMP $31EB			; 4C EB 31 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_593
; Address: $D4B1EC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_593:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3217			; 4C 17 32 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3217			; 4C 17 32 | Jump to address
	LDA $3448			; AD 48 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_594
; Address: $D4B205
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_594:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	LDX #$56			 ; A2 56 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_597
; Address: $D4B21B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_597:
	JSL $CA3392		  ; 22 92 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3240			; 4C 40 32 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_598
; Address: $D4B22A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_598:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$41			 ; A2 41 | Load immediate value into X register
	LDA #$56			 ; A9 56 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_59C
; Address: $D4B241
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_59C:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $326C			; 4C 6C 32 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $326C			; 4C 6C 32 | Jump to address
	LDA $344A			; AD 4A 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_59D
; Address: $D4B25A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_59D:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	LDX #$58			 ; A2 58 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5A0
; Address: $D4B270
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5A0:
	JSL $CA33B5		  ; 22 B5 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3295			; 4C 95 32 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5A2
; Address: $D4B27F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5A2:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$41			 ; A2 41 | Load immediate value into X register
	LDA #$58			 ; A9 58 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5A6
; Address: $D4B296
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5A6:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $32C1			; 4C C1 32 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $32C1			; 4C C1 32 | Jump to address
	LDA $344C			; AD 4C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5A7
; Address: $D4B2AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5A7:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	LDX #$5A			 ; A2 5A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5AA
; Address: $D4B2C5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5AA:
	JSL $CA33D8		  ; 22 D8 33 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $32EA			; 4C EA 32 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5AB
; Address: $D4B2D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5AB:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDX #$41			 ; A2 41 | Load immediate value into X register
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5B3
; Address: $D4B2FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5B3:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3322			; 4C 22 33 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3322			; 4C 22 33 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5B5
; Address: $D4B318
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5B5:
	JSL $CDD682		  ; 22 82 D6 CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5BB
; Address: $D4B339
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5BB:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	ORA $CA36			; 0D 36 CA | Logical OR with accumulator (absolute)
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	JMP $3356			; 4C 56 33 | Jump to address
	JMP $3347			; 4C 47 33 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5BE
; Address: $D4B35F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5BE:
	JSL $C74E4A		  ; 22 4A 4E C7 | Jump to subroutine long
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C76D			; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5BF
; Address: $D4B36A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5BF:
	JSL $C56364		  ; 22 64 63 C5 | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3380			; 4C 80 33 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5C0
; Address: $D4B379
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5C0:
	JSL $C57B68		  ; 22 68 7B C5 | Jump to subroutine long
	JMP $336E			; 4C 6E 33 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5C1
; Address: $D4B382
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5C1:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3391			; 4C 91 33 | Jump to address
	JMP $3382			; 4C 82 33 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5C3
; Address: $D4B396
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5C3:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $353F			; AD 3F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $33B3			; 4C B3 33 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5C5
; Address: $D4B3A9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5C5:
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	STA $3448			; 8D 48 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $33B4			; 4C B4 33 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5C7
; Address: $D4B3B9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5C7:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $353F			; AD 3F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $33D6			; 4C D6 33 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5C8
; Address: $D4B3C8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5C8:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	STA $344A			; 8D 4A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $33D7			; 4C D7 33 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5CA
; Address: $D4B3DC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5CA:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $353F			; AD 3F 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $33F9			; 4C F9 33 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5CB
; Address: $D4B3EB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5CB:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Load from absolute address into accumulator
	STA $344C			; 8D 4C 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $33FA			; 4C FA 33 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5CC
; Address: $D4B3FB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5CC:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3412			; 4C 12 34 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5CF
; Address: $D4B41B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5CF:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $342E			; 4C 2E 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5D2
; Address: $D4B435
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5D2:
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3441			; 4C 41 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5D4
; Address: $D4B442
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5D4:
	JSL $CCDADF		  ; 22 DF DA CC | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3473			; 4C 73 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5D5
; Address: $D4B451
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5D5:
	JSL $CA3653		  ; 22 53 36 CA | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3473			; 4C 73 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5D6
; Address: $D4B45A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5D6:
	JSL $CA3775		  ; 22 75 37 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3470			; 4C 70 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5D7
; Address: $D4B463
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5D7:
	JSL $CA36BE		  ; 22 BE 36 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3470			; 4C 70 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5DA
; Address: $D4B47A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5DA:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3490			; 4C 90 34 | Jump to address
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	STA $3422			; 8D 22 34 | Store accumulator to absolute address
	JMP $349A			; 4C 9A 34 | Jump to address
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	STA $3422			; 8D 22 34 | Store accumulator to absolute address
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	LDX $3424			; AE 24 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5DC
; Address: $D4B4A5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5DC:
	JSL $CA3653		  ; 22 53 36 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $34B8			; 4C B8 34 | Jump to address
	LDA				  ; BF 0E 22 D2 | Load from absolute long,X into accumulator
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5DD
; Address: $D4B4B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5DD:
	JSL $CA36BE		  ; 22 BE 36 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $34CE			; 4C CE 34 | Jump to address
	LDA $C1FD			; AD FD C1 | Load from absolute address into accumulator
	STA $3454			; 8D 54 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5E1
; Address: $D4B4D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5E1:
	JSL $CA352E		  ; 22 2E 35 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $34EE			; 4C EE 34 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5E4
; Address: $D4B4E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5E4:
	JSL $CA3558		  ; 22 58 35 CA | Jump to subroutine long
	JMP $352D			; 4C 2D 35 | Jump to address
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $3526			; 4C 26 35 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5E5
; Address: $D4B4FA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5E5:
	JSL $CA3543		  ; 22 43 35 CA | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3519			; 4C 19 35 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5E6
; Address: $D4B503
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5E6:
	JSL $CA35AB		  ; 22 AB 35 CA | Jump to subroutine long
	LDX $220E,Y		  ; BE 0E 22 | Load from absolute,Y into X register
	AND ($9F,X)		  ; 21 9F | Logical AND with accumulator ((zero page,X))
	CPY $D222			; CC 22 D2 | Compare Y register (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	DEX				  ; CA | Decrement X register
	JMP $3523			; 4C 23 35 | Jump to address
	LDA $000E,X		  ; BD 0E 00 | Load from absolute,X into accumulator
	LDY $220E,X		  ; BC 0E 22 | Load from absolute,X into Y register
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	AND $0035			; 2D 35 00 | Logical AND with accumulator (absolute)
	LDY $220E,X		  ; BC 0E 22 | Load from absolute,X into Y register
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA #$D3			 ; A9 D3 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3541			; 4C 41 35 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $3542			; 4C 42 35 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5E7
; Address: $D4B543
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5E7:
	LDA #$E4			 ; A9 E4 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3556			; 4C 56 35 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $3557			; 4C 57 35 | Jump to address
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5EA
; Address: $D4B55C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5EA:
	JSL $CCD6DC		  ; 22 DC D6 CC | Jump to subroutine long
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	CMP $342C			; CD 2C 34 | Compare accumulator (absolute)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $357A			; 4C 7A 35 | Jump to address
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	STA $3422			; 8D 22 34 | Store accumulator to absolute address
	JMP $3584			; 4C 84 35 | Jump to address
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	STA $3422			; 8D 22 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5ED
; Address: $D4B58C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5ED:
	JSL $CCD34E		  ; 22 4E D3 CC | Jump to subroutine long
	LDX $3422			; AE 22 34 | Load from absolute address into X register
	LDA $3424			; AD 24 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5F4
; Address: $D4B5B2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5F4:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $35CA			; 4C CA 35 | Jump to address
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $360C			; 4C 0C 36 | Jump to address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5F5
; Address: $D4B5CD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5F5:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $35E5			; 4C E5 35 | Jump to address
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $360C			; 4C 0C 36 | Jump to address
	LDA #$59			 ; A9 59 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5F7
; Address: $D4B5EE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5F7:
	JMP $3600			; 4C 00 36 | Jump to address
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $360C			; 4C 0C 36 | Jump to address
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5F9
; Address: $D4B610
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5F9:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3622			; 4C 22 36 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $3652			; 4C 52 36 | Jump to address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5FA
; Address: $D4B625
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5FA:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3637			; 4C 37 36 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $3652			; 4C 52 36 | Jump to address
	LDA #$59			 ; A9 59 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5FB
; Address: $D4B63A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5FB:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $364C			; 4C 4C 36 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $3652			; 4C 52 36 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5FD
; Address: $D4B656
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5FD:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3671			; 4C 71 36 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $366E			; 4C 6E 36 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $36BD			; 4C BD 36 | Jump to address
	JMP $36BC			; 4C BC 36 | Jump to address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5FE
; Address: $D4B674
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5FE:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $368F			; 4C 8F 36 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_5FF
; Address: $D4B67D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_5FF:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $368C			; 4C 8C 36 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $36BD			; 4C BD 36 | Jump to address
	JMP $36BC			; 4C BC 36 | Jump to address
	LDA #$59			 ; A9 59 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_600
; Address: $D4B692
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_600:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $36AD			; 4C AD 36 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $36AA			; 4C AA 36 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $36BD			; 4C BD 36 | Jump to address
	JMP $36BC			; 4C BC 36 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $36BC			; 4C BC 36 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $36BD			; 4C BD 36 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_602
; Address: $D4B6C1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_602:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $36DC			; 4C DC 36 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $36D9			; 4C D9 36 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $3728			; 4C 28 37 | Jump to address
	JMP $3727			; 4C 27 37 | Jump to address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_603
; Address: $D4B6DF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_603:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $36FA			; 4C FA 36 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $36F7			; 4C F7 36 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $3728			; 4C 28 37 | Jump to address
	JMP $3727			; 4C 27 37 | Jump to address
	LDA #$59			 ; A9 59 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_605
; Address: $D4B701
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_605:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $3718			; 4C 18 37 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3715			; 4C 15 37 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $3728			; 4C 28 37 | Jump to address
	JMP $3727			; 4C 27 37 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3727			; 4C 27 37 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $3728			; 4C 28 37 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_606
; Address: $D4B729
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_606:
	JMP $374A			; 4C 4A 37 | Jump to address
	CMP $0E			  ; C5 0E | Compare accumulator (zero page)
	JMP $3770			; 4C 70 37 | Jump to address
	DEC $0E			  ; C6 0E | Decrement (zero page)
	JMP $3770			; 4C 70 37 | Jump to address
	ASL $704C			; 0E 4C 70 | Arithmetic shift left (absolute)
	CPY $0E			  ; C4 0E | Compare Y register (zero page)
	JMP $3770			; 4C 70 37 | Jump to address
	LDY $4C0E,X		  ; BC 0E 4C | Load from absolute,X into Y register
	BVS $37			  ; 70 37 | Branch if overflow set
	LDA $3454			; AD 54 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $372C			; 4C 2C 37 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3732			; 4C 32 37 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3738			; 4C 38 37 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $373E			; 4C 3E 37 | Jump to address
	JMP $3744			; 4C 44 37 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_608
; Address: $D4B775
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_608:
	JMP $378C			; 4C 8C 37 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $37B2			; 4C B2 37 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $37B2			; 4C B2 37 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $37B2			; 4C B2 37 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_609
; Address: $D4B784
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_609:
	SEC				  ; 38 | Set carry flag
	JMP $37B2			; 4C B2 37 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $37B2			; 4C B2 37 | Jump to address
	LDA $C1FD			; AD FD C1 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3778			; 4C 78 37 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $377C			; 4C 7C 37 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3780			; 4C 80 37 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3784			; 4C 84 37 | Jump to address
	JMP $3788			; 4C 88 37 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_60B
; Address: $D4B7B8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_60B:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	STZ $01			  ; 64 01 | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_60D
; Address: $D4B7C2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_60D:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $37D1			; 4C D1 37 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_60E
; Address: $D4B7D6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_60E:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $384E			; 4C 4E 38 | Jump to address
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_611
; Address: $D4B811
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_611:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3820			; 4C 20 38 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_612
; Address: $D4B819
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_612:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $380E			; 4C 0E 38 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $382E			; 4C 2E 38 | Jump to address
	JMP $3860			; 4C 60 38 | Jump to address
	LDA #$19			 ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_615
; Address: $D4B839
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_615:
	JSL $CC7289		  ; 22 89 72 CC | Jump to subroutine long
	ADC $2209			; 6D 09 22 | Add with carry (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	REP #$4B			 ; C2 4B | Reset processor status bits
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3860			; 4C 60 38 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_619
; Address: $D4B869
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_619:
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3878			; 4C 78 38 | Jump to address
	JMP $3869			; 4C 69 38 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_61B
; Address: $D4B87D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_61B:
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $388E			; 4C 8E 38 | Jump to address
	ROR $4C09			; 6E 09 4C | Rotate right (absolute)
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_61C
; Address: $D4B891
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_61C:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	JMP $38AA			; 4C AA 38 | Jump to address
	ROR				  ; 6A | Rotate right (accumulator)
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_61D
; Address: $D4B8A0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_61D:
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	JMP ($4C09)		  ; 6C 09 4C | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_61E
; Address: $D4B8A8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_61E:
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	LDA $C141			; AD 41 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3898			; 4C 98 38 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $389E			; 4C 9E 38 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $38A4			; 4C A4 38 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_624
; Address: $D4B8EB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_624:
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)
	BVS $09			  ; 70 09 | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_625
; Address: $D4B8F1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_625:
	LDA $3558			; AD 58 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3914			; 4C 14 39 | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $390E			; 4C 0E 39 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	ORA ($39),Y		  ; 11 39 | Logical OR with accumulator ((zero page),Y)
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	AND $7100,Y		  ; 39 00 71 | Logical AND with accumulator (absolute,Y)
	ORA #$AD			 ; 09 AD | Logical OR with accumulator (immediate)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $392F			; 4C 2F 39 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_626
; Address: $D4B925
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_626:
	JSL $C78D7D		  ; 22 7D 8D C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	LDA $3562			; AD 62 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $397B			; 4C 7B 39 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_627
; Address: $D4B93B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_627:
	LDA $3558			; AD 58 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3952			; 4C 52 39 | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $A909,Y		  ; 79 09 A9 | Add with carry (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_628
; Address: $D4B952
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_628:
	JSL $CA39B3		  ; 22 B3 39 CA | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	BCC $9A			  ; 90 9A | Branch if carry clear
	LDA $C197			; AD 97 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	ORA #$AD			 ; 09 AD | Logical OR with accumulator (immediate)
	CMP ($C9,X)		  ; C1 C9 | Compare accumulator ((zero page,X))
	ROR $F000			; 6E 00 F0 | Rotate right (absolute)
	JMP $3978			; 4C 78 39 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_629
; Address: $D4B971
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_629:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	AND $5FAD,Y		  ; 39 AD 5F | Logical AND with accumulator (absolute,Y)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3992			; 4C 92 39 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	AND $64AD,Y		  ; 39 AD 64 | Logical AND with accumulator (absolute,Y)
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $39A9			; 4C A9 39 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	AND $02A9,Y		  ; 39 A9 02 | Logical AND with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $BE82			; 8D 82 BE | Store accumulator to absolute address
	LDA $358E			; AD 8E 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $39CD			; 4C CD 39 | Jump to address
	INC $BE81			; EE 81 BE | Increment (absolute)
	LDA $358E			; AD 8E 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_62A
; Address: $D4B9D5
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_62A:
	JMP $39DB			; 4C DB 39 | Jump to address
	INC $BE81			; EE 81 BE | Increment (absolute)
	LDA $3590			; AD 90 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $39E9			; 4C E9 39 | Jump to address
	INC $BE81			; EE 81 BE | Increment (absolute)
	LDA $3591			; AD 91 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $39F7			; 4C F7 39 | Jump to address
	INC $BE81			; EE 81 BE | Increment (absolute)
	LDA $3592			; AD 92 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A05			; 4C 05 3A | Jump to address
	INC $BE81			; EE 81 BE | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_62B
; Address: $D4BA06
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_62B:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A17			; 4C 17 3A | Jump to address
	BRA $09			  ; 80 09 | Branch always
	JMP $3A32			; 4C 32 3A | Jump to address
	ADC $2209,X		  ; 7D 09 22 | Add with carry (absolute,X)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $3A2F			; 4C 2F 3A | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	ROR $6B09,X		  ; 7E 09 6B | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_62D
; Address: $D4BA38
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_62D:
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_62E
; Address: $D4BA52
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_62E:
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$65			 ; A9 65 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$66			 ; A9 66 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$69			 ; A9 69 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_62F
; Address: $D4BA8D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_62F:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $66A9			; CD A9 66 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_630
; Address: $D4BA9F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_630:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $67A9			; CD A9 67 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_632
; Address: $D4BAB2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_632:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $7BA9			; CD A9 7B | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_633
; Address: $D4BABE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_633:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_634
; Address: $D4BAC4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_634:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $7AA9			; CD A9 7A | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_635
; Address: $D4BAD6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_635:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $7FA9			; CD A9 7F | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_636
; Address: $D4BAE8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_636:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $81A9			; CD A9 81 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_637
; Address: $D4BAFA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_637:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $82A9			; CD A9 82 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_638
; Address: $D4BB0C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_638:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $83A9			; CD A9 83 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_639
; Address: $D4BB1E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_639:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $84A9			; CD A9 84 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_63A
; Address: $D4BB30
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_63A:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	CMP $85A9			; CD A9 85 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_63B
; Address: $D4BB42
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_63B:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_63D
; Address: $D4BB4C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_63D:
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $3B70			; 4C 70 3B | Jump to address
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ROR $D000			; 6E 00 D0 | Rotate right (absolute)
	JMP $3B70			; 4C 70 3B | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_642
; Address: $D4BB82
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_642:
	JSL $C74414		  ; 22 14 44 C7 | Jump to subroutine long
	JMP $3B7F			; 4C 7F 3B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_645
; Address: $D4BB95
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_645:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3BAB			; 4C AB 3B | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_649
; Address: $D4BBB3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_649:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	EOR $2235			; 4D 35 22 | Exclusive OR with accumulator (absolute)
	SBC $CCD9,X		  ; FD D9 CC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_64C
; Address: $D4BBD0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_64C:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3BE1			; 4C E1 3B | Jump to address
	TAX				  ; AA | Transfer accumulator to X register
	JMP $3BE4			; 4C E4 3B | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_652
; Address: $D4BBFD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_652:
	JSL $C77656		  ; 22 56 76 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $C775,X		  ; 1E 75 C7 | Arithmetic shift left (absolute,X)
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_654
; Address: $D4BC0F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_654:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_659
; Address: $D4BC2A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_659:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CPX $CA7E			; EC 7E CA | Compare X register (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_65E
; Address: $D4BC45
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_65E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	ROR $6BCA,X		  ; 7E CA 6B | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_664
; Address: $D4BC67
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_664:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC $CAE3			; ED E3 CA | Subtract with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_669
; Address: $D4BC82
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_669:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_66A
; Address: $D4BC89
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_66A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	AND $CAE4			; 2D E4 CA | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_66F
; Address: $D4BCA7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_66F:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ASL $E4			  ; 06 E4 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_674
; Address: $D4BCC2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_674:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_679
; Address: $D4BCE0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_679:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_67A
; Address: $D4BCE7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_67A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	STX $CC09			; 8E 09 CC | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_680
; Address: $D4BD09
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_680:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ADC ($E7),Y		  ; 71 E7 | Add with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_681
; Address: $D4BD11
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_681:
	JSL $CDAC4F		  ; 22 4F AC CD | Jump to subroutine long
	LDA #$47			 ; A9 47 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_686
; Address: $D4BD38
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_686:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	EOR $CC0A,Y		  ; 59 0A CC | Exclusive OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_68E
; Address: $D4BD62
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_68E:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_694
; Address: $D4BD84
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_694:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_695
; Address: $D4BD8B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_695:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_69C
; Address: $D4BDB1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_69C:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LSR $7F			  ; 46 7F | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_69E
; Address: $D4BDBE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_69E:
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $E8			  ; 10 E8 | Branch if positive
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6A3
; Address: $D4BDDD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6A3:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ASL $CC0C,X		  ; 1E 0C CC | Arithmetic shift left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6AB
; Address: $D4BE07
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6AB:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6B1
; Address: $D4BE2D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6B1:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	JMP $22CA7F		  ; 5C 7F CA 22 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6B5
; Address: $D4BE52
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6B5:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6BD
; Address: $D4BE7C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6BD:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROR $7F			  ; 66 7F | Rotate right (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6BE
; Address: $D4BE83
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6BE:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6C8
; Address: $D4BEB7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6C8:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6C9
; Address: $D4BEBF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6C9:
	JSL $CDAC4F		  ; 22 4F AC CD | Jump to subroutine long
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6CD
; Address: $D4BEDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6CD:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BVS $7F			  ; 70 7F | Branch if overflow set
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6D2
; Address: $D4BEFA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6D2:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	INC $0F			  ; E6 0F | Increment (zero page)
	CPY $226B			; CC 6B 22 | Compare Y register (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	SBC $3B			  ; E5 3B | Subtract with carry (zero page)
	DEX				  ; CA | Decrement X register
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6D4
; Address: $D4BF11
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6D4:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6D5
; Address: $D4BF18
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6D5:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	CPY $A96B			; CC 6B A9 | Compare Y register (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6D6
; Address: $D4BF23
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6D6:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ROL $6B00			; 2E 00 6B | Rotate left (absolute)
	LDA #$11			 ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6D7
; Address: $D4BF2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6D7:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6D8
; Address: $D4BF39
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6D8:
	JSL $C773FE		  ; 22 FE 73 C7 | Jump to subroutine long
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6DE
; Address: $D4BF58
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6DE:
	JSL $CA3F41		  ; 22 41 3F CA | Jump to subroutine long
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6E3
; Address: $D4BF73
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6E3:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STX $7F			  ; 86 7F | Store X register to zero page
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6E4
; Address: $D4BF7A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6E4:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6E5
; Address: $D4BF88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6E5:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	BPL $CC			  ; 10 CC | Branch if positive
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6EA
; Address: $D4BFA5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6EA:
	JSL $C77656		  ; 22 56 76 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $C775,X		  ; 1E 75 C7 | Arithmetic shift left (absolute,X)
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6EF
; Address: $D4BFC9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6EF:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6F0
; Address: $D4BFD0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6F0:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6F6
; Address: $D4BFF2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6F6:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CAE3			; ED E3 CA | Subtract with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6FD
; Address: $D4C022
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6FD:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	AND $CAE4			; 2D E4 CA | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6FE
; Address: $D4C02A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6FE:
	JSL $CDAC4F		  ; 22 4F AC CD | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_6FF
; Address: $D4C036
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_6FF:
	JMP $403F			; 4C 3F 40 | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND $A935,X		  ; 3D 35 A9 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_707
; Address: $D4C061
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_707:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_709
; Address: $D4C06F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_709:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA $CAE1,Y		  ; 99 E1 CA | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_70D
; Address: $D4C090
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_70D:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_712
; Address: $D4C0B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_712:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	SBC ($CC,X)		  ; E1 CC | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_71B
; Address: $D4C0E3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_71B:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	CPY $226B			; CC 6B 22 | Compare Y register (absolute)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_723
; Address: $D4C111
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_723:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CMP #$4C			 ; C9 4C | Compare accumulator (immediate)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $226B			; CD 6B 22 | Compare accumulator (absolute)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_725
; Address: $D4C12E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_725:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_728
; Address: $D4C143
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_728:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	BRA $CA			  ; 80 CA | Branch always

;------------------------------------------------------------------------------
; Bank28_DmaFunction_729
; Address: $D4C14A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_729:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	LSR $22CC			; 4E CC 22 | Logical shift right (absolute)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	BVC $E1			  ; 50 E1 | Branch if overflow clear
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_72E
; Address: $D4C16F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_72E:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPY $53			  ; C4 53 | Compare Y register (zero page)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_72F
; Address: $D4C17D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_72F:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_735
; Address: $D4C198
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_735:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BVS $80			  ; 70 80 | Branch if overflow set
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_736
; Address: $D4C19F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_736:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPY $8922			; CC 22 89 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_739
; Address: $D4C1B5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_739:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $CA			  ; 80 CA | Branch always

;------------------------------------------------------------------------------
; Bank28_DmaFunction_73A
; Address: $D4C1BC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_73A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	EOR $22CC,Y		  ; 59 CC 22 | Exclusive OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_73B
; Address: $D4C1CA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_73B:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_740
; Address: $D4C1E4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_740:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	JMP $7B22CC		  ; 5C CC 22 7B | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_741
; Address: $D4C1FA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_741:
	JSL $CDAC59		  ; 22 59 AC CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ROL $A935,X		  ; 3E 35 A9 | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_744
; Address: $D4C20F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_744:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_746
; Address: $D4C21C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_746:
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($CAE1)		  ; 6C E1 CA | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_74B
; Address: $D4C244
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_74B:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $CAE1,Y		  ; 79 E1 CA | Add with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_74F
; Address: $D4C26E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_74F:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_750
; Address: $D4C284
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_750:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ROL $A935,X		  ; 3E 35 A9 | Rotate left (absolute,X)
	ORA $2200			; 0D 00 22 | Logical OR with accumulator (absolute)
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_751
; Address: $D4C291
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_751:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX #$81			 ; A2 81 | Load immediate value into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_754
; Address: $D4C2A6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_754:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PHB				  ; 8B | Push data bank register to stack
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_756
; Address: $D4C2AE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_756:
	JSL $CDAC59		  ; 22 59 AC CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ROL $A935,X		  ; 3E 35 A9 | Rotate left (absolute,X)
	ASL $2200			; 0E 00 22 | Arithmetic shift left (absolute)
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_75A
; Address: $D4C2D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_75A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	STA ($CA,X)		  ; 81 CA | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_75B
; Address: $D4C2DA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_75B:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $5122			; CD 22 51 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_75C
; Address: $D4C2E8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_75C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_76B
; Address: $D4C34B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_76B:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_76C
; Address: $D4C352
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_76C:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	STX $61			  ; 86 61 | Store X register to zero page
	CPY $8922			; CC 22 89 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_770
; Address: $D4C36C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_770:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_771
; Address: $D4C373
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_771:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $CAD7,X		  ; 1E D7 CA | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_772
; Address: $D4C381
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_772:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_777
; Address: $D4C3A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_777:
	JSL $C77656		  ; 22 56 76 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $C775,X		  ; 1E 75 C7 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_779
; Address: $D4C3B3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_779:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_780
; Address: $D4C3E1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_780:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDY $CD			  ; A4 CD | Load from zero page into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_783
; Address: $D4C3F6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_783:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4408			; 4C 08 44 | Jump to address
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_784
; Address: $D4C401
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_784:
	JSL $C7752B		  ; 22 2B 75 C7 | Jump to subroutine long
	JMP $440F			; 4C 0F 44 | Jump to address
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_787
; Address: $D4C416
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_787:
	JSL $C77656		  ; 22 56 76 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $C775,X		  ; 1E 75 C7 | Arithmetic shift left (absolute,X)
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_788
; Address: $D4C424
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_788:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_78C
; Address: $D4C43A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_78C:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BIT #$85			 ; 89 85 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_78D
; Address: $D4C441
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_78D:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BCC $E2			  ; 90 E2 | Branch if carry clear
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CAD6			; ED D6 CA | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_78F
; Address: $D4C456
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_78F:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR $CDA4,Y		  ; 59 A4 CD | Exclusive OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_797
; Address: $D4C482
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_797:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	STX $CA			  ; 86 CA | Store X register to zero page

;------------------------------------------------------------------------------
; Bank28_DmaFunction_798
; Address: $D4C489
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_798:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	LSR $F4			  ; 46 F4 | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_79A
; Address: $D4C494
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_79A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LSR $E1			  ; 46 E1 | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7A2
; Address: $D4C4C6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7A2:
	JSL $C77656		  ; 22 56 76 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $C775,X		  ; 1E 75 C7 | Arithmetic shift left (absolute,X)
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7A3
; Address: $D4C4D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7A3:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7A5
; Address: $D4C4E2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7A5:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	STX $CA			  ; 86 CA | Store X register to zero page

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7A7
; Address: $D4C4F0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7A7:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7B0
; Address: $D4C530
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7B0:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7B4
; Address: $D4C545
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7B4:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BCC $E2			  ; 90 E2 | Branch if carry clear
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7BB
; Address: $D4C572
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7BB:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	STX $CA			  ; 86 CA | Store X register to zero page

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7BC
; Address: $D4C579
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7BC:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LDA $E1			  ; A5 E1 | Load from zero page into accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7BD
; Address: $D4C581
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7BD:
	JSL $CC9912		  ; 22 12 99 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4590			; 4C 90 45 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$15			 ; A9 15 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7C1
; Address: $D4C59F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7C1:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA				  ; BF 86 CA 22 | Load from absolute long,X into accumulator
	ADC $C778			; 6D 78 C7 | Add with carry (absolute)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	TAX				  ; AA | Transfer accumulator to X register
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7C7
; Address: $D4C5DB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7C7:
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7CC
; Address: $D4C5F6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7CC:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7D2
; Address: $D4C61B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7D2:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $CAE1			; CD E1 CA | Compare accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7D7
; Address: $D4C639
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7D7:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7DC
; Address: $D4C650
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7DC:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDY #$87			 ; A0 87 | Load immediate value into Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7DD
; Address: $D4C657
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7DD:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7E4
; Address: $D4C688
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7E4:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7E5
; Address: $D4C69D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7E5:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7EC
; Address: $D4C6C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7EC:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7F1
; Address: $D4C6D9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7F1:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7F2
; Address: $D4C6E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7F2:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($E1),Y		  ; F1 E1 | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7F9
; Address: $D4C70C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7F9:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CAEB,X		  ; 3E EB CA | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7FA
; Address: $D4C71B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7FA:
	JSL $CC9C8F		  ; 22 8F 9C CC | Jump to subroutine long
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $473B			; 4C 3B 47 | Jump to address
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7FC
; Address: $D4C731
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7FC:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $974C			; CD 4C 97 | Compare accumulator (absolute)
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4757			; 4C 57 47 | Jump to address
	LDA #$27			 ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_7FE
; Address: $D4C74D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_7FE:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $974C			; CD 4C 97 | Compare accumulator (absolute)
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4773			; 4C 73 47 | Jump to address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_800
; Address: $D4C769
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_800:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $974C			; CD 4C 97 | Compare accumulator (absolute)
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $478C			; 4C 8C 47 | Jump to address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_802
; Address: $D4C785
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_802:
	JSL $CC9A1F		  ; 22 1F 9A CC | Jump to subroutine long
	JMP $4797			; 4C 97 47 | Jump to address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_805
; Address: $D4C797
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_805:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_808
; Address: $D4C7AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_808:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $88			  ; A6 88 | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_80B
; Address: $D4C7BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_80B:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_810
; Address: $D4C7D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_810:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	EOR ($8A),Y		  ; 51 8A | Exclusive OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_811
; Address: $D4C7DD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_811:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_812
; Address: $D4C7E4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_812:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_817
; Address: $D4C7FB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_817:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_81A
; Address: $D4C810
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_81A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_81E
; Address: $D4C824
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_81E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_822
; Address: $D4C839
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_822:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_827
; Address: $D4C850
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_827:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_82A
; Address: $D4C85F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_82A:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4872			; 4C 72 48 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_82D
; Address: $D4C876
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_82D:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_82E
; Address: $D4C87D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_82E:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	STA				  ; 9F A4 CD 22 | Store accumulator to absolute long,X
	SEI				  ; 78 | Set interrupt disable flag
	ROR $E5			  ; 66 E5 | Rotate right (zero page)
	CPY $5122			; CC 22 51 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank28_DmaFunction_82F
; Address: $D4C892
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_82F:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_834
; Address: $D4C8B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_834:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_83B
; Address: $D4C8CE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_83B:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC ($8B),Y		  ; F1 8B | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_83E
; Address: $D4C8E3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_83E:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	BIT $CAE2			; 2C E2 CA | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_842
; Address: $D4C8F6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_842:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BNE $8B			  ; D0 8B | Branch if not equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_845
; Address: $D4C90B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_845:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_849
; Address: $D4C91E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_849:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $492B			; 4C 2B 49 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_84C
; Address: $D4C92F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_84C:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STY $22CA			; 8C CA 22 | Store Y register to absolute address
	ADC $C778			; 6D 78 C7 | Add with carry (absolute)
	LDY $CD			  ; A4 CD | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_84D
; Address: $D4C93D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_84D:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	LDA #$E5			 ; A9 E5 | Load immediate value into accumulator
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_84E
; Address: $D4C94B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_84E:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_853
; Address: $D4C962
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_853:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	STY $22CA			; 8C CA 22 | Store Y register to absolute address
	ADC $C778			; 6D 78 C7 | Add with carry (absolute)
	LDA $CD			  ; A5 CD | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_854
; Address: $D4C970
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_854:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_859
; Address: $D4C987
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_859:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STY $22CA			; 8C CA 22 | Store Y register to absolute address
	ADC $C778			; 6D 78 C7 | Add with carry (absolute)
	LDA $CD			  ; A5 CD | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_85B
; Address: $D4C99C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_85B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$E2			 ; 42 E2 | Reserved instruction
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_862
; Address: $D4C9C2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_862:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STY $22CA			; 8C CA 22 | Store Y register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	INC $CC			  ; E6 CC | Increment (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_864
; Address: $D4C9D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_864:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ADC $E2			  ; 65 E2 | Add with carry (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_86E
; Address: $D4CA05
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_86E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $22CA			; 8D CA 22 | Store accumulator to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_872
; Address: $D4CA26
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_872:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STX $8D			  ; 86 8D | Store X register to zero page
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_873
; Address: $D4CA2D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_873:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	INC $CC			  ; E6 CC | Increment (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_875
; Address: $D4CA42
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_875:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_87A
; Address: $D4CA59
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_87A:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	STA $22CC99		  ; 8F 99 CC 22 | Store accumulator to absolute long address
	AND $CAE0,X		  ; 3D E0 CA | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_87B
; Address: $D4CA6D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_87B:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $22CA			; 8D CA 22 | Store accumulator to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$CA			 ; E2 CA | Set processor status bits

;------------------------------------------------------------------------------
; Bank28_DmaFunction_87C
; Address: $D4CA82
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_87C:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_880
; Address: $D4CA95
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_880:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STX $22CA			; 8E CA 22 | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_881
; Address: $D4CAA3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_881:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	JMP $22CAE2		  ; 5C E2 CA 22 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INC $6BCA			; EE CA 6B | Increment (absolute)
	LDA #$42			 ; A9 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank28_DmaFunction_887
; Address: $D4CAC9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_887:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $22CA			; 8E CA 22 | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_888
; Address: $D4CAD7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_888:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_88E
; Address: $D4CAF2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_88E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $8E			  ; A6 8E | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_890
; Address: $D4CB00
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_890:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LDX #$E2			 ; A2 E2 | Load immediate value into X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_895
; Address: $D4CB17
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_895:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC ($8E),Y		  ; F1 8E | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_89A
; Address: $D4CB33
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_89A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	STA $CAE2,Y		  ; 99 E2 CA | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_89E
; Address: $D4CB46
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_89E:
	JSL $CADEB1		  ; 22 B1 DE CA | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$29			 ; A2 29 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8A0
; Address: $D4CB54
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8A0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $5F22CA		  ; 8F CA 22 5F | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	LDX $CCE6,Y		  ; BE E6 CC | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8A1
; Address: $D4CB62
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8A1:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8A8
; Address: $D4CB88
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8A8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $6D22CA		  ; 8F CA 22 6D | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	STX $CDA2			; 8E A2 CD | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8AB
; Address: $D4CBA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8AB:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8B2
; Address: $D4CBC9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8B2:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LDY $CAE2,X		  ; BC E2 CA | Load from absolute,X into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8B8
; Address: $D4CBE4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8B8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BEQ $8F			  ; F0 8F | Branch if equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8BA
; Address: $D4CBF2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8BA:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CMP $E2			  ; C5 E2 | Compare accumulator (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8BF
; Address: $D4CC09
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8BF:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8C1
; Address: $D4CC17
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8C1:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC #$E6			 ; E9 E6 | Subtract with carry (immediate)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8C2
; Address: $D4CC25
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8C2:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEC $CAE2			; CE E2 CA | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8C7
; Address: $D4CC3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8C7:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	BCC $CA			  ; 90 CA | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8CC
; Address: $D4CC53
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8CC:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $CA90,X		  ; 9D 90 CA | Store accumulator to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8D3
; Address: $D4CC83
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8D3:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8D8
; Address: $D4CCA4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8D8:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8DA
; Address: $D4CCB4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8DA:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $8922			; CC 22 89 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $E2			  ; E4 E2 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8ED
; Address: $D4CD19
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8ED:
	JSL $CADEB1		  ; 22 B1 DE CA | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2B			 ; A2 2B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8EF
; Address: $D4CD27
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8EF:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STZ $91			  ; 64 91 | Store zero to zero page
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8F0
; Address: $D4CD2E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8F0:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $CAEA			; CD EA CA | Compare accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8F4
; Address: $D4CD57
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8F4:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BVS $91			  ; 70 91 | Branch if overflow set
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8F7
; Address: $D4CD6C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8F7:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$CA			 ; E2 CA | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8FD
; Address: $D4CD8E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8FD:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	STA ($CA),Y		  ; 91 CA | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank28_DmaFunction_8FE
; Address: $D4CD95
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_8FE:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_905
; Address: $D4CDBD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_905:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_90A
; Address: $D4CDD4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_90A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA ($CA),Y		  ; 91 CA | Store accumulator to (zero page),Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_910
; Address: $D4CDF5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_910:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ORA ($E3),Y		  ; 11 E3 | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_915
; Address: $D4CE0C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_915:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	AND ($92,X)		  ; 21 92 | Logical AND with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_916
; Address: $D4CE13
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_916:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_917
; Address: $D4CE28
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_917:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_91E
; Address: $D4CE4D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_91E:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	BIT $CAE3			; 2C E3 CA | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_923
; Address: $D4CE67
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_923:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_929
; Address: $D4CE8C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_929:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC ($CA),Y		  ; F1 CA | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_92A
; Address: $D4CE93
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_92A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_92B
; Address: $D4CE9B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_92B:
	JSL $CC9912		  ; 22 12 99 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4EAA			; 4C AA 4E | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_931
; Address: $D4CEC1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_931:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_934
; Address: $D4CED3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_934:
	JMP $22CCE7		  ; 5C E7 CC 22 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_93C
; Address: $D4CF03
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_93C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank28_DmaFunction_942
; Address: $D4CF25
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_942:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_943
; Address: $D4CF34
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_943:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4F45			; 4C 45 4F | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$71			 ; A9 71 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_947
; Address: $D4CF54
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_947:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_948
; Address: $D4CF5B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_948:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank28_DmaFunction_94A
; Address: $D4CF69
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_94A:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_94F
; Address: $D4CF87
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_94F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_950
; Address: $D4CF8E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_950:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_955
; Address: $D4CFAF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_955:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	JMP $CAE3			; 4C E3 CA | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_95C
; Address: $D4CFDB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_95C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $CAE3,Y		  ; 59 E3 CA | Exclusive OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_95D
; Address: $D4CFEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_95D:
	JSL $CC81D5		  ; 22 D5 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4FFB			; 4C FB 4F | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_960
; Address: $D4CFFE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_960:
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $500C			; 4C 0C 50 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	JMP $A935			; 4C 35 A9 | Jump to address
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_968
; Address: $D4D02E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_968:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_96A
; Address: $D4D03D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_96A:
	JSL $CC81D5		  ; 22 D5 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $504E			; 4C 4E 50 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_973
; Address: $D4D06C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_973:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF D7 CA 22 | Load from absolute long,X into accumulator
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_978
; Address: $D4D094
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_978:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BNE $E7			  ; D0 E7 | Branch if not equal
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_979
; Address: $D4D09D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_979:
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA $E3			  ; 85 E3 | Store accumulator to zero page
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_97A
; Address: $D4D0AA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_97A:
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $50BF			; 4C BF 50 | Jump to address
	LDA #$7B			 ; A9 7B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_97B
; Address: $D4D0B8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_97B:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	JMP $50C6			; 4C C6 50 | Jump to address
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_97F
; Address: $D4D0D6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_97F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_982
; Address: $D4D0EB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_982:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STX $CAE3			; 8E E3 CA | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_989
; Address: $D4D114
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_989:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_98A
; Address: $D4D11B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_98A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPY $8922			; CC 22 89 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_98F
; Address: $D4D139
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_98F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	EOR ($97,X)		  ; 41 97 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_990
; Address: $D4D140
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_990:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_996
; Address: $D4D165
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_996:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_99A
; Address: $D4D17F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_99A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_99B
; Address: $D4D186
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_99B:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $E8			  ; 10 E8 | Branch if positive
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	LDY $E3			  ; A4 E3 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9A0
; Address: $D4D1B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9A0:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9A1
; Address: $D4D1BE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9A1:
	SEI				  ; 78 | Set interrupt disable flag
	LDA #$E3			 ; A9 E3 | Load immediate value into accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9A7
; Address: $D4D1DA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9A7:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9AB
; Address: $D4D1FC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9AB:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BEQ $97			  ; F0 97 | Branch if equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9AE
; Address: $D4D211
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9AE:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9B4
; Address: $D4D233
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9B4:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9B5
; Address: $D4D23A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9B5:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $E3			  ; C4 E3 | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9BA
; Address: $D4D258
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9BA:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9BB
; Address: $D4D25F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9BB:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP #$E3			 ; C9 E3 | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9BF
; Address: $D4D279
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9BF:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9C1
; Address: $D4D287
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9C1:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	INX				  ; E8 | Increment X register
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9C2
; Address: $D4D295
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9C2:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9C8
; Address: $D4D2B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9C8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP ($98,X)		  ; C1 98 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9CA
; Address: $D4D2BE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9CA:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9D3
; Address: $D4D2F5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9D3:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9DA
; Address: $D4D324
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9DA:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $E8			  ; 64 E8 | Store zero to zero page
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CAE3			; ED E3 CA | Subtract with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9DF
; Address: $D4D350
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9DF:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $22CA,Y		  ; 99 CA 22 | Store accumulator to absolute,Y
	ADC $C778			; 6D 78 C7 | Add with carry (absolute)
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9E0
; Address: $D4D36C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9E0:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ASL $E4			  ; 06 E4 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9E6
; Address: $D4D387
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9E6:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDY $99			  ; A4 99 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9E8
; Address: $D4D395
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9E8:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC #$CC			 ; E9 CC | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9EE
; Address: $D4D3B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9EE:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BNE $99			  ; D0 99 | Branch if not equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9F0
; Address: $D4D3BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9F0:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	AND $CAE4			; 2D E4 CA | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9F5
; Address: $D4D3D5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9F5:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	STA $22CA,Y		  ; 99 CA 22 | Store accumulator to absolute,Y
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9F8
; Address: $D4D3F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9F8:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	STA $652200		  ; 8F 00 22 65 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9FC
; Address: $D4D40C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9FC:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_9FF
; Address: $D4D41A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_9FF:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	AND $CAE4			; 2D E4 CA | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A07
; Address: $D4D443
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A07:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	BIT $E4			  ; 24 E4 | Test bits in accumulator (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A0D
; Address: $D4D45E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A0D:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	AND ($9A),Y		  ; 31 9A | Logical AND with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A16
; Address: $D4D485
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A16:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A18
; Address: $D4D493
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A18:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A1E
; Address: $D4D4AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A1E:
	JSL $CC92BC		  ; 22 BC 92 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $54CC			; 4C CC 54 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A1F
; Address: $D4D4B7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A1F:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$F7			 ; A9 F7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A20
; Address: $D4D4C5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A20:
	JSL $C773FE		  ; 22 FE 73 C7 | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $54E6			; 4C E6 54 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $54E6			; 4C E6 54 | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A24
; Address: $D4D4EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A24:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A25
; Address: $D4D4F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A25:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ROR $E9			  ; 66 E9 | Rotate right (zero page)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A26
; Address: $D4D503
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A26:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A2C
; Address: $D4D521
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A2C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($E4),Y		  ; 51 E4 | Exclusive OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A34
; Address: $D4D550
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A34:
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A39
; Address: $D4D570
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A39:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A3C
; Address: $D4D585
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A3C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A42
; Address: $D4D5AA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A42:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($CAE4)		  ; 6C E4 CA | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A47
; Address: $D4D5CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A47:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	EOR ($A2),Y		  ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
	CMP $5F22			; CD 22 5F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CC			 ; E9 CC | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A48
; Address: $D4D5D9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A48:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	BMI $D8			  ; 30 D8 | Branch if negative
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A4E
; Address: $D4D5F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A4E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROL $9C			  ; 26 9C | Rotate left (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A50
; Address: $D4D601
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A50:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	STX $E4			  ; 86 E4 | Store X register to zero page
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A51
; Address: $D4D608
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A51:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A56
; Address: $D4D61F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A56:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STZ $22CA			; 9C CA 22 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA $22CAE4		  ; 8F E4 CA 22 | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A5A
; Address: $D4D647
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A5A:
	JSL $CADEB1		  ; 22 B1 DE CA | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$28			 ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A5C
; Address: $D4D655
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A5C:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STY $9C			  ; 84 9C | Store Y register to zero page
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A5E
; Address: $D4D663
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A5E:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$EA			 ; C0 EA | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A61
; Address: $D4D67E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A61:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	JMP $568C			; 4C 8C 56 | Jump to address
	LDA #$9C			 ; A9 9C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A65
; Address: $D4D694
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A65:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BCC $9C			  ; 90 9C | Branch if carry clear
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A68
; Address: $D4D6A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A68:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ADC $6BCB,X		  ; 7D CB 6B | Add with carry (absolute,X)
	LDA #$9E			 ; A9 9E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A6F
; Address: $D4D6D2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A6F:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $CA			  ; E4 CA | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A70
; Address: $D4D6D9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A70:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A77
; Address: $D4D6FB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A77:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A78
; Address: $D4D709
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A78:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LDA $E4			  ; A5 E4 | Load from zero page into accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A7D
; Address: $D4D720
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A7D:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	EOR ($9D,X)		  ; 41 9D | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A7E
; Address: $D4D727
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A7E:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A83
; Address: $D4D73E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A83:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BVC $9D			  ; 50 9D | Branch if overflow clear
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A84
; Address: $D4D745
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A84:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A89
; Address: $D4D75C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A89:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $22CA,X		  ; 9D CA 22 | Store accumulator to absolute,X
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A8F
; Address: $D4D781
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A8F:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A93
; Address: $D4D794
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A93:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $22CA,X		  ; 9D CA 22 | Store accumulator to absolute,X
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A94
; Address: $D4D7A2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A94:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC ($72),Y		  ; F1 72 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A99
; Address: $D4D7B9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A99:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $22CA,X		  ; 9D CA 22 | Store accumulator to absolute,X
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$EA			 ; E0 EA | Compare X register (immediate)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_A9E
; Address: $D4D7E5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_A9E:
	JSL $22CA9E		  ; 22 9E CA 22 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($E4),Y		  ; D1 E4 | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AA4
; Address: $D4D80A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AA4:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STZ $22CA,X		  ; 9E CA 22 | Store zero to absolute,X
	SEI				  ; 78 | Set interrupt disable flag
	SBC $EA			  ; E5 EA | Subtract with carry (zero page)
	CPY $A96B			; CC 6B A9 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AA9
; Address: $D4D82F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AA9:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA ($9E),Y		  ; B1 9E | Load from (zero page),Y into accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AAA
; Address: $D4D836
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AAA:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	XBA				  ; EB | Exchange accumulator bytes
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AAB
; Address: $D4D841
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AAB:
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEC $CAE4,X		  ; DE E4 CA | Decrement (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AB3
; Address: $D4D867
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AB3:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP ($9E),Y		  ; D1 9E | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AB5
; Address: $D4D875
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AB5:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPX $CA			  ; E4 CA | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AB6
; Address: $D4D87C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AB6:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	EOR $EB			  ; 45 EB | Exclusive OR with accumulator (zero page)
	CPY $A96B			; CC 6B A9 | Compare Y register (absolute)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ABC
; Address: $D4D89B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ABC:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP ($9F,X)		  ; C1 9F | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ABF
; Address: $D4D8B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ABF:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AC5
; Address: $D4D8CF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AC5:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SEP #$9F			 ; E2 9F | Set processor status bits
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AC7
; Address: $D4D8DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AC7:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ORA $E5			  ; 05 E5 | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ACC
; Address: $D4D8F4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ACC:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA				  ; 9F CA 22 7B | Store accumulator to absolute long,X
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $CAE5			; 0E E5 CA | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AD2
; Address: $D4D920
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AD2:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	LDA $EB			  ; A5 EB | Load from zero page into accumulator
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$74			 ; C0 74 | Compare Y register (immediate)
	CPY $8922			; CC 22 89 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AD8
; Address: $D4D949
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AD8:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ADB
; Address: $D4D95E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ADB:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $E5			  ; 24 E5 | Test bits in accumulator (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AE1
; Address: $D4D980
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AE1:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AE4
; Address: $D4D995
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AE4:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $E5			  ; 24 E5 | Test bits in accumulator (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AE7
; Address: $D4D9AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AE7:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AEB
; Address: $D4D9C4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AEB:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	AND $CAE5,X		  ; 3D E5 CA | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AEE
; Address: $D4D9DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AEE:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AF4
; Address: $D4D9F7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AF4:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AF7
; Address: $D4DA0D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AF7:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AFC
; Address: $D4DA2A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AFC:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_AFE
; Address: $D4DA3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_AFE:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B01
; Address: $D4DA4E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B01:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA ($CA,X)		  ; A1 CA | Load from (zero page,X) into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B03
; Address: $D4DA59
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B03:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5A86			; 4C 86 5A | Jump to address
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B05
; Address: $D4DA75
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B05:
	JSL $C773FE		  ; 22 FE 73 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C773,X		  ; FE 73 C7 | Increment (absolute,X)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5A98			; 4C 98 5A | Jump to address
	LDA #$BF			 ; A9 BF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B0D
; Address: $D4DABF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B0D:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B12
; Address: $D4DAD9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B12:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5AEF			; 4C EF 5A | Jump to address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B14
; Address: $D4DAEF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B14:
	JSL $CC915A		  ; 22 5A 91 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5B05			; 4C 05 5B | Jump to address
	LDA #$AA			 ; A9 AA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B15
; Address: $D4DAFB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B15:
	JSL $C773FE		  ; 22 FE 73 C7 | Jump to subroutine long
	JMP $5B0F			; 4C 0F 5B | Jump to address
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B1A
; Address: $D4DB1E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B1A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPY $C822			; CC 22 C8 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B1B
; Address: $D4DB29
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B1B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B1C
; Address: $D4DB30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B1C:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B24
; Address: $D4DB56
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B24:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B25
; Address: $D4DB6B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B25:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	XBA				  ; EB | Exchange accumulator bytes
	CPY $A96B			; CC 6B A9 | Compare Y register (absolute)
	LDA $2200,Y		  ; B9 00 22 | Load from absolute,Y into accumulator
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B28
; Address: $D4DB82
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B28:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	LDX #$CA			 ; A2 CA | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B29
; Address: $D4DB89
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B29:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B2A
; Address: $D4DB97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B2A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	SBC $CA			  ; E5 CA | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B2C
; Address: $D4DBA6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B2C:
	JSL $CC9912		  ; 22 12 99 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5BBB			; 4C BB 5B | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$BA			 ; A9 BA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B32
; Address: $D4DBD5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B32:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B34
; Address: $D4DBE3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B34:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC ($E5),Y		  ; F1 E5 | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B3A
; Address: $D4DC01
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B3A:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B3F
; Address: $D4DC18
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B3F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LSR $CAA3,X		  ; 5E A3 CA | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B43
; Address: $D4DC2B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B43:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B44
; Address: $D4DC32
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B44:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INC $CAE5,X		  ; FE E5 CA | Increment (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B48
; Address: $D4DC4C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B48:
	JSL $CADEB1		  ; 22 B1 DE CA | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2A			 ; A2 2A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B4C
; Address: $D4DC68
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B4C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$EA			 ; C0 EA | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B51
; Address: $D4DC86
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B51:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDY $CAA3			; AC A3 CA | Load from absolute address into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B56
; Address: $D4DCA0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B56:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	CMP $4322			; CD 22 43 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $CAA3			; CD A3 CA | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B58
; Address: $D4DCB5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B58:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B5C
; Address: $D4DCC8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B5C:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEC $22CA,X		  ; DE CA 22 | Decrement (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	INC				  ; 1A | Increment accumulator
	LDY $CA			  ; A4 CA | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B5E
; Address: $D4DCDD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B5E:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $E6			  ; 10 E6 | Branch if positive
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B64
; Address: $D4DCFF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B64:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	CMP $6422			; CD 22 64 | Compare accumulator (absolute)
	STA $22CC,Y		  ; 99 CC 22 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B65
; Address: $D4DD0C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B65:
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	LDY $CA			  ; A4 CA | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B68
; Address: $D4DD1F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B68:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	AND ($E6,X)		  ; 21 E6 | Logical AND with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B6D
; Address: $D4DD36
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B6D:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CPY $CAA4			; CC A4 CA | Compare Y register (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B73
; Address: $D4DD51
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B73:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	SBC ($DE,X)		  ; E1 DE | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B76
; Address: $D4DD66
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B76:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B7B
; Address: $D4DD84
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B7B:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	SBC ($DE,X)		  ; E1 DE | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B7D
; Address: $D4DD92
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B7D:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B7E
; Address: $D4DD9E
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B7E:
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B85
; Address: $D4DDBE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B85:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	EOR $EC			  ; 45 EC | Exclusive OR with accumulator (zero page)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B86
; Address: $D4DDCC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B86:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B8D
; Address: $D4DDF1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B8D:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B94
; Address: $D4DE16
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B94:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B99
; Address: $D4DE2D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B99:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC ($A5),Y		  ; F1 A5 | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_B9F
; Address: $D4DE4B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_B9F:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	LDX $CA			  ; A6 CA | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BA1
; Address: $D4DE60
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BA1:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	EOR $CAE6			; 4D E6 CA | Exclusive OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BA9
; Address: $D4DE8C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BA9:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BB0
; Address: $D4DEB1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BB0:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BB5
; Address: $D4DEC8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BB5:
	JSL $CC9990		  ; 22 90 99 CC | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5EDB			; 4C DB 5E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BB7
; Address: $D4DEDB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BB7:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5EEA			; 4C EA 5E | Jump to address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BB9
; Address: $D4DEEA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BB9:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BBC
; Address: $D4DEFD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BBC:
	CPX $22CC			; EC CC 22 | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BBD
; Address: $D4DF06
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BBD:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BC4
; Address: $D4DF2B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BC4:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	BRA $E6			  ; 80 E6 | Branch always
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BC8
; Address: $D4DF3E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BC8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ADC ($A7,X)		  ; 61 A7 | Add with carry ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BC9
; Address: $D4DF45
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BC9:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT #$E6			 ; 89 E6 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BCE
; Address: $D4DF63
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BCE:
	JSL $CC9990		  ; 22 90 99 CC | Jump to subroutine long
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BD1
; Address: $D4DF75
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BD1:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDA				  ; BF A5 CD 22 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BD2
; Address: $D4DF83
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BD2:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPX $22CC			; EC CC 22 | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHX				  ; DA | Push X register to stack
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BD4
; Address: $D4DF9C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BD4:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BD8
; Address: $D4DFB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BD8:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDA				  ; BF A5 CD 22 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BD9
; Address: $D4DFC0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BD9:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F E6 CA 6B | Store accumulator to absolute long,X
	LDA #$DC			 ; A9 DC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BDA
; Address: $D4DFD2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BDA:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BDE
; Address: $D4DFEB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BDE:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDA				  ; BF A5 CD 22 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BDF
; Address: $D4DFF9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BDF:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $CA			  ; E6 CA | Increment (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BE2
; Address: $D4E00B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BE2:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BE6
; Address: $D4E021
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BE6:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDA				  ; BF A5 CD 22 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BRA $A8			  ; 80 A8 | Branch always
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BE7
; Address: $D4E02F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BE7:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($E6),Y		  ; B1 E6 | Load from (zero page),Y into accumulator
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BEA
; Address: $D4E045
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BEA:
	JSL $CC9964		  ; 22 64 99 CC | Jump to subroutine long
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	LDX #$20			 ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BEE
; Address: $D4E05B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BEE:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDA				  ; BF A5 CD 22 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($A8,X)		  ; A1 A8 | Load from (zero page,X) into accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BF0
; Address: $D4E070
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BF0:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	TSX				  ; BA | Transfer stack pointer to X register
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BF2
; Address: $D4E082
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BF2:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $609B			; 4C 9B 60 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BF3
; Address: $D4E095
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BF3:
	INC $C773,X		  ; FE 73 C7 | Increment (absolute,X)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C773,X		  ; FE 73 C7 | Increment (absolute,X)
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BF6
; Address: $D4E0B3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BF6:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	LDA $CD			  ; A5 CD | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BF9
; Address: $D4E0C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BF9:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SEP #$EC			 ; E2 EC | Set processor status bits
	CPY $5122			; CC 22 51 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $CD			  ; 64 CD | Store zero to zero page

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BFA
; Address: $D4E0D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BFA:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ORA $DA			  ; 05 DA | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BFB
; Address: $D4E0DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BFB:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_BFF
; Address: $D4E0ED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_BFF:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$44			 ; A9 44 | Load immediate value into accumulator
	LDX #$0E			 ; A2 0E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C04
; Address: $D4E10A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C04:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C09
; Address: $D4E128
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C09:
	JSL $CADF6E		  ; 22 6E DF CA | Jump to subroutine long
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	LDX #$0E			 ; A2 0E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C0E
; Address: $D4E145
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C0E:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C15
; Address: $D4E16B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C15:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $A9			  ; 85 A9 | Store accumulator to zero page
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C16
; Address: $D4E172
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C16:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C1E
; Address: $D4E195
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C1E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	LDA #$CA			 ; A9 CA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C1F
; Address: $D4E19C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C1F:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ADC ($E7),Y		  ; 71 E7 | Add with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C27
; Address: $D4E1C2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C27:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C29
; Address: $D4E1D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C29:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	LDA $CCED,X		  ; BD ED CC | Load from absolute,X into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C2C
; Address: $D4E1DF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C2C:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$49			 ; A9 49 | Load immediate value into accumulator
	LDX #$15			 ; A2 15 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C31
; Address: $D4E1F9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C31:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C32
; Address: $D4E200
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C32:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C36
; Address: $D4E21A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C36:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	LDX #$15			 ; A2 15 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C3A
; Address: $D4E230
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C3A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C3B
; Address: $D4E237
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C3B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C40
; Address: $D4E255
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C40:
	JSL $CADE63		  ; 22 63 DE CA | Jump to subroutine long
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	LDX #$15			 ; A2 15 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C42
; Address: $D4E263
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C42:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C43
; Address: $D4E26A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C43:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C49
; Address: $D4E28C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C49:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C4B
; Address: $D4E29D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C4B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STY $CAE7			; 8C E7 CA | Store Y register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C51
; Address: $D4E2BF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C51:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	DEX				  ; CA | Decrement X register
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C54
; Address: $D4E2D7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C54:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA $CAE7,Y		  ; 99 E7 CA | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C58
; Address: $D4E2F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C58:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	DEX				  ; CA | Decrement X register
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C5B
; Address: $D4E302
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C5B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C5E
; Address: $D4E318
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C5E:
	JSL $CADEB9		  ; 22 B9 DE CA | Jump to subroutine long
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C60
; Address: $D4E326
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C60:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C61
; Address: $D4E32D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C61:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C65
; Address: $D4E347
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C65:
	JSL $CADEC1		  ; 22 C1 DE CA | Jump to subroutine long
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C67
; Address: $D4E355
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C67:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C68
; Address: $D4E35C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C68:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C6B
; Address: $D4E372
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C6B:
	JSL $CADEC1		  ; 22 C1 DE CA | Jump to subroutine long
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C6D
; Address: $D4E380
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C6D:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	PLB				  ; AB | Pull data bank register from stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C6F
; Address: $D4E38B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C6F:
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C76
; Address: $D4E3B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C76:
	JSL $CADEC9		  ; 22 C9 DE CA | Jump to subroutine long
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C79
; Address: $D4E3CA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C79:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C7A
; Address: $D4E3D1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C7A:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C81
; Address: $D4E3F7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C81:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	PLB				  ; AB | Pull data bank register from stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C83
; Address: $D4E405
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C83:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP #$E7			 ; C9 E7 | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C8C
; Address: $D4E439
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C8C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C93
; Address: $D4E470
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C93:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C97
; Address: $D4E48A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C97:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C9A
; Address: $D4E49C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C9A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ORA ($AC),Y		  ; 11 AC | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C9B
; Address: $D4E4A3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C9B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_C9D
; Address: $D4E4B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_C9D:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CA3
; Address: $D4E4D2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CA3:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CA5
; Address: $D4E4DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CA5:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CA7
; Address: $D4E4EE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CA7:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR $CADF			; 6E DF CA | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CA9
; Address: $D4E4FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CA9:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDY $22CA			; AC CA 22 | Load from absolute address into Y register
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CAA
; Address: $D4E50B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CAA:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CAD
; Address: $D4E51A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CAD:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CB1
; Address: $D4E533
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CB1:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CB3
; Address: $D4E545
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CB3:
	JSL $C77365		  ; 22 65 73 C7 | Jump to subroutine long
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CB7
; Address: $D4E55B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CB7:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	LDY $22CA			; AC CA 22 | Load from absolute address into Y register
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CBB
; Address: $D4E575
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CBB:
	JSL $CC9A3A		  ; 22 3A 9A CC | Jump to subroutine long
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CC0
; Address: $D4E58F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CC0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA $22CA			; AD CA 22 | Load from absolute address into accumulator
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	SBC #$E7			 ; E9 E7 | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CC5
; Address: $D4E5AD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CC5:
	JSL $CADF6E		  ; 22 6E DF CA | Jump to subroutine long
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	LDX #$16			 ; A2 16 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CC8
; Address: $D4E5BF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CC8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA $22CA			; AD CA 22 | Load from absolute address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CD1
; Address: $D4E5FD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CD1:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC $6BCC			; ED CC 6B | Subtract with carry (absolute)
	LDA #$FB			 ; A9 FB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CD4
; Address: $D4E610
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CD4:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	ROR $CADF			; 6E DF CA | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CD5
; Address: $D4E620
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CD5:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator
	LDX #$12			 ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CDA
; Address: $D4E640
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CDA:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CE0
; Address: $D4E662
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CE0:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	LDX #$12			 ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CE3
; Address: $D4E674
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CE3:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $22CA			; AE CA 22 | Load from absolute address into X register
	SEI				  ; 78 | Set interrupt disable flag
	INC $22CC			; EE CC 22 | Increment (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $CAD8			; CD D8 CA | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CE4
; Address: $D4E689
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CE4:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	BPL $E8			  ; 10 E8 | Branch if positive
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CE9
; Address: $D4E6A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CE9:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CEB
; Address: $D4E6B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CEB:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	LDX #$17			 ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CEF
; Address: $D4E6D0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CEF:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $22CA			; AE CA 22 | Load from absolute address into X register
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CF0
; Address: $D4E6DE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CF0:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CF3
; Address: $D4E6F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CF3:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	LDX #$17			 ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CF6
; Address: $D4E706
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CF6:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $22CA			; AE CA 22 | Load from absolute address into X register
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CF7
; Address: $D4E71C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CF7:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	LDX #$17			 ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_CFE
; Address: $D4E740
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_CFE:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	LDX #$17			 ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D01
; Address: $D4E752
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D01:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC ($AE,X)		  ; E1 AE | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D02
; Address: $D4E759
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D02:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D03
; Address: $D4E768
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D03:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D04
; Address: $D4E76F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D04:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	LDX #$17			 ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D08
; Address: $D4E785
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D08:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC #$AE			 ; E9 AE | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D09
; Address: $D4E78C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D09:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D0A
; Address: $D4E79B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D0A:
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D0B
; Address: $D4E7A2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D0B:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	LDX #$17			 ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D0F
; Address: $D4E7B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D0F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $22CA			; AE CA 22 | Load from absolute address into X register
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D10
; Address: $D4E7C3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D10:
	PLP				  ; 28 | Pull processor status from stack
	INC $22CC			; EE CC 22 | Increment (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D11
; Address: $D4E7D5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D11:
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D15
; Address: $D4E7E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D15:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D18
; Address: $D4E7FA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D18:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA $7B22CA		  ; AF CA 22 7B | Load from absolute long address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $CAE8			; 2C E8 CA | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D19
; Address: $D4E810
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D19:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D1C
; Address: $D4E81F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D1C:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D20
; Address: $D4E835
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D20:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA $7B22CA		  ; AF CA 22 7B | Load from absolute long address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D22
; Address: $D4E84B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D22:
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D25
; Address: $D4E85A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D25:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D29
; Address: $D4E870
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D29:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA $7B22CA		  ; AF CA 22 7B | Load from absolute long address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $CAE8			; 2C E8 CA | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D2A
; Address: $D4E886
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D2A:
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D2C
; Address: $D4E891
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D2C:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D30
; Address: $D4E8AA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D30:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $CAE8			; 2C E8 CA | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D31
; Address: $D4E8B9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D31:
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D33
; Address: $D4E8C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D33:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D38
; Address: $D4E8E1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D38:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D3A
; Address: $D4E8F0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D3A:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D3B
; Address: $D4E8F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D3B:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D3F
; Address: $D4E90D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D3F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BCS $CA			  ; B0 CA | Branch if carry set

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D41
; Address: $D4E91B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D41:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D42
; Address: $D4E922
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D42:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D43
; Address: $D4E92A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D43:
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D46
; Address: $D4E939
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D46:
	JSL $CC998F		  ; 22 8F 99 CC | Jump to subroutine long
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D4B
; Address: $D4E956
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D4B:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	LDX $CD			  ; A6 CD | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D4C
; Address: $D4E95D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D4C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D4D
; Address: $D4E96B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D4D:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	AND $CCEE			; 2D EE CC | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D54
; Address: $D4E98D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D54:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($E8,X)		  ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D55
; Address: $D4E99B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D55:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BEQ $96			  ; F0 96 | Branch if equal
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D57
; Address: $D4E9AE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D57:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	LDX #$2D			 ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D5B
; Address: $D4E9C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D5B:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	BCS $CA			  ; B0 CA | Branch if carry set

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D5C
; Address: $D4E9CB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D5C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D5D
; Address: $D4E9DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D5D:
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D5E
; Address: $D4E9E1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D5E:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	LDX #$2D			 ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D63
; Address: $D4E9FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D63:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D64
; Address: $D4EA0A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D64:
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D65
; Address: $D4EA0D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D65:
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D66
; Address: $D4EA14
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D66:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	LDX #$2D			 ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D6A
; Address: $D4EA2D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D6A:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D6B
; Address: $D4EA3C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D6B:
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D6C
; Address: $D4EA43
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D6C:
	JSL $CC9A3A		  ; 22 3A 9A CC | Jump to subroutine long
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D70
; Address: $D4EA5C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D70:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D71
; Address: $D4EA6B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D71:
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D74
; Address: $D4EA7A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D74:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D7A
; Address: $D4EA9B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D7A:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D7D
; Address: $D4EAAA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D7D:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	ROR $CADF			; 6E DF CA | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D7E
; Address: $D4EABA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D7E:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$65			 ; A9 65 | Load immediate value into accumulator
	LDX #$12			 ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D81
; Address: $D4EACF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D81:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D82
; Address: $D4EADE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D82:
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D83
; Address: $D4EAE5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D83:
	JSL $CC9A52		  ; 22 52 9A CC | Jump to subroutine long
	LDA #$66			 ; A9 66 | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D85
; Address: $D4EAF3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D85:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BVS $B1			  ; 70 B1 | Branch if overflow set
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D86
; Address: $D4EAFB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D86:
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D89
; Address: $D4EB0D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D89:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT #$E6			 ; 89 E6 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D8A
; Address: $D4EB1C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D8A:
	LDA #$13			 ; A9 13 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D8D
; Address: $D4EB2B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D8D:
	JSL $CADF6E		  ; 22 6E DF CA | Jump to subroutine long
	LDA #$65			 ; A9 65 | Load immediate value into accumulator
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D91
; Address: $D4EB47
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D91:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA $CAE7,Y		  ; 99 E7 CA | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D92
; Address: $D4EB56
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D92:
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D95
; Address: $D4EB65
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D95:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP ($B1),Y		  ; D1 B1 | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D96
; Address: $D4EB6C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D96:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D97
; Address: $D4EB7B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D97:
	LDA #$15			 ; A9 15 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D9A
; Address: $D4EB8D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D9A:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D9B
; Address: $D4EB9C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D9B:
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D9E
; Address: $D4EBAE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D9E:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	PEA #$22CA		   ; F4 CA 22 | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $EA			  ; E4 EA | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_D9F
; Address: $D4EBC4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_D9F:
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DA3
; Address: $D4EBDD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DA3:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	JMP $22CAB2		  ; 5C B2 CA 22 | Jump to address long
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DA4
; Address: $D4EBEC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DA4:
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DA5
; Address: $D4EBF3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DA5:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	CMP $8122			; CD 22 81 | Compare accumulator (absolute)
	STA $22CC,Y		  ; 99 CC 22 | Store accumulator to absolute,Y
	STZ $99			  ; 64 99 | Store zero to zero page
	CPY $4322			; CC 22 43 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DA6
; Address: $D4EC09
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DA6:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DA8
; Address: $D4EC17
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DA8:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX $CA			  ; E4 CA | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DA9
; Address: $D4EC1F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DA9:
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DAA
; Address: $D4EC26
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DAA:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	CMP $4322			; CD 22 43 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DAC
; Address: $D4EC38
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DAC:
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DAD
; Address: $D4EC43
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DAD:
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DB2
; Address: $D4EC5D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DB2:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	LSR $CAE8			; 4E E8 CA | Logical shift right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DB3
; Address: $D4EC6C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DB3:
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DBB
; Address: $D4EC95
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DBB:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DBC
; Address: $D4EC9D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DBC:
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DC1
; Address: $D4ECBA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DC1:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DC2
; Address: $D4ECC1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DC2:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DC4
; Address: $D4ECC9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DC4:
	LDA #$1D			 ; A9 1D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DC9
; Address: $D4ECE6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DC9:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	AND ($B3),Y		  ; 31 B3 | Logical AND with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DCA
; Address: $D4ECED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DCA:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DCB
; Address: $D4ECF5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DCB:
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DD0
; Address: $D4ED12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DD0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DD1
; Address: $D4ED19
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DD1:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ADC $CAE8			; 6D E8 CA | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DD2
; Address: $D4ED21
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DD2:
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DD6
; Address: $D4ED34
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DD6:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROR $CAB3			; 6E B3 CA | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DD7
; Address: $D4ED3C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DD7:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DDE
; Address: $D4ED61
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DDE:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DDF
; Address: $D4ED69
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DDF:
	LDA #$21			 ; A9 21 | PPU graphics register access
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DE4
; Address: $D4ED80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DE4:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC $B3			  ; E5 B3 | Subtract with carry (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DE6
; Address: $D4ED8E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DE6:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DE7
; Address: $D4ED96
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DE7:
	LDA #$22			 ; A9 22 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DED
; Address: $D4EDB1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DED:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DEE
; Address: $D4EDB8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DEE:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DEF
; Address: $D4EDC7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DEF:
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DF8
; Address: $D4EDF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DF8:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPX $6BCC			; EC CC 6B | Compare X register (absolute)
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DFD
; Address: $D4EE1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DFD:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	STZ $CAE8,X		  ; 9E E8 CA | Store zero to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_DFE
; Address: $D4EE23
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_DFE:
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E04
; Address: $D4EE44
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E04:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E05
; Address: $D4EE4C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E05:
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E09
; Address: $D4EE5F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E09:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA				  ; 9F B4 CA 22 | Store accumulator to absolute long,X
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E0A
; Address: $D4EE6D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E0A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LDY $CAE8,X		  ; BC E8 CA | Load from absolute,X into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E0B
; Address: $D4EE75
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E0B:
	LDA #$27			 ; A9 27 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E0F
; Address: $D4EE8B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E0F:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	EOR ($DA,X)		  ; 41 DA | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E10
; Address: $D4EE92
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E10:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CMP ($E8,X)		  ; C1 E8 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E11
; Address: $D4EE9A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E11:
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E17
; Address: $D4EEB8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E17:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E18
; Address: $D4EEC6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E18:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E19
; Address: $D4EECE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E19:
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E1F
; Address: $D4EEEC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E1F:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E20
; Address: $D4EEFB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E20:
	LDA #$2A			 ; A9 2A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E25
; Address: $D4EF15
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E25:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E26
; Address: $D4EF24
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E26:
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E2C
; Address: $D4EF3F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E2C:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ADC #$B5			 ; 69 B5 | Add with carry (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E2D
; Address: $D4EF46
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E2D:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	SBC $22CC			; ED CC 22 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E2E
; Address: $D4EF62
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E2E:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	ASL $CDA3,X		  ; 1E A3 CD | Arithmetic shift left (absolute,X)
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E31
; Address: $D4EF74
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E31:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E32
; Address: $D4EF7C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E32:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E38
; Address: $D4EF9F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E38:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$E8			 ; E9 E8 | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E39
; Address: $D4EFAE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E39:
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E3D
; Address: $D4EFC1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E3D:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA ($B5,X)		  ; A1 B5 | Load from (zero page,X) into accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E3E
; Address: $D4EFC8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E3E:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E3F
; Address: $D4EFD7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E3F:
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E44
; Address: $D4EFEE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E44:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BNE $B5			  ; D0 B5 | Branch if not equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E46
; Address: $D4EFFC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E46:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E47
; Address: $D4F00B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E47:
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E4B
; Address: $D4F01E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E4B:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E4C
; Address: $D4F025
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E4C:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E4E
; Address: $D4F038
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E4E:
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E56
; Address: $D4F05A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E56:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E58
; Address: $D4F069
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E58:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E60
; Address: $D4F095
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E60:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC $22CC			; ED CC 22 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	AND #$E9			 ; 29 E9 | Logical AND with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E61
; Address: $D4F0AB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E61:
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E62
; Address: $D4F0B2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E62:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E67
; Address: $D4F0CE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E67:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BRA $B6			  ; 80 B6 | Branch always
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E69
; Address: $D4F0DC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E69:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CAE9			; 2E E9 CA | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E6A
; Address: $D4F0EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E6A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ROR $CCED			; 6E ED CC | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E6B
; Address: $D4F0F2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E6B:
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E6D
; Address: $D4F100
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E6D:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($77),Y		  ; 91 77 | Store accumulator to (zero page),Y
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E70
; Address: $D4F11D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E70:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BCC $ED			  ; 90 ED | Branch if carry clear
	CPY $7B22			; CC 22 7B | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E71
; Address: $D4F133
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E71:
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E74
; Address: $D4F142
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E74:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E7A
; Address: $D4F163
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E7A:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E7B
; Address: $D4F172
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E7B:
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E7D
; Address: $D4F183
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E7D:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E81
; Address: $D4F199
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E81:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E83
; Address: $D4F1A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E83:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E84
; Address: $D4F1AC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E84:
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E86
; Address: $D4F1BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E86:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$47			 ; A9 47 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E8A
; Address: $D4F1D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E8A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA ($B7,X)		  ; 81 B7 | Store accumulator to (zero page,X)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E8C
; Address: $D4F1DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E8C:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	STY $E9			  ; 84 E9 | Store Y register to zero page
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E8D
; Address: $D4F1E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E8D:
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E92
; Address: $D4F203
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E92:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E93
; Address: $D4F20B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E93:
	LDA #$39			 ; A9 39 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E99
; Address: $D4F229
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E99:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BIT #$E9			 ; 89 E9 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E9A
; Address: $D4F237
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E9A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	INC $6BCC			; EE CC 6B | Increment (absolute)
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E9C
; Address: $D4F24A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E9C:
	JSL $CC997C		  ; 22 7C 99 CC | Jump to subroutine long
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_E9E
; Address: $D4F258
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_E9E:
	JSL $CADF6E		  ; 22 6E DF CA | Jump to subroutine long
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	LDX #$18			 ; A2 18 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EA3
; Address: $D4F272
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EA3:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ADC #$B8			 ; 69 B8 | Add with carry (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EA4
; Address: $D4F279
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EA4:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EA9
; Address: $D4F297
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EA9:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	LDX #$1A			 ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EAD
; Address: $D4F2AD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EAD:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $B8			  ; A6 B8 | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EAE
; Address: $D4F2B4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EAE:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	LDY $E9			  ; A4 E9 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EAF
; Address: $D4F2C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EAF:
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EB2
; Address: $D4F2D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EB2:
	JSL $CADE89		  ; 22 89 DE CA | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	LDX #$1A			 ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EB5
; Address: $D4F2EA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EB5:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDA $6BCA,Y		  ; B9 CA 6B | Load from absolute,Y into accumulator
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EB7
; Address: $D4F303
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EB7:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	LDX #$1A			 ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EBA
; Address: $D4F315
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EBA:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SBC ($B9,X)		  ; E1 B9 | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EBB
; Address: $D4F31D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EBB:
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EBE
; Address: $D4F32E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EBE:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	LDX #$1A			 ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EC1
; Address: $D4F340
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EC1:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TSX				  ; BA | Transfer stack pointer to X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EC2
; Address: $D4F348
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EC2:
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EC4
; Address: $D4F359
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EC4:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	LDX #$1A			 ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EC7
; Address: $D4F36B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EC7:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP $CABA			; CD BA CA | Compare accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EC8
; Address: $D4F373
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EC8:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ECA
; Address: $D4F384
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ECA:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	LDX #$1A			 ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ECD
; Address: $D4F396
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ECD:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ECE
; Address: $D4F39E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ECE:
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ED2
; Address: $D4F3B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ED2:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator
	LDX #$1B			 ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ED6
; Address: $D4F3CA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ED6:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BVC $BB			  ; 50 BB | Branch if overflow clear
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ED7
; Address: $D4F3D1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ED7:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ED8
; Address: $D4F3DF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ED8:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_ED9
; Address: $D4F3E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_ED9:
	LDA #$42			 ; A9 42 | Hardware register operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EDB
; Address: $D4F3F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EDB:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator
	LDX #$1B			 ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EE0
; Address: $D4F415
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EE0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EE4
; Address: $D4F42B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EE4:
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EE6
; Address: $D4F43C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EE6:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator
	LDX #$1B			 ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EE9
; Address: $D4F44E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EE9:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CPY #$BB			 ; C0 BB | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EEB
; Address: $D4F45C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EEB:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	AND $EF			  ; 25 EF | Logical AND with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EEC
; Address: $D4F464
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EEC:
	LDA #$44			 ; A9 44 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EEE
; Address: $D4F475
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EEE:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator
	LDX #$1B			 ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EF2
; Address: $D4F48E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EF2:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LDX $CAE9,Y		  ; BE E9 CA | Load from absolute,Y into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EF3
; Address: $D4F496
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EF3:
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EF6
; Address: $D4F4AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EF6:
	JSL $CADEA1		  ; 22 A1 DE CA | Jump to subroutine long
	LDA #$5F			 ; A9 5F | Load immediate value into accumulator
	LDX #$1B			 ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EF8
; Address: $D4F4B9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EF8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA				  ; BF BC CA 6B | Load from absolute long,X into accumulator
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EFA
; Address: $D4F4CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EFA:
	JSL $CC996F		  ; 22 6F 99 CC | Jump to subroutine long
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EFD
; Address: $D4F4DE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EFD:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	LDA $22CA,X		  ; BD CA 22 | Load from absolute,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_EFF
; Address: $D4F4F6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_EFF:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F01
; Address: $D4F505
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F01:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F05
; Address: $D4F51B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F05:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA $22CA,X		  ; BD CA 22 | Load from absolute,X into accumulator
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	CPY $CAE9			; CC E9 CA | Compare Y register (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F06
; Address: $D4F52A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F06:
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F08
; Address: $D4F53B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F08:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F0C
; Address: $D4F551
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F0C:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $22CA,Y		  ; BE CA 22 | Load from absolute,Y into X register
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	CMP ($E9),Y		  ; D1 E9 | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F0D
; Address: $D4F560
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F0D:
	LDA #$49			 ; A9 49 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F0F
; Address: $D4F571
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F0F:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F13
; Address: $D4F587
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F13:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $22CA,Y		  ; BE CA 22 | Load from absolute,Y into X register
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F14
; Address: $D4F595
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F14:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F16
; Address: $D4F59D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F16:
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F18
; Address: $D4F5AE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F18:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$4C			 ; A9 4C | Load immediate value into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F1B
; Address: $D4F5C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F1B:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA				  ; BF CA 22 89 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F1C
; Address: $D4F5CE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F1C:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F1D
; Address: $D4F5D6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F1D:
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F22
; Address: $D4F5F6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F22:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F23
; Address: $D4F5FE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F23:
	LDA #$4C			 ; A9 4C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F25
; Address: $D4F609
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F25:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F27
; Address: $D4F61F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F27:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F2D
; Address: $D4F640
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F2D:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	CPX #$E9			 ; E0 E9 | Compare X register (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F2F
; Address: $D4F648
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F2F:
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F32
; Address: $D4F660
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F32:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F36
; Address: $D4F676
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F36:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDA $22CAC0		  ; AF C0 CA 22 | Load from absolute long address into accumulator
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	SBC $CAE9			; ED E9 CA | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F38
; Address: $D4F68C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F38:
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F3B
; Address: $D4F6A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F3B:
	JSL $C7773F		  ; 22 3F 77 C7 | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F42
; Address: $D4F6D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F42:
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F46
; Address: $D4F6EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F46:
	JSL $CADFC8		  ; 22 C8 DF CA | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F4C
; Address: $D4F714
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F4C:
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F4E
; Address: $D4F725
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F4E:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F51
; Address: $D4F737
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F51:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ROL $C2			  ; 26 C2 | Rotate left (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F52
; Address: $D4F73E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F52:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	INC $22CC			; EE CC 22 | Increment (absolute)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F53
; Address: $D4F74D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F53:
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F54
; Address: $D4F754
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F54:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	CMP $F9A9			; CD A9 F9 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F56
; Address: $D4F765
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F56:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F59
; Address: $D4F777
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F59:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	REP #$CA			 ; C2 CA | Reset processor status bits

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F5A
; Address: $D4F77E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F5A:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ORA ($EA,X)		  ; 01 EA | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F5D
; Address: $D4F78D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F5D:
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F5E
; Address: $D4F794
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F5E:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	CMP $F9A9			; CD A9 F9 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F60
; Address: $D4F7A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F60:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F63
; Address: $D4F7BA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F63:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	ASL $EA			  ; 06 EA | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F64
; Address: $D4F7C2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F64:
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F65
; Address: $D4F7C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F65:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	CMP $F9A9			; CD A9 F9 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F67
; Address: $D4F7DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F67:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F69
; Address: $D4F7E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F69:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CPX $C2			  ; E4 C2 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F6A
; Address: $D4F7F0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F6A:
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F6B
; Address: $D4F7F7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F6B:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	CMP $F9A9			; CD A9 F9 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F6D
; Address: $D4F808
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F6D:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F6F
; Address: $D4F816
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F6F:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ORA $CAC3			; 0D C3 CA | Logical OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F77
; Address: $D4F842
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F77:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F78
; Address: $D4F850
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F78:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F7A
; Address: $D4F863
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F7A:
	JSL $CC9964		  ; 22 64 99 CC | Jump to subroutine long
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPX $74			  ; E4 74 | Compare X register (zero page)
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	ORA $2201,Y		  ; 19 01 22 | Logical OR with accumulator (absolute,Y)
	CPX $74			  ; E4 74 | Compare X register (zero page)
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPX $74			  ; E4 74 | Compare X register (zero page)
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F7E
; Address: $D4F89A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F7E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	EOR $CAC3,X		  ; 5D C3 CA | Exclusive OR with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F7F
; Address: $D4F8A2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F7F:
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F80
; Address: $D4F8A9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F80:
	JSL $CC9964		  ; 22 64 99 CC | Jump to subroutine long
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F83
; Address: $D4F8BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F83:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F84
; Address: $D4F8C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F84:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP $CAC3,Y		  ; D9 C3 CA | Compare accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F85
; Address: $D4F8CA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F85:
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F87
; Address: $D4F8D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F87:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ORA $CAC4,Y		  ; 19 C4 CA | Logical OR with accumulator (absolute,Y)
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F89
; Address: $D4F8E7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F89:
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F8C
; Address: $D4F8F9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F8C:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ASL $F3			  ; 06 F3 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F8F
; Address: $D4F911
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F8F:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	SBC #$CA			 ; E9 CA | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F90
; Address: $D4F919
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F90:
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F92
; Address: $D4F924
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F92:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	BRA $C4			  ; 80 C4 | Branch always
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F93
; Address: $D4F92B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F93:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F95
; Address: $D4F93D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F95:
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F97
; Address: $D4F948
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F97:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	AND #$C5			 ; 29 C5 | Logical AND with accumulator (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F9A
; Address: $D4F95A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F9A:
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank28_DmaFunction_F9E
; Address: $D4F973
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_F9E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LSR $C5			  ; 46 C5 | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FA0
; Address: $D4F985
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FA0:
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FA5
; Address: $D4F9A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FA5:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BPL $F3			  ; 10 F3 | Branch if positive
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FA6
; Address: $D4F9AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FA6:
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FAB
; Address: $D4F9CD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FAB:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $CA			  ; C5 CA | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FAC
; Address: $D4F9D4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FAC:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $6BCA,Y		  ; D9 CA 6B | Compare accumulator (absolute,Y)
	LDA #$5F			 ; A9 5F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FB0
; Address: $D4F9EF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FB0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register
	DEX				  ; CA | Decrement X register
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	LDX #$26			 ; A2 26 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FB2
; Address: $D4FA00
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FB2:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $EA			  ; 10 EA | Branch if positive
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FB3
; Address: $D4FA0F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FB3:
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FB5
; Address: $D4FA1A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FB5:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	LDX #$26			 ; A2 26 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FB8
; Address: $D4FA2F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FB8:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ORA $CAEA,Y		  ; 19 EA CA | Logical OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FB9
; Address: $D4FA3E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FB9:
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A57			; 4C 57 7A | Jump to address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FBA
; Address: $D4FA50
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FBA:
	JSL $CADDEA		  ; 22 EA DD CA | Jump to subroutine long
	JMP $7A5E			; 4C 5E 7A | Jump to address
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FC0
; Address: $D4FA75
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FC0:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FC1
; Address: $D4FA80
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FC1:
	JSL $6BCAEA		  ; 22 EA CA 6B | Jump to subroutine long
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FC6
; Address: $D4FAA1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FC6:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FC7
; Address: $D4FAA9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FC7:
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FCA
; Address: $D4FABB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FCA:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$EA			 ; 49 EA | Exclusive OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FCB
; Address: $D4FAC9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FCB:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	ADC $01			  ; 65 01 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FCF
; Address: $D4FAE0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FCF:
	JSL $CADF2B		  ; 22 2B DF CA | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FD4
; Address: $D4FB00
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FD4:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FD6
; Address: $D4FB0E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FD6:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	CMP $00A9			; CD A9 00 | Compare accumulator (absolute)
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FD7
; Address: $D4FB1C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FD7:
	LDA #$66			 ; A9 66 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FDC
; Address: $D4FB39
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FDC:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FDD
; Address: $D4FB41
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FDD:
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FE0
; Address: $D4FB50
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FE0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FE2
; Address: $D4FB5E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FE2:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FE3
; Address: $D4FB65
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FE3:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	LDX #$2A			 ; A2 2A | Load immediate value into X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FE4
; Address: $D4FB6D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FE4:
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FE6
; Address: $D4FB78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FE6:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FEB
; Address: $D4FB98
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FEB:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FEC
; Address: $D4FBA6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FEC:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	CMP $2A			  ; C5 2A | Compare accumulator (zero page)
	DEX				  ; CA | Decrement X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FED
; Address: $D4FBB4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FED:
	LDA #$69			 ; A9 69 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FF0
; Address: $D4FBC6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FF0:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FF1
; Address: $D4FBD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FF1:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BCS $2C			  ; B0 2C | Branch if carry set
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FF2
; Address: $D4FBDC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FF2:
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FF5
; Address: $D4FBEB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FF5:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FFA
; Address: $D4FC0B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FFA:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FFB
; Address: $D4FC19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FFB:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	BIT $A9CA			; 2C CA A9 | Test bits in accumulator (absolute)
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FFD
; Address: $D4FC27
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FFD:
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_FFF
; Address: $D4FC32
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_FFF:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1003
; Address: $D4FC4B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1003:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	LDX $C7			  ; A6 C7 | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1004
; Address: $D4FC52
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1004:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1005
; Address: $D4FC60
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1005:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ROL $A9CA			; 2E CA A9 | Rotate left (absolute)
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1006
; Address: $D4FC6E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1006:
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1009
; Address: $D4FC80
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1009:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_100A
; Address: $D4FC8E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_100A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	ROL $6BCA			; 2E CA 6B | Rotate left (absolute)
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_100D
; Address: $D4FCA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_100D:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1011
; Address: $D4FCBE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1011:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1012
; Address: $D4FCC5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1012:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1013
; Address: $D4FCD3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1013:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEC $CA2E			; CE 2E CA | Decrement (absolute)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1014
; Address: $D4FCE1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1014:
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1016
; Address: $D4FCEC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1016:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_101A
; Address: $D4FD05
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_101A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_101B
; Address: $D4FD0C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_101B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_101C
; Address: $D4FD1A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_101C:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	STA $A9CA30		  ; 8F 30 CA A9 | Store accumulator to absolute long address
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_101D
; Address: $D4FD28
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_101D:
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1020
; Address: $D4FD3A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1020:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	ADC $C8			  ; 65 C8 | Add with carry (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1022
; Address: $D4FD47
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1022:
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $CAEA,X		  ; 7E EA CA | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1023
; Address: $D4FD50
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1023:
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1026
; Address: $D4FD62
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1026:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1027
; Address: $D4FD69
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1027:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1028
; Address: $D4FD78
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1028:
	LDA #$71			 ; A9 71 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_102A
; Address: $D4FD86
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_102A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA ($C8),Y		  ; 91 C8 | Store accumulator to (zero page),Y
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_102B
; Address: $D4FD8D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_102B:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_102C
; Address: $D4FD9B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_102C:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	AND ($CA),Y		  ; 31 CA | Logical AND with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_102D
; Address: $D4FDA3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_102D:
	LDA #$72			 ; A9 72 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1030
; Address: $D4FDB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1030:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1036
; Address: $D4FDD2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1036:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1037
; Address: $D4FDE0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1037:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($CA),Y		  ; 31 CA | Logical AND with accumulator ((zero page),Y)
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1038
; Address: $D4FDEE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1038:
	LDA #$73			 ; A9 73 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_103A
; Address: $D4FDF9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_103A:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_103E
; Address: $D4FE12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_103E:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_103F
; Address: $D4FE19
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_103F:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1040
; Address: $D4FE27
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1040:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1041
; Address: $D4FE35
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1041:
	LDA #$74			 ; A9 74 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1043
; Address: $D4FE40
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1043:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1049
; Address: $D4FE60
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1049:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	LDX $EA			  ; A6 EA | Load from zero page into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_104A
; Address: $D4FE6E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_104A:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	PEA #$CA32		   ; F4 32 CA | Push effective address to stack
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_104B
; Address: $D4FE7C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_104B:
	LDA #$75			 ; A9 75 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ADC $73			  ; 65 73 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_104D
; Address: $D4FE87
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_104D:
	JSL $C7786D		  ; 22 6D 78 C7 | Jump to subroutine long
	LDX $CDA3,Y		  ; BE A3 CD | Load from absolute,Y into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$2C			 ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1051
; Address: $D4FEA0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1051:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1052
; Address: $D4FEA7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1052:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	CMP $22CA,Y		  ; D9 CA 22 | Compare accumulator (absolute,Y)
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	STA $CAEA,X		  ; 9D EA CA | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1053
; Address: $D4FEB5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1053:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	SBC $CA32,Y		  ; F9 32 CA | Subtract with carry (absolute,Y)
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	STA $99C7			; 8D C7 99 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1057
; Address: $D4FECE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1057:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP #$CA			 ; C9 CA | Compare accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_105A
; Address: $D4FEDD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_105A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	CMP #$CA			 ; C9 CA | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank28_DmaFunction_105B
; Address: $D4FEE4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_105B:
	JSL $C7785F		  ; 22 5F 78 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1090
; Address: $D4FFD3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1090:
	JSL $C738E2		  ; 22 E2 38 C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $49			  ; 50 49 | Branch if overflow clear
	CPY $E222			; CC 22 E2 | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR #$CC			 ; 49 CC | Exclusive OR with accumulator (immediate)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank28_DmaFunction_1093
; Address: $D4FFF4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank28_DmaFunction_1093:
	JSL $C738E2		  ; 22 E2 38 C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	LSR $A9CC			; 4E CC A9 | Logical shift right (absolute)
