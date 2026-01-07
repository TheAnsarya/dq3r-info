;==============================================================================
; Dragon Quest III - Bank $16
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $CB0000-$CB7FFF
; Instructions: 7377
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_16"

;------------------------------------------------------------------------------
; Bank16_DmaFunction_000
; Address: $CB8000
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_000:
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $80EB			; 4C EB 80 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_002
; Address: $CB800F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_002:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	INX				  ; E8 | Increment X register
	BRA $22			  ; 80 22 | Branch always
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	XBA				  ; EB | Exchange accumulator bytes
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $C58F			; CC 8F C5 | Compare Y register (absolute)
	JMP $80E8			; 4C E8 80 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_004
; Address: $CB8031
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_004:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	CPX $220E			; EC 0E 22 | Compare X register (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	AND $C590,X		  ; 3D 90 C5 | Logical AND with accumulator (absolute,X)
	LDA $99C7			; AD C7 99 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_005
; Address: $CB8043
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_005:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8060			; 4C 60 80 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $A935,X		  ; 3D 35 A9 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($A998)		  ; 6C 98 A9 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $C1FD			; 8D FD C1 | Store accumulator to absolute address
	LDA $C1DD			; AD DD C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_007
; Address: $CB8076
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_007:
	JSL $C58F28		  ; 22 28 8F C5 | Jump to subroutine long
	JMP $80E8			; 4C E8 80 | Jump to address
	LDX $C1F5			; AE F5 C1 | Load from absolute address into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_008
; Address: $CB8083
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_008:
	JSL $C78CF3		  ; 22 F3 8C C7 | Jump to subroutine long
	LDA $C179			; AD 79 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $80A8			; 4C A8 80 | Jump to address
	LDA $C179			; AD 79 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_009
; Address: $CB8098
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_009:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $A90E			; EE 0E A9 | Increment (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_00B
; Address: $CB80A8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_00B:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	INX				  ; E8 | Increment X register
	BRA $AD			  ; 80 AD | Branch always
	SBC $C9C1,Y		  ; F9 C1 C9 | Subtract with carry (absolute,Y)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $800F			; 4C 0F 80 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $801C			; 4C 1C 80 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $802D			; 4C 2D 80 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8076			; 4C 76 80 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $807D			; 4C 7D 80 | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $807D			; 4C 7D 80 | Jump to address
	JMP $80EF			; 4C EF 80 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_00F
; Address: $CB80FB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_00F:
	JSL $C78D1D		  ; 22 1D 8D C7 | Jump to subroutine long
	LDA $C179			; AD 79 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8121			; 4C 21 81 | Jump to address
	LDA $C179			; AD 79 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_010
; Address: $CB8110
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_010:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	ASL $22A9			; 0E A9 22 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_018
; Address: $CB813E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_018:
	LDA $C1E1			; AD E1 C1 | Load from absolute address into accumulator
	CMP $C1F5			; CD F5 C1 | Compare accumulator (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8152			; 4C 52 81 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C1E1			; 8D E1 C1 | Store accumulator to absolute address
	JMP $815C			; 4C 5C 81 | Jump to address
	LDA $C1E1			; AD E1 C1 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $C1F5			; ED F5 C1 | Subtract with carry (absolute)
	STA $C1E1			; 8D E1 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_019
; Address: $CB815C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_019:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	CMP $A90E,X		  ; DD 0E A9 | Compare accumulator (absolute,X)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_01D
; Address: $CB8173
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_01D:
	JSL $C57DC7		  ; 22 C7 7D C5 | Jump to subroutine long
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_01E
; Address: $CB817E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_01E:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $F5AD			; 0E AD F5 | Arithmetic shift left (absolute)
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_01F
; Address: $CB818A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_01F:
	JSL $C78570		  ; 22 70 85 C7 | Jump to subroutine long
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_020
; Address: $CB8194
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_020:
	JSL $C78A23		  ; 22 23 8A C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81BA			; 4C BA 81 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_023
; Address: $CB81AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_023:
	JSL $C73836		  ; 22 36 38 C7 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $C1FD			; 8D FD C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_02A
; Address: $CB81D6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_02A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	CMP $220E			; CD 0E 22 | Compare accumulator (absolute)
	LDY $ADCD			; AC CD AD | Load from absolute address into Y register
	CMP ($22,X)		  ; C1 22 | Compare accumulator ((zero page,X))
	CMP $6B			  ; C5 6B | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_02B
; Address: $CB81E8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_02B:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	DEC $220E			; CE 0E 22 | Decrement (absolute)
	LDY $ADCD			; AC CD AD | Load from absolute address into Y register
	CMP ($22,X)		  ; C1 22 | Compare accumulator ((zero page,X))
	DEC $67			  ; C6 67 | Decrement (zero page)
	CMP $22			  ; C5 22 | Compare accumulator (zero page)
	ORA $C57D			; 0D 7D C5 | Logical OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_02C
; Address: $CB81FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_02C:
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $821E			; 4C 1E 82 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_02D
; Address: $CB8209
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_02D:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	BCC $C5			  ; 90 C5 | Branch if carry clear
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_032
; Address: $CB8231
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_032:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_033
; Address: $CB823B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_033:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_035
; Address: $CB8249
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_035:
	JSL $C74A42		  ; 22 42 4A C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8275			; 4C 75 82 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_038
; Address: $CB8269
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_038:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_03B
; Address: $CB8281
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_03B:
	JSL $C566DD		  ; 22 DD 66 C5 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_04B
; Address: $CB82D6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_04B:
	JSL $C72F5E		  ; 22 5E 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $82F4			; 4C F4 82 | Jump to address
	LDX #$A0			 ; A2 A0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_052
; Address: $CB8301
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_052:
	JSL $C7304B		  ; 22 4B 30 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $830E			; 4C 0E 83 | Jump to address
	JMP $8301			; 4C 01 83 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_059
; Address: $CB832F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_059:
	JSL $C76D2E		  ; 22 2E 6D C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8351			; 4C 51 83 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_05A
; Address: $CB8345
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_05A:
	JSL $C76D08		  ; 22 08 6D C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_05D
; Address: $CB835F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_05D:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $C1FD			; 8D FD C1 | Store accumulator to absolute address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $6835,X		  ; 3D 35 68 | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_062
; Address: $CB8384
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_062:
	JSL $C76D2E		  ; 22 2E 6D C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $83A6			; 4C A6 83 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_064
; Address: $CB839A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_064:
	JSL $C76D08		  ; 22 08 6D C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STA $AD83			; 8D 83 AD | Store accumulator to absolute address
	CMP ($22,X)		  ; C1 22 | Compare accumulator ((zero page,X))
	ASL $25			  ; 06 25 | Arithmetic shift left (zero page)
	DEC $22			  ; C6 22 | Decrement (zero page)
	ROR $D0			  ; 66 D0 | Rotate right (zero page)
	CPY $23A9			; CC A9 23 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_065
; Address: $CB83B4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_065:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $C1FD			; 8D FD C1 | Store accumulator to absolute address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $6835,X		  ; 3D 35 68 | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_067
; Address: $CB83CC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_067:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $83FD			; 4C FD 83 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_068
; Address: $CB83D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_068:
	JSL $C1D084		  ; 22 84 D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $83F0			; 4C F0 83 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_06C
; Address: $CB83F0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_06C:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_06F
; Address: $CB8408
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_06F:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8439			; 4C 39 84 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_070
; Address: $CB8414
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_070:
	JSL $C1D099		  ; 22 99 D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $842C			; 4C 2C 84 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_075
; Address: $CB8434
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_075:
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	AND $2284,X		  ; 3D 84 22 | Logical AND with accumulator (absolute,X)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_077
; Address: $CB8444
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_077:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8475			; 4C 75 84 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_078
; Address: $CB8450
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_078:
	JSL $C1D0AE		  ; 22 AE D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8468			; 4C 68 84 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_07C
; Address: $CB8468
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_07C:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	ADC $2284,Y		  ; 79 84 22 | Add with carry (absolute,Y)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_07D
; Address: $CB847A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_07D:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $84AD			; 4C AD 84 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_07E
; Address: $CB848C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_07E:
	JSL $C1D084		  ; 22 84 D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $84A0			; 4C A0 84 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_081
; Address: $CB84A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_081:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	LDA ($84),Y		  ; B1 84 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_083
; Address: $CB84B2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_083:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $84E5			; 4C E5 84 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_084
; Address: $CB84C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_084:
	JSL $C1D099		  ; 22 99 D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $84D8			; 4C D8 84 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_088
; Address: $CB84D8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_088:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	SBC #$84			 ; E9 84 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_08A
; Address: $CB84EA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_08A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $851D			; 4C 1D 85 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_08B
; Address: $CB84FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_08B:
	JSL $C1D0AE		  ; 22 AE D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8510			; 4C 10 85 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_08E
; Address: $CB8510
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_08E:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	AND ($85,X)		  ; 21 85 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_090
; Address: $CB8522
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_090:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $8559			; 4C 59 85 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_091
; Address: $CB8534
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_091:
	JSL $C1D084		  ; 22 84 D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8548			; 4C 48 85 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_095
; Address: $CB854C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_095:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	EOR $2285,X		  ; 5D 85 22 | Exclusive OR with accumulator (absolute,X)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_096
; Address: $CB855E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_096:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $8595			; 4C 95 85 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_097
; Address: $CB8570
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_097:
	JSL $C1D099		  ; 22 99 D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8584			; 4C 84 85 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_09B
; Address: $CB8588
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_09B:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	STA $2285,Y		  ; 99 85 22 | Store accumulator to absolute,Y
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_09C
; Address: $CB859A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_09C:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6622			; 0E 22 66 | Arithmetic shift left (absolute)
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $85D1			; 4C D1 85 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_09D
; Address: $CB85AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_09D:
	JSL $C1D0AE		  ; 22 AE D0 C1 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $85C0			; 4C C0 85 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0A1
; Address: $CB85C4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0A1:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	STA $22			  ; 85 22 | Store accumulator to zero page
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0A3
; Address: $CB85DA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0A3:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	AND $C590,X		  ; 3D 90 C5 | Logical AND with accumulator (absolute,X)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $A935,X		  ; 3D 35 A9 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($A998)		  ; 6C 98 A9 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $C1FD			; 8D FD C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0A6
; Address: $CB8606
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0A6:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	AND $C590,X		  ; 3D 90 C5 | Logical AND with accumulator (absolute,X)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	JMP ($AD98)		  ; 6C 98 AD | Jump to address (absolute indirect)
	CMP ($22,X)		  ; C1 22 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0A8
; Address: $CB8622
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0A8:
	JSL $C57E38		  ; 22 38 7E C5 | Jump to subroutine long
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0A9
; Address: $CB862C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0A9:
	JSL $C78356		  ; 22 56 83 C7 | Jump to subroutine long
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0AB
; Address: $CB863A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0AB:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	ASL $23A9			; 0E A9 23 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0B0
; Address: $CB8656
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0B0:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	CMP $220E,Y		  ; D9 0E 22 | Compare accumulator (absolute,Y)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0B2
; Address: $CB8667
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0B2:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0B4
; Address: $CB867C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0B4:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $2322			; 0E 22 23 | Arithmetic shift left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $E522			; CD 22 E5 | Compare accumulator (absolute)
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0B5
; Address: $CB868B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0B5:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	DEC $220E,X		  ; DE 0E 22 | Decrement (absolute,X)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	ASL $1622			; 0E 22 16 | Arithmetic shift left (absolute)
	CMP $22			  ; C5 22 | Compare accumulator (zero page)
	AND $88			  ; 25 88 | Logical AND with accumulator (zero page)
	CMP $4C			  ; C5 4C | Compare accumulator (zero page)
	STZ $2287			; 9C 87 22 | Store zero to absolute
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0B6
; Address: $CB86AC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0B6:
	JSL $C587DA		  ; 22 DA 87 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86C2			; 4C C2 86 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0B8
; Address: $CB86BB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0B8:
	JSL $C7842E		  ; 22 2E 84 C7 | Jump to subroutine long
	JMP $86CC			; 4C CC 86 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0BB
; Address: $CB86D5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0BB:
	JSL $C587DA		  ; 22 DA 87 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86EB			; 4C EB 86 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0BC
; Address: $CB86E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0BC:
	JSL $C78464		  ; 22 64 84 C7 | Jump to subroutine long
	JMP $86F5			; 4C F5 86 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0BF
; Address: $CB86FE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0BF:
	JSL $C587DA		  ; 22 DA 87 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8714			; 4C 14 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0C0
; Address: $CB870D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0C0:
	JSL $C7849A		  ; 22 9A 84 C7 | Jump to subroutine long
	JMP $871E			; 4C 1E 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0C2
; Address: $CB8721
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0C2:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $DA22			; 0E 22 DA | Arithmetic shift left (absolute)
	CMP $B0			  ; C5 B0 | Compare accumulator (zero page)
	JMP $873D			; 4C 3D 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0C3
; Address: $CB8736
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0C3:
	JSL $C784D0		  ; 22 D0 84 C7 | Jump to subroutine long
	JMP $8747			; 4C 47 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0C6
; Address: $CB8750
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0C6:
	JSL $C587DA		  ; 22 DA 87 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8766			; 4C 66 87 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0C8
; Address: $CB875F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0C8:
	JSL $C78506		  ; 22 06 85 C7 | Jump to subroutine long
	JMP $8770			; 4C 70 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0CB
; Address: $CB8779
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0CB:
	JSL $C587DA		  ; 22 DA 87 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $878F			; 4C 8F 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0CC
; Address: $CB8788
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0CC:
	JSL $C783C2		  ; 22 C2 83 C7 | Jump to subroutine long
	JMP $8799			; 4C 99 87 | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0CD
; Address: $CB8795
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0CD:
	JSL $C78740		  ; 22 40 87 C7 | Jump to subroutine long
	JMP $87CF			; 4C CF 87 | Jump to address
	LDA $C1E7			; AD E7 C1 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86A6			; 4C A6 86 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86CF			; 4C CF 86 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86F8			; 4C F8 86 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8721			; 4C 21 87 | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $874A			; 4C 4A 87 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8773			; 4C 73 87 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0CE
; Address: $CB87CF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0CE:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C1E7			; 8D E7 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0D1
; Address: $CB87E2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0D1:
	JSL $C58825		  ; 22 25 88 C5 | Jump to subroutine long
	LDA $C1E7			; AD E7 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA $C1E7			; AD E7 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0D5
; Address: $CB87FC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0D5:
	JSL $C56716		  ; 22 16 67 C5 | Jump to subroutine long
	LDA $C1E7			; AD E7 C1 | Load from absolute address into accumulator
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8819			; 4C 19 88 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0D7
; Address: $CB880F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0D7:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	ASL $4C18			; 0E 18 4C | Arithmetic shift left (absolute)
	BIT $88			  ; 24 88 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0D9
; Address: $CB881D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0D9:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $6B38			; 0E 38 6B | Arithmetic shift left (absolute)
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0DB
; Address: $CB882D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0DB:
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	BEQ $22			  ; F0 22 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $883D			; 4C 3D 88 | Jump to address
	JMP $882D			; 4C 2D 88 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0DD
; Address: $CB8844
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0DD:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0E1
; Address: $CB885F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0E1:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0E4
; Address: $CB8874
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0E4:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0E8
; Address: $CB888F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0E8:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0EB
; Address: $CB88AA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0EB:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	PEA #$220E		   ; F4 0E 22 | Push effective address to stack
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0EE
; Address: $CB88C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0EE:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0F1
; Address: $CB88E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0F1:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0F4
; Address: $CB88FB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0F4:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0F7
; Address: $CB8916
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0F7:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0FB
; Address: $CB8931
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0FB:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	SBC $220E,Y		  ; F9 0E 22 | Subtract with carry (absolute,Y)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_0FE
; Address: $CB894C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_0FE:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_102
; Address: $CB8965
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_102:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_106
; Address: $CB897E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_106:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $BE22			; 0E 22 BE | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_10A
; Address: $CB8997
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_10A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	SBC $220E,X		  ; FD 0E 22 | Subtract with carry (absolute,X)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_10E
; Address: $CB89B0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_10E:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $220E,X		  ; FE 0E 22 | Increment (absolute,X)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_114
; Address: $CB89CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_114:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_115
; Address: $CB89DF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_115:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	BCC $C5			  ; 90 C5 | Branch if carry clear
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_11B
; Address: $CB8A0A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_11B:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA $99C7			; AD C7 99 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_11C
; Address: $CB8A12
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_11C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA $FF00,X		  ; 1D 00 FF | Logical OR with accumulator (absolute,X)
	STA $C1F7			; 8D F7 C1 | Store accumulator to absolute address
	LDA $C1F7			; AD F7 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_120
; Address: $CB8A36
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_120:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA $99C7			; AD C7 99 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_121
; Address: $CB8A3E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_121:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ASL $FF00,X		  ; 1E 00 FF | Arithmetic shift left (absolute,X)
	STA $C1F7			; 8D F7 C1 | Store accumulator to absolute address
	LDA $C1F7			; AD F7 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_125
; Address: $CB8A62
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_125:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA $99C7			; AD C7 99 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_126
; Address: $CB8A6A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_126:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	STA $C1F7			; 8D F7 C1 | Store accumulator to absolute address
	LDA $C1F7			; AD F7 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_12C
; Address: $CB8A98
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_12C:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_138
; Address: $CB8ADA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_138:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_144
; Address: $CB8B1E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_144:
	JSL $C5903D		  ; 22 3D 90 C5 | Jump to subroutine long
	LDA $99C7			; AD C7 99 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_145
; Address: $CB8B26
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_145:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8B43			; 4C 43 8B | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $A935,X		  ; 3D 35 A9 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($AD98)		  ; 6C 98 AD | Jump to address (absolute indirect)
	CMP $22C1,X		  ; DD C1 22 | Compare accumulator (absolute,X)
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_146
; Address: $CB8B51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_146:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA $220F			; 0D 0F 22 | Logical OR with accumulator (absolute)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_149
; Address: $CB8B66
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_149:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $220F			; 0E 0F 22 | Arithmetic shift left (absolute)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_14B
; Address: $CB8B78
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_14B:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BD9			; 4C D9 8B | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_14C
; Address: $CB8B81
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_14C:
	JSL $C1C81E		  ; 22 1E C8 C1 | Jump to subroutine long
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8BCC			; 4C CC 8B | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	STA $C119			; 8D 19 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	STA $BE79			; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_14D
; Address: $CB8B9C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_14D:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BPL $0F			  ; 10 0F | Branch if positive
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_14E
; Address: $CB8BA6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_14E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	WDM #$11			 ; 42 11 | Reserved instruction
	CPY $11			  ; C4 11 | Compare Y register (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	STA $C1F7			; 8D F7 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_153
; Address: $CB8BCC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_153:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	CMP $228B,X		  ; DD 8B 22 | Compare accumulator (absolute,X)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_156
; Address: $CB8BE8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_156:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_157
; Address: $CB8BFA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_157:
	JSL $C7853C		  ; 22 3C 85 C7 | Jump to subroutine long
	LDA $C175			; AD 75 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_15D
; Address: $CB8C1D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_15D:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_15E
; Address: $CB8C2F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_15E:
	JSL $C7853C		  ; 22 3C 85 C7 | Jump to subroutine long
	LDA $C175			; AD 75 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_164
; Address: $CB8C52
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_164:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	LDA $C1E1			; AD E1 C1 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $C1E1			; 8D E1 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_169
; Address: $CB8C78
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_169:
	JSL $C56D29		  ; 22 29 6D C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CBE			; 4C BE 8C | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_16C
; Address: $CB8C8D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_16C:
	JSL $C56D5A		  ; 22 5A 6D C5 | Jump to subroutine long
	LDA $99C7			; AD C7 99 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_16D
; Address: $CB8C95
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_16D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8CB0			; 4C B0 8C | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_174
; Address: $CB8CC7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_174:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8D05			; 4C 05 8D | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_17D
; Address: $CB8D0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_17D:
	ORA $220F,Y		  ; 19 0F 22 | Logical OR with accumulator (absolute,Y)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_17F
; Address: $CB8D1C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_17F:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_182
; Address: $CB8D31
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_182:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_186
; Address: $CB8D4D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_186:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_18A
; Address: $CB8D67
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_18A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA $220F,X		  ; 1D 0F 22 | Logical OR with accumulator (absolute,X)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BVC $01			  ; 50 01 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_18C
; Address: $CB8D77
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_18C:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $220F,X		  ; 1E 0F 22 | Arithmetic shift left (absolute,X)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CMP $C58E			; CD 8E C5 | Compare accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_18E
; Address: $CB8D8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_18E:
	JSL $C7842E		  ; 22 2E 84 C7 | Jump to subroutine long
	LDA $C175			; AD 75 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_199
; Address: $CB8DCA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_199:
	JSL $C7849A		  ; 22 9A 84 C7 | Jump to subroutine long
	LDA $C175			; AD 75 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_19E
; Address: $CB8DE9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_19E:
	JSL $C784D0		  ; 22 D0 84 C7 | Jump to subroutine long
	LDA $C175			; AD 75 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1A3
; Address: $CB8E08
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1A3:
	JSL $C78506		  ; 22 06 85 C7 | Jump to subroutine long
	LDA $C175			; AD 75 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1A8
; Address: $CB8E27
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1A8:
	JSL $C7861E		  ; 22 1E 86 C7 | Jump to subroutine long
	LDA $C177			; AD 77 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1AB
; Address: $CB8E39
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1AB:
	JSR $220F			; 20 0F 22 | Jump to subroutine
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1AC
; Address: $CB8E46
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1AC:
	JSL $C78658		  ; 22 58 86 C7 | Jump to subroutine long
	LDA $C177			; AD 77 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1AF
; Address: $CB8E58
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1AF:
	JSL $D2220F		  ; 22 0F 22 D2 | Jump to subroutine long
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1B0
; Address: $CB8E65
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1B0:
	JSL $C78692		  ; 22 92 86 C7 | Jump to subroutine long
	LDA $C177			; AD 77 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1B5
; Address: $CB8E84
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1B5:
	JSL $C786CC		  ; 22 CC 86 C7 | Jump to subroutine long
	LDA $C177			; AD 77 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1BA
; Address: $CB8EA3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1BA:
	JSL $C78706		  ; 22 06 87 C7 | Jump to subroutine long
	LDA $C177			; AD 77 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1BF
; Address: $CB8EBF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1BF:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	INC $C141			; EE 41 C1 | Increment (absolute)
	LDA $C141			; AD 41 C1 | Load from absolute address into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1C1
; Address: $CB8ECE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1C1:
	JSL $C74A04		  ; 22 04 4A C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8EFA			; 4C FA 8E | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1C4
; Address: $CB8EF3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1C4:
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STX $24A9			; 8E A9 24 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1C5
; Address: $CB8EFD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1C5:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F0D			; 4C 0D 8F | Jump to address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1C6
; Address: $CB8F09
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1C6:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1C9
; Address: $CB8F19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1C9:
	JSL $C1D102		  ; 22 02 D1 C1 | Jump to subroutine long
	LDA $C191			; AD 91 C1 | Load from absolute address into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1CB
; Address: $CB8F28
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1CB:
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8F6C			; 4C 6C 8F | Jump to address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	STA $C119			; 8D 19 C1 | Store accumulator to absolute address
	LDA $C1F5			; AD F5 C1 | Load from absolute address into accumulator
	STA $BE79			; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1CC
; Address: $CB8F3F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1CC:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	SBC $AD0E			; ED 0E AD | Subtract with carry (absolute)
	CMP ($AA,X)		  ; C1 AA | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1CD
; Address: $CB8F49
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1CD:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	WDM #$11			 ; 42 11 | Reserved instruction
	CPY $11			  ; C4 11 | Compare Y register (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	STA $C1F7			; 8D F7 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1CF
; Address: $CB8F5F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1CF:
	JSL $C590AB		  ; 22 AB 90 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F6C			; 4C 6C 8F | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1D3
; Address: $CB8F77
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1D3:
	JSL $C1D116		  ; 22 16 D1 C1 | Jump to subroutine long
	LDA $C191			; AD 91 C1 | Load from absolute address into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1D7
; Address: $CB8F8C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1D7:
	JSL $C78CF3		  ; 22 F3 8C C7 | Jump to subroutine long
	LDA $C179			; AD 79 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8FB2			; 4C B2 8F | Jump to address
	LDA $C179			; AD 79 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1D8
; Address: $CB8FA1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1D8:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1DD
; Address: $CB8FBD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1DD:
	JSL $C1D127		  ; 22 27 D1 C1 | Jump to subroutine long
	LDA $C191			; AD 91 C1 | Load from absolute address into accumulator
	STA $C1F5			; 8D F5 C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1E8
; Address: $CB8FF5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1E8:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	LDY #$64			 ; A0 64 | Load immediate value into Y register
	LDX $C1D9			; AE D9 C1 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1EC
; Address: $CB900E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1EC:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	LDX $C1D9			; AE D9 C1 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1F0
; Address: $CB9027
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1F0:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	LDY #$66			 ; A0 66 | Load immediate value into Y register
	LDX $C1D9			; AE D9 C1 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1F3
; Address: $CB903D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1F3:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9060			; 4C 60 90 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1F5
; Address: $CB9054
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1F5:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BCC $A2			  ; 90 A2 | Branch if carry clear
	STA $2200,Y		  ; 99 00 22 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1F6
; Address: $CB9067
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1F6:
	JSL $C756BA		  ; 22 BA 56 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9074			; 4C 74 90 | Jump to address
	JMP $9067			; 4C 67 90 | Jump to address
	LDA #$48			 ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1F9
; Address: $CB9083
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1F9:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_1FA
; Address: $CB9089
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_1FA:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2235,X		  ; 3D 35 22 | Logical AND with accumulator (absolute,X)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	LDA $C1DB			; AD DB C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_200
; Address: $CB90AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_200:
	LDA $C119			; AD 19 C1 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $90E5			; 4C E5 90 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_203
; Address: $CB90C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_203:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $90D3			; 4C D3 90 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_204
; Address: $CB90CB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_204:
	JSL $C56E36		  ; 22 36 6E C5 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	JMP $90E2			; 4C E2 90 | Jump to address
	LDA $C119			; AD 19 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_205
; Address: $CB90DD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_205:
	JSL $C73831		  ; 22 31 38 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $90F0			; 4C F0 90 | Jump to address
	LDA $C119			; AD 19 C1 | Load from absolute address into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_20A
; Address: $CB9101
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_20A:
	JSL $C77361		  ; 22 61 73 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_20F
; Address: $CB9121
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_20F:
	JSL $C7787B		  ; 22 7B 78 C7 | Jump to subroutine long
	JMP $22C591		  ; 5C 91 C5 22 | Jump to address long
	LDY $68CD			; AC CD 68 | Load from absolute address into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_21C
; Address: $CB917B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_21C:
	JSL $C74743		  ; 22 43 47 C7 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $7FC0			; 8D C0 7F | Store accumulator to absolute address
	LDA $C30B			; AD 0B C3 | Load from absolute address into accumulator
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9194			; 4C 94 91 | Jump to address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_220
; Address: $CB919E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_220:
	JSL $C74295		  ; 22 95 42 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $91B2			; 4C B2 91 | Jump to address
	LDA $C11F			; AD 1F C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_221
; Address: $CB91AA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_221:
	JSL $C7418A		  ; 22 8A 41 C7 | Jump to subroutine long
	JMP $919E			; 4C 9E 91 | Jump to address
	LDA #$C3			 ; A9 C3 | Load immediate value into accumulator
	STA $7FBC			; 8D BC 7F | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_222
; Address: $CB91BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_222:
	JSL $C743D3		  ; 22 D3 43 C7 | Jump to subroutine long
	LDA $C30B			; AD 0B C3 | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_223
; Address: $CB91C6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_223:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9203			; 4C 03 92 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank16_DmaFunction_224
; Address: $CB91E7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_224:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9200			; 4C 00 92 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_226
; Address: $CB91F3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_226:
	JSL $C7478E		  ; 22 8E 47 C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	SEP #$91			 ; E2 91 | Set processor status bits
	JMP $9226			; 4C 26 92 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9226			; 4C 26 92 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_228
; Address: $CB9219
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_228:
	JSL $C747B1		  ; 22 B1 47 C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_22A
; Address: $CB9230
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_22A:
	JSL $CDE073		  ; 22 73 E0 CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_22C
; Address: $CB9242
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_22C:
	JSL $C74A04		  ; 22 04 4A C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_22D
; Address: $CB924C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_22D:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9259			; 4C 59 92 | Jump to address
	JMP $9246			; 4C 46 92 | Jump to address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_22E
; Address: $CB925C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_22E:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $935B			; 4C 5B 93 | Jump to address
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_231
; Address: $CB927B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_231:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SEP #$35			 ; E2 35 | Set processor status bits
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_234
; Address: $CB928D
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_234:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDA $C30B			; AD 0B C3 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$0C			 ; C9 0C | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_235
; Address: $CB9316
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_235:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$11			 ; C9 11 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$12			 ; C9 12 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$14			 ; C9 14 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9199			; 4C 99 91 | Jump to address
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9230			; 4C 30 92 | Jump to address
	CMP #$16			 ; C9 16 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9230			; 4C 30 92 | Jump to address
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9230			; 4C 30 92 | Jump to address
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9263			; 4C 63 92 | Jump to address
	INC $C30B			; EE 0B C3 | Increment (absolute)
	LDA $C30B			; AD 0B C3 | Load from absolute address into accumulator
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9370			; 4C 70 93 | Jump to address
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_236
; Address: $CB936C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_236:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_24F
; Address: $CB93D6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_24F:
	JSL $C75092		  ; 22 92 50 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $93E3			; 4C E3 93 | Jump to address
	JMP $93D6			; 4C D6 93 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_250
; Address: $CB93EB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_250:
	JSL $039000		  ; 22 00 90 03 | Jump to subroutine long
	JMP $9405			; 4C 05 94 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_251
; Address: $CB93F8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_251:
	JSL $C75612		  ; 22 12 56 C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INC $C309			; EE 09 C3 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank16_DmaFunction_253
; Address: $CB940E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_253:
	JSR $CFCD			; 20 CD CF | Jump to subroutine
	LDA $193F,X		  ; BD 3F 19 | Load from absolute,X into accumulator
	INX				  ; E8 | Increment X register
	EOR $C8AF,X		  ; 5D AF C8 | Exclusive OR with accumulator (absolute,X)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	EOR $00D5,X		  ; 5D D5 00 | Exclusive OR with accumulator (absolute,X)
	ORA $D5			  ; 05 D5 | Logical OR with accumulator (zero page)
	ASL $D5			  ; 06 D5 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $DFD0,X		  ; 3D D0 DF | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_254
; Address: $CB9440
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_254:
	LSR $3F13			; 4E 13 3F | Logical shift right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	STA $8F1D00		  ; 8F 00 1D 8F | Store accumulator to absolute long address
	ASL $008F,X		  ; 1E 8F 00 | Arithmetic shift left (absolute,X)
	ADC $3F19			; 6D 19 3F | Add with carry (absolute)
	CPX $2FEB			; EC EB 2F | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	ASL $60CF,X		  ; 1E CF 60 | Arithmetic shift left (absolute,X)
	STY $2E			  ; 84 2E | Store Y register to zero page
	CPY $2E			  ; C4 2E | Compare Y register (zero page)
	BCC $07			  ; 90 07 | Branch if carry clear
	ADC #$2D			 ; 69 2D | Add with carry (immediate)
	BIT $02F0			; 2C F0 02 | Test bits in accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	BIT $BE3F			; 2C 3F BE | Test bits in accumulator (absolute)
	CPX $1E			  ; E4 1E | Compare X register (zero page)
	STA $3F5C			; 8D 5C 3F | Store accumulator to absolute address
	CPX $28			  ; E4 28 | Compare X register (zero page)
	STA $3F0C			; 8D 0C 3F | Store accumulator to absolute address
	CPX $29			  ; E4 29 | Compare X register (zero page)
	STA $3F1C			; 8D 1C 3F | Store accumulator to absolute address
	CPX $22			  ; E4 22 | Compare X register (zero page)
	STA $3F2D			; 8D 2D 3F | Store accumulator to absolute address
	CPX $20			  ; E4 20 | Compare X register (zero page)
	STA $3F3D			; 8D 3D 3F | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	STA $3F5C			; 8D 5C 3F | Store accumulator to absolute address
	CPX $1D			  ; E4 1D | Compare X register (zero page)
	STA $3F4C			; 8D 4C 3F | Store accumulator to absolute address
	BIT $8F27			; 2C 27 8F | Test bits in accumulator (absolute)
	JMP ($FAF2)		  ; 6C F2 FA | Jump to address (absolute indirect)
	ADC #$2D			 ; 69 2D | Add with carry (immediate)
	BIT $1CD0			; 2C D0 1C | Test bits in accumulator (absolute)
	STA $E44D			; 8D 4D E4 | Store accumulator to absolute address
	STA $E40D			; 8D 0D E4 | Store accumulator to absolute address
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	STA $E43C			; 8D 3C E4 | Store accumulator to absolute address
	STA $E42C			; 8D 2C E4 | Store accumulator to absolute address
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	STA $F83600		  ; 8F 00 36 F8 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $09			  ; 30 09 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $07			  ; F0 07 | Branch if equal
	STZ $FFD5			; 9C D5 FF | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_255
; Address: $CB94E5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_255:
	PLP				  ; 28 | Pull processor status from stack
	SBC $25F6,X		  ; FD F6 25 | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	AND ($0A),Y		  ; 31 0A | Logical AND with accumulator ((zero page),Y)
	CPY $3C			  ; C4 3C | Compare Y register (zero page)
	STA $B23A00		  ; 8F 00 3A B2 | Store accumulator to absolute long address
	INC				  ; 1A | Increment accumulator
	LDX $0409			; AE 09 04 | Load from absolute address into X register
	XBA				  ; EB | Exchange accumulator bytes
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_256
; Address: $CB9502
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_256:
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	ORA $0290,Y		  ; 19 90 02 | Logical OR with accumulator (absolute,Y)
	LDX #$1A			 ; A2 1A | Load immediate value into X register
	INC				  ; 1A | Increment accumulator
	BRA $0F			  ; 80 0F | Branch always
	SBC $3F09			; ED 09 3F | Subtract with carry (absolute)
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	PEA #$3F09		   ; F4 09 3F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	BPL $0A			  ; 10 0A | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	DEC				  ; 3A | Decrement accumulator
	ASL $3F0A,X		  ; 1E 0A 3F | Arithmetic shift left (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	SEI				  ; 78 | Set interrupt disable flag
	BCS $03			  ; B0 03 | Branch if carry set
	CMP ($0B,X)		  ; C1 0B | Compare accumulator ((zero page,X))
	SBC $3509			; ED 09 35 | Subtract with carry (absolute)
	PEA #$3509		   ; F4 09 35 | Push effective address to stack
	ORA #$35			 ; 09 35 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	BPL $0A			  ; 10 0A | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_257
; Address: $CB9579
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_257:
	ASL $680A,X		  ; 1E 0A 68 | Arithmetic shift left (absolute,X)
	BNE $03			  ; D0 03 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	EOR $37C4			; 4D C4 37 | Exclusive OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $03			  ; D0 03 | Branch if not equal
	BIT $0D			  ; 24 0D | Test bits in accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	REP #$1A			 ; C2 1A | Reset processor status bits
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $E5			  ; F0 E5 | Branch if equal
	ADC $B312			; 6D 12 B3 | Add with carry (absolute)
	INC				  ; 1A | Increment accumulator
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	STZ $E0D5			; 9C D5 E0 | Game work RAM access
	BNE $54			  ; D0 54 | Branch if not equal
	EOR $36F8			; 4D F8 36 | Exclusive OR with accumulator (absolute)
	STA $CE09,Y		  ; 99 09 CE | Store accumulator to absolute,Y
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $12			  ; F0 12 | Branch if equal
	CPY $15			  ; C4 15 | Compare Y register (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	CPX $3A			  ; E4 3A | Compare X register (zero page)
	BCC $1E			  ; 90 1E | Branch if carry clear
	DEC $106F			; CE 6F 10 | Decrement (absolute)
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	BCS $23			  ; B0 23 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($F0),Y		  ; D1 F0 | Compare accumulator ((zero page),Y)
	ROL $68			  ; 26 68 | Rotate left (zero page)
	BNE $F0			  ; D0 F0 | Branch if not equal
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0D			  ; 26 0D | Rotate left (zero page)
	DEC $11			  ; C6 11 | Decrement (zero page)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ASL $242F			; 0E 2F 24 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $C5			  ; 30 C5 | Branch if negative
	STZ $18			  ; 64 18 | Store zero to zero page
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $14			  ; 85 14 | Store accumulator to zero page
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank16_DmaFunction_258
; Address: $CB95FA
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_258:
	LDA $A8F5,Y		  ; B9 F5 A8 | Load from absolute,Y into accumulator
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($2F),Y		  ; 11 2F | Logical OR with accumulator ((zero page),Y)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	REP #$0D			 ; C2 0D | Reset processor status bits
	BVC $0E			  ; 50 0E | Branch if overflow clear
	ADC $3F12			; 6D 12 3F | Add with carry (absolute)
	ASL $7D3F			; 0E 3F 7D | Arithmetic shift left (absolute)
	ASL $DA3F			; 0E 3F DA | Arithmetic shift left (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$3F0D		   ; F4 0D 3F | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	ASL $3F10			; 0E 10 3F | Arithmetic shift left (absolute)
	ORA $CE13			; 0D 13 CE | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	AND $A8F5			; 2D F5 A8 | Logical AND with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $F0			  ; 80 F0 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_259
; Address: $CB9642
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_259:
	JSR $13D0			; 20 D0 13 | Jump to subroutine
	STA $E800			; 8D 00 E8 | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	STA $3F01			; 8D 01 3F | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	STA $3F5C			; 8D 5C 3F | Store accumulator to absolute address
	LDX $36F8			; AE F8 36 | Load from absolute address into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_25B
; Address: $CB9660
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_25B:
	SED				  ; F8 | Set decimal mode flag
	BNE $08			  ; D0 08 | Branch if not equal
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	ORA $D5			  ; 05 D5 | Logical OR with accumulator (zero page)
	BCS $04			  ; B0 04 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	JMP $7C00E8		  ; 5C E8 00 7C | Jump to address long
	TYA				  ; 98 | Transfer Y register to accumulator
	INX				  ; E8 | Increment X register
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BRA $07			  ; 80 07 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank16_DmaFunction_25C
; Address: $CB9687
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_25C:
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BCC $06			  ; 90 06 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	BEQ $06			  ; F0 06 | Branch if equal
	BNE $0A			  ; D0 0A | Branch if not equal
	INY				  ; C8 | Increment Y register
	BRA $B5			  ; 80 B5 | Branch always
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_25D
; Address: $CB96AD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_25D:
	PHP				  ; 08 | Push processor status to stack
	ASL $1AE2			; 0E E2 1A | Arithmetic shift left (absolute)
	REP #$1A			 ; C2 1A | Reset processor status bits
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	BRA $F0			  ; 80 F0 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_25E
; Address: $CB96C1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_25E:
	JSR $0BD0			; 20 D0 0B | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_25F
; Address: $CB96C8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_25F:
	JSR $A8D5			; 20 D5 A8 | Jump to subroutine
	LDA $11			  ; A5 11 | Load from zero page into accumulator
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	SBC $26F0,X		  ; FD F0 26 | Subtract with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BVS $08			  ; 70 08 | Branch if overflow set
	BCS $06			  ; B0 06 | Branch if carry set
	LDY $88D5,X		  ; BC D5 88 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $07			  ; 10 07 | Branch if positive
	BNE $04			  ; D0 04 | Branch if not equal
	INX				  ; E8 | Increment X register
	BRA $2F			  ; 80 2F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_260
; Address: $CB96F2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_260:
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_261
; Address: $CB96F8
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_261:
	BPL $0E			  ; 10 0E | Branch if positive
	ORA $E8			  ; 05 E8 | Logical OR with accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	BEQ $16			  ; F0 16 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BVS $08			  ; 70 08 | Branch if overflow set
	BCC $0E			  ; 90 0E | Branch if carry clear
	XBA				  ; EB | Exchange accumulator bytes
	ORA $58F5,Y		  ; 19 F5 58 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	CMP $9560,X		  ; DD 60 95 | Compare accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $0E			  ; 10 0E | Branch if positive
	BCC $02			  ; 90 02 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	SBC $A0F5,X		  ; FD F5 A0 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CMP $FF48,X		  ; DD 48 FF | Compare accumulator (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	REP #$1A			 ; C2 1A | Reset processor status bits
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $D0			  ; 06 D0 | Arithmetic shift left (zero page)
	ORA $F83F			; 0D 3F F8 | Logical OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $D0			  ; E5 D0 | Subtract with carry (zero page)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	INC $3F12,X		  ; FE 12 3F | Increment (absolute,X)
	LDX $16			  ; A6 16 | Load from zero page into X register
	PLP				  ; 28 | Pull processor status from stack
	BVC $07			  ; 50 07 | Branch if overflow clear
	BRA $B5			  ; 80 B5 | Branch always
	INY				  ; C8 | Increment Y register
	AND $A8F5			; 2D F5 A8 | Logical AND with accumulator (absolute)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	LDX $CA3F			; AE 3F CA | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_262
; Address: $CB9757
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_262:
	JSR $DD07			; 20 07 DD | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ASL $9C			  ; 06 9C | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	SEP #$1A			 ; E2 1A | Set processor status bits

;------------------------------------------------------------------------------
; Bank16_DmaFunction_263
; Address: $CB9771
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_263:
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $9C			  ; 06 9C | Arithmetic shift left (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	BCS $04			  ; B0 04 | Branch if carry set

;------------------------------------------------------------------------------
; Bank16_DmaFunction_264
; Address: $CB977C
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_264:
	JSR $D507			; 20 07 D5 | Jump to subroutine
	BCS $04			  ; B0 04 | Branch if carry set
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $75			  ; 06 75 | Arithmetic shift left (zero page)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BCC $0C			  ; 90 0C | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	SBC $20F5,X		  ; FD F5 20 | Subtract with carry (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BPL $E2			  ; 10 E2 | Branch if positive
	INC				  ; 1A | Increment accumulator
	BPL $08			  ; 10 08 | Branch if positive
	BEQ $5C			  ; F0 5C | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BCS $06			  ; B0 06 | Branch if carry set
	LDY $E0D5,X		  ; BC D5 E0 | Game work RAM access
	LSR $80F5			; 4E F5 80 | Logical shift right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $05			  ; D0 05 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SBC $D5BC,X		  ; FD BC D5 | Subtract with carry (absolute,X)
	BRA $07			  ; 80 07 | Branch always
	CMP $03F0,X		  ; DD F0 03 | Compare accumulator (absolute,X)
	BPL $08			  ; 10 08 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_265
; Address: $CB97D2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_265:
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_266
; Address: $CB97DC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_266:
	BCS $07			  ; B0 07 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BCC $02			  ; 90 02 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	SBC $10F5,X		  ; FD F5 10 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	SBC ($90),Y		  ; F1 90 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_267
; Address: $CB97F0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_267:
	ORA $28			  ; 05 28 | Logical OR with accumulator (zero page)
	CMP $008D,X		  ; DD 8D 00 | Compare accumulator (absolute,X)
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PHX				  ; DA | Push X register to stack
	SEP #$1A			 ; E2 1A | Set processor status bits
	BPL $08			  ; 10 08 | Branch if positive
	BEQ $16			  ; F0 16 | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BCC $0E			  ; 90 0E | Branch if carry clear
	XBA				  ; EB | Exchange accumulator bytes
	ORA $B0F5,Y		  ; 19 F5 B0 | Logical OR with accumulator (absolute,Y)
	CMP $9560,X		  ; DD 60 95 | Compare accumulator (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $F56F			; 0E 6F F5 | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	AND $C2			  ; 25 C2 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	STZ $78D5			; 9C D5 78 | Store zero to absolute
	ASL $D0			  ; 06 D0 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	BMI $06			  ; 30 06 | Branch if negative
	BPL $60			  ; 10 60 | Branch if positive
	ASL $95			  ; 06 95 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ASL $D5			  ; 06 D5 | Arithmetic shift left (zero page)
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $95			  ; 06 95 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_268
; Address: $CB9849
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_268:
	ASL $D5			  ; 06 D5 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $6F			  ; 06 6F | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_269
; Address: $CB9855
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_269:
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	CLV				  ; B8 | Clear overflow flag
	BPL $C2			  ; 10 C2 | Branch if positive
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BEQ $25			  ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank16_DmaFunction_26A
; Address: $CB9869
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_26A:
	INC				  ; 1A | Increment accumulator
	STZ $06D5			; 9C D5 06 | Store zero to absolute
	ORA #$D0			 ; 09 D0 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	BPL $60			  ; 10 60 | Branch if positive
	ORA #$95			 ; 09 95 | Logical OR with accumulator (immediate)
	ORA $D509			; 0D 09 D5 | Logical OR with accumulator (absolute)
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_26C
; Address: $CB988B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_26C:
	JSL $F56F09		  ; 22 09 6F F5 | Jump to subroutine long
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	BNE $01			  ; D0 01 | Branch if not equal
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_26E
; Address: $CB98A2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_26E:
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	ORA #$95			 ; 09 95 | Logical OR with accumulator (immediate)
	STA $9009,Y		  ; 99 09 90 | Store accumulator to absolute,Y
	ORA $00E8			; 0D E8 00 | Logical OR with accumulator (absolute)
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	ORA #$5F			 ; 09 5F | Logical OR with accumulator (immediate)
	BNE $0F			  ; D0 0F | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	STA $A409,Y		  ; 99 09 A4 | Store accumulator to absolute,Y
	BCS $0B			  ; B0 0B | Branch if carry set
	INX				  ; E8 | Increment X register
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	STA $8209,Y		  ; 99 09 82 | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	PHB				  ; 8B | Push data bank register to stack
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	ORA #$82			 ; 09 82 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BVS $05			  ; 70 05 | Branch if overflow set
	BEQ $25			  ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank16_DmaFunction_26F
; Address: $CB98F6
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_26F:
	REP #$1A			 ; C2 1A | Reset processor status bits
	STZ $70D5			; 9C D5 70 | Store zero to absolute
	ORA $D0			  ; 05 D0 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	BNE $05			  ; D0 05 | Branch if not equal
	CLV				  ; B8 | Clear overflow flag
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	BPL $60			  ; 10 60 | Branch if positive
	BNE $05			  ; D0 05 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	ORA $D5			  ; 05 D5 | Logical OR with accumulator (zero page)
	BNE $05			  ; D0 05 | Branch if not equal
	INX				  ; E8 | Increment X register
	ORA $95			  ; 05 95 | Logical OR with accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ROL $36F8,X		  ; 3E F8 36 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_270
; Address: $CB9922
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_270:
	JSL $F5FD09		  ; 22 09 FD F5 | Jump to subroutine long
	STY $09			  ; 84 09 | Store Y register to zero page
	STA $CF09,Y		  ; 99 09 CF | Store accumulator to absolute,Y
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	CMP $CBCF,X		  ; DD CF CB | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ASL $DA			  ; 06 DA | Arithmetic shift left (zero page)
	BPL $C4			  ; 10 C4 | Branch if positive
	STA $E814			; 8D 14 E8 | Store accumulator to absolute address
	TXS				  ; 9A | Transfer X register to stack pointer
	PHX				  ; DA | Push X register to stack
	BPL $C4			  ; 10 C4 | Branch if positive
	BVC $10			  ; 50 10 | Branch if overflow clear
	CPX $35			  ; E4 35 | Compare X register (zero page)
	BNE $0C			  ; D0 0C | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	BEQ $05			  ; F0 05 | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	PLB				  ; AB | Pull data bank register from stack
	STA $E400			; 8D 00 E4 | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_271
; Address: $CB9975
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_271:
	CPX $35			  ; E4 35 | Compare X register (zero page)
	BNE $0C			  ; D0 0C | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	BEQ $05			  ; F0 05 | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	PLB				  ; AB | Pull data bank register from stack
	STA $E401			; 8D 01 E4 | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	CPX $35			  ; E4 35 | Compare X register (zero page)
	BEQ $06			  ; F0 06 | Branch if equal
	STA $E80A			; 8D 0A E8 | Store accumulator to absolute address
	PHX				  ; DA | Push X register to stack
	XBA				  ; EB | Exchange accumulator bytes
	BPL $80			  ; 10 80 | Branch if positive
	LDX #$10			 ; A2 10 | Load immediate value into X register
	XBA				  ; EB | Exchange accumulator bytes
	CMP $17EB,X		  ; DD EB 17 | Compare accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_272
; Address: $CB99A8
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_272:
	LDX #$10			 ; A2 10 | Load immediate value into X register
	SBC $18E4,X		  ; FD E4 18 | Subtract with carry (absolute,X)
	CMP $006F,X		  ; DD 6F 00 | Compare accumulator (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $1E15			; 0D 15 1E | Logical OR with accumulator (absolute)
	AND #$34			 ; 29 34 | Logical AND with accumulator (immediate)
	WDM #$51			 ; 42 51 | Reserved instruction
	LSR $6E67,X		  ; 5E 67 6E | Logical shift right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7F7E,X		  ; 7D 7E 7F | Add with carry (absolute,X)
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	ADC $19EB			; 6D EB 19 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA $EB0900		  ; 8F 00 09 EB | Store accumulator to absolute long address
	ORA $CFAE,Y		  ; 19 AE CF | Logical OR with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PHX				  ; DA | Push X register to stack
	INC				  ; 1A | Increment accumulator
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BRA $F0			  ; 80 F0 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CPX $22			  ; E4 22 | Compare X register (zero page)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_273
; Address: $CB99FF
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_273:
	BIT $22			  ; 24 22 | Test bits in accumulator (zero page)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	BPL $D0			  ; 10 D0 | Branch if positive
	ASL $A8F5			; 0E F5 A8 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $1A			  ; F0 1A | Branch if equal
	CPX $17			  ; E4 17 | Compare X register (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	CPY $23			  ; C4 23 | Compare Y register (zero page)
	CPX $20			  ; E4 20 | Compare X register (zero page)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	EOR $008D			; 4D 8D 00 | Exclusive OR with accumulator (absolute)
	CPX $17			  ; E4 17 | Compare X register (zero page)
	BRA $A8			  ; 80 A8 | Branch always
	BCS $09			  ; B0 09 | Branch if carry set
	CPX $17			  ; E4 17 | Compare X register (zero page)
	BRA $A8			  ; 80 A8 | Branch always
	BCS $06			  ; B0 06 | Branch if carry set
	PLY				  ; 7A | Pull Y register from stack
	PHX				  ; DA | Push X register to stack
	CPX $17			  ; E4 17 | Compare X register (zero page)
	STA $CD00			; 8D 00 CD | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	STZ $F65D,X		  ; 9E 5D F6 | Store zero to absolute,X
	CPY $09			  ; C4 09 | Compare Y register (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	STA $2D12,X		  ; 9D 12 2D | Store accumulator to absolute,X
	STZ $EE12			; 9C 12 EE | Store zero to absolute
	TXS				  ; 9A | Transfer X register to stack pointer
	PHP				  ; 08 | Push processor status to stack
	XBA				  ; EB | Exchange accumulator bytes
	CMP $008D,X		  ; DD 8D 00 | Compare accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_274
; Address: $CB9A79
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_274:
	ORA #$7C			 ; 09 7C | Logical OR with accumulator (immediate)
	AND $06C8,X		  ; 3D C8 06 | Logical AND with accumulator (absolute,X)
	BNE $F8			  ; D0 F8 | Branch if not equal
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	DEC $80F5			; CE F5 80 | Decrement (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$CF			 ; 09 CF | Logical OR with accumulator (immediate)
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $04			  ; 80 04 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	ADC $98F5			; 6D F5 98 | Add with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$CF			 ; 09 CF | Logical OR with accumulator (immediate)
	SBC $7AAE,X		  ; FD AE 7A | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $028D			; 6D 8D 02 | Add with carry (absolute)
	STZ $14			  ; 64 14 | Store zero to zero page
	LDX $038D			; AE 8D 03 | Load from absolute address into X register
	STZ $14			  ; 64 14 | Store zero to zero page
	CPX $1D			  ; E4 1D | Compare X register (zero page)
	CPY $1D			  ; C4 1D | Compare Y register (zero page)
	CPX $1E			  ; E4 1E | Compare X register (zero page)
	CPY $1E			  ; C4 1E | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SBC $10F5,X		  ; FD F5 10 | Subtract with carry (absolute,X)
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	CMP $01D0,X		  ; DD D0 01 | Compare accumulator (absolute,X)
	LDY $28D5,X		  ; BC D5 28 | Load from absolute,X into Y register
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_275
; Address: $CB9AD8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_275:
	JSR $0804			; 20 04 08 | Jump to subroutine
	BRA $8D			  ; 80 8D | Branch always
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	STZ $14			  ; 64 14 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	BVC $04			  ; 50 04 | Branch if overflow clear
	STA $3F06			; 8D 06 3F | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	ORA $F0			  ; 05 F0 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_276
; Address: $CB9AF1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_276:
	DEC				  ; 3A | Decrement accumulator
	STZ $28D5			; 9C D5 28 | Store zero to absolute
	ORA $F0			  ; 05 F0 | Logical OR with accumulator (zero page)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $2D			  ; D0 2D | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	BNE $27			  ; D0 27 | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	BRA $D0			  ; 80 D0 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	BCS $1A			  ; B0 1A | Branch if carry set
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_277
; Address: $CB9B16
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_277:
	JSR $0804			; 20 04 08 | Jump to subroutine
	BRA $8D			  ; 80 8D | Branch always
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	STZ $14			  ; 64 14 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	CPX #$15			 ; E0 15 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	STA $3F06			; 8D 06 3F | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	LDA				  ; BF D5 A8 03 | Load from absolute long,X into accumulator
	STA $BA00D0		  ; 8F D0 00 BA | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	STA $EB0100		  ; 8F 00 01 EB | Store accumulator to absolute long address
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BEQ $11			  ; F0 11 | Branch if equal
	PLB				  ; AB | Pull data bank register from stack
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA $F0FD			; 0D FD F0 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $F1			  ; 10 F1 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BCS $08			  ; B0 08 | Branch if carry set
	STZ $00			  ; 64 00 | Store zero to zero page
	BEQ $02			  ; F0 02 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_278
; Address: $CB9B59
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_278:
	BRA $6F			  ; 80 6F | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $F8			  ; F0 F8 | Branch if equal

;------------------------------------------------------------------------------
; Bank16_DmaFunction_279
; Address: $CB9B5F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_279:
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $F4			  ; F0 F4 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$F0F0		   ; F4 F0 F0 | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	SBC $ECF0,Y		  ; F9 F0 EC | Subtract with carry (absolute,Y)
	BRA $A8			  ; 80 A8 | Branch always
	SBC $DFF6,X		  ; FD F6 DF | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_27A
; Address: $CB9B73
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_27A:
	STY $01			  ; 84 01 | Store Y register to zero page
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	BCS $DE			  ; B0 DE | Branch if carry set
	CMP $F5			  ; C5 F5 | Compare accumulator (zero page)
	BCS $04			  ; B0 04 | Branch if carry set
	CPY $16			  ; C4 16 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	CPY $17			  ; C4 17 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ASL $DA			  ; 06 DA | Arithmetic shift left (zero page)
	LSR $69			  ; 46 69 | Logical shift right (zero page)
	STY $D2AF			; 8C AF D2 | Store Y register to absolute address
	ORA $3728,Y		  ; 19 28 37 | Logical OR with accumulator (absolute,Y)
	LSR $55			  ; 46 55 | Logical shift right (zero page)
	STZ $73			  ; 64 73 | Store zero to zero page
	STA ($A0),Y		  ; 91 A0 | Store accumulator to (zero page),Y
	BCS $BE			  ; B0 BE | Branch if carry set
	CMP $EBDC			; CD DC EB | Compare accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ADC ($09),Y		  ; 71 09 | Add with carry ((zero page),Y)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	STA $3B0A,Y		  ; 99 0A 3B | Store accumulator to absolute,Y
	INC $0B			  ; E6 0B | Increment (zero page)
	ORA $0E26			; 0D 26 0E | Logical OR with accumulator (absolute)
	SBC $E10E,X		  ; FD 0E E1 | Subtract with carry (absolute,X)
	BPL $D3			  ; 10 D3 | Branch if positive
	ORA ($E3),Y		  ; 11 E3 | Logical OR with accumulator ((zero page),Y)
	ORA $1AB5,Y		  ; 19 B5 1A | Logical OR with accumulator (absolute,Y)
	JMP $FB1C			; 4C 1C FB | Jump to address
	ORA $1FC3,X		  ; 1D C3 1F | Logical OR with accumulator (absolute,X)
	EOR $CE6D			; 4D 6D CE | Exclusive OR with accumulator (absolute)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STA $9E00			; 8D 00 9E | Store accumulator to absolute address
	AND $00E8			; 2D E8 00 | Logical AND with accumulator (absolute)
	STZ $CEEE,X		  ; 9E EE CE | Store zero to absolute,X
	PHA				  ; 48 | Push accumulator to stack
	LDY $008D,X		  ; BC 8D 00 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_27B
; Address: $CB9BEC
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_27B:
	STZ $E82D,X		  ; 9E 2D E8 | Store zero to absolute,X
	STZ $3FEE,X		  ; 9E EE 3F | Store zero to absolute,X
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	DEC $DA6F			; CE 6F DA | Decrement (absolute)
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	TXS				  ; 9A | Transfer X register to stack pointer
	PHP				  ; 08 | Push processor status to stack
	STA $F700			; 8D 00 F7 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	SBC $8D6F,X		  ; FD 6F 8D | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	SBC $3A6F,X		  ; FD 6F 3A | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	SBC $30F5,X		  ; FD F5 30 | Subtract with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PHX				  ; DA | Push X register to stack
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	SEC				  ; 38 | Set carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $03			  ; 30 03 | Branch if negative
	CMP $48D5,X		  ; DD D5 48 | Compare accumulator (absolute,X)
	STA $8FF1F0		  ; 8F F0 F1 8F | Store accumulator to absolute long address
	BPL $FA			  ; 10 FA | Branch if positive
	STA $8FFB80		  ; 8F 80 FB 8F | Store accumulator to absolute long address
	SBC ($8F),Y		  ; F1 8F | Subtract with carry ((zero page),Y)
	JMP ($8FF2)		  ; 6C F2 8F | Jump to address (absolute indirect)
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	STA $E4F27D		  ; 8F 7D F2 E4 | Store accumulator to absolute long address
	PLP				  ; 28 | Pull processor status from stack
	CPY $2D			  ; C4 2D | Compare Y register (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	BEQ $FC			  ; F0 FC | Branch if equal
	PHB				  ; 8B | Push data bank register to stack
	AND $F8D0			; 2D D0 F8 | Logical AND with accumulator (absolute)
	STA $8FF27D		  ; 8F 7D F2 8F | Store accumulator to absolute long address
	STA $8FF26D		  ; 8F 6D F2 8F | Store accumulator to absolute long address
	STA $6F2A00		  ; 8F 00 2A 6F | Store accumulator to absolute long address
	INX				  ; E8 | Increment X register
	CPY $23			  ; C4 23 | Compare Y register (zero page)
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	CPY $25			  ; C4 25 | Compare Y register (zero page)
	CPY $26			  ; C4 26 | Compare Y register (zero page)
	CPY $27			  ; C4 27 | Compare Y register (zero page)
	CPY $21			  ; C4 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank16_DmaFunction_27C
; Address: $CB9C6A
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_27C:
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	CPY $2D			  ; C4 2D | Compare Y register (zero page)
	CPY $2C			  ; C4 2C | Compare Y register (zero page)
	CPY $2E			  ; C4 2E | Compare Y register (zero page)
	CPY $35			  ; C4 35 | Compare Y register (zero page)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	CPY $29			  ; C4 29 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	STA $3F5D			; 8D 5D 3F | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	STA				  ; 9F 13 A2 23 | Store accumulator to absolute long,X
	INX				  ; E8 | Increment X register
	CMP $D500			; CD 00 D5 | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	AND $07C8,X		  ; 3D C8 07 | Logical AND with accumulator (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	CMP $D500			; CD 00 D5 | Compare accumulator (absolute)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	AND $08C8,X		  ; 3D C8 08 | Logical AND with accumulator (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	CMP $D500			; CD 00 D5 | Compare accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	AND $18C8,X		  ; 3D C8 18 | Logical AND with accumulator (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	CPY $2D			  ; C4 2D | Compare Y register (zero page)
	ADC #$2D			 ; 69 2D | Add with carry (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	PLX				  ; FA | Pull X register from stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $7D8D			; 2D 8D 7D | Logical AND with accumulator (absolute)
	CPX $F3			  ; E4 F3 | Compare X register (zero page)
	STZ $2D			  ; 64 2D | Store zero to zero page
	BEQ $32			  ; F0 32 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	BIT $6003			; 2C 03 60 | Test bits in accumulator (absolute)
	STY $2C			  ; 84 2C | Store Y register to zero page
	CPY $2C			  ; C4 2C | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	STA $3F3C			; 8D 3C 3F | Store accumulator to absolute address
	STA $3F2C			; 8D 2C 3F | Store accumulator to absolute address
	STA $3F0D			; 8D 0D 3F | Store accumulator to absolute address
	STA $3F4D			; 8D 4D 3F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_27E
; Address: $CB9CE6
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_27E:
	JSR $6C8D			; 20 8D 6C | Jump to subroutine
	STA $E47D			; 8D 7D E4 | Store accumulator to absolute address
	AND $753F			; 2D 3F 75 | Logical AND with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	STA $3F6D			; 8D 6D 3F | Store accumulator to absolute address
	STA $6F2E00		  ; 8F 00 2E 6F | Store accumulator to absolute long address
	STA $8F1B80		  ; 8F 80 1B 8F | Store accumulator to absolute long address
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($F5,X)		  ; 01 F5 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	SBC $E8F6,X		  ; FD F6 E8 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	BNE $30			  ; D0 30 | Branch if not equal
	WDM #$14			 ; 42 14 | Reserved instruction
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL $36EB,X		  ; 1E EB 36 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CF10			; 8D 10 CF | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_27F
; Address: $CB9D3C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_27F:
	BEQ $03			  ; F0 03 | Branch if equal
	SBC $3DF6,X		  ; FD F6 3D | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3F04			; 8D 04 3F | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	STZ $01			  ; 64 01 | Store zero to zero page
	BNE $03			  ; D0 03 | Branch if not equal
	WDM #$14			 ; 42 14 | Reserved instruction
	CPX $01			  ; E4 01 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STA				  ; 9F C4 1B EB | Store accumulator to absolute long,X
	CPY $1C			  ; C4 1C | Compare Y register (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank16_DmaFunction_280
; Address: $CB9D68
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_280:
	RTI				  ; 40 | Return from interrupt
	BRA $FE			  ; 80 FE | Branch always
	SBC $F7FB,X		  ; FD FB F7 | Subtract with carry (absolute,X)
	LDA				  ; BF 7F 2D C4 | Load from absolute long,X into accumulator
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	BMI $08			  ; 30 08 | Branch if negative
	CMP $1B04,X		  ; DD 04 1B | Compare accumulator (absolute,X)
	CPY $F2			  ; C4 F2 | Compare Y register (zero page)
	PLX				  ; FA | Pull X register from stack
	LDX $CB6F			; AE 6F CB | Load from absolute address into X register
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	STA $8FF565		  ; 8F 65 F5 8F | Store accumulator to absolute long address
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	STA $6FF774		  ; 8F 74 F7 6F | Store accumulator to absolute long address
	BRA $A8			  ; 80 A8 | Branch always
	EOR $37E4,X		  ; 5D E4 37 | Exclusive OR with accumulator (absolute,X)
	STA $150714		  ; 8F 14 07 15 | Store accumulator to absolute long address
	ORA $3715,Y		  ; 19 15 37 | Logical OR with accumulator (absolute,Y)
	LDA #$15			 ; A9 15 | Load immediate value into accumulator
	CLV				  ; B8 | Clear overflow flag
	WDM #$16			 ; 42 16 | Reserved instruction
	LSR $5716			; 4E 16 57 | Logical shift right (absolute)
	DEY				  ; 88 | Decrement Y register
	LDX $16			  ; A6 16 | Load from zero page into X register
	DEC $16			  ; C6 16 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	ROL $17			  ; 26 17 | Rotate left (zero page)
	AND $C215			; 2D 15 C2 | Logical AND with accumulator (absolute)
	SEP #$17			 ; E2 17 | Set processor status bits
	AND $6418,X		  ; 3D 18 64 | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STA $18AC18		  ; 8F 18 AC 18 | Store accumulator to absolute long address
	INC $18			  ; E6 18 | Increment (zero page)
	BEQ $18			  ; F0 18 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	CMP $001E,X		  ; DD 1E 00 | Compare accumulator (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($5D,X)		  ; 01 5D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_281
; Address: $CB9E17
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_281:
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $D5			  ; 80 D5 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $C0F5,X		  ; 5D F5 C0 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $D5			  ; 80 D5 | Branch always
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	EOR $C0F5,X		  ; 5D F5 C0 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA #$FD			 ; 09 FD | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	STA $CF06			; 8D 06 CF | Store accumulator to absolute address
	SBC $F76D,X		  ; FD 6D F7 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $03			  ; F0 03 | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CF10			; 8D 10 CF | Store accumulator to absolute address
	INC $9760			; EE 60 97 | Increment (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC $F6FD			; 6D FD F6 | Add with carry (absolute)
	AND $8D0A,X		  ; 3D 0A 8D | Logical AND with accumulator (absolute,X)
	STZ $14			  ; 64 14 | Store zero to zero page
	INC $08F7			; EE F7 08 | Increment (absolute)
	AND $0F28			; 2D 28 0F | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDX $7028			; AE 28 70 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_282
; Address: $CB9E88
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_282:
	JSR $F704			; 20 04 F7 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	AND $1F28			; 2D 28 1F | Logical AND with accumulator (absolute)
	BVC $04			  ; 50 04 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	LDX $E028			; AE 28 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank16_DmaFunction_283
; Address: $CB9E9D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_283:
	PHP				  ; 08 | Push processor status to stack
	ADC $078D			; 6D 8D 07 | Add with carry (absolute)
	STZ $14			  ; 64 14 | Store zero to zero page
	INC $08F7			; EE F7 08 | Increment (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	BRA $04			  ; 80 04 | Branch always
	DEC $11			  ; C6 11 | Decrement (zero page)
	EOR $5D6F,X		  ; 5D 6F 5D | Exclusive OR with accumulator (absolute,X)
	BEQ $12			  ; F0 12 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ASL $E8			  ; 06 E8 | Arithmetic shift left (zero page)
	ASL $6F			  ; 06 6F | Arithmetic shift left (zero page)
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $2D			  ; 06 2D | Arithmetic shift left (zero page)
	BEQ $12			  ; F0 12 | Branch if equal
	BMI $06			  ; 30 06 | Branch if negative
	BRA $B5			  ; 80 B5 | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL $EE			  ; 06 EE | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	PHA				  ; 48 | Push accumulator to stack
	ASL $DD			  ; 06 DD | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_284
; Address: $CB9EE2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_284:
	ASL $6F			  ; 06 6F | Arithmetic shift left (zero page)
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	BEQ $12			  ; F0 12 | Branch if equal
	BCS $07			  ; B0 07 | Branch if carry set
	BEQ $12			  ; F0 12 | Branch if equal
	BPL $08			  ; 10 08 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	AND $008D			; 2D 8D 00 | Logical AND with accumulator (absolute)
	BPL $08			  ; 10 08 | Branch if positive
	DEC $F89E			; CE 9E F8 | Decrement (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BPL $08			  ; 10 08 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_286
; Address: $CB9F2E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_286:
	JSL $F86F09		  ; 22 09 6F F8 | Jump to subroutine long
	BEQ $12			  ; F0 12 | Branch if equal
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	AND $F03F			; 2D 3F F0 | Logical AND with accumulator (absolute)
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	BRA $B5			  ; 80 B5 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_287
; Address: $CB9F42
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_287:
	JSL $3FEE09		  ; 22 09 EE 3F | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	ORA $DD09			; 0D 09 DD | Logical OR with accumulator (absolute)
	ORA #$6F			 ; 09 6F | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	LDX $6F09			; AE 09 6F | Load from absolute address into X register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	INC $09			  ; E6 09 | Increment (zero page)
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	BNE $08			  ; D0 08 | Branch if not equal
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	BVS $08			  ; 70 08 | Branch if overflow set
	BEQ $12			  ; F0 12 | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $12			  ; F0 12 | Branch if equal
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	ORA $E8			  ; 05 E8 | Logical OR with accumulator (zero page)
	BNE $05			  ; D0 05 | Branch if not equal
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	BVS $05			  ; 70 05 | Branch if overflow set
	AND $F03F			; 2D 3F F0 | Logical AND with accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA $EE			  ; 05 EE | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	ORA $DD			  ; 05 DD | Logical OR with accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_288
; Address: $CB9FBD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_288:
	BEQ $12			  ; F0 12 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	BEQ $12			  ; F0 12 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_289
; Address: $CB9FC9
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_289:
	INC $09			  ; E6 09 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	BNE $08			  ; D0 08 | Branch if not equal
	ASL $5D6F			; 0E 6F 5D | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	BEQ $06			  ; F0 06 | Branch if equal
	BEQ $12			  ; F0 12 | Branch if equal
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	BCC $06			  ; 90 06 | Branch if carry clear
	BEQ $12			  ; F0 12 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	EOR $00E8,X		  ; 5D E8 00 | Exclusive OR with accumulator (absolute,X)
	BEQ $06			  ; F0 06 | Branch if equal
	BEQ $12			  ; F0 12 | Branch if equal
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	BCC $06			  ; 90 06 | Branch if carry clear
	BEQ $12			  ; F0 12 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BCC $06			  ; 90 06 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $6F			  ; 06 6F | Arithmetic shift left (zero page)
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	BIT $DD			  ; 24 DD | Test bits in accumulator (zero page)
	ROL $3F09,X		  ; 3E 09 3F | Rotate left (absolute,X)
	BEQ $12			  ; F0 12 | Branch if equal
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	ROL $DD			  ; 26 DD | Rotate left (zero page)
	EOR $09			  ; 45 09 | Exclusive OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank16_DmaFunction_28A
; Address: $CBA03F
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_28A:
	STA				  ; 9F 13 F8 36 | Store accumulator to absolute long,X
	BEQ $12			  ; F0 12 | Branch if equal
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	BEQ $12			  ; F0 12 | Branch if equal
	EOR $36EB,X		  ; 5D EB 36 | Exclusive OR with accumulator (absolute,X)
	STA $F5F20F		  ; 8F 0F F2 F5 | Store accumulator to absolute long address
	LDA ($17,X)		  ; A1 17 | Load from (zero page,X) into accumulator
	JMP $C409			; 4C 09 C4 | Jump to address
	STA $F5F21F		  ; 8F 1F F2 F5 | Store accumulator to absolute long address
	LDX #$17			 ; A2 17 | Load immediate value into X register
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F22F		  ; 8F 2F F2 F5 | Store accumulator to absolute long address
	PHY				  ; 5A | Push Y register to stack
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F23F		  ; 8F 3F F2 F5 | Store accumulator to absolute long address
	LDY $17			  ; A4 17 | Load from zero page into Y register
	ADC ($09,X)		  ; 61 09 | Add with carry ((zero page,X))
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	STA $F5F24F		  ; 8F 4F F2 F5 | Store accumulator to absolute long address
	LDA $17			  ; A5 17 | Load from zero page into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F25F		  ; 8F 5F F2 F5 | Store accumulator to absolute long address
	LDX $17			  ; A6 17 | Load from zero page into X register
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F26F		  ; 8F 6F F2 F5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F27F		  ; 8F 7F F2 F5 | Store accumulator to absolute long address
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $C409,X		  ; 7D 09 C4 | Add with carry (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA				  ; BF DB F0 FE | Load from absolute long,X into accumulator
	AND ($2B,X)		  ; 21 2B | Logical AND with accumulator ((zero page,X))
	INC $F9F3,X		  ; FE F3 F9 | Increment (absolute,X)
	CMP $01E5,Y		  ; D9 E5 01 | Compare accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $A8D5,X		  ; FE D5 A8 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CLI				  ; 58 | Clear interrupt disable flag
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank16_DmaFunction_28B
; Address: $CBA0F5
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_28B:
	STA $D5F20F		  ; 8F 0F F2 D5 | Store accumulator to absolute long address
	JMP $C409			; 4C 09 C4 | Jump to address
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F21F		  ; 8F 1F F2 D5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F22F		  ; 8F 2F F2 D5 | Store accumulator to absolute long address
	PHY				  ; 5A | Push Y register to stack
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F23F		  ; 8F 3F F2 D5 | Store accumulator to absolute long address
	ADC ($09,X)		  ; 61 09 | Add with carry ((zero page,X))
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F24F		  ; 8F 4F F2 D5 | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F25F		  ; 8F 5F F2 D5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F26F		  ; 8F 6F F2 D5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	STA $D5F27F		  ; 8F 7F F2 D5 | Store accumulator to absolute long address
	ADC $C409,X		  ; 7D 09 C4 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	AND $0F28			; 2D 28 0F | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDX $7028			; AE 28 70 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank16_DmaFunction_28C
; Address: $CBA15A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_28C:
	JSR $3F04			; 20 04 3F | Jump to subroutine
	BEQ $12			  ; F0 12 | Branch if equal
	AND $1F28			; 2D 28 1F | Logical AND with accumulator (absolute)
	BVC $04			  ; 50 04 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	LDX $E028			; AE 28 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	DEC $11			  ; C6 11 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	AND $289F			; 2D 9F 28 | Logical AND with accumulator (absolute)
	SBC $82F6,X		  ; FD F6 82 | Subtract with carry (absolute,X)
	BPL $05			  ; 10 05 | Branch if positive
	LDX $0F28			; AE 28 0F | Load from absolute address into X register
	SBC $8AF6,X		  ; FD F6 8A | Subtract with carry (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	AND $F03F			; 2D 3F F0 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_28D
; Address: $CBA195
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_28D:
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	LDX $38C4			; AE C4 38 | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	AND $F03F			; 2D 3F F0 | Logical AND with accumulator (absolute)
	AND $38BA			; 2D BA 38 | Logical AND with accumulator (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_28E
; Address: $CBA1AD
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_28E:
	CMP $78D5,X		  ; DD D5 78 | Compare accumulator (absolute,X)
	LDX $39C4			; AE C4 39 | Load from absolute address into X register
	LDX $38C4			; AE C4 38 | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	EOR $60F5,X		  ; 5D F5 60 | Exclusive OR with accumulator (absolute,X)
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	AND $F03F			; 2D 3F F0 | Logical AND with accumulator (absolute)
	AND $90F5			; 2D F5 90 | Logical AND with accumulator (absolute)
	BEQ $13			  ; F0 13 | Branch if equal
	STZ $90D5			; 9C D5 90 | Store zero to absolute
	BEQ $0D			  ; F0 0D | Branch if equal
	LDX $39C4			; AE C4 39 | Load from absolute address into X register
	LDX $38C4			; AE C4 38 | Load from absolute address into X register
	TSX				  ; BA | Transfer stack pointer to X register
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	PHX				  ; DA | Push X register to stack
	SEC				  ; 38 | Set carry flag
	LDX $6FAE			; AE AE 6F | Load from absolute address into X register
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $D5			  ; 10 D5 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $5D6F,X		  ; 5D 6F 5D | Exclusive OR with accumulator (absolute,X)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank16_DmaFunction_28F
; Address: $CBA224
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_28F:
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BVS $D5			  ; 70 D5 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank16_DmaFunction_290
; Address: $CBA235
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_290:
	JSR $6F04			; 20 04 6F | Jump to subroutine
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$D5			 ; E0 D5 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BVC $04			  ; 50 04 | Branch if overflow clear
	EOR $F03F,X		  ; 5D 3F F0 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	EOR $A8F5,X		  ; 5D F5 A8 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SBC $00C4,X		  ; FD C4 00 | Subtract with carry (absolute,X)
	BEQ $12			  ; F0 12 | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BEQ $12			  ; F0 12 | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	CPX $F4			  ; E4 F4 | Compare X register (zero page)
	STZ $F4			  ; 64 F4 | Store zero to zero page
	BNE $F7			  ; D0 F7 | Branch if not equal
	STZ $30			  ; 64 30 | Store zero to zero page
	BEQ $14			  ; F0 14 | Branch if equal
	PLB				  ; AB | Pull data bank register from stack
	BMI $E4			  ; 30 E4 | Branch if negative
	STZ $F5			  ; 64 F5 | Store zero to zero page
	BNE $FA			  ; D0 FA | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	AND ($FA),Y		  ; 31 FA | Logical AND with accumulator ((zero page),Y)
	ORA $6D5F,Y		  ; 19 5F 6D | Logical OR with accumulator (absolute,Y)
	ORA $FDEB,Y		  ; 19 EB FD | Logical OR with accumulator (absolute,Y)
	BEQ $DB			  ; F0 DB | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	BCS $05			  ; B0 05 | Branch if carry set
	EOR $A21F,X		  ; 5D 1F A2 | Exclusive OR with accumulator (absolute,X)
	ORA $30FA,Y		  ; 19 FA 30 | Logical OR with accumulator (absolute,Y)
	PEA #$9E6F		   ; F4 6F 9E | Push effective address to stack
	ORA $19C0,Y		  ; 19 C0 19 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_291
; Address: $CBA2B5
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_291:
	ORA $1B06,Y		  ; 19 06 1B | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ROL $621B,X		  ; 3E 1B 62 | Rotate left (absolute,X)
	ADC $8D1B,X		  ; 7D 1B 8D | Add with carry (absolute,X)
	ORA $19FE,Y		  ; 19 FE 19 | Logical OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA $F43F,Y		  ; 19 3F F4 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	PHX				  ; DA | Push X register to stack
	ASL $D53F			; 0E 3F D5 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	AND $6F1A,X		  ; 3D 1A 6F | Logical AND with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	PEA #$1C1A		   ; F4 1A 1C | Push effective address to stack
	EOR $F43F,X		  ; 5D 3F F4 | Exclusive OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	PHX				  ; DA | Push X register to stack
	CMP $01D5,X		  ; DD D5 01 | Compare accumulator (absolute,X)
	PEA #$D51A		   ; F4 1A D5 | Push effective address to stack
	CMP $03D5,X		  ; DD D5 03 | Compare accumulator (absolute,X)
	INC $3F19,X		  ; FE 19 3F | Increment (absolute,X)
	PEA #$DA1A		   ; F4 1A DA | Push effective address to stack
	ASL $D53F			; 0E 3F D5 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	AND $6F1A,X		  ; 3D 1A 6F | Logical AND with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	PEA #$2D1A		   ; F4 1A 2D | Push effective address to stack
	STA $CF10			; 8D 10 CF | Store accumulator to absolute address
	EOR $088F,X		  ; 5D 8F 08 | Exclusive OR with accumulator (absolute,X)
	PEA #$D51A		   ; F4 1A D5 | Push effective address to stack
	AND $DD0A,X		  ; 3D 0A DD | Logical AND with accumulator (absolute,X)
	ROL $3D0A,X		  ; 3E 0A 3D | Rotate left (absolute,X)
	AND $008B,X		  ; 3D 8B 00 | Logical AND with accumulator (absolute,X)
	BNE $F0			  ; D0 F0 | Branch if not equal
	DEC $F43F			; CE 3F F4 | Decrement (absolute)
	INC				  ; 1A | Increment accumulator
	PHX				  ; DA | Push X register to stack
	AND $0A			  ; 25 0A | Logical AND with accumulator (zero page)
	CMP $31D5,X		  ; DD D5 31 | Compare accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	TSX				  ; BA | Transfer stack pointer to X register
	AND ($DA),Y		  ; 31 DA | Logical AND with accumulator ((zero page),Y)
	PEA #$DA1A		   ; F4 1A DA | Push effective address to stack
	ASL $D53F			; 0E 3F D5 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_292
; Address: $CBA348
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_292:
	AND $6F1A,X		  ; 3D 1A 6F | Logical AND with accumulator (absolute,X)
	CPX $0C			  ; E4 0C | Compare X register (zero page)
	CMP $8F			  ; C5 8F | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	CMP $97			  ; C5 97 | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	CMP $A4			  ; C5 A4 | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	CPX $0D			  ; E4 0D | Compare X register (zero page)
	CMP $90			  ; C5 90 | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	CMP $98			  ; C5 98 | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	CMP $A5			  ; C5 A5 | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	STA $BA1255		  ; 8F 55 12 BA | Store accumulator to absolute long address
	ASL $56F0			; 0E F0 56 | Arithmetic shift left (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $0FCB			; 0E CB 0F | Arithmetic shift left (absolute)
	EOR $008D,X		  ; 5D 8D 00 | Exclusive OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	BNE $1B			  ; D0 1B | Branch if not equal
	STA $4D1255		  ; 8F 55 12 4D | Store accumulator to absolute long address
	ADC $FDEB			; 6D EB FD | Add with carry (absolute)
	BEQ $0E			  ; F0 0E | Branch if equal
	STA $8F1D00		  ; 8F 00 1D 8F | Store accumulator to absolute long address
	ASL $4B3F,X		  ; 1E 3F 4B | Arithmetic shift left (absolute,X)
	INC $2FCE			; EE CE 2F | Increment (absolute)
	SBC ($E4,X)		  ; E1 E4 | Subtract with carry ((zero page,X))
	PEA #$3064		   ; F4 64 30 | Push effective address to stack
	BEQ $DB			  ; F0 DB | Branch if equal
	STZ $F4			  ; 64 F4 | Store zero to zero page
	BNE $D7			  ; D0 D7 | Branch if not equal
	CPX $F5			  ; E4 F5 | Compare X register (zero page)
	BEQ $1D			  ; F0 1D | Branch if equal
	CPX $F6			  ; E4 F6 | Compare X register (zero page)
	BEQ $21			  ; F0 21 | PPU graphics register access
	CPX $F7			  ; E4 F7 | Compare X register (zero page)
	PLB				  ; AB | Pull data bank register from stack
	BMI $FA			  ; 30 FA | Branch if negative
	BMI $F4			  ; 30 F4 | Branch if negative
	BEQ $20			  ; F0 20 | Branch if equal
	AND $B7D0,X		  ; 3D D0 B7 | Logical AND with accumulator (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	BNE $B3			  ; D0 B3 | Branch if not equal
	LDY $1A90			; AC 90 1A | Load from absolute address into Y register
	LDY $1A98			; AC 98 1A | Load from absolute address into Y register
	LDY $1AA5			; AC A5 1A | Load from absolute address into Y register
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_293
; Address: $CBA3CB
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_293:
	LDY $1A90			; AC 90 1A | Load from absolute address into Y register
	LDY $1A98			; AC 98 1A | Load from absolute address into Y register
	LDY $1AA5			; AC A5 1A | Load from absolute address into Y register
	STZ $AC1A			; 9C 1A AC | Store zero to absolute
	BCC $1A			  ; 90 1A | Branch if carry clear
	LDY $1A98			; AC 98 1A | Load from absolute address into Y register
	LDY $1AA5			; AC A5 1A | Load from absolute address into Y register
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	STA $8F1123		  ; 8F 23 11 8F | Store accumulator to absolute long address
	BPL $BA			  ; 10 BA | Branch if positive
	ASL $0E7A			; 0E 7A 0E | Arithmetic shift left (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ASL $0C7A			; 0E 7A 0C | Arithmetic shift left (absolute)
	PHY				  ; 5A | Push Y register to stack
	BPL $90			  ; 10 90 | Branch if positive
	BPL $E8			  ; 10 E8 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_294
; Address: $CBA3FA
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_294:
	LDY $10			  ; A4 10 | Load from zero page into Y register
	JMP $C45C5C		  ; 5C 5C 5C C4 | Jump to address long
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $F4			  ; E4 F4 | Compare X register (zero page)
	STZ $30			  ; 64 30 | Store zero to zero page
	BEQ $FA			  ; F0 FA | Branch if equal
	STZ $F4			  ; 64 F4 | Store zero to zero page
	BNE $F6			  ; D0 F6 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	BMI $BA			  ; 30 BA | Branch if negative
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	TSX				  ; BA | Transfer stack pointer to X register
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	STZ $6F1B			; 9C 1B 6F | Store zero to absolute
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	TSX				  ; BA | Transfer stack pointer to X register
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	CPX $31			  ; E4 31 | Compare X register (zero page)
	CPY $36			  ; C4 36 | Compare Y register (zero page)
	ASL $F86F,X		  ; 1E 6F F8 | Arithmetic shift left (absolute,X)
	AND ($C8),Y		  ; 31 C8 | Logical AND with accumulator ((zero page),Y)
	BCS $0E			  ; B0 0E | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $07			  ; F0 07 | Branch if equal
	STA $FAF500		  ; 8F 00 F5 FA | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank16_DmaFunction_295
; Address: $CBA442
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_295:
	BMI $F4			  ; 30 F4 | Branch if negative
	STA $FAF5FF		  ; 8F FF F5 FA | Store accumulator to absolute long address
	BMI $F4			  ; 30 F4 | Branch if negative
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	TSX				  ; BA | Transfer stack pointer to X register
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	STZ $3F1B			; 9C 1B 3F | Store zero to absolute
	PEA #$F81A		   ; F4 1A F8 | Push effective address to stack
	STA $1C0000		  ; 8F 00 00 1C | Store accumulator to absolute long address
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	STA $6F09,Y		  ; 99 09 6F | Store accumulator to absolute,Y
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	AND ($E4),Y		  ; 31 E4 | Logical AND with accumulator ((zero page),Y)
	STA $1C0000		  ; 8F 00 00 1C | Store accumulator to absolute long address
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $D5			  ; 80 D5 | Branch always
	ORA #$6F			 ; 09 6F | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	AND ($E4),Y		  ; 31 E4 | Logical AND with accumulator ((zero page),Y)
	STY $09			  ; 84 09 | Store Y register to zero page
	INX				  ; E8 | Increment X register
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	ORA #$6F			 ; 09 6F | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	STA $6F2BFF		  ; 8F FF 2B 6F | Store accumulator to absolute long address
	PLX				  ; FA | Pull X register from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	CPX $31			  ; E4 31 | Compare X register (zero page)
	CPY $35			  ; C4 35 | Compare Y register (zero page)
	ADC $36C4			; 6D C4 36 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_296
; Address: $CBA4AE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_296:
	JSR $F81E			; 20 1E F8 | Jump to subroutine
	INX				  ; E8 | Increment X register
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	CPY #$D5			 ; C0 D5 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_297
; Address: $CBA4C3
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_297:
	JSL $00E809		  ; 22 09 E8 00 | Jump to subroutine long
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	INC $09			  ; E6 09 | Increment (zero page)
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	BMI $09			  ; 30 09 | Branch if negative
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	BPL $D5			  ; 10 D5 | Branch if positive
	LDX $E809			; AE 09 E8 | Load from absolute address into X register
	STY $09			  ; 84 09 | Store Y register to zero page
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)
	STA $E809,Y		  ; 99 09 E8 | Store accumulator to absolute,Y
	PHP				  ; 08 | Push processor status to stack
	INC $25F6			; EE F6 25 | Increment (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	AND ($0A),Y		  ; 31 0A | Logical AND with accumulator ((zero page),Y)
	CPY $09			  ; C4 09 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	CMP $F8D5,X		  ; DD D5 F8 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STA $F700			; 8D 00 F7 | Store accumulator to absolute address
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	ORA #$FC			 ; 09 FC | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CMP $F0			  ; C5 F0 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F1			  ; C5 F1 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F2			  ; C5 F2 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F3			  ; C5 F3 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F4			  ; C5 F4 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F5			  ; C5 F5 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F6			  ; C5 F6 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F7			  ; C5 F7 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $3F3D64		  ; 8F 64 3D 3F | Store accumulator to absolute long address
	ORA $3F90,X		  ; 1D 90 3F | Logical OR with accumulator (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SBC $FCFC,X		  ; FD FC FC | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY $01			  ; C4 01 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_298
; Address: $CBA53B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_298:
	BMI $03			  ; 30 03 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STA $CF07			; 8D 07 CF | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_299
; Address: $CBA54E
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_299:
	STY $36			  ; 84 36 | Store Y register to zero page
	SBC $D67D,X		  ; FD 7D D6 | Subtract with carry (absolute,X)
	SBC $E809			; ED 09 E8 | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	WDM #$1D			 ; 42 1D | Reserved instruction
	ORA $3D8B,X		  ; 1D 8B 3D | Logical OR with accumulator (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BCC $BC			  ; 90 BC | Branch if carry clear
	ADC $36C4			; 6D C4 36 | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $02			  ; F0 02 | Branch if equal
	INC $3F6F			; EE 6F 3F | Increment (absolute)
	ASL $36F8,X		  ; 1E F8 36 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	STA $F509,Y		  ; 99 09 F5 | Store accumulator to absolute,Y
	BMI $09			  ; 30 09 | Branch if negative
	STA				  ; 9F 13 B2 23 | Store accumulator to absolute long,X
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	AND ($E8,X)		  ; 21 E8 | Logical AND with accumulator ((zero page,X))
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	CPY $26			  ; C4 26 | Compare Y register (zero page)
	ROL $C409,X		  ; 3E 09 C4 | Rotate left (absolute,X)
	AND $F5			  ; 25 F5 | Logical AND with accumulator (zero page)
	EOR $09			  ; 45 09 | Exclusive OR with accumulator (zero page)
	CPY $27			  ; C4 27 | Compare Y register (zero page)
	STA $F5F20F		  ; 8F 0F F2 F5 | Store accumulator to absolute long address
	JMP $C409			; 4C 09 C4 | Jump to address
	STA $F5F21F		  ; 8F 1F F2 F5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F22F		  ; 8F 2F F2 F5 | Store accumulator to absolute long address
	PHY				  ; 5A | Push Y register to stack
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_29A
; Address: $CBA5C4
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_29A:
	STA $F5F23F		  ; 8F 3F F2 F5 | Store accumulator to absolute long address
	ADC ($09,X)		  ; 61 09 | Add with carry ((zero page,X))
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	STA $F5F24F		  ; 8F 4F F2 F5 | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F25F		  ; 8F 5F F2 F5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F26F		  ; 8F 6F F2 F5 | Store accumulator to absolute long address
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	STA $F5F27F		  ; 8F 7F F2 F5 | Store accumulator to absolute long address
	ADC $C409,X		  ; 7D 09 C4 | Add with carry (absolute,X)
	INC $36F8			; EE F8 36 | Increment (absolute)
	CMP $F8D5,X		  ; DD D5 F8 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	CMP $F0			  ; C5 F0 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F1			  ; C5 F1 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F2			  ; C5 F2 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F3			  ; C5 F3 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F4			  ; C5 F4 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F5			  ; C5 F5 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F6			  ; C5 F6 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP $F7			  ; C5 F7 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $E43D64		  ; 8F 64 3D E4 | Store accumulator to absolute long address
	STA $CF07			; 8D 07 CF | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_29B
; Address: $CBA618
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_29B:
	STY $36			  ; 84 36 | Store Y register to zero page
	SBC $EDF6,X		  ; FD F6 ED | Subtract with carry (absolute,X)
	ORA #$5D			 ; 09 5D | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	WDM #$1D			 ; 42 1D | Reserved instruction
	BCC $1B			  ; 90 1B | Branch if carry clear
	CMP $C49F,X		  ; DD 9F C4 | Compare accumulator (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CF10			; 8D 10 CF | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_29D
; Address: $CBA638
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_29D:
	SBC $3DF6,X		  ; FD F6 3D | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3F04			; 8D 04 3F | Store accumulator to absolute address
	STZ $14			  ; 64 14 | Store zero to zero page
	CPX $3D			  ; E4 3D | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	AND $03AB,X		  ; 3D AB 03 | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BCC $C3			  ; 90 C3 | Branch if carry clear
	EOR $FF8F			; 4D 8F FF | Exclusive OR with accumulator (absolute)
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	STA $F600			; 8D 00 F6 | Store accumulator to absolute address
	BEQ $08			  ; F0 08 | Branch if equal
	BNE $13			  ; D0 13 | Branch if not equal
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $18			  ; F0 18 | Branch if equal
	EOR $18F5,X		  ; 5D F5 18 | Exclusive OR with accumulator (absolute,X)
	STZ $01			  ; 64 01 | Store zero to zero page
	BCS $04			  ; B0 04 | Branch if carry set
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	LDA $9008			; AD 08 90 | Load from absolute address into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	ADC #$3D			 ; 69 3D | Add with carry (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	BIT $DDCE			; 2C CE DD | Test bits in accumulator (absolute)
	ADC $E8D6,X		  ; 7D D6 E8 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	ORA ($D6,X)		  ; 01 D6 | Logical OR with accumulator ((zero page,X))
	BEQ $08			  ; F0 08 | Branch if equal
	JMP $1F2414		  ; 5C 14 24 1F | Jump to address long
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	ASL $1EC4,X		  ; 1E C4 1E | Arithmetic shift left (absolute,X)
	BRA $6F			  ; 80 6F | Branch always
	DEC $D5DD			; CE DD D5 | Decrement (absolute)
	INX				  ; E8 | Increment X register
	ORA ($D6,X)		  ; 01 D6 | Logical OR with accumulator ((zero page,X))
	BEQ $08			  ; F0 08 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_29E
; Address: $CBA6B5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_29E:
	INX				  ; E8 | Increment X register
	BNE $05			  ; D0 05 | Branch if not equal
	BNE $08			  ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank16_DmaFunction_29F
; Address: $CBA6BE
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_29F:
	BVS $05			  ; 70 05 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	ORA $D5			  ; 05 D5 | Logical OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $D5			  ; 06 D5 | Arithmetic shift left (zero page)
	ASL $D5			  ; 06 D5 | Arithmetic shift left (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $03			  ; F0 03 | Branch if equal
	INX				  ; E8 | Increment X register
	BPL $D5			  ; 10 D5 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	LDA $0510D5		  ; AF D5 10 05 | Load from absolute long address into accumulator
	PLP				  ; 28 | Pull processor status from stack
	ORA $E4			  ; 05 E4 | Logical OR with accumulator (zero page)
	AND $18D5,X		  ; 3D D5 18 | Logical AND with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ORA $E8			  ; 05 E8 | Logical OR with accumulator (zero page)
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	CMP $F500			; CD 00 F5 | Compare accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $07			  ; F0 07 | Branch if equal
	AND $18C8,X		  ; 3D C8 18 | Logical AND with accumulator (absolute,X)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2A0
; Address: $CBA710
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2A0:
	BRA $6F			  ; 80 6F | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	LDA $D000			; AD 00 D0 | Load from absolute address into accumulator
	ASL $F66F,X		  ; 1E 6F F6 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	BNE $07			  ; D0 07 | Branch if not equal
	ASL $6A3F,X		  ; 1E 3F 6A | Arithmetic shift left (absolute,X)
	ASL $3F6F,X		  ; 1E 6F 3F | Arithmetic shift left (absolute,X)
	ASL $3F6F,X		  ; 1E 6F 3F | Arithmetic shift left (absolute,X)
	ASL $273F,X		  ; 1E 3F 27 | Arithmetic shift left (absolute,X)
	ASL $EB6F,X		  ; 1E 6F EB | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	SBC $D609			; ED 09 D6 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2A1
; Address: $CBA73D
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2A1:
	PEA #$D609		   ; F4 09 D6 | Push effective address to stack
	ORA #$D6			 ; 09 D6 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	BPL $0A			  ; 10 0A | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $6F0A,X		  ; 1E 0A 6F | Arithmetic shift left (absolute,X)
	STA $E40000		  ; 8F 00 00 E4 | Store accumulator to absolute long address
	LDA $AB1E			; AD 1E AB | Load from absolute address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BCC $F4			  ; 90 F4 | Branch if carry clear
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $8F6F,X		  ; 1E 6F 8F | Arithmetic shift left (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BCC $1E			  ; 90 1E | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BCC $F4			  ; 90 F4 | Branch if carry clear
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $EB6F,X		  ; 1E 6F EB | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $09			  ; 30 09 | Branch if negative
	BEQ $19			  ; F0 19 | Branch if equal
	EOR $E86D			; 4D 6D E8 | Exclusive OR with accumulator (absolute)
	STA				  ; 9F 13 A2 23 | Store accumulator to absolute long,X
	INX				  ; E8 | Increment X register
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	CPY $25			  ; C4 25 | Compare Y register (zero page)
	CPY $26			  ; C4 26 | Compare Y register (zero page)
	CPY $27			  ; C4 27 | Compare Y register (zero page)
	CPY $21			  ; C4 21 | PPU graphics register access
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	INC $6FCE			; EE CE 6F | Increment (absolute)
	STA $CF07			; 8D 07 CF | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2A2
; Address: $CBA7A2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2A2:
	STY $36			  ; 84 36 | Store Y register to zero page
	SBC $EDF6,X		  ; FD F6 ED | Subtract with carry (absolute,X)
	ORA #$68			 ; 09 68 | Logical OR with accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	EOR $FFE8,X		  ; 5D E8 FF | Exclusive OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	SBC $6F09			; ED 09 6F | Subtract with carry (absolute)
	STA $CF07			; 8D 07 CF | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2A3
; Address: $CBA7BF
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2A3:
	STY $36			  ; 84 36 | Store Y register to zero page
	SBC $EDF6,X		  ; FD F6 ED | Subtract with carry (absolute,X)
	ORA #$68			 ; 09 68 | Logical OR with accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	EOR $C03F,X		  ; 5D 3F C0 | Exclusive OR with accumulator (absolute,X)
	ASL $D86F,X		  ; 1E 6F D8 | Arithmetic shift left (absolute,X)
	ORA ($F5,X)		  ; 01 F5 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	EOR $E8F5,X		  ; 5D F5 E8 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STZ $01			  ; 64 01 | Store zero to zero page
	BNE $0D			  ; D0 0D | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	STA $C4F25C		  ; 8F 5C F2 C4 | Store accumulator to absolute long address
	BEQ $12			  ; F0 12 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	BCS $07			  ; B0 07 | Branch if carry set
	EOR $37E4,X		  ; 5D E4 37 | Exclusive OR with accumulator (absolute,X)
	CPX $6F1E			; EC 1E 6F | Compare X register (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	CLC				  ; 18 | Clear carry flag
	REP #$18			 ; C2 18 | Reset processor status bits
	BPL $19			  ; 10 19 | Branch if positive
	ORA $191C,Y		  ; 19 1C 19 | Logical OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $1939,Y		  ; 19 39 19 | Logical OR with accumulator (absolute,Y)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	EOR $0019			; 4D 19 00 | Exclusive OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $0F			  ; 80 0F | Branch always
	BRA $0E			  ; 80 0E | Branch always
	ASL $0D80			; 0E 80 0D | Arithmetic shift left (absolute)
	ORA $0C80			; 0D 80 0C | Logical OR with accumulator (absolute)
	BRA $0B			  ; 80 0B | Branch always
	BRA $0A			  ; 80 0A | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $09			  ; 80 09 | Branch always
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $07			  ; 80 07 | Branch always
	BRA $06			  ; 80 06 | Branch always
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2A4
; Address: $CBA84F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2A4:
	BRA $03			  ; 80 03 | Branch always
	BRA $02			  ; 80 02 | Branch always
	BRA $01			  ; 80 01 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2A6
; Address: $CBA864
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2A6:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	AND $3E00,X		  ; 3D 00 3E | Logical AND with accumulator (absolute,X)
	ROL $3D00,X		  ; 3E 00 3D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2AA
; Address: $CBA8E6
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2AA:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	AND $3E00,X		  ; 3D 00 3E | Logical AND with accumulator (absolute,X)
	ROL $3D00,X		  ; 3E 00 3D | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2AB
; Address: $CBA928
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2AB:
	DEC				  ; 3A | Decrement accumulator
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2AF
; Address: $CBA966
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2AF:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	AND $3D00,X		  ; 3D 00 3D | Logical AND with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2B3
; Address: $CBA9E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2B3:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2B4
; Address: $CBA9F2
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2B4:
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2B8
; Address: $CBAA66
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2B8:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2BD
; Address: $CBAAE6
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2BD:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2C1
; Address: $CBAB66
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2C1:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2C2
; Address: $CBAB7E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2C2:
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2C6
; Address: $CBABE6
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2C6:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2CB
; Address: $CBAC66
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2CB:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2CF
; Address: $CBACE6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2CF:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2D0
; Address: $CBAD2E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2D0:
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2D4
; Address: $CBAD66
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2D4:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2D9
; Address: $CBADE8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2D9:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2DC
; Address: $CBAE60
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2DC:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2DD
; Address: $CBAE68
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2DD:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2DE
; Address: $CBAE98
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2DE:
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2D00			; 2E 00 2D | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E1
; Address: $CBAEE0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E1:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E2
; Address: $CBAEE8
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E2:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E3
; Address: $CBAF40
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E3:
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E4
; Address: $CBAF54
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E4:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E6
; Address: $CBAF60
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E6:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E7
; Address: $CBAF68
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E7:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2E00			; 2D 00 2E | Logical AND with accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2C00			; 2D 00 2C | Logical AND with accumulator (absolute)
	BIT $2B00			; 2C 00 2B | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2E8
; Address: $CBAFD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2E8:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2EA
; Address: $CBAFE0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2EA:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2EB
; Address: $CBAFE8
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2EB:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2EC
; Address: $CBB054
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2EC:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2EE
; Address: $CBB060
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2EE:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2EF
; Address: $CBB068
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2EF:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2F0
; Address: $CBB082
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2F0:
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2F1
; Address: $CBB0D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2F1:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2F5
; Address: $CBB0EA
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2F5:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2F6
; Address: $CBB132
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2F6:
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2F7
; Address: $CBB152
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2F7:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2FA
; Address: $CBB162
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2FA:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2FB
; Address: $CBB16A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2FB:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	AND $2D00			; 2D 00 2D | Logical AND with accumulator (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2FC
; Address: $CBB1D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2FC:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_2FF
; Address: $CBB1E2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_2FF:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_301
; Address: $CBB1EE
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_301:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_307
; Address: $CBB266
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_307:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_308
; Address: $CBB26C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_308:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_309
; Address: $CBB2D0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_309:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_30C
; Address: $CBB2E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_30C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_30E
; Address: $CBB2F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_30E:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_30F
; Address: $CBB2FC
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_30F:
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_311
; Address: $CBB352
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_311:
	JSL $002100		  ; 22 00 21 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_315
; Address: $CBB366
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_315:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_317
; Address: $CBB372
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_317:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_318
; Address: $CBB386
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_318:
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_31A
; Address: $CBB3D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_31A:
	JSL $002100		  ; 22 00 21 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_31E
; Address: $CBB3E4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_31E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_320
; Address: $CBB3F4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_320:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_321
; Address: $CBB41A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_321:
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_323
; Address: $CBB44E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_323:
	JSL $002100		  ; 22 00 21 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_327
; Address: $CBB464
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_327:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_329
; Address: $CBB474
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_329:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_32A
; Address: $CBB4B6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_32A:
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_32C
; Address: $CBB4CC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_32C:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_331
; Address: $CBB4E8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_331:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_333
; Address: $CBB4F8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_333:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_336
; Address: $CBB54C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_336:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_33C
; Address: $CBB56A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_33C:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_33F
; Address: $CBB57E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_33F:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_342
; Address: $CBB5C8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_342:
	JSL $002100		  ; 22 00 21 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_349
; Address: $CBB5EC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_349:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_34D
; Address: $CBB606
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_34D:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_351
; Address: $CBB644
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_351:
	JSL $002100		  ; 22 00 21 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_359
; Address: $CBB66E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_359:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_361
; Address: $CBB6BC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_361:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_36B
; Address: $CBB6F4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_36B:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_375
; Address: $CBB730
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_375:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_376
; Address: $CBB742
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_376:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_384
; Address: $CBB77E
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_384:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3AC
; Address: $CBB85C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3AC:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3AD
; Address: $CBB881
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3AD:
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5A00,Y		  ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
	JMP $005D00		  ; 5C 00 5D 00 | Jump to address long
	LSR $5F00,X		  ; 5E 00 5F | Logical shift right (absolute,X)
	LSR $5D00,X		  ; 5E 00 5D | Logical shift right (absolute,X)
	JMP $005B00		  ; 5C 00 5B 00 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	EOR $5800,Y		  ; 59 00 58 | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5A00,Y		  ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
	JMP $005D00		  ; 5C 00 5D 00 | Jump to address long
	LSR $5E00,X		  ; 5E 00 5E | Logical shift right (absolute,X)
	EOR $5C00,X		  ; 5D 00 5C | Exclusive OR with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	EOR $5800,Y		  ; 59 00 58 | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3AE
; Address: $CBB957
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3AE:
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5A00,Y		  ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
	JMP $005D00		  ; 5C 00 5D 00 | Jump to address long
	EOR $5C00,X		  ; 5D 00 5C | Exclusive OR with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	EOR $5800,Y		  ; 59 00 58 | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3AF
; Address: $CBBA15
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3AF:
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5A00,Y		  ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
	JMP $005C00		  ; 5C 00 5C 00 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	EOR $5800,Y		  ; 59 00 58 | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5A00,Y		  ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	EOR $5800,Y		  ; 59 00 58 | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B0
; Address: $CBBAE1
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B0:
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5A00,Y		  ; 59 00 5A | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	EOR $5800,Y		  ; 59 00 58 | Exclusive OR with accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B1
; Address: $CBBB9B
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B1:
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5900,Y		  ; 59 00 59 | Exclusive OR with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B2
; Address: $CBBC5F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B2:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B3
; Address: $CBBD35
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B3:
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B4
; Address: $CBBDE3
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B4:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B5
; Address: $CBBE97
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B5:
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4D00			; 4E 00 4D | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D00			; 4C 00 4D | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B6
; Address: $CBBF3D
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B6:
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4E00			; 4D 00 4E | Exclusive OR with accumulator (absolute)
	LSR $4F00			; 4E 00 4F | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	JMP $4B00			; 4C 00 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B7
; Address: $CBBFD7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B7:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B8
; Address: $CBC077
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B8:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3B9
; Address: $CBC11F
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3B9:
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3BA
; Address: $CBC1C1
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3BA:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4C00			; 4C 00 4C | Jump to address
	JMP $4C00			; 4C 00 4C | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3BB
; Address: $CBC257
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3BB:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3BC
; Address: $CBC2E7
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3BC:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3BD
; Address: $CBC36F
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3BD:
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3BE
; Address: $CBC405
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3BE:
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3BF
; Address: $CBC4A7
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3BF:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C0
; Address: $CBC52D
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C0:
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
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
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C1
; Address: $CBC5CF
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C1:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
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
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C2
; Address: $CBC663
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C2:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
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

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C3
; Address: $CBC6E7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C3:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C4
; Address: $CBC74B
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C4:
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
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C5
; Address: $CBC7AF
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C5:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
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

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C6
; Address: $CBC813
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C6:
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
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C7
; Address: $CBC882
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C7:
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9A00,Y		  ; 99 00 9A | Store accumulator to absolute,Y
	STZ $9D00			; 9C 00 9D | Store zero to absolute
	STZ $9F00,X		  ; 9E 00 9F | Store zero to absolute,X
	STA				  ; 9F 00 9E 00 | Store accumulator to absolute long,X
	STA $9C00,X		  ; 9D 00 9C | Store accumulator to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9800,Y		  ; 99 00 98 | Store accumulator to absolute,Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9A00,Y		  ; 99 00 9A | Store accumulator to absolute,Y
	STZ $9D00			; 9C 00 9D | Store zero to absolute
	STZ $9E00,X		  ; 9E 00 9E | Store zero to absolute,X
	STA $9C00,X		  ; 9D 00 9C | Store accumulator to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9800,Y		  ; 99 00 98 | Store accumulator to absolute,Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C8
; Address: $CBC94C
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C8:
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	STA $009000		  ; 8F 00 90 00 | Store accumulator to absolute long address
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9A00,Y		  ; 99 00 9A | Store accumulator to absolute,Y
	STZ $9D00			; 9C 00 9D | Store zero to absolute
	STA $9C00,X		  ; 9D 00 9C | Store accumulator to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9800,Y		  ; 99 00 98 | Store accumulator to absolute,Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STY $8B00			; 8C 00 8B | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3C9
; Address: $CBC9F8
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3C9:
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9A00,Y		  ; 99 00 9A | Store accumulator to absolute,Y
	STZ $9C00			; 9C 00 9C | Store zero to absolute
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9800,Y		  ; 99 00 98 | Store accumulator to absolute,Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $009000		  ; 8F 00 90 00 | Store accumulator to absolute long address
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9A00,Y		  ; 99 00 9A | Store accumulator to absolute,Y
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9800,Y		  ; 99 00 98 | Store accumulator to absolute,Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STY $8B00			; 8C 00 8B | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3CA
; Address: $CBCAC8
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3CA:
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9A00,Y		  ; 99 00 9A | Store accumulator to absolute,Y
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9800,Y		  ; 99 00 98 | Store accumulator to absolute,Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3CB
; Address: $CBCB6C
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3CB:
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STA $009000		  ; 8F 00 90 00 | Store accumulator to absolute long address
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9900,Y		  ; 99 00 99 | Store accumulator to absolute,Y
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STY $8B00			; 8C 00 8B | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $009000		  ; 8F 00 90 00 | Store accumulator to absolute long address
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3CC
; Address: $CBCC20
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3CC:
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STY $8B00			; 8C 00 8B | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3CD
; Address: $CBCCDE
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3CD:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3CE
; Address: $CBCD82
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3CE:
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3CF
; Address: $CBCE2E
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3CF:
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D0
; Address: $CBCEC2
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D0:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008E00		  ; 8F 00 8E 00 | Store accumulator to absolute long address
	STX $8D00			; 8E 00 8D | Store X register to absolute address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D1
; Address: $CBCF4C
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D1:
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8E00			; 8D 00 8E | Store accumulator to absolute address
	STX $8F00			; 8E 00 8F | Store X register to absolute address
	STA $009000		  ; 8F 00 90 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $8C00			; 8D 00 8C | Store accumulator to absolute address
	STY $8B00			; 8C 00 8B | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D2
; Address: $CBCFDE
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D2:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D3
; Address: $CBD072
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D3:
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D4
; Address: $CBD104
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D4:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D5
; Address: $CBD192
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D5:
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STA $8D00			; 8D 00 8D | Store accumulator to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D6
; Address: $CBD21C
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D6:
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D7
; Address: $CBD2A2
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D7:
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D8
; Address: $CBD328
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D8:
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3D9
; Address: $CBD3B6
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3D9:
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3DA
; Address: $CBD452
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3DA:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3DB
; Address: $CBD4E6
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3DB:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
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
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3DC
; Address: $CBD56E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3DC:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3DD
; Address: $CBD618
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3DD:
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3DE
; Address: $CBD6D6
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3DE:
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3DF
; Address: $CBD762
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3DF:
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3E0
; Address: $CBD7C6
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3E0:
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

;------------------------------------------------------------------------------
; Bank16_DmaFunction_3E1
; Address: $CBD82A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank16_DmaFunction_3E1:
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
