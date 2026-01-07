;==============================================================================
; Dragon Quest III - Bank $2E
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $D70000-$D77FFF
; Instructions: 9240
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_2E"

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_001
; Address: $D78008
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_001:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8026			; 4C 26 80 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_002
; Address: $D78011
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_002:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8020			; 4C 20 80 | Jump to address
	CMP ($06,X)		  ; C1 06 | Compare accumulator ((zero page,X))
	JMP $8023			; 4C 23 80 | Jump to address
	REP #$06			 ; C2 06 | Reset processor status bits
	JMP $8029			; 4C 29 80 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	BRA $AD			  ; 80 AD | Branch always
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $804C			; 4C 4C 80 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_003
; Address: $D78037
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_003:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8046			; 4C 46 80 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	EOR #$80			 ; 49 80 | Exclusive OR with accumulator (immediate)
	ADC $4C06,X		  ; 7D 06 4C | Add with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_004
; Address: $D78050
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_004:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $805F			; 4C 5F 80 | Jump to address
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	JMP $8082			; 4C 82 80 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $807F			; 4C 7F 80 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_005
; Address: $D7806A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_005:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8079			; 4C 79 80 | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_006
; Address: $D78083
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_006:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8092			; 4C 92 80 | Jump to address
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	JMP $8115			; 4C 15 81 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_008
; Address: $D7809D
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_008:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $80AC			; 4C AC 80 | Jump to address
	JMP $4C06			; 4C 06 4C | Jump to address
	STA ($22,X)		  ; 81 22 | Store accumulator to (zero page,X)
	STA ($CB,X)		  ; 81 CB | Store accumulator to (zero page,X)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $80BE			; 4C BE 80 | Jump to address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $4C06,X		  ; 7E 06 4C | Rotate right (absolute,X)
	STA ($AD,X)		  ; 81 AD | Store accumulator to (zero page,X)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $80D9			; 4C D9 80 | Jump to address
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $CDAC,X		  ; BD AC CD | Load from absolute,X into accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $4C06,X		  ; 7E 06 4C | Rotate right (absolute,X)
	STA ($AD,X)		  ; 81 AD | Store accumulator to (zero page,X)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $810C			; 4C 0C 81 | Jump to address
	ROR $2206,X		  ; 7E 06 22 | Rotate right (absolute,X)
	LDA $CDAC,X		  ; BD AC CD | Load from absolute,X into accumulator
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $8106			; 4C 06 81 | Jump to address
	STA ($06,X)		  ; 81 06 | Store accumulator to (zero page,X)
	ASL $A9			  ; 06 A9 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	JMP $8109			; 4C 09 81 | Jump to address
	BRA $06			  ; 80 06 | Branch always
	JMP $810F			; 4C 0F 81 | Jump to address
	ROR $4C06,X		  ; 7E 06 4C | Rotate right (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA $6B06,X		  ; 1D 06 6B | Logical OR with accumulator (absolute,X)
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8130			; 4C 30 81 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8130			; 4C 30 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8131			; 4C 31 81 | Jump to address
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_00A
; Address: $D78132
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_00A:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8142			; 4C 42 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_00B
; Address: $D7813B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_00B:
	JSL $CCDAFE		  ; 22 FE DA CC | Jump to subroutine long
	JMP $8155			; 4C 55 81 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8155			; 4C 55 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_00E
; Address: $D78156
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_00E:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81A6			; 4C A6 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_00F
; Address: $D7815F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_00F:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81A0			; 4C A0 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_011
; Address: $D7816C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_011:
	JSL $CC9081		  ; 22 81 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $817C			; 4C 7C 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_013
; Address: $D7817C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_013:
	JSL $CC90B2		  ; 22 B2 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $818B			; 4C 8B 81 | Jump to address
	ROR $0F			  ; 66 0F | Rotate right (zero page)
	JMP $819D			; 4C 9D 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_014
; Address: $D7818B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_014:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $819A			; 4C 9A 81 | Jump to address
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	JMP $819D			; 4C 9D 81 | Jump to address
	DEC $06			  ; C6 06 | Decrement (zero page)
	JMP $81A3			; 4C A3 81 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	STA ($AD,X)		  ; 81 AD | Store accumulator to (zero page,X)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $81EC			; 4C EC 81 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_016
; Address: $D781B5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_016:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81C4			; 4C C4 81 | Jump to address
	EOR $4C06			; 4D 06 4C | Exclusive OR with accumulator (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $06			  ; 84 06 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_01A
; Address: $D781D3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_01A:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81E2			; 4C E2 81 | Jump to address
	LSR $4C06			; 4E 06 4C | Logical shift right (absolute)
	SBC $81			  ; E5 81 | Subtract with carry (zero page)
	STA $06			  ; 85 06 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_01B
; Address: $D781E5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_01B:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	JMP $81EF			; 4C EF 81 | Jump to address
	ASL $6B06,X		  ; 1E 06 6B | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_01C
; Address: $D781F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_01C:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $821D			; 4C 1D 82 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_01D
; Address: $D781F9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_01D:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8208			; 4C 08 82 | Jump to address
	INY				  ; C8 | Increment Y register
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_01E
; Address: $D78208
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_01E:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8217			; 4C 17 82 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	JMP $821A			; 4C 1A 82 | Jump to address
	DEX				  ; CA | Decrement X register
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $823D			; 4C 3D 82 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_01F
; Address: $D78228
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_01F:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8237			; 4C 37 82 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	DEC				  ; 3A | Decrement accumulator
	STX $06			  ; 86 06 | Store X register to zero page
	JMP $8240			; 4C 40 82 | Jump to address
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_020
; Address: $D78241
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_020:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8271			; 4C 71 82 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_021
; Address: $D7824A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_021:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $826B			; 4C 6B 82 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_022
; Address: $D78253
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_022:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8262			; 4C 62 82 | Jump to address
	LDA $4C06,X		  ; BD 06 4C | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_023
; Address: $D78260
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_023:
	ADC $82			  ; 65 82 | Add with carry (zero page)
	LDX $0006,Y		  ; BE 06 00 | Load from absolute,Y into X register
	LDA				  ; BF 06 4C 6E | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_024
; Address: $D7826C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_024:
	JSR $4C06			; 20 06 4C | Jump to subroutine
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8291			; 4C 91 82 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_025
; Address: $D7827C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_025:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $828B			; 4C 8B 82 | Jump to address
	EOR #$06			 ; 49 06 | Exclusive OR with accumulator (immediate)
	JMP $828E			; 4C 8E 82 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_027
; Address: $D78295
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_027:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $82A4			; 4C A4 82 | Jump to address
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	JMP $82C7			; 4C C7 82 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $82C4			; 4C C4 82 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_028
; Address: $D782AF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_028:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $82BE			; 4C BE 82 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	CMP ($82,X)		  ; C1 82 | Compare accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_029
; Address: $D782C8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_029:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	EOR $CDDC			; 4D DC CD | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_02B
; Address: $D782DE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_02B:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $82ED			; 4C ED 82 | Jump to address
	LDY $4C06,X		  ; BC 06 4C | Load from absolute,X into Y register
	BPL $83			  ; 10 83 | Branch if positive
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $830D			; 4C 0D 83 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_02C
; Address: $D782F8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_02C:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8307			; 4C 07 83 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $4C06,Y		  ; 79 06 4C | Add with carry (absolute,Y)
	BPL $83			  ; 10 83 | Branch if positive

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_02D
; Address: $D7830E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_02D:
	JSL $226B06		  ; 22 06 6B 22 | Jump to subroutine long
	STA $03B0CC		  ; 8F CC B0 03 | Store accumulator to absolute long address
	JMP $8332			; 4C 32 83 | Jump to address
	TSX				  ; BA | Transfer stack pointer to X register
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $832C			; 4C 2C 83 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	AND $06			  ; 25 06 | Logical AND with accumulator (zero page)
	JMP $8367			; 4C 67 83 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8352			; 4C 52 83 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_02E
; Address: $D7833D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_02E:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $834C			; 4C 4C 83 | Jump to address
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	JMP $834F			; 4C 4F 83 | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $8364			; 4C 64 83 | Jump to address
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	JMP $8367			; 4C 67 83 | Jump to address
	AND $06			  ; 25 06 | Logical AND with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_02F
; Address: $D78368
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_02F:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8377			; 4C 77 83 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	CMP $AD83			; CD 83 AD | Compare accumulator (absolute)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $83CA			; 4C CA 83 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_030
; Address: $D78382
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_030:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8391			; 4C 91 83 | Jump to address
	EOR $06			  ; 45 06 | Exclusive OR with accumulator (zero page)
	JMP $83C7			; 4C C7 83 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_031
; Address: $D78391
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_031:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $83B3			; 4C B3 83 | Jump to address
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $83AD			; 4C AD 83 | Jump to address
	LDY $06			  ; A4 06 | Load from zero page into Y register
	JMP $83B0			; 4C B0 83 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $83C4			; 4C C4 83 | Jump to address
	LDY $06			  ; A4 06 | Load from zero page into Y register
	JMP $83C7			; 4C C7 83 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	CMP $0083			; CD 83 00 | Compare accumulator (absolute)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_032
; Address: $D783CE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_032:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $83FE			; 4C FE 83 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_033
; Address: $D783D7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_033:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $83F8			; 4C F8 83 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_034
; Address: $D783E0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_034:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $83EF			; 4C EF 83 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLV				  ; B8 | Clear overflow flag
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	LDA $4C06,Y		  ; B9 06 4C | Load from absolute,Y into accumulator
	AND ($84,X)		  ; 21 84 | Logical AND with accumulator ((zero page,X))
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $841E			; 4C 1E 84 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_035
; Address: $D78409
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_035:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8418			; 4C 18 84 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	AND ($84,X)		  ; 21 84 | Logical AND with accumulator ((zero page,X))
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_03B
; Address: $D78442
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_03B:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $844F			; 4C 4F 84 | Jump to address
	JMP $843F			; 4C 3F 84 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_03C
; Address: $D7844F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_03C:
	JSL $CDA0EE		  ; 22 EE A0 CD | Jump to subroutine long
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_03D
; Address: $D7845B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_03D:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $361A			; 8D 1A 36 | Store accumulator to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $8493			; 4C 93 84 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_03E
; Address: $D78476
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_03E:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8485			; 4C 85 84 | Jump to address
	AND $4C06,Y		  ; 39 06 4C | Logical AND with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	STY $00			  ; 84 00 | Store Y register to zero page
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_03F
; Address: $D7848D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_03F:
	JSL $4CCB84		  ; 22 84 CB 4C | Jump to subroutine long
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	JMP $84B7			; 4C B7 84 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	SEP #$84			 ; E2 84 | Set processor status bits
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	SEP #$84			 ; E2 84 | Set processor status bits
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	SEP #$84			 ; E2 84 | Set processor status bits
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	SEP #$84			 ; E2 84 | Set processor status bits
	SEC				  ; 38 | Set carry flag
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	STY $4C			  ; 84 4C | Store Y register to zero page
	SEP #$84			 ; E2 84 | Set processor status bits
	LDA $361A			; AD 1A 36 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8496			; 4C 96 84 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_040
; Address: $D784C2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_040:
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $849C			; 4C 9C 84 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $84A2			; 4C A2 84 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $84A8			; 4C A8 84 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $84AE			; 4C AE 84 | Jump to address
	LDA $361A			; AD 1A 36 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $361A			; 8D 1A 36 | Store accumulator to absolute address
	JMP $846A			; 4C 6A 84 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_041
; Address: $D784EF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_041:
	JSL $CDBF7D		  ; 22 7D BF CD | Jump to subroutine long
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8501			; 4C 01 85 | Jump to address
	EOR $220A,X		  ; 5D 0A 22 | Exclusive OR with accumulator (absolute,X)
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_042
; Address: $D78509
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_042:
	JSL $CDBF7D		  ; 22 7D BF CD | Jump to subroutine long
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $856A			; 4C 6A 85 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8529			; 4C 29 85 | Jump to address
	LSR $4C0A,X		  ; 5E 0A 4C | Logical shift right (absolute,X)
	BIT $0085			; 2C 85 00 | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_043
; Address: $D7852C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_043:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8563			; 4C 63 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_044
; Address: $D78535
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_044:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8544			; 4C 44 85 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	STA $AD			  ; 85 AD | Store accumulator to zero page
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8555			; 4C 55 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_045
; Address: $D78550
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_045:
	LDA ($06),Y		  ; B1 06 | Load from (zero page),Y into accumulator
	JMP $8558			; 4C 58 85 | Jump to address
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_046
; Address: $D7855D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_046:
	JSL $4CCB84		  ; 22 84 CB 4C | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	STA $00			  ; 85 00 | Store accumulator to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_049
; Address: $D7856B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_049:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $85B7			; 4C B7 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_04A
; Address: $D78576
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_04A:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85B0			; 4C B0 85 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $85A9			; 4C A9 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_04B
; Address: $D7858A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_04B:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8599			; 4C 99 85 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	STZ $0085			; 9C 85 00 | Store zero to absolute
	BCS $06			  ; B0 06 | Branch if carry set
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	LDA $2285			; AD 85 22 | Load from absolute address into accumulator
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	JMP $85B4			; 4C B4 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_04C
; Address: $D785B0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_04C:
	JSL $CDBFCE		  ; 22 CE BF CD | Jump to subroutine long
	JMP $8657			; 4C 57 86 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $85FD			; 4C FD 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_04D
; Address: $D785C2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_04D:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85E4			; 4C E4 85 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $85DD			; 4C DD 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_050
; Address: $D785E1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_050:
	JMP $85FA			; 4C FA 85 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $85F6			; 4C F6 85 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_052
; Address: $D785F6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_052:
	JSL $CDBFB4		  ; 22 B4 BF CD | Jump to subroutine long
	JMP $8657			; 4C 57 86 | Jump to address
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8653			; 4C 53 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_053
; Address: $D78608
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_053:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8632			; 4C 32 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_054
; Address: $D78611
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_054:
	JSL $CC9031		  ; 22 31 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $862B			; 4C 2B 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_055
; Address: $D7861A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_055:
	JSL $CC9E44		  ; 22 44 9E CC | Jump to subroutine long
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	LSR $2235			; 4E 35 22 | Logical shift right (absolute)
	STY $CB			  ; 84 CB | Store Y register to zero page
	JMP $862F			; 4C 2F 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_057
; Address: $D78632
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_057:
	JSL $CC9031		  ; 22 31 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $864C			; 4C 4C 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_058
; Address: $D7863B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_058:
	JSL $CC9E44		  ; 22 44 9E CC | Jump to subroutine long
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	LSR $2235			; 4E 35 22 | Logical shift right (absolute)
	LDA				  ; BF CD 4C 50 | Load from absolute long,X into accumulator
	STX $22			  ; 86 22 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	LDA				  ; BF CD 4C 57 | Load from absolute long,X into accumulator
	STX $22			  ; 86 22 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	LDA				  ; BF CD 4C E3 | Load from absolute long,X into accumulator
	STX $AD			  ; 86 AD | Store X register to zero page
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86DF			; 4C DF 86 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $867A			; 4C 7A 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_05A
; Address: $D78678
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_05A:
	LSR $2235			; 4E 35 22 | Logical shift right (absolute)
	ORA $7B			  ; 05 7B | Logical OR with accumulator (zero page)
	CPY $03B0			; CC B0 03 | Compare Y register (absolute)
	JMP $86D8			; 4C D8 86 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86BF			; 4C BF 86 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86B8			; 4C B8 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_05B
; Address: $D78699
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_05B:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86A8			; 4C A8 86 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	PLB				  ; AB | Pull data bank register from stack
	STX $00			  ; 86 00 | Store X register to zero page
	BCS $06			  ; B0 06 | Branch if carry set
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	LDY $2286,X		  ; BC 86 22 | Load from absolute,X into Y register
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	JMP $86D5			; 4C D5 86 | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $86D1			; 4C D1 86 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_06C
; Address: $D78723
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_06C:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $86ED			; 4C ED 86 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_06D
; Address: $D7872B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_06D:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $873A			; 4C 3A 87 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $875A			; 4C 5A 87 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_06E
; Address: $D78745
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_06E:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8754			; 4C 54 87 | Jump to address
	EOR ($06),Y		  ; 51 06 | Exclusive OR with accumulator ((zero page),Y)
	JMP $8757			; 4C 57 87 | Jump to address
	DEY				  ; 88 | Decrement Y register
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_06F
; Address: $D7875A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_06F:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	SBC $CC76,X		  ; FD 76 CC | Subtract with carry (absolute,X)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $877E			; 4C 7E 87 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_070
; Address: $D78777
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_070:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	CPY $D222			; CC 22 D2 | Compare Y register (absolute)
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_071
; Address: $D78787
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_071:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $87B7			; 4C B7 87 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_072
; Address: $D78790
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_072:
	JSL $CC7B05		  ; 22 05 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $87B1			; 4C B1 87 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_073
; Address: $D78799
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_073:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $87A8			; 4C A8 87 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	PLB				  ; AB | Pull data bank register from stack
	CPY $0006			; CC 06 00 | Compare Y register (absolute)
	CMP $4C06			; CD 06 4C | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_074
; Address: $D787B2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_074:
	DEC $4C06			; CE 06 4C | Decrement (absolute)
	PHX				  ; DA | Push X register to stack
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $87D7			; 4C D7 87 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_075
; Address: $D787C2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_075:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $87D1			; 4C D1 87 | Jump to address
	BVC $06			  ; 50 06 | Branch if overflow clear
	JMP $87D4			; 4C D4 87 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	PHX				  ; DA | Push X register to stack
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_07E
; Address: $D78807
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_07E:
	JSL $CC8F87		  ; 22 87 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8816			; 4C 16 88 | Jump to address
	CMP $4C06,X		  ; DD 06 4C | Compare accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_080
; Address: $D7881D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_080:
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	BMI $06			  ; 30 06 | Branch if negative
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_082
; Address: $D78829
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_082:
	AND ($06),Y		  ; 31 06 | Logical AND with accumulator ((zero page),Y)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_083
; Address: $D7882F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_083:
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8840			; 4C 40 88 | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_084
; Address: $D7883E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_084:
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_085
; Address: $D7885E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_085:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_08C
; Address: $D78899
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_08C:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	JMP $8885			; 4C 85 88 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_08D
; Address: $D788A2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_08D:
	JSL $CC808A		  ; 22 8A 80 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $88B3			; 4C B3 88 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_091
; Address: $D788B7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_091:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $88E7			; 4C E7 88 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_092
; Address: $D788C3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_092:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $88D5			; 4C D5 88 | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	JMP $88E7			; 4C E7 88 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_094
; Address: $D788DC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_094:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $88E7			; 4C E7 88 | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_097
; Address: $D788F1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_097:
	JSL $CCD73B		  ; 22 3B D7 CC | Jump to subroutine long
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $890A			; 4C 0A 89 | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_098
; Address: $D78903
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_098:
	JSL $C75446		  ; 22 46 54 C7 | Jump to subroutine long
	JMP $8911			; 4C 11 89 | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_09E
; Address: $D78921
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_09E:
	JSL $CDADAB		  ; 22 AB AD CD | Jump to subroutine long
	JMP $88E9			; 4C E9 88 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A0
; Address: $D78931
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A0:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8940			; 4C 40 89 | Jump to address
	SBC ($06,X)		  ; E1 06 | Subtract with carry ((zero page,X))
	JMP $8943			; 4C 43 89 | Jump to address
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A2
; Address: $D7894B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A2:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $895A			; 4C 5A 89 | Jump to address
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	EOR $0089,X		  ; 5D 89 00 | Exclusive OR with accumulator (absolute,X)
	CPX $06			  ; E4 06 | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A3
; Address: $D7895E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A3:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $896D			; 4C 6D 89 | Jump to address
	SBC $06			  ; E5 06 | Subtract with carry (zero page)
	JMP $8970			; 4C 70 89 | Jump to address
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A5
; Address: $D78973
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A5:
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	CPX $6B06			; EC 06 6B | Compare X register (absolute)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	SBC $6B06			; ED 06 6B | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A6
; Address: $D78981
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A6:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8990			; 4C 90 89 | Jump to address
	NOP				  ; EA | No operation
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A7
; Address: $D78994
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A7:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $89B3			; 4C B3 89 | Jump to address
	INX				  ; E8 | Increment X register
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	SBC $CC98,X		  ; FD 98 CC | Subtract with carry (absolute,X)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $89B0			; 4C B0 89 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0A8
; Address: $D789A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0A8:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	JMP $89B6			; 4C B6 89 | Jump to address
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	INC $06			  ; E6 06 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0AC
; Address: $D789CD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0AC:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $89EB			; 4C EB 89 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0AF
; Address: $D789E4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0AF:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	JMP $89D1			; 4C D1 89 | Jump to address
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A6F			; 4C 6F 8A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0B0
; Address: $D789F6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0B0:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	JMP $8A45			; 4C 45 8A | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA $AD36,Y		  ; 19 36 AD | Logical OR with accumulator (absolute,Y)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0B1
; Address: $D78A09
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0B1:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A12			; 4C 12 8A | Jump to address
	JMP $8A03			; 4C 03 8A | Jump to address
	JMP $8A60			; 4C 60 8A | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $AD36,Y		  ; 19 36 AD | Logical OR with accumulator (absolute,Y)
	ORA $2936,Y		  ; 19 36 29 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A2A			; 4C 2A 8A | Jump to address
	JMP $8A1B			; 4C 1B 8A | Jump to address
	JMP $8A60			; 4C 60 8A | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA $AD36,Y		  ; 19 36 AD | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A42			; 4C 42 8A | Jump to address
	JMP $8A33			; 4C 33 8A | Jump to address
	JMP $8A60			; 4C 60 8A | Jump to address
	LDA $3436			; AD 36 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $89FD			; 4C FD 89 | Jump to address
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8A15			; 4C 15 8A | Jump to address
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8A2D			; 4C 2D 8A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0B6
; Address: $D78A76
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0B6:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$84			 ; A2 84 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0B8
; Address: $D78A90
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0B8:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0B9
; Address: $D78AA0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0B9:
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$39			 ; A9 39 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0BE
; Address: $D78AC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0BE:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AD2			; 4C D2 8A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0BF
; Address: $D78ACB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0BF:
	JSL $CB8AF6		  ; 22 F6 8A CB | Jump to subroutine long
	JMP $8AF5			; 4C F5 8A | Jump to address
	LDA #$17			 ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0C0
; Address: $D78AD5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0C0:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AE5			; 4C E5 8A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0C1
; Address: $D78ADE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0C1:
	JSL $CB8AF6		  ; 22 F6 8A CB | Jump to subroutine long
	JMP $8AF5			; 4C F5 8A | Jump to address
	LDA #$16			 ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0C2
; Address: $D78AE8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0C2:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AF5			; 4C F5 8A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0C5
; Address: $D78AF9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0C5:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B4D			; 4C 4D 8B | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$80			 ; A2 80 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0C6
; Address: $D78B0B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0C6:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B1B			; 4C 1B 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0C7
; Address: $D78B14
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0C7:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8B4A			; 4C 4A 8B | Jump to address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0CA
; Address: $D78B2D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0CA:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8B4A			; 4C 4A 8B | Jump to address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$58			 ; A2 58 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0CB
; Address: $D78B3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0CB:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B4A			; 4C 4A 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0CC
; Address: $D78B46
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0CC:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8BDF			; 4C DF 8B | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0CD
; Address: $D78B50
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0CD:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B72			; 4C 72 8B | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$90			 ; A2 90 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0CE
; Address: $D78B62
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0CE:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B6F			; 4C 6F 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0CF
; Address: $D78B6B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0CF:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8BDF			; 4C DF 8B | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D0
; Address: $D78B75
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D0:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BB0			; 4C B0 8B | Jump to address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D1
; Address: $D78B87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D1:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B97			; 4C 97 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D2
; Address: $D78B90
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D2:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8BAD			; 4C AD 8B | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$38			 ; A0 38 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D4
; Address: $D78BA0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D4:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BAD			; 4C AD 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D5
; Address: $D78BA9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D5:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8BDF			; 4C DF 8B | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$90			 ; A2 90 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D6
; Address: $D78BB9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D6:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BC9			; 4C C9 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D7
; Address: $D78BC2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D7:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $8BDF			; 4C DF 8B | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0D8
; Address: $D78BD2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0D8:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BDF			; 4C DF 8B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0DA
; Address: $D78BE0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0DA:
	JSL $C750A7		  ; 22 A7 50 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C2B			; 4C 2B 8C | Jump to address
	LDA #$18			 ; A9 18 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0DB
; Address: $D78BEC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0DB:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C00			; 4C 00 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0DD
; Address: $D78BF9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0DD:
	JSL $CDB0A8		  ; 22 A8 B0 CD | Jump to subroutine long
	JMP $8C2B			; 4C 2B 8C | Jump to address
	LDA #$17			 ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0DE
; Address: $D78C03
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0DE:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C17			; 4C 17 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0E0
; Address: $D78C10
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0E0:
	JSL $CDB0AF		  ; 22 AF B0 CD | Jump to subroutine long
	JMP $8C2B			; 4C 2B 8C | Jump to address
	LDA #$16			 ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0E1
; Address: $D78C1A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0E1:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C2B			; 4C 2B 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0E4
; Address: $D78C2C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0E4:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA #$86			 ; A9 86 | Load immediate value into accumulator
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0E5
; Address: $D78C39
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0E5:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0E7
; Address: $D78C49
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0E7:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	LDA #$7A			 ; A9 7A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0E9
; Address: $D78C58
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0E9:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0EF
; Address: $D78C7D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0EF:
	JSL $CCD376		  ; 22 76 D3 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8CCC			; 4C CC 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0F1
; Address: $D78C91
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0F1:
	JSL $C76BE3		  ; 22 E3 6B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CC9			; 4C C9 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0F2
; Address: $D78C9A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0F2:
	JSL $CC815D		  ; 22 5D 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CAC			; 4C AC 8C | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	CMP #$8C			 ; C9 8C | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0F3
; Address: $D78CAC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0F3:
	JSL $CC8175		  ; 22 75 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CC3			; 4C C3 8C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0F5
; Address: $D78CB9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0F5:
	JSL $CDB0A8		  ; 22 A8 B0 CD | Jump to subroutine long
	JMP $8CCC			; 4C CC 8C | Jump to address
	JMP $8CC9			; 4C C9 8C | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0F6
; Address: $D78CCB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0F6:
	STY $2C22			; 8C 22 2C | Store Y register to absolute address
	STY $A9CB			; 8C CB A9 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0FB
; Address: $D78CED
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0FB:
	JSL $CCD376		  ; 22 76 D3 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8D3C			; 4C 3C 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0FD
; Address: $D78D01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0FD:
	JSL $C76BE3		  ; 22 E3 6B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D39			; 4C 39 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_0FE
; Address: $D78D0A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_0FE:
	JSL $CC815D		  ; 22 5D 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D1C			; 4C 1C 8D | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	AND $228D,Y		  ; 39 8D 22 | Logical AND with accumulator (absolute,Y)
	STA ($CC,X)		  ; 81 CC | Store accumulator to (zero page,X)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D33			; 4C 33 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_100
; Address: $D78D29
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_100:
	JSL $CDB0AF		  ; 22 AF B0 CD | Jump to subroutine long
	JMP $8D3C			; 4C 3C 8D | Jump to address
	JMP $8D39			; 4C 39 8D | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	STY $2C22			; 8C 22 2C | Store Y register to absolute address
	STY $A9CB			; 8C CB A9 | Store Y register to absolute address
	BRA $00			  ; 80 00 | Branch always
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_105
; Address: $D78D5D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_105:
	JSL $CCD376		  ; 22 76 D3 CC | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8DAC			; 4C AC 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_107
; Address: $D78D71
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_107:
	JSL $C76BE3		  ; 22 E3 6B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8DA9			; 4C A9 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_108
; Address: $D78D7A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_108:
	JSL $CC815D		  ; 22 5D 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D8C			; 4C 8C 8D | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	LDA #$8D			 ; A9 8D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_109
; Address: $D78D8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_109:
	JSL $CC8175		  ; 22 75 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8DA3			; 4C A3 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_10B
; Address: $D78D99
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_10B:
	JSL $CDB0B6		  ; 22 B6 B0 CD | Jump to subroutine long
	JMP $8DAC			; 4C AC 8D | Jump to address
	JMP $8DA9			; 4C A9 8D | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	STA $2C22			; 8D 22 2C | Store accumulator to absolute address
	STY $A9CB			; 8C CB A9 | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_10C
; Address: $D78DB8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_10C:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8DDC			; 4C DC 8D | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8DDC			; 4C DC 8D | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8DDC			; 4C DC 8D | Jump to address
	JMP $8DE0			; 4C E0 8D | Jump to address
	JMP $8DB8			; 4C B8 8D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_10E
; Address: $D78DE6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_10E:
	PEA #$6B06		   ; F4 06 6B | Push effective address to stack
	SBC $6B06,Y		  ; F9 06 6B | Subtract with carry (absolute,Y)
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_10F
; Address: $D78DF3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_10F:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_110
; Address: $D78DFE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_110:
	SED				  ; F8 | Set decimal mode flag
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_112
; Address: $D78E0A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_112:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$48			 ; A2 48 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$A8			 ; A0 A8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_113
; Address: $D78E17
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_113:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8E23			; 4C 23 8E | Jump to address
	JMP $8E26			; 4C 26 8E | Jump to address
	JMP $8E0A			; 4C 0A 8E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_115
; Address: $D78E2A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_115:
	JSL $CDE073		  ; 22 73 E0 CD | Jump to subroutine long
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	LDX #$44			 ; A2 44 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_11C
; Address: $D78E4C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_11C:
	JSL $CDE0E5		  ; 22 E5 E0 CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_11F
; Address: $D78E5F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_11F:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8E77			; 4C 77 8E | Jump to address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	LDX #$3F			 ; A2 3F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_124
; Address: $D78E84
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_124:
	JSL $CC76C1		  ; 22 C1 76 CC | Jump to subroutine long
	LDX #$24			 ; A2 24 | Load immediate value into X register
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_12B
; Address: $D78EA5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_12B:
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_12C
; Address: $D78EB4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_12C:
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_12D
; Address: $D78EC0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_12D:
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_12E
; Address: $D78EC7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_12E:
	LDA #$22			 ; A9 22 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_131
; Address: $D78EEE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_131:
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_13E
; Address: $D78F44
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_13E:
	JSL $CCD85D		  ; 22 5D D8 CC | Jump to subroutine long
	JMP $8F1A			; 4C 1A 8F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_141
; Address: $D78F57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_141:
	JSL $CC8075		  ; 22 75 80 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8FA5			; 4C A5 8F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_14D
; Address: $D78F98
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_14D:
	JSL $C7593B		  ; 22 3B 59 C7 | Jump to subroutine long
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	JMP $8FA9			; 4C A9 8F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_151
; Address: $D78FB6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_151:
	JSL $CDACF7		  ; 22 F7 AC CD | Jump to subroutine long
	INC $6B06,X		  ; FE 06 6B | Increment (absolute,X)
	ORA $6B07			; 0D 07 6B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_157
; Address: $D78FD8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_157:
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_15F
; Address: $D79002
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_15F:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $902F			; 4C 2F 90 | Jump to address
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_160
; Address: $D7900E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_160:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9023			; 4C 23 90 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	BIT $0090			; 2C 90 00 | Test bits in accumulator (absolute)
	BPL $07			  ; 10 07 | Branch if positive
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $07			  ; 10 07 | Branch if positive
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	LDX $22CD			; AE CD 22 | Load from absolute address into X register
	AND ($AF),Y		  ; 31 AF | Logical AND with accumulator ((zero page),Y)
	CMP $EE22			; CD 22 EE | Compare accumulator (absolute)
	LDY #$CD			 ; A0 CD | Load immediate value into Y register
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $905F			; 4C 5F 90 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_162
; Address: $D79058
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_162:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	JMP $8FE8			; 4C E8 8F | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_165
; Address: $D7906E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_165:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $908C			; 4C 8C 90 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_169
; Address: $D79089
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_169:
	JMP $90F7			; 4C F7 90 | Jump to address
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $90B2			; 4C B2 90 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_173
; Address: $D790C2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_173:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	LSR $A900,X		  ; 5E 00 A9 | Logical shift right (absolute,X)
	STA $BE79			; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_174
; Address: $D790CE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_174:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	ORA $8D00,Y		  ; 19 00 8D | Logical OR with accumulator (absolute,Y)
	BIT $AD34			; 2C 34 AD | Test bits in accumulator (absolute)
	BIT $2234			; 2C 34 22 | Test bits in accumulator (absolute)
	STA				  ; 9F CF C1 22 | Store accumulator to absolute long,X
	LDA $CDAC,X		  ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_175
; Address: $D790E5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_175:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $9F			  ; C5 9F | Compare accumulator (zero page)
	CPY $D222			; CC 22 D2 | Compare Y register (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CLD				  ; D8 | Clear decimal mode flag
	LDA $6BCD			; AD CD 6B | Load from absolute address into accumulator
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_17B
; Address: $D79120
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_17B:
	JSL $CDDA82		  ; 22 82 DA CD | Jump to subroutine long
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	LDX #$19			 ; A2 19 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_180
; Address: $D7913A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_180:
	JSL $CDC871		  ; 22 71 C8 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_18D
; Address: $D79181
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_18D:
	JSL $CDE370		  ; 22 70 E3 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_190
; Address: $D79194
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_190:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_196
; Address: $D791B2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_196:
	JSL $CDAE10		  ; 22 10 AE CD | Jump to subroutine long
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $91C8			; 4C C8 91 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1A6
; Address: $D79208
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1A6:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1AE
; Address: $D79232
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1AE:
	JSL $CCDADF		  ; 22 DF DA CC | Jump to subroutine long
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9257			; 4C 57 92 | Jump to address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	LDX #$4F			 ; A2 4F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1B6
; Address: $D79268
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1B6:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA #$85			 ; A9 85 | Load immediate value into accumulator
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1BA
; Address: $D79283
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1BA:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1BB
; Address: $D7928D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1BB:
	JSL $CC75D6		  ; 22 D6 75 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $92AD			; 4C AD 92 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1BC
; Address: $D7929C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1BC:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address
	JMP $9291			; 4C 91 92 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1BE
; Address: $D792B1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1BE:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1BF
; Address: $D792BB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1BF:
	JSL $CC75FE		  ; 22 FE 75 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $92DB			; 4C DB 92 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1C0
; Address: $D792CA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1C0:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address
	JMP $92BF			; 4C BF 92 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1C1
; Address: $D792DB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1C1:
	JSL $CDADFB		  ; 22 FB AD CD | Jump to subroutine long
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1C2
; Address: $D792E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1C2:
	JSL $CC75FE		  ; 22 FE 75 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9305			; 4C 05 93 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1C3
; Address: $D792F4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1C3:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address
	JMP $92E9			; 4C E9 92 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1CC
; Address: $D79326
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1CC:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $933B			; 4C 3B 93 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1CE
; Address: $D79340
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1CE:
	JSL $CDC682		  ; 22 82 C6 CD | Jump to subroutine long
	LDA #$C1			 ; A9 C1 | Load immediate value into accumulator
	LDX #$AA			 ; A2 AA | Load immediate value into X register
	ROL				  ; 2A | Rotate left (accumulator)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1D5
; Address: $D79370
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1D5:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	ASL $6B07,X		  ; 1E 07 6B | Arithmetic shift left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1D8
; Address: $D79382
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1D8:
	JSL $CC7B35		  ; 22 35 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $93A1			; 4C A1 93 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1D9
; Address: $D7938C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1D9:
	JSL $472207		  ; 22 07 22 47 | Jump to subroutine long
	CPY $0390			; CC 90 03 | Compare Y register (absolute)
	JMP $939E			; 4C 9E 93 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1DA
; Address: $D79397
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1DA:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	JMP $93A4			; 4C A4 93 | Jump to address
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1DC
; Address: $D793A9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1DC:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $93CB			; 4C CB 93 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1DD
; Address: $D793BA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1DD:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $93C5			; 4C C5 93 | Jump to address
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	JMP $93C8			; 4C C8 93 | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	JMP $93DA			; 4C DA 93 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1DE
; Address: $D793DD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1DE:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	AND $07			  ; 25 07 | Logical AND with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1E3
; Address: $D793F1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1E3:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9406			; 4C 06 94 | Jump to address
	AND $4C07			; 2D 07 4C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1E5
; Address: $D79410
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1E5:
	JSL $CDA0E5		  ; 22 E5 A0 CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1E6
; Address: $D79423
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1E6:
	JSL $C687A0		  ; 22 A0 87 C6 | Jump to subroutine long
	LDA $C149			; AD 49 C1 | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $943C			; 4C 3C 94 | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1E7
; Address: $D79438
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1E7:
	JSL $C67A85		  ; 22 85 7A C6 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1EA
; Address: $D7944D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1EA:
	JSL $CC7B8A		  ; 22 8A 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $945C			; 4C 5C 94 | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1EB
; Address: $D7945C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1EB:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1F2
; Address: $D79483
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1F2:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	BIT $2207			; 2C 07 22 | Test bits in accumulator (absolute)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	BNE $07			  ; D0 07 | Branch if not equal
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1F4
; Address: $D7949E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1F4:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ADC ($43,X)		  ; 61 43 | Add with carry ((zero page,X))
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1F9
; Address: $D794BC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1F9:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ADC ($43,X)		  ; 61 43 | Add with carry ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $94CC			; 4C CC 94 | Jump to address
	JMP $94BC			; 4C BC 94 | Jump to address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $94E1			; 4C E1 94 | Jump to address
	JMP $94D2			; 4C D2 94 | Jump to address
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1FA
; Address: $D794E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1FA:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$B5			 ; A2 B5 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1FC
; Address: $D794F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1FC:
	JSL $CDADFB		  ; 22 FB AD CD | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_1FF
; Address: $D79509
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_1FF:
	JSL $C733E5		  ; 22 E5 33 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_200
; Address: $D79513
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_200:
	JSL $C733E5		  ; 22 E5 33 C7 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_203
; Address: $D79525
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_203:
	JSL $CB9852		  ; 22 52 98 CB | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_204
; Address: $D7952F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_204:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	ADC $02			  ; 65 02 | Add with carry (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $CD			  ; C6 CD | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_208
; Address: $D7954C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_208:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	LDX #$A0			 ; A2 A0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_20C
; Address: $D79565
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_20C:
	JSL $C7559A		  ; 22 9A 55 C7 | Jump to subroutine long
	LDA $C12F			; AD 2F C1 | Load from absolute address into accumulator
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$20			 ; E9 20 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA #$B4			 ; A9 B4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_20F
; Address: $D79590
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_20F:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_212
; Address: $D795A5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_212:
	JSL $CDC701		  ; 22 01 C7 CD | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $95BE			; 4C BE 95 | Jump to address
	JMP $95AF			; 4C AF 95 | Jump to address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $9684			; 8D 84 96 | Store accumulator to absolute address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	LDX #$06			 ; A2 06 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_216
; Address: $D795EB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_216:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $95F8			; 4C F8 95 | Jump to address
	JMP $95E8			; 4C E8 95 | Jump to address
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_217
; Address: $D795FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_217:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_219
; Address: $D7960D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_219:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C72F			; EE 2F C7 | Increment (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9621			; 4C 21 96 | Jump to address
	JMP $9611			; 4C 11 96 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_21A
; Address: $D79621
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_21A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ROL $A907			; 2E 07 A9 | Rotate left (absolute)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $966C			; 4C 6C 96 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_21C
; Address: $D79641
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_21C:
	JSL $C7891B		  ; 22 1B 89 C7 | Jump to subroutine long
	LDA $C161			; AD 61 C1 | Load from absolute address into accumulator
	STA $BE77			; 8D 77 BE | Store accumulator to absolute address
	LDA $C17F			; AD 7F C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9664			; 4C 64 96 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_21F
; Address: $D7965E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_21F:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BIT $2296			; 2C 96 22 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	CMP $22CD,X		  ; DD CD 22 | Compare accumulator (absolute,X)
	LDA $CDA8			; AD A8 CD | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_226
; Address: $D79696
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_226:
	JSL $CDE01C		  ; 22 1C E0 CD | Jump to subroutine long
	JMP $96CD			; 4C CD 96 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_227
; Address: $D796A0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_227:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	JMP $96F0			; 4C F0 96 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_228
; Address: $D796AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_228:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	JMP $96F0			; 4C F0 96 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_229
; Address: $D796B8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_229:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	JMP $96F0			; 4C F0 96 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_22A
; Address: $D796C4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_22A:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	JMP $96F0			; 4C F0 96 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $969D			; 4C 9D 96 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $96A9			; 4C A9 96 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_22B
; Address: $D796E3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_22B:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $96B5			; 4C B5 96 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $96C1			; 4C C1 96 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_230
; Address: $D7970A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_230:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_235
; Address: $D7972D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_235:
	JSL $C731E0		  ; 22 E0 31 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_237
; Address: $D79734
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_237:
	JSL $CCDADF		  ; 22 DF DA CC | Jump to subroutine long
	LDA #$D1			 ; A9 D1 | Load immediate value into accumulator
	LDX #$88			 ; A2 88 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_238
; Address: $D7974D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_238:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9765			; 4C 65 97 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_23C
; Address: $D79770
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_23C:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ROL $43			  ; 26 43 | Rotate left (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$26			 ; C0 26 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_240
; Address: $D79790
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_240:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_244
; Address: $D797A3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_244:
	JSL $C743E5		  ; 22 E5 43 C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $97BE			; 4C BE 97 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_245
; Address: $D797B6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_245:
	JSL $C74414		  ; 22 14 44 C7 | Jump to subroutine long
	JMP $97A8			; 4C A8 97 | Jump to address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $97CD			; 4C CD 97 | Jump to address
	JMP $97BE			; 4C BE 97 | Jump to address
	LDX #$2A			 ; A2 2A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_246
; Address: $D797D0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_246:
	JSL $C743E5		  ; 22 E5 43 C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $97EA			; 4C EA 97 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_247
; Address: $D797E2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_247:
	JSL $C74414		  ; 22 14 44 C7 | Jump to subroutine long
	JMP $97D4			; 4C D4 97 | Jump to address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $97FF			; 4C FF 97 | Jump to address
	JMP $97F0			; 4C F0 97 | Jump to address
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_248
; Address: $D79805
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_248:
	JSL $C9ACDE		  ; 22 DE AC C9 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9825			; 4C 25 98 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_24A
; Address: $D7981E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_24A:
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ASL $AD98			; 0E 98 AD | Arithmetic shift left (absolute)
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9838			; 4C 38 98 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_24C
; Address: $D79838
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_24C:
	JSL $C9AED5		  ; 22 D5 AE C9 | Jump to subroutine long
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_24E
; Address: $D7984A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_24E:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	LDA				  ; BF 01 01 6B | Load from absolute long,X into accumulator
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_252
; Address: $D7986C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_252:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	AND $2207,X		  ; 3D 07 22 | Logical AND with accumulator (absolute,X)
	ASL $A8			  ; 06 A8 | Arithmetic shift left (zero page)
	CMP $1F22			; CD 22 1F | Compare accumulator (absolute)
	LDA ($CC,X)		  ; A1 CC | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_253
; Address: $D7987A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_253:
	JSL $CDACEE		  ; 22 EE AC CD | Jump to subroutine long
	ROL $2207,X		  ; 3E 07 22 | Rotate left (absolute,X)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $ED22			; CC 22 ED | Compare Y register (absolute)
	LDA $22CD			; AD CD 22 | Load from absolute address into accumulator
	SBC ($AE),Y		  ; F1 AE | Subtract with carry ((zero page),Y)
	CMP $8222			; CD 22 82 | Compare accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	CMP $FB22			; CD 22 FB | Compare accumulator (absolute)
	LDA $22CD			; AD CD 22 | Load from absolute address into accumulator
	AND ($AF),Y		  ; 31 AF | Logical AND with accumulator ((zero page),Y)
	CMP $1722			; CD 22 17 | Compare accumulator (absolute)
	LDX $A9CD			; AE CD A9 | Load from absolute address into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_255
; Address: $D798A8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_255:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $98B5			; 4C B5 98 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_256
; Address: $D798B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_256:
	JSL $CDDA4B		  ; 22 4B DA CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_25A
; Address: $D798C8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_25A:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	LDA #$93			 ; A9 93 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_25B
; Address: $D798D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_25B:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	STX $A903			; 8E 03 A9 | Store X register to absolute address
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_25C
; Address: $D798E1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_25C:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $98F9			; 4C F9 98 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_25E
; Address: $D798F9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_25E:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	LDX #$4A			 ; A2 4A | Load immediate value into X register
	AND #$A0			 ; 29 A0 | Logical AND with accumulator (immediate)
	INC $2283,X		  ; FE 83 22 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_260
; Address: $D7990D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_260:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$69			 ; A9 69 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_263
; Address: $D79923
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_263:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9933			; 4C 33 99 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_270
; Address: $D7995D
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_270:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $996E			; 4C 6E 99 | Jump to address
	RTI				  ; 40 | Return from interrupt
	JMP $9971			; 4C 71 99 | Jump to address
	AND $6B07,Y		  ; 39 07 6B | Logical AND with accumulator (absolute,Y)
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9983			; 4C 83 99 | Jump to address
	EOR ($07,X)		  ; 41 07 | Exclusive OR with accumulator ((zero page,X))
	JMP $9986			; 4C 86 99 | Jump to address
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_271
; Address: $D79987
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_271:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9998			; 4C 98 99 | Jump to address
	WDM #$07			 ; 42 07 | Reserved instruction
	JMP $999B			; 4C 9B 99 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_272
; Address: $D7999C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_272:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $99AE			; 4C AE 99 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_275
; Address: $D799B3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_275:
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_277
; Address: $D799CD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_277:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $99E9			; 4C E9 99 | Jump to address
	LDA #$42			 ; A9 42 | Hardware register operation
	LDX #$5B			 ; A2 5B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_27D
; Address: $D799F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_27D:
	JSL $CDAEE1		  ; 22 E1 AE CD | Jump to subroutine long
	LDA #$42			 ; A9 42 | Hardware register operation
	LDX #$5B			 ; A2 5B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_287
; Address: $D79A24
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_287:
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9A35			; 4C 35 9A | Jump to address
	JMP $9A38			; 4C 38 9A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_28F
; Address: $D79A57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_28F:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9A67			; 4C 67 9A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_290
; Address: $D79A60
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_290:
	JSL $CDC392		  ; 22 92 C3 CD | Jump to subroutine long
	JMP $9A85			; 4C 85 9A | Jump to address
	LDA $C371			; AD 71 C3 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9A7F			; 4C 7F 9A | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_291
; Address: $D79A72
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_291:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	STA $9A			  ; 85 9A | Store accumulator to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C371			; 8D 71 C3 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_299
; Address: $D79AA2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_299:
	JMP $6B07			; 4C 07 6B | Jump to address
	EOR $6B07			; 4D 07 6B | Exclusive OR with accumulator (absolute)
	LSR $6B07			; 4E 07 6B | Logical shift right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_29B
; Address: $D79AB5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_29B:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9ACA			; 4C CA 9A | Jump to address
	SBC $2207,X		  ; FD 07 22 | Subtract with carry (absolute,X)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	DEC $229A			; CE 9A 22 | Decrement (absolute)
	CMP $AD6B			; CD 6B AD | Compare accumulator (absolute)
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9B12			; 4C 12 9B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_29C
; Address: $D79ADA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_29C:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9AFA			; 4C FA 9A | Jump to address
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9AF4			; 4C F4 9A | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9AF7			; 4C F7 9A | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9B0F			; 4C 0F 9B | Jump to address
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_29D
; Address: $D79AFD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_29D:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9B0C			; 4C 0C 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9B0F			; 4C 0F 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	JMP $9B91			; 4C 91 9B | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_29E
; Address: $D79B15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_29E:
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9B8E			; 4C 8E 9B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_29F
; Address: $D79B1D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_29F:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9B6D			; 4C 6D 9B | Jump to address
	INC $AD07,X		  ; FE 07 AD | Increment (absolute,X)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9B52			; 4C 52 9B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A0
; Address: $D79B34
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A0:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9B43			; 4C 43 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9B4F			; 4C 4F 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	JMP $9B6A			; 4C 6A 9B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A1
; Address: $D79B52
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A1:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9B61			; 4C 61 9B | Jump to address
	JMP $9B6A			; 4C 6A 9B | Jump to address
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	JMP $9B8B			; 4C 8B 9B | Jump to address
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A2
; Address: $D79B73
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A2:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9B82			; 4C 82 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9B85			; 4C 85 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	JMP $9B91			; 4C 91 9B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A3
; Address: $D79B92
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A3:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BA3			; 4C A3 9B | Jump to address
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	JMP $9BA6			; 4C A6 9B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A4
; Address: $D79BA7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A4:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BBD			; 4C BD 9B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A8
; Address: $D79BC2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A8:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BE8			; 4C E8 9B | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2A9
; Address: $D79BD0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2A9:
	JSL $CC7AC2		  ; 22 C2 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9BDF			; 4C DF 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9BE2			; 4C E2 9B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	ORA $4C08			; 0D 08 4C | Logical OR with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2AA
; Address: $D79BEC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2AA:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BFD			; 4C FD 9B | Jump to address
	ASL $4C08			; 0E 08 4C | Arithmetic shift left (absolute)
	STZ $D800			; 9C 00 D8 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2AB
; Address: $D79C01
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2AB:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C33			; 4C 33 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2AC
; Address: $D79C0C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2AC:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9C1B			; 4C 1B 9C | Jump to address
	SBC $4C07,Y		  ; F9 07 4C | Subtract with carry (absolute,Y)
	BMI $9C			  ; 30 9C | Branch if negative
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2AD
; Address: $D79C1E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2AD:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9C2D			; 4C 2D 9C | Jump to address
	JMP $9C30			; 4C 30 9C | Jump to address
	JMP $9C36			; 4C 36 9C | Jump to address
	CMP $6B07,Y		  ; D9 07 6B | Compare accumulator (absolute,Y)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C49			; 4C 49 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2AE
; Address: $D79C42
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2AE:
	JSL $CDAD8D		  ; 22 8D AD CD | Jump to subroutine long
	JMP $9C4C			; 4C 4C 9C | Jump to address
	PHX				  ; DA | Push X register to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2AF
; Address: $D79C4D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2AF:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C62			; 4C 62 9C | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2B2
; Address: $D79C67
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2B2:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C79			; 4C 79 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2B3
; Address: $D79C72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2B3:
	JSL $CDAD3C		  ; 22 3C AD CD | Jump to subroutine long
	JMP $9C7C			; 4C 7C 9C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2B4
; Address: $D79C7D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2B4:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C93			; 4C 93 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2B8
; Address: $D79C98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2B8:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9CAA			; 4C AA 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2B9
; Address: $D79CA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2B9:
	JSL $CDAD89		  ; 22 89 AD CD | Jump to subroutine long
	JMP $9CAD			; 4C AD 9C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2BA
; Address: $D79CAE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2BA:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9CC0			; 4C C0 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2BB
; Address: $D79CB9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2BB:
	JSL $CDAD72		  ; 22 72 AD CD | Jump to subroutine long
	JMP $9CC3			; 4C C3 9C | Jump to address
	CMP $6B07,X		  ; DD 07 6B | Compare accumulator (absolute,X)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9CE4			; 4C E4 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2BC
; Address: $D79CCF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2BC:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9CDE			; 4C DE 9C | Jump to address
	BPL $08			  ; 10 08 | Branch if positive
	JMP $9CE1			; 4C E1 9C | Jump to address
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	JMP $9CE7			; 4C E7 9C | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2BD
; Address: $D79CE5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2BD:
	DEC $6B07,X		  ; DE 07 6B | Decrement (absolute,X)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9CF9			; 4C F9 9C | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9CFC			; 4C FC 9C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2BE
; Address: $D79CFD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2BE:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9D0F			; 4C 0F 9D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2BF
; Address: $D79D08
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2BF:
	JSL $CDAD38		  ; 22 38 AD CD | Jump to subroutine long
	JMP $9D12			; 4C 12 9D | Jump to address
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C0
; Address: $D79D13
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C0:
	LDA $3553			; AD 53 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9D35			; 4C 35 9D | Jump to address
	LDA $3553			; AD 53 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9D2F			; 4C 2F 9D | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9D32			; 4C 32 9D | Jump to address
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP $9D79			; 4C 79 9D | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9D76			; 4C 76 9D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C1
; Address: $D79D40
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C1:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9D4F			; 4C 4F 9D | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9D73			; 4C 73 9D | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C2
; Address: $D79D52
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C2:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9D6A			; 4C 6A 9D | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	JMP $9D6D			; 4C 6D 9D | Jump to address
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	JMP $9D79			; 4C 79 9D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C4
; Address: $D79D7A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C4:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9D8B			; 4C 8B 9D | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9D8E			; 4C 8E 9D | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C7
; Address: $D79D98
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C7:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DAD			; 4C AD 9D | Jump to address
	ORA $2208,Y		  ; 19 08 22 | Logical OR with accumulator (absolute,Y)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	STA $44AD,X		  ; 9D AD 44 | Store accumulator to absolute,X
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DC2			; 4C C2 9D | Jump to address
	INC $07			  ; E6 07 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C8
; Address: $D79DBB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C8:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	JMP $9DF5			; 4C F5 9D | Jump to address
	SEP #$07			 ; E2 07 | Set processor status bits

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2C9
; Address: $D79DC5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2C9:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9DEE			; 4C EE 9D | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D1
; Address: $D79DF6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D1:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9E08			; 4C 08 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D2
; Address: $D79E01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D2:
	JSL $CDAD40		  ; 22 40 AD CD | Jump to subroutine long
	JMP $9E0B			; 4C 0B 9E | Jump to address
	INX				  ; E8 | Increment X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D4
; Address: $D79E0F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D4:
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9E1E			; 4C 1E 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D5
; Address: $D79E17
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D5:
	JSL $CDAD38		  ; 22 38 AD CD | Jump to subroutine long
	JMP $9E21			; 4C 21 9E | Jump to address
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D6
; Address: $D79E22
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D6:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9E45			; 4C 45 9E | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D7
; Address: $D79E30
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D7:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9E3F			; 4C 3F 9E | Jump to address
	ORA $4C08,X		  ; 1D 08 4C | Logical OR with accumulator (absolute,X)
	WDM #$9E			 ; 42 9E | Reserved instruction
	ASL $4C08,X		  ; 1E 08 4C | Arithmetic shift left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	STZ $EA00,X		  ; 9E 00 EA | Store zero to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D8
; Address: $D79E49
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D8:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9E6F			; 4C 6F 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2D9
; Address: $D79E54
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2D9:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9E66			; 4C 66 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2DA
; Address: $D79E5E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2DA:
	JSL $230008		  ; 22 08 00 23 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	JMP $9E6C			; 4C 6C 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2DB
; Address: $D79E67
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2DB:
	JSL $240008		  ; 22 08 00 24 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	JMP $9E72			; 4C 72 9E | Jump to address
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2DC
; Address: $D79E73
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2DC:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9EE8			; 4C E8 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2DD
; Address: $D79E7E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2DD:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9EC1			; 4C C1 9E | Jump to address
	AND $08			  ; 25 08 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2DF
; Address: $D79E8E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2DF:
	JSL $CC8FA3		  ; 22 A3 8F CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9E9D			; 4C 9D 9E | Jump to address
	ROL $08			  ; 26 08 | Rotate left (zero page)
	JMP $9EBE			; 4C BE 9E | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2E0
; Address: $D79E9D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2E0:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $C109			; 8D 09 C1 | Store accumulator to absolute address
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2E1
; Address: $D79EA6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2E1:
	JSL $C782A5		  ; 22 A5 82 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9EBB			; 4C BB 9E | Jump to address
	LDA $C18F			; AD 8F C1 | Load from absolute address into accumulator
	STA $BE79			; 8D 79 BE | Store accumulator to absolute address
	PHP				  ; 08 | Push processor status to stack
	JMP $9EBE			; 4C BE 9E | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	JMP $9EE5			; 4C E5 9E | Jump to address
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2E2
; Address: $D79ECD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2E2:
	JSL $C782A5		  ; 22 A5 82 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9EE2			; 4C E2 9E | Jump to address
	LDA $C18F			; AD 8F C1 | Load from absolute address into accumulator
	STA $BE79			; 8D 79 BE | Store accumulator to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	JMP $9EE5			; 4C E5 9E | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9EEB			; 4C EB 9E | Jump to address
	CPX $6B07			; EC 07 6B | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2E3
; Address: $D79EEC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2E3:
	JSL $CDC966		  ; 22 66 C9 CD | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9F2A			; 4C 2A 9F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2E5
; Address: $D79EFF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2E5:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9F11			; 4C 11 9F | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2E6
; Address: $D79F0C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2E6:
	JSR $4C08			; 20 08 4C | Jump to subroutine
	STA				  ; 9F 00 1F 08 | Store accumulator to absolute long,X
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2EB
; Address: $D79F2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2EB:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	SBC $2207			; ED 07 22 | Subtract with carry (absolute)
	CMP #$CD			 ; C9 CD | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2EF
; Address: $D79F42
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2EF:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9F54			; 4C 54 9F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F0
; Address: $D79F4D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F0:
	JSL $CDAD44		  ; 22 44 AD CD | Jump to subroutine long
	JMP $9F57			; 4C 57 9F | Jump to address
	INC $6B07			; EE 07 6B | Increment (absolute)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9F69			; 4C 69 9F | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $9F6C			; 4C 6C 9F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F1
; Address: $D79F6D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F1:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9F7E			; 4C 7E 9F | Jump to address
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	JMP $9F81			; 4C 81 9F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F2
; Address: $D79F82
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F2:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9F94			; 4C 94 9F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F3
; Address: $D79F8D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F3:
	JSL $CDAD72		  ; 22 72 AD CD | Jump to subroutine long
	JMP $9F97			; 4C 97 9F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F4
; Address: $D79F98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F4:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9FAA			; 4C AA 9F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F5
; Address: $D79FA3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F5:
	JSL $CDAD8D		  ; 22 8D AD CD | Jump to subroutine long
	JMP $9FAD			; 4C AD 9F | Jump to address
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F6
; Address: $D79FAE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F6:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9FE0			; 4C E0 9F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F7
; Address: $D79FB9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F7:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9FC8			; 4C C8 9F | Jump to address
	BIT $4C08			; 2C 08 4C | Test bits in accumulator (absolute)
	CMP $009F,X		  ; DD 9F 00 | Compare accumulator (absolute,X)
	AND $2208			; 2D 08 22 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F8
; Address: $D79FCC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F8:
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $9FDA			; 4C DA 9F | Jump to address
	ROL $4C08			; 2E 08 4C | Rotate left (absolute)
	CMP $009F,X		  ; DD 9F 00 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	JMP $9FE3			; 4C E3 9F | Jump to address
	BEQ $07			  ; F0 07 | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2F9
; Address: $D79FE4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2F9:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9FF2			; 4C F2 9F | Jump to address
	JMP $9FF6			; 4C F6 9F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2FB
; Address: $D79FF7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2FB:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A005			; 4C 05 A0 | Jump to address
	JMP $A008			; 4C 08 A0 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2FC
; Address: $D7A009
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2FC:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A017			; 4C 17 A0 | Jump to address
	JMP $A01A			; 4C 1A A0 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2FD
; Address: $D7A01B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2FD:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A029			; 4C 29 A0 | Jump to address
	JMP $A02C			; 4C 2C A0 | Jump to address
	PEA #$6B07		   ; F4 07 6B | Push effective address to stack
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A03B			; 4C 3B A0 | Jump to address
	JMP $A03E			; 4C 3E A0 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2FE
; Address: $D7A03F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2FE:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A04D			; 4C 4D A0 | Jump to address
	JMP $A050			; 4C 50 A0 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_2FF
; Address: $D7A051
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_2FF:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A05F			; 4C 5F A0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_301
; Address: $D7A063
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_301:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A074			; 4C 74 A0 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A0B2			; 4C B2 A0 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A0AF			; 4C AF A0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_303
; Address: $D7A086
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_303:
	JSL $CC76FD		  ; 22 FD 76 CC | Jump to subroutine long
	AND ($08),Y		  ; 31 08 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_304
; Address: $D7A090
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_304:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A0A5			; 4C A5 A0 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	JMP $A0A8			; 4C A8 A0 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_305
; Address: $D7A0A8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_305:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	JMP $A0B2			; 4C B2 A0 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_306
; Address: $D7A0B3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_306:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A0C4			; 4C C4 A0 | Jump to address
	LDY $4C08,X		  ; BC 08 4C | Load from absolute,X into Y register
	CMP $00A0,Y		  ; D9 A0 00 | Compare accumulator (absolute,Y)
	LDA $2208,Y		  ; B9 08 22 | Load from absolute,Y into accumulator
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $A0D6			; 4C D6 A0 | Jump to address
	TSX				  ; BA | Transfer stack pointer to X register
	PHP				  ; 08 | Push processor status to stack
	JMP $A0D9			; 4C D9 A0 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_307
; Address: $D7A0DB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_307:
	LDA $6B08,X		  ; BD 08 6B | Load from absolute,X into accumulator
	LDA				  ; BF 08 6B 00 | Load from absolute long,X into accumulator
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_30A
; Address: $D7A0EF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_30A:
	JMP $A0F8			; 4C F8 A0 | Jump to address
	REP #$08			 ; C2 08 | Reset processor status bits
	JMP $A0FB			; 4C FB A0 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_30D
; Address: $D7A105
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_30D:
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A116			; 4C 16 A1 | Jump to address
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	JMP $A14B			; 4C 4B A1 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A127			; 4C 27 A1 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A14B			; 4C 4B A1 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_316
; Address: $D7A151
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_316:
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A163			; 4C 63 A1 | Jump to address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_319
; Address: $D7A168
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_319:
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A179			; 4C 79 A1 | Jump to address
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	JMP $A17C			; 4C 7C A1 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_31C
; Address: $D7A181
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_31C:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A192			; 4C 92 A1 | Jump to address
	DEC $4C08			; CE 08 4C | Decrement (absolute)
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	CPY $6B08			; CC 08 6B | Compare Y register (absolute)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A1A7			; 4C A7 A1 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A1AA			; 4C AA A1 | Jump to address
	CMP $6B08			; CD 08 6B | Compare accumulator (absolute)
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A1BC			; 4C BC A1 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A1BF			; 4C BF A1 | Jump to address
	BNE $08			  ; D0 08 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_31D
; Address: $D7A1C0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_31D:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A1D1			; 4C D1 A1 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A1D4			; 4C D4 A1 | Jump to address
	CMP ($08),Y		  ; D1 08 | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_31E
; Address: $D7A1D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_31E:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A1ED			; 4C ED A1 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_31F
; Address: $D7A1E3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_31F:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	JMP $A1F0			; 4C F0 A1 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_320
; Address: $D7A1F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_320:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A206			; 4C 06 A2 | Jump to address
	CMP $2208,Y		  ; D9 08 22 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_321
; Address: $D7A201
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_321:
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	LSR $ADA2			; 4E A2 AD | Logical shift right (absolute)
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A21B			; 4C 1B A2 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_327
; Address: $D7A22B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_327:
	JSL $CDAD9E		  ; 22 9E AD CD | Jump to subroutine long
	LDA $C199			; AD 99 C1 | Load from absolute address into accumulator
	STA $BE81			; 8D 81 BE | Store accumulator to absolute address
	LDA $C19B			; AD 9B C1 | Load from absolute address into accumulator
	STA $BE85			; 8D 85 BE | Store accumulator to absolute address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_334
; Address: $D7A276
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_334:
	JSL $CDC682		  ; 22 82 C6 CD | Jump to subroutine long
	LDA #$21			 ; A9 21 | PPU graphics register access
	LDX #$A5			 ; A2 A5 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_340
; Address: $D7A2C1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_340:
	JSL $C72FE4		  ; 22 E4 2F C7 | Jump to subroutine long
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_348
; Address: $D7A2F1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_348:
	JSL $C72FE4		  ; 22 E4 2F C7 | Jump to subroutine long
	CMP $2208,X		  ; DD 08 22 | Compare accumulator (absolute,X)
	LDA ($CC,X)		  ; A1 CC | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_34D
; Address: $D7A30C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_34D:
	JSL $CDE34C		  ; 22 4C E3 CD | Jump to subroutine long
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_34F
; Address: $D7A320
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_34F:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_350
; Address: $D7A32A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_350:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $A337			; 4C 37 A3 | Jump to address
	JMP $A324			; 4C 24 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_35C
; Address: $D7A368
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_35C:
	JSL $CDAEF1		  ; 22 F1 AE CD | Jump to subroutine long
	LDA $3426			; AD 26 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$C8			 ; A9 C8 | Load immediate value into accumulator
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_35E
; Address: $D7A385
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_35E:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_364
; Address: $D7A3A3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_364:
	JSL $CDAF41		  ; 22 41 AF CD | Jump to subroutine long
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$48			 ; E9 48 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDA #$CD			 ; A9 CD | Load immediate value into accumulator
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_366
; Address: $D7A3C0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_366:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_367
; Address: $D7A3CA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_367:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_36A
; Address: $D7A3E4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_36A:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	STA $90F647		  ; 8F 47 F6 90 | Store accumulator to absolute long address
	JMP $A3F4			; 4C F4 A3 | Jump to address
	JMP $A3E4			; 4C E4 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_36F
; Address: $D7A406
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_36F:
	JSL $CDAEF1		  ; 22 F1 AE CD | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	STA $33D6			; 8D D6 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_371
; Address: $D7A417
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_371:
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $A427			; 4C 27 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_372
; Address: $D7A41F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_372:
	JSL $C9A1EF		  ; 22 EF A1 C9 | Jump to subroutine long
	JMP $A414			; 4C 14 A4 | Jump to address
	LDA $33D6			; AD D6 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A446			; 4C 46 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_373
; Address: $D7A434
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_373:
	JSL $C9A1EF		  ; 22 EF A1 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $33D6			; 8D D6 33 | Store accumulator to absolute address
	JMP $A427			; 4C 27 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_377
; Address: $D7A456
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_377:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A469			; 4C 69 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_37F
; Address: $D7A483
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_37F:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A4A7			; 4C A7 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_380
; Address: $D7A48E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_380:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A49D			; 4C 9D A4 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A4A0			; 4C A0 A4 | Jump to address
	CPX #$08			 ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_381
; Address: $D7A4A0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_381:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	JMP $A4E6			; 4C E6 A4 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A4BC			; 4C BC A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_382
; Address: $D7A4B3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_382:
	DEC $2208,X		  ; DE 08 22 | Decrement (absolute,X)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	INC $A4			  ; E6 A4 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_383
; Address: $D7A4BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_383:
	JSL $CC8991		  ; 22 91 89 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A4CC			; 4C CC A4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_385
; Address: $D7A4CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_385:
	JSL $CC89AB		  ; 22 AB 89 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A4DF			; 4C DF A4 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_386
; Address: $D7A4D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_386:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	JMP $A4E6			; 4C E6 A4 | Jump to address
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_38A
; Address: $D7A4F0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_38A:
	JMP ($2201)		  ; 6C 01 22 | Jump to address (absolute indirect)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $A501			; 4C 01 A5 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $A504			; 4C 04 A5 | Jump to address
	ADC $6B01			; 6D 01 6B | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_393
; Address: $D7A54D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_393:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_39C
; Address: $D7A579
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_39C:
	JSL $CBA94F		  ; 22 4F A9 CB | Jump to subroutine long
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_39E
; Address: $D7A588
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_39E:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A5B1			; 4C B1 A5 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_39F
; Address: $D7A594
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_39F:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A5A7			; 4C A7 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3A0
; Address: $D7A59D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3A0:
	JSL $CBA786		  ; 22 86 A7 CB | Jump to subroutine long
	JMP $A5B8			; 4C B8 A5 | Jump to address
	JMP $A5AE			; 4C AE A5 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3A1
; Address: $D7A5A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3A1:
	JSL $CBA6BB		  ; 22 BB A6 CB | Jump to subroutine long
	JMP $A5B8			; 4C B8 A5 | Jump to address
	JMP $A5B8			; 4C B8 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3A2
; Address: $D7A5B1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3A2:
	JSL $CBA786		  ; 22 86 A7 CB | Jump to subroutine long
	JMP $A5B8			; 4C B8 A5 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3A5
; Address: $D7A5C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3A5:
	JSL $CBA966		  ; 22 66 A9 CB | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3A8
; Address: $D7A5D6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3A8:
	JSL $CBA509		  ; 22 09 A5 CB | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3AD
; Address: $D7A5EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3AD:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B0
; Address: $D7A601
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B0:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	CPX $2208			; EC 08 22 | Compare X register (absolute)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $A646			; 4C 46 A6 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A626			; 4C 26 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B1
; Address: $D7A61C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B1:
	JSL $CBA66B		  ; 22 6B A6 CB | Jump to subroutine long
	JMP $A64D			; 4C 4D A6 | Jump to address
	JMP $A643			; 4C 43 A6 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B2
; Address: $D7A629
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B2:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A63C			; 4C 3C A6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B3
; Address: $D7A632
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B3:
	JSL $CBA69F		  ; 22 9F A6 CB | Jump to subroutine long
	JMP $A64D			; 4C 4D A6 | Jump to address
	JMP $A643			; 4C 43 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B4
; Address: $D7A63C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B4:
	JSL $CBA6D3		  ; 22 D3 A6 CB | Jump to subroutine long
	JMP $A64D			; 4C 4D A6 | Jump to address
	JMP $A64D			; 4C 4D A6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B5
; Address: $D7A646
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B5:
	JSL $CBA6D3		  ; 22 D3 A6 CB | Jump to subroutine long
	JMP $A64D			; 4C 4D A6 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3B8
; Address: $D7A658
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3B8:
	JSL $CBA966		  ; 22 66 A9 CB | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3BB
; Address: $D7A66C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3BB:
	SBC $2208			; ED 08 22 | Subtract with carry (absolute)
	LDA $CDAC,X		  ; BD AC CD | Load from absolute,X into accumulator
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3BC
; Address: $D7A678
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3BC:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $2208			; EE 08 22 | Increment (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CLC				  ; 18 | Clear carry flag
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3BD
; Address: $D7A688
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3BD:
	PEA #$A908		   ; F4 08 A9 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3BE
; Address: $D7A690
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3BE:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $2208			; EE 08 22 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	LDX #$CC			 ; A2 CC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3C1
; Address: $D7A6A2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3C1:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3C5
; Address: $D7A6BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3C5:
	SBC $A908,X		  ; FD 08 A9 | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3C6
; Address: $D7A6C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3C6:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $2208			; EE 08 22 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	LDX #$CC			 ; A2 CC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3CB
; Address: $D7A6E1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3CB:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A709			; 4C 09 A7 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A6FF			; 4C FF A6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3CC
; Address: $D7A6F5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3CC:
	JSL $CBA66B		  ; 22 6B A6 CB | Jump to subroutine long
	JMP $A785			; 4C 85 A7 | Jump to address
	JMP $A706			; 4C 06 A7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3CD
; Address: $D7A6FF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3CD:
	JSL $CBA687		  ; 22 87 A6 CB | Jump to subroutine long
	JMP $A785			; 4C 85 A7 | Jump to address
	JMP $A785			; 4C 85 A7 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D2
; Address: $D7A720
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D2:
	JSL $CBA7E8		  ; 22 E8 A7 CB | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A746			; 4C 46 A7 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D3
; Address: $D7A732
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D3:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $2208			; EE 08 22 | Increment (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CLC				  ; 18 | Clear carry flag
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	JMP $A785			; 4C 85 A7 | Jump to address
	JMP $A77B			; 4C 7B A7 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D4
; Address: $D7A74F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D4:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	INC $2208			; EE 08 22 | Increment (absolute)
	LDA $CDAC,X		  ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D5
; Address: $D7A759
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D5:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	SBC $2208,Y		  ; F9 08 22 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	LDX #$CC			 ; A2 CC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D7
; Address: $D7A767
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D7:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D8
; Address: $D7A76E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D8:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	JMP $A785			; 4C 85 A7 | Jump to address
	JMP $A785			; 4C 85 A7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3D9
; Address: $D7A77E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3D9:
	JSL $CBA687		  ; 22 87 A6 CB | Jump to subroutine long
	JMP $A785			; 4C 85 A7 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3DD
; Address: $D7A79A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3DD:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A7BF			; 4C BF A7 | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	RTI				  ; 40 | Return from interrupt
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3DE
; Address: $D7A7B4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3DE:
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	JMP $A7E7			; 4C E7 A7 | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3E0
; Address: $D7A7CC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3E0:
	JSL $CBAB7E		  ; 22 7E AB CB | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $A7E3			; 4C E3 A7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3E3
; Address: $D7A7E8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3E3:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A7F7			; 4C F7 A7 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A807			; 4C 07 A8 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A806			; 4C 06 A8 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A807			; 4C 07 A8 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3E4
; Address: $D7A808
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3E4:
	JSL $CC8A21		  ; 22 21 8A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A815			; 4C 15 A8 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3E6
; Address: $D7A816
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3E6:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A828			; 4C 28 A8 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3E7
; Address: $D7A821
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3E7:
	JSL $CDA8DB		  ; 22 DB A8 CD | Jump to subroutine long
	JMP $A868			; 4C 68 A8 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A864			; 4C 64 A8 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3E8
; Address: $D7A833
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3E8:
	JSL $CDA8D4		  ; 22 D4 A8 CD | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	STA $BE79			; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3ED
; Address: $D7A851
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3ED:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	JMP $A868			; 4C 68 A8 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3F1
; Address: $D7A871
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3F1:
	JSL $CCD7EA		  ; 22 EA D7 CC | Jump to subroutine long
	LDA #$95			 ; A9 95 | Load immediate value into accumulator
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	STA ($03),Y		  ; 91 03 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3FA
; Address: $D7A8AB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3FA:
	JSL $CCD767		  ; 22 67 D7 CC | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$A4			 ; A9 A4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C76D			; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_3FE
; Address: $D7A8CC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_3FE:
	JSL $CCD70B		  ; 22 0B D7 CC | Jump to subroutine long
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $342C			; 8D 2C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_401
; Address: $D7A8E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_401:
	JSL $C74DC1		  ; 22 C1 4D C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_403
; Address: $D7A8F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_403:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_406
; Address: $D7A90B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_406:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $A91E			; 4C 1E A9 | Jump to address
	JMP $A90F			; 4C 0F A9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_40B
; Address: $D7A931
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_40B:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_40F
; Address: $D7A948
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_40F:
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $362C			; 8D 2C 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_410
; Address: $D7A94F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_410:
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $A95E			; 4C 5E A9 | Jump to address
	JMP $A94F			; 4C 4F A9 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_411
; Address: $D7A95F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_411:
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $362C			; 8D 2C 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_412
; Address: $D7A966
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_412:
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A975			; 4C 75 A9 | Jump to address
	JMP $A966			; 4C 66 A9 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_413
; Address: $D7A976
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_413:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A991			; 4C 91 A9 | Jump to address
	LDA #$94			 ; A9 94 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_414
; Address: $D7A982
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_414:
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	STA $A04C03		  ; 8F 03 4C A0 | Store accumulator to absolute long address
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $A9B0			; 4C B0 A9 | Jump to address
	JMP $A9A1			; 4C A1 A9 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_417
; Address: $D7A9BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_417:
	JSL $CDA853		  ; 22 53 A8 CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_418
; Address: $D7A9C8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_418:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A9EF			; 4C EF A9 | Jump to address
	LDA $C137			; AD 37 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_419
; Address: $D7A9D4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_419:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $A9EC			; 4C EC A9 | Jump to address
	JMP $A9DC			; 4C DC A9 | Jump to address
	JMP $AA0A			; 4C 0A AA | Jump to address
	LDA $C137			; AD 37 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_41A
; Address: $D7A9F2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_41A:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$57			 ; C0 57 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AA0A			; 4C 0A AA | Jump to address
	JMP $A9FA			; 4C FA A9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_41B
; Address: $D7AA0A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_41B:
	JSL $CDA85B		  ; 22 5B A8 CD | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $362C			; 8D 2C 36 | Store accumulator to absolute address
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AA23			; 4C 23 AA | Jump to address
	JMP $AA14			; 4C 14 AA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_41C
; Address: $D7AA23
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_41C:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_41E
; Address: $D7AA31
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_41E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AA58			; 4C 58 AA | Jump to address
	LDA $C137			; AD 37 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_41F
; Address: $D7AA3D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_41F:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AA55			; 4C 55 AA | Jump to address
	JMP $AA45			; 4C 45 AA | Jump to address
	JMP $AA73			; 4C 73 AA | Jump to address
	LDA $C137			; AD 37 C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_420
; Address: $D7AA5B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_420:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$75			 ; C0 75 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AA73			; 4C 73 AA | Jump to address
	JMP $AA63			; 4C 63 AA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_422
; Address: $D7AA77
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_422:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $362C			; 8D 2C 36 | Store accumulator to absolute address
	JMP $A9A1			; 4C A1 A9 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_423
; Address: $D7AA85
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_423:
	LDA #$95			 ; A9 95 | Load immediate value into accumulator
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$9F			 ; A0 9F | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	STA ($03),Y		  ; 91 03 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_424
; Address: $D7AA95
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_424:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AAA4			; 4C A4 AA | Jump to address
	JMP $AA95			; 4C 95 AA | Jump to address
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_425
; Address: $D7AAA7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_425:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AAC0			; 4C C0 AA | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_426
; Address: $D7AABC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_426:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AADD			; 4C DD AA | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AADA			; 4C DA AA | Jump to address
	JMP $AAF6			; 4C F6 AA | Jump to address
	JMP $AAC0			; 4C C0 AA | Jump to address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_427
; Address: $D7AAE0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_427:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AAF3			; 4C F3 AA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_42A
; Address: $D7AAFB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_42A:
	LDA #$D5			 ; A9 D5 | Load immediate value into accumulator
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$63			 ; A0 63 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_42D
; Address: $D7AB16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_42D:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_432
; Address: $D7AB2D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_432:
	LDA #$96			 ; A9 96 | Load immediate value into accumulator
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_435
; Address: $D7AB48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_435:
	JSL $CDA7CD		  ; 22 CD A7 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_43A
; Address: $D7AB64
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_43A:
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AB73			; 4C 73 AB | Jump to address
	JMP $AB64			; 4C 64 AB | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_43B
; Address: $D7AB73
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_43B:
	JSL $CDE1D5		  ; 22 D5 E1 CD | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_443
; Address: $D7ABA2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_443:
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ABB3			; 4C B3 AB | Jump to address
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	JMP $ABB6			; 4C B6 AB | Jump to address
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_446
; Address: $D7ABC2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_446:
	JSL $CDC682		  ; 22 82 C6 CD | Jump to subroutine long
	LDA #$21			 ; A9 21 | PPU graphics register access
	LDX #$8C			 ; A2 8C | Load immediate value into X register
	AND ($A0,X)		  ; 21 A0 | Logical AND with accumulator ((zero page,X))
	INC $2283,X		  ; FE 83 22 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_44C
; Address: $D7ABF3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_44C:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	LDY $220F			; AC 0F 22 | Load from absolute address into Y register
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_44D
; Address: $D7AC00
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_44D:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	LDA $220F			; AD 0F 22 | Load from absolute address into accumulator
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $C109			; 8D 09 C1 | Store accumulator to absolute address
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_44E
; Address: $D7AC16
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_44E:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AC28			; 4C 28 AC | Jump to address
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX $464C,Y		  ; BE 4C 46 | Load from absolute,Y into X register
	LDY $16A9			; AC A9 16 | Load from absolute address into Y register
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_44F
; Address: $D7AC2E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_44F:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AC40			; 4C 40 AC | Jump to address
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX $464C,Y		  ; BE 4C 46 | Load from absolute,Y into X register
	LDY $4DA9			; AC A9 4D | Load from absolute address into Y register
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX $03A9,Y		  ; BE A9 03 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_450
; Address: $D7AC49
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_450:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	LDX $220F			; AE 0F 22 | Load from absolute address into X register
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_451
; Address: $D7AC56
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_451:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	LDA $D7220F		  ; AF 0F 22 D7 | Load from absolute long address into accumulator
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_45A
; Address: $D7AC89
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_45A:
	JSL $C4656F		  ; 22 6F 65 C4 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $3440			; 8D 40 34 | Store accumulator to absolute address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_45C
; Address: $D7AC9B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_45C:
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_45D
; Address: $D7ACB9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_45D:
	JSL $C736BD		  ; 22 BD 36 C7 | Jump to subroutine long
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_45E
; Address: $D7ACDB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_45E:
	JSL $C736BD		  ; 22 BD 36 C7 | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_463
; Address: $D7AD11
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_463:
	JSL $CCD714		  ; 22 14 D7 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AD2A			; 4C 2A AD | Jump to address
	JMP $AD1B			; 4C 1B AD | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_465
; Address: $D7AD30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_465:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_46E
; Address: $D7AD5D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_46E:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AD76			; 4C 76 AD | Jump to address
	JMP $AD67			; 4C 67 AD | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_46F
; Address: $D7AD76
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_46F:
	JSL $C73C2E		  ; 22 2E 3C C7 | Jump to subroutine long
	LDA $C18B			; AD 8B C1 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AD89			; 4C 89 AD | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_470
; Address: $D7AD85
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_470:
	JSL $CBABBB		  ; 22 BB AB CB | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3406			; 8D 06 34 | Store accumulator to absolute address
	LDA $3406			; AD 06 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AD9E			; 4C 9E AD | Jump to address
	JMP $AD8F			; 4C 8F AD | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3404			; 8D 04 34 | Store accumulator to absolute address
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_472
; Address: $D7ADAB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_472:
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3408			; 8D 08 34 | Store accumulator to absolute address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $340E			; 8D 0E 34 | Store accumulator to absolute address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $340A			; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_473
; Address: $D7ADBD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_473:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3408			; 8D 08 34 | Store accumulator to absolute address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $340A			; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_474
; Address: $D7ADD3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_474:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $3408			; 8D 08 34 | Store accumulator to absolute address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $340A			; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_475
; Address: $D7ADE9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_475:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $3408			; 8D 08 34 | Store accumulator to absolute address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $340A			; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_476
; Address: $D7ADFF
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_476:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $3408			; 8D 08 34 | Store accumulator to absolute address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AE1E			; 4C 1E AE | Jump to address
	JMP $AE0F			; 4C 0F AE | Jump to address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $340E			; 8D 0E 34 | Store accumulator to absolute address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $3408			; 8D 08 34 | Store accumulator to absolute address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $3404			; 8D 04 34 | Store accumulator to absolute address
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AE3F			; 4C 3F AE | Jump to address
	JMP $AE30			; 4C 30 AE | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_47D
; Address: $D7AE5A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_47D:
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_47E
; Address: $D7AE78
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_47E:
	JSL $C736C8		  ; 22 C8 36 C7 | Jump to subroutine long
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_47F
; Address: $D7AE9A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_47F:
	JSL $C736C8		  ; 22 C8 36 C7 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_481
; Address: $D7AEC2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_481:
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AED1			; 4C D1 AE | Jump to address
	JMP $AEC2			; 4C C2 AE | Jump to address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	LDX $3430			; AE 30 34 | Load from absolute address into X register
	LDY $3432			; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_486
; Address: $D7AEEE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_486:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Load from absolute address into accumulator
	STA $340C			; 8D 0C 34 | Store accumulator to absolute address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_487
; Address: $D7AEFE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_487:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AF0E			; 4C 0E AF | Jump to address
	JMP $AEFE			; 4C FE AE | Jump to address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AF52			; 4C 52 AF | Jump to address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AF34			; 4C 34 AF | Jump to address
	LDA #$83			 ; A9 83 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_48A
; Address: $D7AF37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_48A:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	AND $01F6,Y		  ; 39 F6 01 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_48B
; Address: $D7AF3F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_48B:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	AND $90F6,Y		  ; 39 F6 90 | Logical AND with accumulator (absolute,Y)
	JMP $AF4F			; 4C 4F AF | Jump to address
	JMP $AF3F			; 4C 3F AF | Jump to address
	JMP $AF0E			; 4C 0E AF | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_48E
; Address: $D7AF60
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_48E:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	AND $01F6,Y		  ; 39 F6 01 | Logical AND with accumulator (absolute,Y)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_492
; Address: $D7AF7A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_492:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND $90F6,Y		  ; 39 F6 90 | Logical AND with accumulator (absolute,Y)
	JMP $AF8A			; 4C 8A AF | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_493
; Address: $D7AF87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_493:
	JMP $AF7A			; 4C 7A AF | Jump to address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_494
; Address: $D7AF92
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_494:
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AFA1			; 4C A1 AF | Jump to address
	JMP $AF92			; 4C 92 AF | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_495
; Address: $D7AFA1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_495:
	JSL $CDA793		  ; 22 93 A7 CD | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$0E			 ; A2 0E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_496
; Address: $D7AFB7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_496:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$12			 ; A2 12 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_498
; Address: $D7AFD1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_498:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $AFE4			; 4C E4 AF | Jump to address
	JMP $AFD5			; 4C D5 AF | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_499
; Address: $D7AFE4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_499:
	JSL $CDA793		  ; 22 93 A7 CD | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$0F			 ; A2 0F | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_49A
; Address: $D7AFFA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_49A:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$13			 ; A2 13 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_49D
; Address: $D7B018
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_49D:
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B027			; 4C 27 B0 | Jump to address
	JMP $B018			; 4C 18 B0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_49E
; Address: $D7B027
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_49E:
	JSL $CDA793		  ; 22 93 A7 CD | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$10			 ; A2 10 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_49F
; Address: $D7B03D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_49F:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$14			 ; A2 14 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4A1
; Address: $D7B057
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4A1:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B06A			; 4C 6A B0 | Jump to address
	JMP $B05B			; 4C 5B B0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4A2
; Address: $D7B06A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4A2:
	JSL $CDA793		  ; 22 93 A7 CD | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$11			 ; A2 11 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4A3
; Address: $D7B080
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4A3:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$15			 ; A2 15 | Load immediate value into X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4A5
; Address: $D7B09A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4A5:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4A7
; Address: $D7B0A7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4A7:
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B0B6			; 4C B6 B0 | Jump to address
	JMP $B0A7			; 4C A7 B0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4A8
; Address: $D7B0B6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4A8:
	JSL $CDA866		  ; 22 66 A8 CD | Jump to subroutine long
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B0CC			; 4C CC B0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4AA
; Address: $D7B0CC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4AA:
	JSL $CDA88E		  ; 22 8E A8 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B0EB			; 4C EB B0 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4AB
; Address: $D7B0DF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4AB:
	JSL $CDE1B1		  ; 22 B1 E1 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BCS $22			  ; B0 22 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $00A9			; CD A9 00 | Compare accumulator (absolute)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B10A			; 4C 0A B1 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4AC
; Address: $D7B0FE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4AC:
	JSL $CDE1A5		  ; 22 A5 E1 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	PEA #$22B0		   ; F4 B0 22 | Push effective address to stack
	STZ $CDA8,X		  ; 9E A8 CD | Store zero to absolute,X
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $3404			; 8D 04 34 | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4AD
; Address: $D7B116
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4AD:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3406			; AD 06 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B127			; 4C 27 B1 | Jump to address
	JMP $B118			; 4C 18 B1 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B14E			; 4C 4E B1 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4B1
; Address: $D7B142
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4B1:
	JSL $CBB17F		  ; 22 7F B1 CB | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BIT $22B1			; 2C B1 22 | Test bits in accumulator (absolute)
	LDA ($CB),Y		  ; B1 CB | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4B2
; Address: $D7B152
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4B2:
	JSL $CBB177		  ; 22 77 B1 CB | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3406			; 8D 06 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4B3
; Address: $D7B15C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4B3:
	JSL $CDC679		  ; 22 79 C6 CD | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4B5
; Address: $D7B165
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4B5:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register
	WDM #$A0			 ; 42 A0 | Reserved instruction
	INC $227F,X		  ; FE 7F 22 | Increment (absolute,X)
	INC $C01F			; EE 1F C0 | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4BA
; Address: $D7B187
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4BA:
	JSL $CCD7EA		  ; 22 EA D7 CC | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4BB
; Address: $D7B194
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4BB:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LSR $6B03,X		  ; 5E 03 6B | Logical shift right (absolute,X)
	LDA $3426			; AD 26 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4BD
; Address: $D7B1B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4BD:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4C1
; Address: $D7B1D0
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4C1:
	JSL $CBB187		  ; 22 87 B1 CB | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B1E4			; 4C E4 B1 | Jump to address
	JMP $B1D5			; 4C D5 B1 | Jump to address
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B20D			; 4C 0D B2 | Jump to address
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4C6
; Address: $D7B212
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4C6:
	JSL $CBB187		  ; 22 87 B1 CB | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B226			; 4C 26 B2 | Jump to address
	JMP $B217			; 4C 17 B2 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4C7
; Address: $D7B229
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4C7:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B252			; 4C 52 B2 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$A1			 ; A9 A1 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4CB
; Address: $D7B257
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4CB:
	JSL $CBB187		  ; 22 87 B1 CB | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B26B			; 4C 6B B2 | Jump to address
	JMP $B25C			; 4C 5C B2 | Jump to address
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4CC
; Address: $D7B26E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4CC:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B297			; 4C 97 B2 | Jump to address
	LDA #$F2			 ; A9 F2 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$8E			 ; A9 8E | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4D0
; Address: $D7B29C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4D0:
	JSL $CBB187		  ; 22 87 B1 CB | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B2B0			; 4C B0 B2 | Jump to address
	JMP $B2A1			; 4C A1 B2 | Jump to address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4D1
; Address: $D7B2B3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4D1:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B2DC			; 4C DC B2 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$7C			 ; A9 7C | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4D6
; Address: $D7B2E9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4D6:
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B2F5			; 4C F5 B2 | Jump to address
	JMP $B2E6			; 4C E6 B2 | Jump to address
	LDA #$18			 ; A9 18 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4D7
; Address: $D7B2F8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4D7:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B321			; 4C 21 B3 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4DB
; Address: $D7B326
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4DB:
	JSL $CBB187		  ; 22 87 B1 CB | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B33A			; 4C 3A B3 | Jump to address
	JMP $B32B			; 4C 2B B3 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4DC
; Address: $D7B33D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4DC:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3408			; AD 08 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B366			; 4C 66 B3 | Jump to address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$91			 ; A9 91 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4E0
; Address: $D7B36B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4E0:
	JSL $CCD7EA		  ; 22 EA D7 CC | Jump to subroutine long
	LDA #$89			 ; A9 89 | Load immediate value into accumulator
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4E2
; Address: $D7B378
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4E2:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4E5
; Address: $D7B389
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4E5:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4EB
; Address: $D7B3A8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4EB:
	JSL $CBB36B		  ; 22 6B B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B3BC			; 4C BC B3 | Jump to address
	JMP $B3AD			; 4C AD B3 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4EC
; Address: $D7B3BC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4EC:
	JSL $CBB3A0		  ; 22 A0 B3 CB | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4EE
; Address: $D7B3D0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4EE:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$FA			 ; A9 FA | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$86			 ; A9 86 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4EF
; Address: $D7B3E0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4EF:
	JSL $CBB37F		  ; 22 7F B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B3F3			; 4C F3 B3 | Jump to address
	JMP $B3E4			; 4C E4 B3 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F0
; Address: $D7B3F3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F0:
	JSL $CBB3A0		  ; 22 A0 B3 CB | Jump to subroutine long
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F3
; Address: $D7B407
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F3:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$86			 ; A9 86 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F4
; Address: $D7B417
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F4:
	JSL $CBB37F		  ; 22 7F B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B42A			; 4C 2A B4 | Jump to address
	JMP $B41B			; 4C 1B B4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F5
; Address: $D7B42A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F5:
	JSL $CBB3A0		  ; 22 A0 B3 CB | Jump to subroutine long
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F7
; Address: $D7B43E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F7:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$F2			 ; A9 F2 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F8
; Address: $D7B44E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F8:
	JSL $CBB37F		  ; 22 7F B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B461			; 4C 61 B4 | Jump to address
	JMP $B452			; 4C 52 B4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4F9
; Address: $D7B461
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4F9:
	JSL $CBB3A0		  ; 22 A0 B3 CB | Jump to subroutine long
	LDA #$F4			 ; A9 F4 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_4FB
; Address: $D7B475
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_4FB:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_505
; Address: $D7B4B4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_505:
	JSL $CBB36B		  ; 22 6B B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B4C8			; 4C C8 B4 | Jump to address
	JMP $B4B9			; 4C B9 B4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_506
; Address: $D7B4C8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_506:
	JSL $CBB48E		  ; 22 8E B4 CB | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_508
; Address: $D7B4DC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_508:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$7C			 ; A9 7C | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_509
; Address: $D7B4EC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_509:
	JSL $CBB37F		  ; 22 7F B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B4FF			; 4C FF B4 | Jump to address
	JMP $B4F0			; 4C F0 B4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_50A
; Address: $D7B4FF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_50A:
	JSL $CBB48E		  ; 22 8E B4 CB | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_50C
; Address: $D7B513
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_50C:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_50D
; Address: $D7B523
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_50D:
	JSL $CBB37F		  ; 22 7F B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B536			; 4C 36 B5 | Jump to address
	JMP $B527			; 4C 27 B5 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_50E
; Address: $D7B536
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_50E:
	JSL $CBB48E		  ; 22 8E B4 CB | Jump to subroutine long
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_510
; Address: $D7B54A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_510:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_511
; Address: $D7B55A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_511:
	JSL $CBB37F		  ; 22 7F B3 CB | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Load from absolute address into accumulator
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B56D			; 4C 6D B5 | Jump to address
	JMP $B55E			; 4C 5E B5 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_512
; Address: $D7B56D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_512:
	JSL $CBB48E		  ; 22 8E B4 CB | Jump to subroutine long
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_514
; Address: $D7B581
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_514:
	JSL $CBB4A1		  ; 22 A1 B4 CB | Jump to subroutine long
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_517
; Address: $D7B59B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_517:
	LDA $340E			; AD 0E 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B5AA			; 4C AA B5 | Jump to address
	JMP $B59B			; 4C 9B B5 | Jump to address
	LDA $340E			; AD 0E 34 | Load from absolute address into accumulator
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B602			; 4C 02 B6 | Jump to address
	LDA #$98			 ; A9 98 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_519
; Address: $D7B5BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_519:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	JMP $B5E4			; 4C E4 B5 | Jump to address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_51A
; Address: $D7B5C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_51A:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $B5FF			; 4C FF B5 | Jump to address
	LDA #$14			 ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_51B
; Address: $D7B5D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_51B:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $B5FF			; 4C FF B5 | Jump to address
	LDA #$11			 ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_51C
; Address: $D7B5DD
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_51C:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $B5FF			; 4C FF B5 | Jump to address
	LDA $C141			; AD 41 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B5C6			; 4C C6 B5 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B5D0			; 4C D0 B5 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B5DA			; 4C DA B5 | Jump to address
	JMP $B5AA			; 4C AA B5 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_51D
; Address: $D7B604
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_51D:
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B613			; 4C 13 B6 | Jump to address
	JMP $B604			; 4C 04 B6 | Jump to address
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B628			; 4C 28 B6 | Jump to address
	LDA #$07			 ; A9 07 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_520
; Address: $D7B629
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_520:
	JSL $CBB6B2		  ; 22 B2 B6 CB | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B636			; 4C 36 B6 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $B637			; 4C 37 B6 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_521
; Address: $D7B638
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_521:
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B649			; 4C 49 B6 | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	JMP $B64C			; 4C 4C B6 | Jump to address
	ADC $6B08,Y		  ; 79 08 6B | Add with carry (absolute,Y)
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B66B			; 4C 6B B6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_529
; Address: $D7B67B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_529:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $342C			; 8D 2C 34 | Store accumulator to absolute address
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_52E
; Address: $D7B69B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_52E:
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D1			 ; A2 D1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_531
; Address: $D7B6B8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_531:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B6CC			; 4C CC B6 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B6CC			; 4C CC B6 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $B6CD			; 4C CD B6 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_535
; Address: $D7B6DB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_535:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	ADC $2208,X		  ; 7D 08 22 | Add with carry (absolute,X)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CMP $22CC,Y		  ; D9 CC 22 | Compare accumulator (absolute,Y)
	CPY $7E00			; CC 00 7E | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_540
; Address: $D7B721
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_540:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_541
; Address: $D7B72E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_541:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B747			; 4C 47 B7 | Jump to address
	JMP $B738			; 4C 38 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_547
; Address: $D7B75D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_547:
	JSL $CDAE02		  ; 22 02 AE CD | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$94			 ; C9 94 | Compare accumulator (immediate)
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	JMP $B776			; 4C 76 B7 | Jump to address
	JMP $B767			; 4C 67 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_548
; Address: $D7B776
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_548:
	JSL $CDAE1E		  ; 22 1E AE CD | Jump to subroutine long
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_549
; Address: $D7B780
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_549:
	JSL $CCD430		  ; 22 30 D4 CC | Jump to subroutine long
	LDA #$AA			 ; A9 AA | Load immediate value into accumulator
	LDX #$50			 ; A2 50 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_54A
; Address: $D7B78A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_54A:
	JSL $C72FE9		  ; 22 E9 2F C7 | Jump to subroutine long
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B7A3			; 4C A3 B7 | Jump to address
	JMP $B794			; 4C 94 B7 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_54D
; Address: $D7B7AE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_54D:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP $2209			; 4C 09 22 | Jump to address
	EOR $CCA1,X		  ; 5D A1 CC | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_554
; Address: $D7B7DB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_554:
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_556
; Address: $D7B7F9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_556:
	JSL $C736BD		  ; 22 BD 36 C7 | Jump to subroutine long
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_557
; Address: $D7B81B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_557:
	JSL $C736BD		  ; 22 BD 36 C7 | Jump to subroutine long
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	STA $9C11			; 8D 11 9C | Store accumulator to absolute address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $9C13			; 8D 13 9C | Store accumulator to absolute address
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	STA $9C15			; 8D 15 9C | Store accumulator to absolute address
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	STA $9C17			; 8D 17 9C | Store accumulator to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_559
; Address: $D7B841
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_559:
	JSL $CCD7EA		  ; 22 EA D7 CC | Jump to subroutine long
	LDA #$91			 ; A9 91 | Load immediate value into accumulator
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$D8			 ; A0 D8 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	STY $A903			; 8C 03 A9 | Store Y register to absolute address
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_55C
; Address: $D7B863
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_55C:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Load from absolute address into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B8F6			; 4C F6 B8 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_55D
; Address: $D7B87B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_55D:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_55F
; Address: $D7B893
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_55F:
	PHA				  ; 48 | Push accumulator to stack
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B8A1			; 4C A1 B8 | Jump to address
	JMP $B891			; 4C 91 B8 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_560
; Address: $D7B8A4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_560:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_561
; Address: $D7B8B2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_561:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	EOR $F63B,X		  ; 5D 3B F6 | Exclusive OR with accumulator (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$5D			 ; C0 5D | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B8CA			; 4C CA B8 | Jump to address
	JMP $B8BA			; 4C BA B8 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_562
; Address: $D7B8CD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_562:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_563
; Address: $D7B8DB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_563:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ROR $F63B,X		  ; 7E 3B F6 | Rotate right (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B8F3			; 4C F3 B8 | Jump to address
	JMP $B8E3			; 4C E3 B8 | Jump to address
	JMP $B86D			; 4C 6D B8 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_565
; Address: $D7B8FA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_565:
	JSL $CDAF51		  ; 22 51 AF CD | Jump to subroutine long
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $3402			; AD 02 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_566
; Address: $D7B908
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_566:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$B2			 ; C0 B2 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B920			; 4C 20 B9 | Jump to address
	JMP $B910			; 4C 10 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_56B
; Address: $D7B935
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_56B:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	LDX #$84			 ; A2 84 | Load immediate value into X register
	BPL $A0			  ; 10 A0 | Branch if positive
	INC $2283,X		  ; FE 83 22 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_56C
; Address: $D7B944
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_56C:
	JSR $22C0			; 20 C0 22 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $E1A9			; CD A9 E1 | Compare accumulator (absolute)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_56D
; Address: $D7B950
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_56D:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B95D			; 4C 5D B9 | Jump to address
	JMP $B94A			; 4C 4A B9 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_570
; Address: $D7B96B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_570:
	JSL $CDE34C		  ; 22 4C E3 CD | Jump to subroutine long
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_571
; Address: $D7B978
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_571:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_572
; Address: $D7B982
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_572:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B98F			; 4C 8F B9 | Jump to address
	JMP $B97C			; 4C 7C B9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_577
; Address: $D7B9A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_577:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B9B3			; 4C B3 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_579
; Address: $D7B9B3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_579:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	EOR $2209			; 4D 09 22 | Exclusive OR with accumulator (absolute)
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	PHA				  ; 48 | Push accumulator to stack
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B9CF			; 4C CF B9 | Jump to address
	JMP $B9C0			; 4C C0 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_57A
; Address: $D7B9CF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_57A:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $33DA			; 8D DA 33 | Store accumulator to absolute address
	LDA #$5F			 ; A9 5F | Load immediate value into accumulator
	STA $33DC			; 8D DC 33 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $63B4			; 8D B4 63 | Store accumulator to absolute address
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	ADC $D88D,X		  ; 7D 8D D8 | Add with carry (absolute,X)
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	LDX #$8E			 ; A2 8E | Load immediate value into X register
	INC $1522			; EE 22 15 | Increment (absolute)
	CMP #$A9			 ; C9 A9 | Compare accumulator (immediate)
	CPY $A200			; CC 00 A2 | Compare Y register (absolute)
	LDY $22EE			; AC EE 22 | Load from absolute address into Y register
	STZ $C983,X		  ; 9E 83 C9 | Store zero to absolute,X
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	LDX #$DC			 ; A2 DC | Load immediate value into X register
	INC $D622			; EE 22 D6 | Increment (absolute)
	CMP #$A9			 ; C9 A9 | Compare accumulator (immediate)
	CPY $A200			; CC 00 A2 | Compare Y register (absolute)
	BIT $EF			  ; 24 EF | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_57D
; Address: $D7BA19
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_57D:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $BA30			; 4C 30 BA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_57E
; Address: $D7BA28
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_57E:
	JSL $C98D67		  ; 22 67 8D C9 | Jump to subroutine long
	JMP $BA1D			; 4C 1D BA | Jump to address
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	LDX #$F4			 ; A2 F4 | Load immediate value into X register
	INC $0E22			; EE 22 0E | Increment (absolute)
	STY $C9			  ; 84 C9 | Store Y register to zero page
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_580
; Address: $D7BA50
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_580:
	JSL $C98D67		  ; 22 67 8D C9 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LSR $BA			  ; 46 BA | Logical shift right (zero page)
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_582
; Address: $D7BA69
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_582:
	JSL $C9840E		  ; 22 0E 84 C9 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $BA80			; 4C 80 BA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_583
; Address: $D7BA78
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_583:
	JSL $C98D67		  ; 22 67 8D C9 | Jump to subroutine long
	JMP $BA6D			; 4C 6D BA | Jump to address
	LDA $645C			; AD 5C 64 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	STA $645C			; 8D 5C 64 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $BAA6			; 4C A6 BA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_584
; Address: $D7BA99
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_584:
	JSL $C98D67		  ; 22 67 8D C9 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STA $0CA9BA		  ; 8F BA A9 0C | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_586
; Address: $D7BAAD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_586:
	JSL $C97F9C		  ; 22 9C 7F C9 | Jump to subroutine long
	LDA #$94			 ; A9 94 | Load immediate value into accumulator
	ORA ($8D),Y		  ; 11 8D | Logical OR with accumulator ((zero page),Y)
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $BAC7			; 4C C7 BA | Jump to address
	JMP $BAB8			; 4C B8 BA | Jump to address
	LDA #$AA			 ; A9 AA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_587
; Address: $D7BACA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_587:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDA #$54			 ; A9 54 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_589
; Address: $D7BADB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_589:
	JSL $C79961		  ; 22 61 99 C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $BAF2			; 4C F2 BA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_58A
; Address: $D7BAEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_58A:
	JSL $C97F63		  ; 22 63 7F C9 | Jump to subroutine long
	JMP $BADF			; 4C DF BA | Jump to address
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_58C
; Address: $D7BAF9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_58C:
	JSL $C97F9C		  ; 22 9C 7F C9 | Jump to subroutine long
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_58E
; Address: $D7BB05
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_58E:
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	LDY #$1C			 ; A0 1C | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_591
; Address: $D7BB1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_591:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$21			 ; A9 21 | PPU graphics register access
	LDY #$22			 ; A0 22 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_594
; Address: $D7BB3B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_594:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	JMP $4C2A			; 4C 2A 4C | Jump to address
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	LDY #$32			 ; A0 32 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_597
; Address: $D7BB5B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_597:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	LDY #$37			 ; A0 37 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_598
; Address: $D7BB6E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_598:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	LDY #$39			 ; A0 39 | Load immediate value into Y register
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_59A
; Address: $D7BB7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_59A:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BMI $25			  ; 30 25 | Branch if negative
	BMI $02			  ; 30 02 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_59B
; Address: $D7BB88
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_59B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BMI $26			  ; 30 26 | Branch if negative
	BMI $01			  ; 30 01 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_59C
; Address: $D7BB91
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_59C:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $5E			  ; 26 5E | Rotate left (zero page)
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_59D
; Address: $D7BB9A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_59D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $5E			  ; 24 5E | Test bits in accumulator (zero page)
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5A0
; Address: $D7BBB5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5A0:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5A1
; Address: $D7BBC0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5A1:
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5A4
; Address: $D7BBD6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5A4:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5A5
; Address: $D7BBE0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5A5:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $10			  ; 10 10 | Branch if positive
	ORA $2200,Y		  ; 19 00 22 | Logical OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BPL $1A			  ; 10 1A | Branch if positive
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5A6
; Address: $D7BBF2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5A6:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5AA
; Address: $D7BC16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5AA:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5AB
; Address: $D7BC1F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5AB:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $4F38			; 4E 38 4F | Logical shift right (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5AC
; Address: $D7BC28
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5AC:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	WDM #$45			 ; 42 45 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5AD
; Address: $D7BC31
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5AD:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR $51			  ; 45 51 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5AE
; Address: $D7BC3A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5AE:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$4F			 ; 42 4F | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5AF
; Address: $D7BC43
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5AF:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5B2
; Address: $D7BC5E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5B2:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $38			  ; 10 38 | Branch if positive
	ORA ($41),Y		  ; 11 41 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5B3
; Address: $D7BC67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5B3:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $1F38,X		  ; 1E 38 1F | Arithmetic shift left (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5B5
; Address: $D7BC79
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5B5:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	WDM #$1F			 ; 42 1F | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5B6
; Address: $D7BC82
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5B6:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5B7
; Address: $D7BC8B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5B7:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5BA
; Address: $D7BCA6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5BA:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $312A			; 2E 2A 31 | Rotate left (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $3127			; 2E 27 31 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5BB
; Address: $D7BCB8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5BB:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ORA $0341,X		  ; 1D 41 03 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5BC
; Address: $D7BCC1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5BC:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	WDM #$19			 ; 42 19 | Reserved instruction
	EOR ($03),Y		  ; 51 03 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5BD
; Address: $D7BCCA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5BD:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA $2201,Y		  ; 19 01 22 | Logical OR with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA $2203,Y		  ; 19 03 22 | Logical OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	WDM #$38			 ; 42 38 | Reserved instruction
	EOR $0441			; 4D 41 04 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5BE
; Address: $D7BCE5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5BE:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $42			  ; 46 42 | Hardware register operation
	EOR #$51			 ; 49 51 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5BF
; Address: $D7BCEE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5BF:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $57			  ; 46 57 | Logical shift right (zero page)
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5C0
; Address: $D7BCF7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5C0:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $53			  ; 46 53 | Logical shift right (zero page)
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5C9
; Address: $D7BD25
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5C9:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	LDY #$49			 ; A0 49 | Load immediate value into Y register
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5CB
; Address: $D7BD44
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5CB:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	EOR $2B26			; 4D 26 2B | Exclusive OR with accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP $2B26			; 4C 26 2B | Jump to address
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	LDY #$47			 ; A0 47 | Load immediate value into Y register
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5CD
; Address: $D7BD63
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5CD:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0338,X		  ; 3E 38 03 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5CE
; Address: $D7BD6C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5CE:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND #$3B			 ; 29 3B | Logical AND with accumulator (immediate)
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0369,X		  ; 3E 69 03 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5CF
; Address: $D7BD7E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5CF:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	ADC #$01			 ; 69 01 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D1
; Address: $D7BD90
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D1:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BMI $69			  ; 30 69 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D3
; Address: $D7BDAA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D3:
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDY #$4E			 ; A0 4E | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D4
; Address: $D7BDB5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D4:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D5
; Address: $D7BDC2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D5:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	LDY #$52			 ; A0 52 | Load immediate value into Y register
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D7
; Address: $D7BDD3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D7:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROR $4D			  ; 66 4D | Rotate right (zero page)
	ROR $02			  ; 66 02 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D8
; Address: $D7BDDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D8:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROR $4E			  ; 66 4E | Rotate right (zero page)
	ROR $01			  ; 66 01 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5D9
; Address: $D7BDE5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5D9:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	LSR $03			  ; 46 03 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5DB
; Address: $D7BDF7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5DB:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $40			  ; 30 40 | Branch if negative
	EOR $2203			; 4D 03 22 | Exclusive OR with accumulator (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	EOR $2201			; 4D 01 22 | Exclusive OR with accumulator (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	AND ($16),Y		  ; 31 16 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5DC
; Address: $D7BE12
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5DC:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $16			  ; 30 16 | Branch if negative
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND $3018			; 2D 18 30 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5DD
; Address: $D7BE24
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5DD:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND $3017			; 2D 17 30 | Logical AND with accumulator (absolute)
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5DE
; Address: $D7BE37
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5DE:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	LDY #$5A			 ; A0 5A | Load immediate value into Y register
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5E1
; Address: $D7BE51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5E1:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BIT $2C6C			; 2C 6C 2C | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5E3
; Address: $D7BE6C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5E3:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $2203			; 4E 03 22 | Logical shift right (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STZ $4E			  ; 64 4E | Store zero to zero page
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	LDY #$61			 ; A0 61 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5E7
; Address: $D7BE9B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5E7:
	JSL $6B0125		  ; 22 25 01 6B | Jump to subroutine long
	LDA #$69			 ; A9 69 | Load immediate value into accumulator
	LDY #$6A			 ; A0 6A | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5E8
; Address: $D7BEA8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5E8:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	LDY #$6C			 ; A0 6C | Load immediate value into Y register
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5EB
; Address: $D7BEC2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5EB:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	WDM #$24			 ; 42 24 | Reserved instruction
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$03			 ; 49 03 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5EC
; Address: $D7BED4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5EC:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5EE
; Address: $D7BEE6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5EE:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	WDM #$34			 ; 42 34 | Reserved instruction
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F0
; Address: $D7BEF2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F0:
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F2
; Address: $D7BEFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F2:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BIT $53			  ; 24 53 | Test bits in accumulator (zero page)
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F3
; Address: $D7BF08
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F3:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BIT $54			  ; 24 54 | Test bits in accumulator (zero page)
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F4
; Address: $D7BF11
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F4:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $2202			; 4E 02 22 | Logical shift right (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $6B01			; 4E 01 6B | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F5
; Address: $D7BF24
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F5:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $1D			  ; 24 1D | Test bits in accumulator (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F6
; Address: $D7BF2D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F6:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0235,Y		  ; 19 35 02 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F7
; Address: $D7BF36
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F7:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F8
; Address: $D7BF48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F8:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BIT $49			  ; 24 49 | Test bits in accumulator (zero page)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5F9
; Address: $D7BF51
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5F9:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$35			 ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_5FC
; Address: $D7BF6C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_5FC:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_601
; Address: $D7BF90
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_601:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $1F22,X		  ; 1E 22 1F | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_607
; Address: $D7BFBD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_607:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	WDM #$17			 ; 42 17 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_610
; Address: $D7BFF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_610:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	AND $0035,Y		  ; 39 35 00 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_618
; Address: $D7C033
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_618:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_619
; Address: $D7C046
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_619:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $2A			  ; 10 2A | Branch if positive
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_61B
; Address: $D7C058
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_61B:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROR $25			  ; 66 25 | Rotate right (zero page)
	ADC $2202			; 6D 02 22 | Add with carry (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROR $751F			; 6E 1F 75 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_61C
; Address: $D7C06A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_61C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BMI $47			  ; 30 47 | Branch if negative
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	DEC				  ; 3A | Decrement accumulator
	ADC $02			  ; 65 02 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_61D
; Address: $D7C085
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_61D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ROR $4F			  ; 66 4F | Rotate right (zero page)
	ADC $2202			; 6D 02 22 | Add with carry (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROR $754F			; 6E 4F 75 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_61E
; Address: $D7C097
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_61E:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ASL $5550,X		  ; 1E 50 55 | Arithmetic shift left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	INC				  ; 1A | Increment accumulator
	BVC $55			  ; 50 55 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_61F
; Address: $D7C0A9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_61F:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $6A			  ; 26 6A | Rotate left (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $6A			  ; 24 6A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_620
; Address: $D7C0BB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_620:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BVC $55			  ; 50 55 | Branch if overflow clear
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	BVC $55			  ; 50 55 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_623
; Address: $D7C0DF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_623:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $4522,X		  ; 1E 22 45 | Arithmetic shift left (absolute,X)
	AND $2203			; 2D 03 22 | Logical AND with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ASL $4540,X		  ; 1E 40 45 | Arithmetic shift left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $64			  ; 26 64 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_625
; Address: $D7C0FB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_625:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $5B			  ; 10 5B | Branch if positive
	ORA $2203,Y		  ; 19 03 22 | Logical OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_627
; Address: $D7C116
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_627:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_628
; Address: $D7C128
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_628:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	LDY #$AF			 ; A0 AF | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_62B
; Address: $D7C150
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_62B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	SEC				  ; 38 | Set carry flag
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_62D
; Address: $D7C164
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_62D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($25,X)		  ; 21 25 | Logical AND with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $2521			; 2C 21 25 | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_62E
; Address: $D7C177
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_62E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ASL $41			  ; 06 41 | Arithmetic shift left (zero page)
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_62F
; Address: $D7C180
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_62F:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $04			  ; 10 04 | Branch if positive
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_633
; Address: $D7C1A5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_633:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BIT $2D65			; 2C 65 2D | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $2D5F			; 2C 5F 2D | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_635
; Address: $D7C1C0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_635:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $59			  ; 50 59 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_636
; Address: $D7C1C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_636:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $0359			; 4D 59 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_637
; Address: $D7C1D2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_637:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $59			  ; 65 59 | Add with carry (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $2202,Y		  ; 59 02 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	EOR $2203			; 4D 03 22 | Exclusive OR with accumulator (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $4D4A			; 2E 4A 4D | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_638
; Address: $D7C1F6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_638:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $4A			  ; 30 4A | Branch if negative
	EOR $2207			; 4D 07 22 | Exclusive OR with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $4D5F,X		  ; 3E 5F 4D | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_639
; Address: $D7C208
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_639:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $2203			; 4D 03 22 | Exclusive OR with accumulator (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $2207			; 4D 07 22 | Exclusive OR with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $5F51			; 4E 51 5F | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_63C
; Address: $D7C235
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_63C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $34			  ; 26 34 | Rotate left (zero page)
	AND $2205,X		  ; 3D 05 22 | Logical AND with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_63D
; Address: $D7C242
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_63D:
	BMI $38			  ; 30 38 | Branch if negative
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $052B,X		  ; 3E 2B 05 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_640
; Address: $D7C262
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_640:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	AND $053B,X		  ; 3D 3B 05 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_641
; Address: $D7C26B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_641:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $38			  ; 46 38 | Logical shift right (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $5F34			; 4E 34 5F | Logical shift right (absolute)
	AND $2206,X		  ; 3D 06 22 | Logical AND with accumulator (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	PHY				  ; 5A | Push Y register to stack
	AND $065B,X		  ; 3D 5B 06 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_644
; Address: $D7C298
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_644:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $064B,X		  ; 3D 4B 06 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_645
; Address: $D7C2A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_645:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BIT $374D			; 2C 4D 37 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_647
; Address: $D7C2B3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_647:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_648
; Address: $D7C2BC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_648:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BMI $44			  ; 30 44 | Branch if negative
	EOR $2207			; 4D 07 22 | Exclusive OR with accumulator (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	WDM #$29			 ; 42 29 | Reserved instruction
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	WDM #$2F			 ; 42 2F | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_649
; Address: $D7C2D8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_649:
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	LDY #$C7			 ; A0 C7 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_64E
; Address: $D7C2FB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_64E:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_64F
; Address: $D7C30D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_64F:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_650
; Address: $D7C317
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_650:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	EOR #$02			 ; 49 02 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_651
; Address: $D7C320
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_651:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $02			  ; 65 02 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_652
; Address: $D7C329
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_652:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $0265,Y		  ; 39 65 02 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_653
; Address: $D7C332
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_653:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	WDM #$14			 ; 42 14 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_655
; Address: $D7C349
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_655:
	JSR $5754			; 20 54 57 | Jump to subroutine
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ASL $5754,X		  ; 1E 54 57 | Arithmetic shift left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_656
; Address: $D7C357
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_656:
	LDA #$D4			 ; A9 D4 | Load immediate value into accumulator
	LDY #$D5			 ; A0 D5 | Load immediate value into Y register
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_657
; Address: $D7C360
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_657:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$D6			 ; A9 D6 | Load immediate value into accumulator
	LDY #$D7			 ; A0 D7 | Load immediate value into Y register
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_658
; Address: $D7C36D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_658:
	JSL $C69222		  ; 22 22 92 C6 | Jump to subroutine long
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator
	LDY #$D9			 ; A0 D9 | Load immediate value into Y register
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_65A
; Address: $D7C37E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_65A:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_65E
; Address: $D7C399
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_65E:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP ($5350)		  ; 6C 50 53 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_661
; Address: $D7C3B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_661:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_662
; Address: $D7C3BE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_662:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	WDM #$3B			 ; 42 3B | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_663
; Address: $D7C3C7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_663:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	WDM #$42			 ; 42 42 | Hardware register operation
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	EOR ($4D,X)		  ; 41 4D | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_665
; Address: $D7C3E2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_665:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $3E41,X		  ; 3E 41 3E | Rotate left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $3E45,X		  ; 3E 45 3E | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_666
; Address: $D7C3F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_666:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $24			  ; 26 24 | Rotate left (zero page)
	AND ($3D),Y		  ; 31 3D | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_667
; Address: $D7C3FE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_667:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	AND ($4F),Y		  ; 31 4F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_668
; Address: $D7C407
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_668:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2203			; 2D 03 22 | Logical AND with accumulator (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2204			; 2D 04 22 | Logical AND with accumulator (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_66D
; Address: $D7C43D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_66D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $50			  ; 26 50 | Rotate left (zero page)
	AND ($6B),Y		  ; 31 6B | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_670
; Address: $D7C450
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_670:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $3D36			; 2E 36 3D | Rotate left (absolute)
	AND $2202,X		  ; 3D 02 22 | Logical AND with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $4F3D,X		  ; 3E 3D 4F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_672
; Address: $D7C46B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_672:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BVC $4B			  ; 50 4B | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_673
; Address: $D7C474
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_673:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $4B60			; 2E 60 4B | Rotate left (absolute)
	ADC $02			  ; 65 02 | Add with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_674
; Address: $D7C47E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_674:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	WDM #$4A			 ; 42 4A | Reserved instruction
	ADC $02			  ; 65 02 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_675
; Address: $D7C487
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_675:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $2201,X		  ; 5E 01 22 | Logical shift right (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	WDM #$58			 ; 42 58 | Reserved instruction
	LSR $2202,X		  ; 5E 02 22 | Logical shift right (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ASL $2573			; 0E 73 25 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_676
; Address: $D7C4A2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_676:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	STZ $01			  ; 64 01 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_678
; Address: $D7C4B4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_678:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ASL $2204,X		  ; 1E 04 22 | Arithmetic shift left (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	INC				  ; 1A | Increment accumulator
	ASL $2203,X		  ; 1E 03 22 | Arithmetic shift left (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	PHB				  ; 8B | Push data bank register to stack
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_67C
; Address: $D7C4D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_67C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROR $8B38			; 6E 38 8B | Rotate right (absolute)
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_67D
; Address: $D7C4E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_67D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	JMP ($4640)		  ; 6C 40 46 | Jump to address (absolute indirect)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROR $4640			; 6E 40 46 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_67E
; Address: $D7C4F3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_67E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROR $7926			; 6E 26 79 | Rotate right (absolute)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP ($342E)		  ; 6C 2E 34 | Jump to address (absolute indirect)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROR $342E			; 6E 2E 34 | Rotate right (absolute)
	ORA $6B			  ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_680
; Address: $D7C518
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_680:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BMI $14			  ; 30 14 | Branch if negative
	AND ($25),Y		  ; 31 25 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_681
; Address: $D7C521
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_681:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	AND $0025,Y		  ; 39 25 00 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_687
; Address: $D7C54E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_687:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND $34			  ; 25 34 | Logical AND with accumulator (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND ($34,X)		  ; 21 34 | Logical AND with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_689
; Address: $D7C56A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_689:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	EOR $0271			; 4D 71 02 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_68A
; Address: $D7C573
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_68A:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $8A			  ; 10 8A | Branch if positive
	STA $2202,Y		  ; 99 02 22 | Store accumulator to absolute,Y
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_68C
; Address: $D7C585
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_68C:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $1D18			; 2C 18 1D | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA $2202,X		  ; 1D 02 22 | Logical OR with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $4540			; 2C 40 45 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_68D
; Address: $D7C5A9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_68D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $6D68,X		  ; 3E 68 6D | Rotate left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	ADC $2202			; 6D 02 22 | Add with carry (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $9590			; 2C 90 95 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	BCC $95			  ; 90 95 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_68F
; Address: $D7C5D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_68F:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	EOR ($49),Y		  ; 51 49 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_690
; Address: $D7C5DF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_690:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	EOR $0385			; 4D 85 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_691
; Address: $D7C5E8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_691:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $2201,X		  ; 1D 01 22 | Logical OR with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	ORA $2203,X		  ; 1D 03 22 | Logical OR with accumulator (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND ($58,X)		  ; 21 58 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_692
; Address: $D7C60C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_692:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROR $24			  ; 66 24 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_693
; Address: $D7C614
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_693:
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROR $21			  ; 66 21 | PPU graphics register access
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_694
; Address: $D7C61E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_694:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_695
; Address: $D7C627
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_695:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_696
; Address: $D7C630
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_696:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $2205			; 4C 05 22 | Jump to address
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC				  ; 3A | Decrement accumulator
	JMP $2203			; 4C 03 22 | Jump to address
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $817C,X		  ; 3E 7C 81 | Rotate left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_698
; Address: $D7C65D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_698:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BPL $26			  ; 10 26 | Branch if positive
	EOR $2204,X		  ; 5D 04 22 | Exclusive OR with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $5D2B			; 4E 2B 5D | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_699
; Address: $D7C66F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_699:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	LSR $5D5D			; 4E 5D 5D | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_69B
; Address: $D7C681
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_69B:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	EOR $0499,X		  ; 5D 99 04 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_69C
; Address: $D7C68A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_69C:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $312C			; 2C 2C 31 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $0431			; 2C 31 04 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_69D
; Address: $D7C69C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_69D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $5954			; 2C 54 59 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_69E
; Address: $D7C6AC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_69E:
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $5954,X		  ; 3E 54 59 | Rotate left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	DEC				  ; 3A | Decrement accumulator
	BCC $95			  ; 90 95 | Branch if carry clear
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BCC $95			  ; 90 95 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_69F
; Address: $D7C6D2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_69F:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $51			  ; 26 51 | Rotate left (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BPL $62			  ; 10 62 | Branch if positive
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	STZ $AD2B,X		  ; 9E 2B AD | Store zero to absolute,X
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	DEC				  ; 3A | Decrement accumulator
	BIT $0131			; 2C 31 01 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A1
; Address: $D7C6FF
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A1:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $68			  ; 30 68 | Branch if negative
	ADC $2201			; 6D 01 22 | Add with carry (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $6D68			; 2E 68 6D | Rotate left (absolute)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $A9A4			; 2C A4 A9 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	LDY $A9			  ; A4 A9 | Load from zero page into Y register
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A3
; Address: $D7C73E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A3:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	STZ $AD6D,X		  ; 9E 6D AD | Store zero to absolute,X
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A4
; Address: $D7C748
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A4:
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BPL $74			  ; 10 74 | Branch if positive
	STA $06			  ; 85 06 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A5
; Address: $D7C750
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A5:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $817C			; 2C 7C 81 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	STA ($06,X)		  ; 81 06 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A6
; Address: $D7C762
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A6:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	LDY $A9			  ; A4 A9 | Load from zero page into Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LDY $A9			  ; A4 A9 | Load from zero page into Y register
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A7
; Address: $D7C775
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A7:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BIT $19			  ; 24 19 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A8
; Address: $D7C77E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A8:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ROL $1D			  ; 26 1D | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6A9
; Address: $D7C787
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6A9:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ASL $302C,X		  ; 1E 2C 30 | Arithmetic shift left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $0230			; 2C 30 02 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6AA
; Address: $D7C799
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6AA:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	AND ($5F,X)		  ; 21 5F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6B0
; Address: $D7C7BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6B0:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6B3
; Address: $D7C7DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6B3:
	JSL $5F3358		  ; 22 58 33 5F | Jump to subroutine long
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6B5
; Address: $D7C7EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6B5:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	LSR $0163,X		  ; 5E 63 01 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6B6
; Address: $D7C7F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6B6:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	LSR $0563,X		  ; 5E 63 05 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6B7
; Address: $D7C7FC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6B7:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROR				  ; 6A | Rotate right (accumulator)
	EOR #$7F			 ; 49 7F | Exclusive OR with accumulator (immediate)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $4069,X		  ; 3E 69 40 | Rotate left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $406C,X		  ; 3E 6C 40 | Rotate left (absolute,X)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6B8
; Address: $D7C818
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6B8:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR ($02),Y		  ; 51 02 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6BA
; Address: $D7C82A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6BA:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $64			  ; 30 64 | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6BC
; Address: $D7C83C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6BC:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	AND ($6B),Y		  ; 31 6B | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6BD
; Address: $D7C845
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6BD:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $59			  ; 26 59 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $5C			  ; 26 5C | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6BE
; Address: $D7C857
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6BE:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	WDM #$1D			 ; 42 1D | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6BF
; Address: $D7C860
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6BF:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $1958			; 0E 58 19 | Arithmetic shift left (absolute)
	ADC ($04,X)		  ; 61 04 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C0
; Address: $D7C869
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C0:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	EOR ($14,X)		  ; 41 14 | Exclusive OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C1
; Address: $D7C87B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C1:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $2508			; 0E 08 25 | Arithmetic shift left (absolute)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C2
; Address: $D7C885
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C2:
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $14			  ; 26 14 | Rotate left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA $2201,Y		  ; 19 01 22 | Logical OR with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA $6B06,Y		  ; 19 06 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C3
; Address: $D7C8B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C3:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $4919,X		  ; 1E 19 49 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C7
; Address: $D7C8CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C7:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	BIT $0131			; 2C 31 01 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C8
; Address: $D7C8D6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C8:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	BIT $0231			; 2C 31 02 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6C9
; Address: $D7C8DF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6C9:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $31			  ; 30 31 | Branch if negative
	AND $2203,X		  ; 3D 03 22 | Logical AND with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6CA
; Address: $D7C8FA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6CA:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $4B31,X		  ; 3E 31 4B | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6CB
; Address: $D7C903
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6CB:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6CC
; Address: $D7C90C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6CC:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6CD
; Address: $D7C915
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6CD:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	EOR ($4B,X)		  ; 41 4B | Exclusive OR with accumulator ((zero page,X))
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6CE
; Address: $D7C923
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6CE:
	WDM #$3E			 ; 42 3E | Reserved instruction
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	ROL $0543,X		  ; 3E 43 05 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6CF
; Address: $D7C930
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6CF:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $6138			; 4E 38 61 | Logical shift right (absolute)
	EOR #$06			 ; 49 06 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D0
; Address: $D7C939
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D0:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	JMP $433E			; 4C 3E 43 | Jump to address
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $433E			; 4E 3E 43 | Logical shift right (absolute)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D2
; Address: $D7C955
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D2:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROR $7E32,X		  ; 7E 32 7E | Rotate right (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROR $7E2F,X		  ; 7E 2F 7E | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D3
; Address: $D7C968
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D3:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LSR $39			  ; 46 39 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D4
; Address: $D7C971
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D4:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	EOR $55			  ; 45 55 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D5
; Address: $D7C97A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D5:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $4343,X		  ; 3E 43 43 | Rotate left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $4346,X		  ; 3E 46 43 | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D8
; Address: $D7C996
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D8:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $35			  ; 30 35 | Branch if negative
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6D9
; Address: $D7C9A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6D9:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	ROL $4577			; 2E 77 45 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6DB
; Address: $D7C9BA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6DB:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROR $34			  ; 66 34 | Rotate right (zero page)
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6DC
; Address: $D7C9C8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6DC:
	PLA				  ; 68 | Pull accumulator from stack
	AND $2203,Y		  ; 39 03 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6DD
; Address: $D7C9D5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6DD:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6DE
; Address: $D7C9DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6DE:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LSR $015D,X		  ; 5E 5D 01 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6DF
; Address: $D7C9E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6DF:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	EOR $2203,X		  ; 5D 03 22 | Exclusive OR with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	STX $913A			; 8E 3A 91 | Store X register to absolute address
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6E0
; Address: $D7C9F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6E0:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	STA $044B,X		  ; 9D 4B 04 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6E1
; Address: $D7CA02
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6E1:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	STY $4540			; 8C 40 45 | Store Y register to absolute address
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	STX $4540			; 8E 40 45 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6E2
; Address: $D7CA14
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6E2:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $2D			  ; 46 2D | Logical shift right (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $5C56			; 2E 56 5C | Rotate left (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $5C56			; 2C 56 5C | Test bits in accumulator (absolute)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	STZ $3F			  ; 64 3F | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6E3
; Address: $D7CA37
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6E3:
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	JMP ($8141)		  ; 6C 41 81 | Jump to address (absolute indirect)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROR $36			  ; 66 36 | Rotate right (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6E6
; Address: $D7CA65
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6E6:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	EOR $2201,Y		  ; 59 01 22 | Exclusive OR with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	EOR $6B02,Y		  ; 59 02 6B | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6E9
; Address: $D7CA81
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6E9:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR $0239			; 4E 39 02 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6EA
; Address: $D7CA93
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6EA:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ASL $6560,X		  ; 1E 60 65 | Arithmetic shift left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6EC
; Address: $D7CAA5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6EC:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $22037B		  ; AF 7B 03 22 | Load from absolute long address into accumulator
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA ($98,X)		  ; 01 98 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ADC $2201			; 6D 01 22 | Add with carry (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA ($9A,X)		  ; 01 9A | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ADC $2203			; 6D 03 22 | Add with carry (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $34			  ; 46 34 | Logical shift right (zero page)
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6EE
; Address: $D7CAD2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6EE:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $44			  ; 46 44 | Logical shift right (zero page)
	EOR #$03			 ; 49 03 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6EF
; Address: $D7CADB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6EF:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ORA ($76,X)		  ; 01 76 | Logical OR with accumulator ((zero page,X))
	JMP $220161		  ; 5C 61 01 22 | Jump to address long
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA ($74,X)		  ; 01 74 | Logical OR with accumulator ((zero page,X))
	JMP $6B0361		  ; 5C 61 03 6B | Jump to address long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6F2
; Address: $D7CAF7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6F2:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $2C			  ; 26 2C | Rotate left (zero page)
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6F3
; Address: $D7CB00
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6F3:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BIT $0231			; 2C 31 02 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6F6
; Address: $D7CB1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6F6:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BVC $2C			  ; 50 2C | Branch if overflow clear
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6F7
; Address: $D7CB24
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6F7:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BVS $3B			  ; 70 3B | Branch if overflow set
	STA $04			  ; 85 04 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6F8
; Address: $D7CB2D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6F8:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $7C			  ; 26 7C | Rotate left (zero page)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6F9
; Address: $D7CB36
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6F9:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	STA ($04,X)		  ; 81 04 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6FA
; Address: $D7CB3F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6FA:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BVS $51			  ; 70 51 | Branch if overflow set
	STA $05			  ; 85 05 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6FC
; Address: $D7CB51
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6FC:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BVC $7C			  ; 50 7C | Branch if overflow clear
	STA ($05,X)		  ; 81 05 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6FD
; Address: $D7CB5B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6FD:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BIT $4D2A			; 2C 2A 4D | Test bits in accumulator (absolute)
	AND $2202,X		  ; 3D 02 22 | Logical AND with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6FE
; Address: $D7CB6D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6FE:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	WDM #$3E			 ; 42 3E | Reserved instruction
	EOR $0241			; 4D 41 02 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_6FF
; Address: $D7CB76
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_6FF:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $3B38			; 2C 38 3B | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_700
; Address: $D7CB88
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_700:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $3B38			; 4E 38 3B | Logical shift right (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP $3B38			; 4C 38 3B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_703
; Address: $D7CBA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_703:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $41			  ; 46 41 | Logical shift right (zero page)
	EOR #$02			 ; 49 02 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_704
; Address: $D7CBAC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_704:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROR $60			  ; 66 60 | Rotate right (zero page)
	ADC $026B,X		  ; 7D 6B 02 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_709
; Address: $D7CBD9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_709:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	BVS $73			  ; 70 73 | Branch if overflow set
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_70B
; Address: $D7CBFD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_70B:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	JMP $5F81			; 4C 81 5F | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_70E
; Address: $D7CC1E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_70E:
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_70F
; Address: $D7CC2A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_70F:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	STY $58			  ; 84 58 | Store Y register to zero page
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_712
; Address: $D7CC4B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_712:
	LSR $49			  ; 46 49 | Logical shift right (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $49			  ; 46 49 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_714
; Address: $D7CC5C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_714:
	PLP				  ; 28 | Pull processor status from stack
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_715
; Address: $D7CC68
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_715:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	STY $32			  ; 84 32 | Store Y register to zero page
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTI				  ; 40 | Return from interrupt
	BIT $47			  ; 24 47 | Test bits in accumulator (zero page)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_716
; Address: $D7CCA8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_716:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ROL $29			  ; 26 29 | Rotate left (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $26			  ; 46 26 | Logical shift right (zero page)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_718
; Address: $D7CCC3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_718:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $4B48			; 2C 48 4B | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_719
; Address: $D7CCD5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_719:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	WDM #$4D			 ; 42 4D | Reserved instruction
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $5754			; 4E 54 57 | Logical shift right (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP $5754			; 4C 54 57 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_71B
; Address: $D7CCF8
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_71B:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BIT $375C			; 2C 5C 37 | Test bits in accumulator (absolute)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BMI $6A			  ; 30 6A | Branch if negative
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BMI $67			  ; 30 67 | Branch if negative
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BIT $4568			; 2C 68 45 | Test bits in accumulator (absolute)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	LSR $6749,X		  ; 5E 49 67 | Logical shift right (absolute,X)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $68			  ; 46 68 | Logical shift right (zero page)
	EOR #$6D			 ; 49 6D | Exclusive OR with accumulator (immediate)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	PHY				  ; 5A | Push Y register to stack
	EOR $2206,X		  ; 5D 06 22 | Exclusive OR with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $0171			; 6E 71 01 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_71C
; Address: $D7CD41
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_71C:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $716E			; 2C 6E 71 | Test bits in accumulator (absolute)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_71D
; Address: $D7CD4B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_71D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BVC $14			  ; 50 14 | Branch if overflow clear
	AND $2202			; 2D 02 22 | Logical AND with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BMI $2E			  ; 30 2E | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_71E
; Address: $D7CD5D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_71E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BVC $44			  ; 50 44 | Branch if overflow clear
	EOR $2202,Y		  ; 59 02 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_722
; Address: $D7CD78
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_722:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	STX $2F			  ; 86 2F | Store X register to zero page
	STA				  ; 9F 02 22 34 | Store accumulator to absolute long,X
	DEC $00			  ; C6 00 | Decrement (zero page)
	BMI $59			  ; 30 59 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_725
; Address: $D7CD9C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_725:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BVC $22			  ; 50 22 | Branch if overflow clear
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_728
; Address: $D7CDB7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_728:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $3B38			; 2E 38 3B | Rotate left (absolute)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BMI $38			  ; 30 38 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_729
; Address: $D7CDC9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_729:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $3F			  ; 46 3F | Logical shift right (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $3B38,X		  ; 3E 38 3B | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_72A
; Address: $D7CDED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_72A:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR $59			  ; 46 59 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_72B
; Address: $D7CDFF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_72B:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $514E			; 4E 4E 51 | Logical shift right (absolute)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BVC $4E			  ; 50 4E | Branch if overflow clear
	EOR ($02),Y		  ; 51 02 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_72C
; Address: $D7CE11
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_72C:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	JMP $220559		  ; 5C 59 05 22 | Jump to address long
	DEC $00			  ; C6 00 | Decrement (zero page)
	EOR $0259,Y		  ; 59 59 02 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_730
; Address: $D7CE35
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_730:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $59			  ; 26 59 | Rotate left (zero page)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_731
; Address: $D7CE3E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_731:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $5C			  ; 26 5C | Rotate left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_732
; Address: $D7CE47
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_732:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ASL $6764,X		  ; 1E 64 67 | Arithmetic shift left (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_734
; Address: $D7CE59
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_734:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $72			  ; 26 72 | Rotate left (zero page)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_735
; Address: $D7CE62
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_735:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $6F			  ; 26 6F | Rotate left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_73A
; Address: $D7CE8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_73A:
	PLY				  ; 7A | Pull Y register from stack
	ADC $2202,X		  ; 7D 02 22 | Add with carry (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $85			  ; 26 85 | Rotate left (zero page)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_73B
; Address: $D7CE98
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_73B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $88			  ; 26 88 | Rotate left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_73E
; Address: $D7CEB3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_73E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	AND $2203			; 2D 03 22 | Logical AND with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_740
; Address: $D7CECE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_740:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_741
; Address: $D7CED7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_741:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BMI $86			  ; 30 86 | Branch if negative
	STA				  ; 9F 03 22 AD | Store accumulator to absolute long,X
	STA ($C6),Y		  ; 91 C6 | Store accumulator to (zero page),Y
	BVC $70			  ; 50 70 | Branch if overflow clear
	STA $03			  ; 85 03 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_744
; Address: $D7CEF2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_744:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $2D			  ; 46 2D | Logical shift right (zero page)
	EOR #$03			 ; 49 03 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_74B
; Address: $D7CF28
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_74B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	JMP $220339		  ; 5C 39 03 22 | Jump to address long
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	STZ $67			  ; 64 67 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_74D
; Address: $D7CF43
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_74D:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND $2205,Y		  ; 39 05 22 | Logical AND with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND $2203,Y		  ; 39 03 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_750
; Address: $D7CF67
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_750:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	EOR $2205,Y		  ; 59 05 22 | Exclusive OR with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	EOR $2203,Y		  ; 59 03 22 | Exclusive OR with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $7D7A			; 4E 7A 7D | Logical shift right (absolute)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BVC $7A			  ; 50 7A | Branch if overflow clear
	ADC $2203,X		  ; 7D 03 22 | Add with carry (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA $39			  ; 85 39 | Store accumulator to zero page
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEY				  ; 88 | Decrement Y register
	AND $2203,Y		  ; 39 03 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	BCC $93			  ; 90 93 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_753
; Address: $D7CFAF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_753:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BIT $3F14			; 2C 14 3F | Test bits in accumulator (absolute)
	AND $2204			; 2D 04 22 | Logical AND with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BVC $2E			  ; 50 2E | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_755
; Address: $D7CFC5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_755:
	JSR $2F44			; 20 44 2F | Jump to subroutine
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_758
; Address: $D7CFDC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_758:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	STX $4F			  ; 86 4F | Store X register to zero page
	STA				  ; 9F 04 22 8E | Store accumulator to absolute long,X
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR $3B38			; 4E 38 3B | Logical shift right (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BVC $38			  ; 50 38 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_75A
; Address: $D7CFFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_75A:
	SEC				  ; 38 | Set carry flag
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $3B38,X		  ; 5E 38 3B | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_75B
; Address: $D7D009
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_75B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $43			  ; 26 43 | Rotate left (zero page)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_75C
; Address: $D7D012
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_75C:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $46			  ; 26 46 | Rotate left (zero page)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_75D
; Address: $D7D01B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_75D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $4E			  ; 30 4E | Branch if negative
	EOR ($05),Y		  ; 51 05 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_75F
; Address: $D7D02D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_75F:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $59			  ; 46 59 | Logical shift right (zero page)
	EOR #$06			 ; 49 06 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_760
; Address: $D7D036
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_760:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $5C			  ; 46 5C | Logical shift right (zero page)
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_761
; Address: $D7D03F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_761:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $72			  ; 46 72 | Logical shift right (zero page)
	EOR #$06			 ; 49 06 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_762
; Address: $D7D048
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_762:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $6F			  ; 46 6F | Logical shift right (zero page)
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_763
; Address: $D7D051
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_763:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BVC $64			  ; 50 64 | Branch if overflow clear
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $6764			; 4E 64 67 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_764
; Address: $D7D063
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_764:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BMI $7A			  ; 30 7A | Branch if negative
	ADC $2205,X		  ; 7D 05 22 | Add with carry (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $7D7A			; 2E 7A 7D | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_765
; Address: $D7D075
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_765:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $85			  ; 46 85 | Logical shift right (zero page)
	EOR #$06			 ; 49 06 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_766
; Address: $D7D07E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_766:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $88			  ; 46 88 | Logical shift right (zero page)
	EOR #$04			 ; 49 04 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_767
; Address: $D7D087
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_767:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BVC $90			  ; 50 90 | Branch if overflow clear
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $9390			; 4E 90 93 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_768
; Address: $D7D099
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_768:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BMI $44			  ; 30 44 | Branch if negative
	EOR $2205,Y		  ; 59 05 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_769
; Address: $D7D0B3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_769:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BVC $5A			  ; 50 5A | Branch if overflow clear
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BMI $70			  ; 30 70 | Branch if negative
	STA $05			  ; 85 05 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_76B
; Address: $D7D0CB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_76B:
	JSR $3B38			; 20 38 3B | Jump to subroutine
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ASL $3B38,X		  ; 1E 38 3B | Arithmetic shift left (absolute,X)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	LSR $0651			; 4E 51 06 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_76D
; Address: $D7D0E9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_76D:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_76E
; Address: $D7D0F0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_76E:
	STZ $67			  ; 64 67 | Store zero to zero page
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $6764,X		  ; 5E 64 67 | Logical shift right (absolute,X)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	ADC $2206,X		  ; 7D 06 22 | Add with carry (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $7D7A,X		  ; 3E 7A 7D | Rotate left (absolute,X)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_76F
; Address: $D7D112
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_76F:
	JSR $2F2E			; 20 2E 2F | Jump to subroutine
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTI				  ; 40 | Return from interrupt
	EOR $2206,Y		  ; 59 06 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_770
; Address: $D7D125
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_770:
	LSR $6B67,X		  ; 5E 67 6B | Logical shift right (absolute,X)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTI				  ; 40 | Return from interrupt
	BVS $4F			  ; 70 4F | Branch if overflow set
	STA $06			  ; 85 06 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_771
; Address: $D7D132
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_771:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	LSR $43			  ; 46 43 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL $2D			  ; 26 2D | Rotate left (zero page)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_772
; Address: $D7D14D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_772:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $30			  ; 26 30 | Rotate left (zero page)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_773
; Address: $D7D157
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_773:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LSR $43			  ; 46 43 | Logical shift right (zero page)
	ADC $2202,X		  ; 7D 02 22 | Add with carry (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $2F45			; 2C 45 2F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_774
; Address: $D7D168
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_774:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $2F48			; 2C 48 2F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_776
; Address: $D7D17B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_776:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_777
; Address: $D7D18E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_777:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ROL $23			  ; 26 23 | Rotate left (zero page)
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BIT $26			  ; 24 26 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_778
; Address: $D7D1A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_778:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL $32			  ; 26 32 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_779
; Address: $D7D1B2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_779:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	BMI $3D			  ; 30 3D | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_77D
; Address: $D7D1D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_77D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $4D30,X		  ; 3E 30 4D | Rotate left (absolute,X)
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_77E
; Address: $D7D1DF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_77E:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	DEC				  ; 3A | Decrement accumulator
	AND $2203,Y		  ; 39 03 22 | Logical AND with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR $54			  ; 46 54 | Logical shift right (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_77F
; Address: $D7D203
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_77F:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	STZ $52			  ; 64 52 | Store zero to zero page
	ADC ($65),Y		  ; 71 65 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_781
; Address: $D7D215
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_781:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	STZ $5E			  ; 64 5E | Store zero to zero page
	ADC ($04,X)		  ; 61 04 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_782
; Address: $D7D21E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_782:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ADC $81			  ; 65 81 | Add with carry (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROR $6C			  ; 66 6C | Rotate right (zero page)
	STA ($05,X)		  ; 81 05 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_784
; Address: $D7D236
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_784:
	PLY				  ; 7A | Pull Y register from stack
	ADC $2201,X		  ; 7D 01 22 | Add with carry (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	ADC $6B05,X		  ; 7D 05 6B | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_786
; Address: $D7D24C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_786:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	AND ($35),Y		  ; 31 35 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_787
; Address: $D7D255
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_787:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $2B36,X		  ; 1E 36 2B | Arithmetic shift left (absolute,X)
	EOR $2202			; 4D 02 22 | Exclusive OR with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ASL $2D4E,X		  ; 1E 4E 2D | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_788
; Address: $D7D267
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_788:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $4542			; 2C 42 45 | Test bits in accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$45			 ; 42 45 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_78B
; Address: $D7D28B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_78B:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $1D36			; 0E 36 1D | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_78C
; Address: $D7D295
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_78C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	AND #$87			 ; 29 87 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_78D
; Address: $D7D29E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_78D:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $0481,X		  ; 7E 81 04 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_78E
; Address: $D7D2A7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_78E:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ROR $0281,X		  ; 7E 81 02 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_791
; Address: $D7D2B9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_791:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_792
; Address: $D7D2C2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_792:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_793
; Address: $D7D2CB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_793:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $76			  ; 46 76 | Logical shift right (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROR $0481,X		  ; 7E 81 04 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_794
; Address: $D7D2DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_794:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	STA ($05,X)		  ; 81 05 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_795
; Address: $D7D2E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_795:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $90			  ; 46 90 | Logical shift right (zero page)
	LDA ($06,X)		  ; A1 06 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_797
; Address: $D7D2F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_797:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $98			  ; 46 98 | Logical shift right (zero page)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	JMP ($A745)		  ; 6C 45 A7 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_799
; Address: $D7D311
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_799:
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	DEC $02			  ; C6 02 | Decrement (zero page)
	ROR $0439			; 6E 39 04 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_79A
; Address: $D7D31C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_79A:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $02			  ; C6 02 | Decrement (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_79B
; Address: $D7D32F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_79B:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $413D			; 2C 3D 41 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_79C
; Address: $D7D338
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_79C:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	AND $6B02,Y		  ; 39 02 6B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_79D
; Address: $D7D34B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_79D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $69			  ; 06 69 | Arithmetic shift left (zero page)
	ORA $2202,X		  ; 1D 02 22 | Logical OR with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_79E
; Address: $D7D35B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_79E:
	CLC				  ; 18 | Clear carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A0
; Address: $D7D36F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A0:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	WDM #$64			 ; 42 64 | Reserved instruction
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STZ $03			  ; 64 03 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A2
; Address: $D7D38A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A2:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROR $8146,X		  ; 7E 46 81 | Rotate right (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROR $8143,X		  ; 7E 43 81 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A3
; Address: $D7D39C
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A3:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $6D40,X		  ; 5E 40 6D | Logical shift right (absolute,X)
	EOR $2205,X		  ; 5D 05 22 | Exclusive OR with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$5D			 ; 42 5D | Reserved instruction
	EOR $2205,X		  ; 5D 05 22 | Exclusive OR with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $46			  ; 26 46 | Rotate left (zero page)
	EOR #$59			 ; 49 59 | Exclusive OR with accumulator (immediate)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $2E			  ; 45 2E | Exclusive OR with accumulator (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ROL $2205			; 2E 05 22 | Rotate left (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROR $5C56			; 6E 56 5C | Rotate right (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP ($5C56)		  ; 6C 56 5C | Jump to address (absolute indirect)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $619B			; 4C 9B 61 | Jump to address
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register
	JMP $8E2201		  ; 5C 01 22 8E | Jump to address long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A4
; Address: $D7D3F0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A4:
	DEC $00			  ; C6 00 | Decrement (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $226B06		  ; 5C 06 6B 22 | Jump to address long
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ADC $57			  ; 65 57 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A5
; Address: $D7D400
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A5:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $49			  ; 46 49 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A6
; Address: $D7D409
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A6:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $08			  ; 26 08 | Rotate left (zero page)
	ORA $2202,Y		  ; 19 02 22 | Logical OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	PHP				  ; 08 | Push processor status to stack
	EOR #$17			 ; 49 17 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A7
; Address: $D7D41B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A7:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND #$1C			 ; 29 1C | Logical AND with accumulator (immediate)
	ROL $2201			; 2E 01 22 | Rotate left (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND #$19			 ; 29 19 | Logical AND with accumulator (immediate)
	ROL $2202			; 2E 02 22 | Rotate left (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	BMI $35			  ; 30 35 | Branch if negative
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)
	BMI $35			  ; 30 35 | Branch if negative

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A8
; Address: $D7D43F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A8:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	AND $3145			; 2D 45 31 | Logical AND with accumulator (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND $3148			; 2D 48 31 | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7A9
; Address: $D7D452
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7A9:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	EOR $2202			; 4D 02 22 | Exclusive OR with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $511F			; 4E 1F 51 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7AA
; Address: $D7D464
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7AA:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7AE
; Address: $D7D47F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7AE:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BVS $25			  ; 70 25 | Branch if overflow set
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7B1
; Address: $D7D49A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7B1:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7B2
; Address: $D7D4AC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7B2:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	LSR $797F,X		  ; 5E 7F 79 | Logical shift right (absolute,X)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	EOR $0177,X		  ; 5D 77 01 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7B7
; Address: $D7D4DA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7B7:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	ADC $2201			; 6D 01 22 | Add with carry (absolute)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	ADC $2202			; 6D 02 22 | Add with carry (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	WDM #$2B			 ; 42 2B | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7B9
; Address: $D7D4FA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7B9:
	JSR $235A			; 20 5A 23 | Jump to subroutine
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7BC
; Address: $D7D510
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7BC:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	STZ $53			  ; 64 53 | Store zero to zero page
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	STZ $56			  ; 64 56 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7BD
; Address: $D7D522
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7BD:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BVC $29			  ; 50 29 | Branch if overflow clear
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BVC $2C			  ; 50 2C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7BE
; Address: $D7D53C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7BE:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BVC $46			  ; 50 46 | Branch if overflow clear
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BVC $43			  ; 50 43 | Branch if overflow clear
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7BF
; Address: $D7D555
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7BF:
	DEC				  ; 3A | Decrement accumulator
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $3F3A,X		  ; 5E 3A 3F | Logical shift right (absolute,X)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7C1
; Address: $D7D569
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7C1:
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $2520,X		  ; 5E 20 25 | Logical shift right (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7C5
; Address: $D7D58F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7C5:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PLP				  ; 28 | Pull processor status from stack
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $4D1E,X		  ; 3E 1E 4D | Rotate left (absolute,X)
	AND $2203			; 2D 03 22 | Logical AND with accumulator (absolute)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $414D			; 2E 4D 41 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7C6
; Address: $D7D5B3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7C6:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	AND $2201,Y		  ; 39 01 22 | Logical AND with accumulator (absolute,Y)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	AND $2203,Y		  ; 39 03 22 | Logical AND with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	WDM #$21			 ; 42 21 | PPU graphics register access
	EOR ($04),Y		  ; 51 04 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7C8
; Address: $D7D5D7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7C8:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $2201,X		  ; 5D 01 22 | Exclusive OR with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PLP				  ; 28 | Pull processor status from stack
	EOR $2204,X		  ; 5D 04 22 | Exclusive OR with accumulator (absolute,X)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $4D42,X		  ; 3E 42 4D | Rotate left (absolute,X)
	EOR ($05),Y		  ; 51 05 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7CA
; Address: $D7D5FB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7CA:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	EOR $2201,X		  ; 5D 01 22 | Exclusive OR with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	EOR $6B05,X		  ; 5D 05 6B | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D0
; Address: $D7D634
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D0:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $2B			  ; 26 2B | Rotate left (zero page)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D1
; Address: $D7D63D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D1:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D2
; Address: $D7D647
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D2:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $473C			; 2E 3C 47 | Rotate left (absolute)
	EOR ($02),Y		  ; 51 02 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D3
; Address: $D7D650
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D3:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	EOR ($36),Y		  ; 51 36 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D4
; Address: $D7D662
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D4:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D5
; Address: $D7D674
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D5:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR $014F			; 4D 4F 01 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7D8
; Address: $D7D687
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7D8:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ORA $0227,X		  ; 1D 27 02 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7DA
; Address: $D7D699
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7DA:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BIT $12			  ; 24 12 | Test bits in accumulator (zero page)
	AND $0227			; 2D 27 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7DB
; Address: $D7D6A2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7DB:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $2721			; 2E 21 27 | Rotate left (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $2721			; 2C 21 27 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7DD
; Address: $D7D6BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7DD:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR $0327			; 4D 27 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7E3
; Address: $D7D6EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7E3:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	WDM #$37			 ; 42 37 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7E4
; Address: $D7D6FC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7E4:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	AND #$57			 ; 29 57 | Logical AND with accumulator (immediate)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PLP				  ; 28 | Pull processor status from stack
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	WDM #$44			 ; 42 44 | Reserved instruction
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7E5
; Address: $D7D72A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7E5:
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	WDM #$4F			 ; 42 4F | Reserved instruction
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7E6
; Address: $D7D733
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7E6:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	AND $022A			; 2D 2A 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7E9
; Address: $D7D745
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7E9:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $14			  ; 26 14 | Rotate left (zero page)
	AND $021B			; 2D 1B 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7EB
; Address: $D7D757
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7EB:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $251F			; 2E 1F 25 | Rotate left (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	EOR ($29,X)		  ; 41 29 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7EC
; Address: $D7D769
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7EC:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7ED
; Address: $D7D772
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7ED:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	EOR $0329			; 4D 29 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7EE
; Address: $D7D77B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7EE:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	AND $03			  ; 25 03 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7EF
; Address: $D7D784
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7EF:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7F0
; Address: $D7D78D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7F0:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	AND $4627			; 2D 27 46 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7F2
; Address: $D7D79F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7F2:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $3F4A			; 2E 4A 3F | Rotate left (absolute)
	ADC ($05,X)		  ; 61 05 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7F3
; Address: $D7D7B1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7F3:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ADC ($37,X)		  ; 61 37 | Add with carry ((zero page,X))
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STZ $37			  ; 64 37 | Store zero to zero page
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7F4
; Address: $D7D7C7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7F4:
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $0661			; 2C 61 06 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7F9
; Address: $D7D7DF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7F9:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7FC
; Address: $D7D7F1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7FC:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $12			  ; 26 12 | Rotate left (zero page)
	AND $0229			; 2D 29 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_7FD
; Address: $D7D7FA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_7FD:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $1D19			; 2E 19 1D | Rotate left (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BIT $1D19			; 2C 19 1D | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_802
; Address: $D7D81E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_802:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	EOR ($29,X)		  ; 41 29 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_803
; Address: $D7D827
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_803:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	WDM #$18			 ; 42 18 | Reserved instruction
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_804
; Address: $D7D830
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_804:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	EOR $0329			; 4D 29 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_805
; Address: $D7D839
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_805:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ORA $011D,Y		  ; 19 1D 01 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_806
; Address: $D7D842
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_806:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ORA $031D,Y		  ; 19 1D 03 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_807
; Address: $D7D84B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_807:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	WDM #$2C			 ; 42 2C | Reserved instruction
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	WDM #$29			 ; 42 29 | Reserved instruction

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_80B
; Address: $D7D86D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_80B:
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2201			; 2C 01 22 | Test bits in accumulator (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $2C			  ; 46 2C | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_80C
; Address: $D7D881
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_80C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	EOR $2205,Y		  ; 59 05 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	EOR $55			  ; 45 55 | Exclusive OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC				  ; 3A | Decrement accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC				  ; 3A | Decrement accumulator
	LSR $3C			  ; 46 3C | Logical shift right (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $395C			; 2E 5C 39 | Rotate left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_80D
; Address: $D7D8AD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_80D:
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_80E
; Address: $D7D8B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_80E:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_812
; Address: $D7D8CA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_812:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	BIT $0131			; 2C 31 01 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_813
; Address: $D7D8D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_813:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BIT $0231			; 2C 31 02 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_815
; Address: $D7D8E5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_815:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	AND ($7C),Y		  ; 31 7C | Logical AND with accumulator ((zero page),Y)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_818
; Address: $D7D900
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_818:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_81B
; Address: $D7D91C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_81B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BIT $59			  ; 24 59 | Test bits in accumulator (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $5C			  ; 24 5C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_81C
; Address: $D7D92E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_81C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $355A			; 2E 5A 35 | Rotate left (absolute)
	ADC $03			  ; 65 03 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_821
; Address: $D7D949
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_821:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $6152			; 4E 52 61 | Logical shift right (absolute)
	ADC $04			  ; 65 04 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_822
; Address: $D7D952
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_822:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	EOR ($59),Y		  ; 51 59 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	EOR $2204,Y		  ; 59 04 22 | Exclusive OR with accumulator (absolute,Y)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	BVC $30			  ; 50 30 | Branch if overflow clear
	EOR $0543,X		  ; 5D 43 05 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_823
; Address: $D7D96D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_823:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $3F3A,X		  ; 5E 3A 3F | Logical shift right (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP $053F3A		  ; 5C 3A 3F 05 | Jump to address long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_824
; Address: $D7D97F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_824:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $610E			; 4E 0E 61 | Logical shift right (absolute)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_825
; Address: $D7D988
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_825:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	BIT $59			  ; 24 59 | Test bits in accumulator (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND ($59,X)		  ; 21 59 | Logical AND with accumulator ((zero page,X))
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_829
; Address: $D7D9B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_829:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	AND $023F			; 2D 3F 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_82A
; Address: $D7D9BF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_82A:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $3F3B			; 4E 3B 3F | Logical shift right (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP $3F3B			; 4C 3B 3F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_82B
; Address: $D7D9D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_82B:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $3B3D			; 2C 3D 3B | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_82C
; Address: $D7D9DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_82C:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_82E
; Address: $D7D9F7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_82E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_82F
; Address: $D7DA00
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_82F:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ASL $2129,X		  ; 1E 29 21 | PPU graphics register access
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ASL $2125,X		  ; 1E 25 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_831
; Address: $D7DA1B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_831:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	AND $03			  ; 25 03 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_832
; Address: $D7DA24
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_832:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_836
; Address: $D7DA48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_836:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ROL $0143,X		  ; 3E 43 01 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_838
; Address: $D7DA5A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_838:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	WDM #$33			 ; 42 33 | Reserved instruction
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_839
; Address: $D7DA75
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_839:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	WDM #$37			 ; 42 37 | Reserved instruction
	EOR $05			  ; 45 05 | Exclusive OR with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_83C
; Address: $D7DA91
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_83C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	BVC $45			  ; 50 45 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_83E
; Address: $D7DAA3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_83E:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_83F
; Address: $D7DAB5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_83F:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	BIT $3D			  ; 24 3D | Test bits in accumulator (zero page)
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_840
; Address: $D7DABE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_840:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $411E,X		  ; 3E 1E 41 | Rotate left (absolute,X)
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_841
; Address: $D7DAC7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_841:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	WDM #$1A			 ; 42 1A | Reserved instruction
	EOR #$31			 ; 49 31 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_842
; Address: $D7DAD0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_842:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	INC				  ; 1A | Increment accumulator
	EOR $0337			; 4D 37 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_84A
; Address: $D7DB0F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_84A:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $51			  ; 50 51 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_84B
; Address: $D7DB18
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_84B:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_84D
; Address: $D7DB34
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_84D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $3526			; 2E 26 35 | Rotate left (absolute)
	AND ($02),Y		  ; 31 02 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_84E
; Address: $D7DB3D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_84E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BMI $1A			  ; 30 1A | Branch if negative
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_84F
; Address: $D7DB46
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_84F:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	ROL $2521			; 2E 21 25 | Rotate left (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	BMI $21			  ; 30 21 | PPU graphics register access
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_850
; Address: $D7DB58
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_850:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	INC				  ; 1A | Increment accumulator
	EOR ($49),Y		  ; 51 49 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_853
; Address: $D7DB6A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_853:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $59			  ; 26 59 | Rotate left (zero page)
	AND $2203,X		  ; 3D 03 22 | Logical AND with accumulator (absolute,X)
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	PHY				  ; 5A | Push Y register to stack
	AND $013D,Y		  ; 39 3D 01 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_854
; Address: $D7DB7C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_854:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	AND $033D,Y		  ; 39 3D 03 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_857
; Address: $D7DB97
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_857:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	EOR ($45,X)		  ; 41 45 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_85D
; Address: $D7DBC5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_85D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0239,X		  ; 1D 39 02 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_85E
; Address: $D7DBCE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_85E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $312A			; 2E 2A 31 | Rotate left (absolute)
	AND $2202,Y		  ; 39 02 22 | Logical AND with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $49			  ; 24 49 | Test bits in accumulator (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_85F
; Address: $D7DBEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_85F:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $14			  ; 26 14 | Rotate left (zero page)
	AND $0217			; 2D 17 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_864
; Address: $D7DC05
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_864:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $2C			  ; 26 2C | Rotate left (zero page)
	AND $022F			; 2D 2F 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_867
; Address: $D7DC20
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_867:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC ($1B,X)		  ; 61 1B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_868
; Address: $D7DC29
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_868:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_86A
; Address: $D7DC3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_86A:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_86D
; Address: $D7DC56
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_86D:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $035F			; 4D 5F 03 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_86E
; Address: $D7DC5F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_86E:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_86F
; Address: $D7DC71
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_86F:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $4B			  ; 46 4B | Logical shift right (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	LSR $4B			  ; 46 4B | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_870
; Address: $D7DC83
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_870:
	JSL $C6928E		  ; 22 8E 92 C6 | Jump to subroutine long
	LSR $4B46			; 4E 46 4B | Logical shift right (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STX $C692			; 8E 92 C6 | Store X register to absolute address
	JMP $4B46			; 4C 46 4B | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_871
; Address: $D7DC95
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_871:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	LSR $615D,X		  ; 5E 5D 61 | Logical shift right (absolute,X)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ADC ($65,X)		  ; 61 65 | Add with carry ((zero page,X))
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	LSR $6566			; 4E 66 65 | Logical shift right (absolute)
	ADC ($05),Y		  ; 71 05 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_872
; Address: $D7DCB0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_872:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ADC ($75,X)		  ; 61 75 | Add with carry ((zero page,X))
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	EOR $0579,X		  ; 5D 79 05 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_873
; Address: $D7DCC2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_873:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $015B,X		  ; 5D 5B 01 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_874
; Address: $D7DCCB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_874:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_875
; Address: $D7DCD3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_875:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	LDA $C691			; AD 91 C6 | Load from absolute address into accumulator
	ROL $5E			  ; 26 5E | Rotate left (zero page)
	AND $0461			; 2D 61 04 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_878
; Address: $D7DCE6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_878:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $3566,X		  ; 1E 66 35 | Arithmetic shift left (absolute,X)
	ADC ($04),Y		  ; 71 04 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_87B
; Address: $D7DCF8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_87B:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $76			  ; 26 76 | Rotate left (zero page)
	AND $0479			; 2D 79 04 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_87E
; Address: $D7DD0A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_87E:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_880
; Address: $D7DD14
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_880:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $14			  ; 26 14 | Rotate left (zero page)
	EOR $0217,X		  ; 5D 17 02 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_884
; Address: $D7DD2F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_884:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_888
; Address: $D7DD4A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_888:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $2C			  ; 26 2C | Rotate left (zero page)
	AND $022F			; 2D 2F 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_889
; Address: $D7DD53
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_889:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $5E			  ; 26 5E | Rotate left (zero page)
	AND $0361			; 2D 61 03 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_88C
; Address: $D7DD65
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_88C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ASL $6566,X		  ; 1E 66 65 | Arithmetic shift left (absolute,X)
	ADC ($03),Y		  ; 71 03 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_891
; Address: $D7DD89
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_891:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $76			  ; 26 76 | Rotate left (zero page)
	EOR $0379,X		  ; 5D 79 03 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_892
; Address: $D7DD92
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_892:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	EOR $012B,X		  ; 5D 2B 01 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_893
; Address: $D7DD9B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_893:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_894
; Address: $D7DDA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_894:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $015B,X		  ; 5D 5B 01 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_896
; Address: $D7DDB2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_896:
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($5B,X)		  ; 61 5B | Add with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_898
; Address: $D7DDC0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_898:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC ($1B,X)		  ; 61 1B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_89A
; Address: $D7DDD2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_89A:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_89C
; Address: $D7DDE4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_89C:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BIT $5F4B			; 2C 4B 5F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_89D
; Address: $D7DDED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_89D:
	JSL $C69234		  ; 22 34 92 C6 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_89E
; Address: $D7DE00
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_89E:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $14			  ; 26 14 | Rotate left (zero page)
	AND $0217			; 2D 17 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8A3
; Address: $D7DE1B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8A3:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	ROL $2C			  ; 26 2C | Rotate left (zero page)
	AND $022F			; 2D 2F 02 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8A6
; Address: $D7DE36
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8A6:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC ($1B,X)		  ; 61 1B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8A7
; Address: $D7DE3F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8A7:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8A8
; Address: $D7DE48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8A8:
	JSL $C691AD		  ; 22 AD 91 C6 | Jump to subroutine long
	BIT $2F5D			; 2C 5D 2F | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8B1
; Address: $D7DE6B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8B1:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $DE7B			; 4C 7B DE | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8B3
; Address: $D7DE7C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8B3:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $DE8C			; 4C 8C DE | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8F4
; Address: $D7DF8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8F4:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ASL $F634			; 0E 34 F6 | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8F6
; Address: $D7DF98
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8F6:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8F8
; Address: $D7DFA4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8F8:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CMP $F630,Y		  ; D9 30 F6 | Compare accumulator (absolute,Y)
	LDA $9977			; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8F9
; Address: $D7DFAF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8F9:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	STA ($31,X)		  ; 81 31 | Store accumulator to (zero page,X)
	LDA $9977			; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8FD
; Address: $D7DFD1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8FD:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ROR $F634			; 6E 34 F6 | Rotate right (absolute)
	LDA $9977			; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_8FE
; Address: $D7DFDC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_8FE:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_903
; Address: $D7DFF4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_903:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_907
; Address: $D7E00C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_907:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_908
; Address: $D7E015
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_908:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E029			; 4C 29 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_90E
; Address: $D7E035
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_90E:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_90F
; Address: $D7E03E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_90F:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E04B			; 4C 4B E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_916
; Address: $D7E064
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_916:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E071			; 4C 71 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_918
; Address: $D7E072
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_918:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E07F			; 4C 7F E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_91D
; Address: $D7E08F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_91D:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA $9977			; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_91E
; Address: $D7E09B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_91E:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDY $3B			  ; A4 3B | Load from zero page into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_928
; Address: $D7E0D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_928:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDA $F63C,X		  ; BD 3C F6 | Load from absolute,X into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_92C
; Address: $D7E0EF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_92C:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	WDM #$F6			 ; 42 F6 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_92E
; Address: $D7E0FB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_92E:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDX $42			  ; A6 42 | Hardware register operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_930
; Address: $D7E107
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_930:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	WDM #$F6			 ; 42 F6 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_933
; Address: $D7E118
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_933:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E16A			; 4C 6A E1 | Jump to address
	LDA #$78			 ; A9 78 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_93E
; Address: $D7E163
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_93E:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E18D			; 4C 8D E1 | Jump to address
	LDA #$82			 ; A9 82 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_944
; Address: $D7E18E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_944:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E1A1			; 4C A1 E1 | Jump to address
	LDA #$86			 ; A9 86 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_945
; Address: $D7E19A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_945:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E1AF			; 4C AF E1 | Jump to address
	LDA #$87			 ; A9 87 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_948
; Address: $D7E1B0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_948:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E1C3			; 4C C3 E1 | Jump to address
	LDA #$89			 ; A9 89 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_949
; Address: $D7E1BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_949:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E1CA			; 4C CA E1 | Jump to address
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_94B
; Address: $D7E1CB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_94B:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E1D7			; 4C D7 E1 | Jump to address
	JMP $E1D7			; 4C D7 E1 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_94C
; Address: $D7E1D8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_94C:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E1EB			; 4C EB E1 | Jump to address
	LDA #$8B			 ; A9 8B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_94D
; Address: $D7E1E4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_94D:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E1F9			; 4C F9 E1 | Jump to address
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_950
; Address: $D7E1FA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_950:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E20D			; 4C 0D E2 | Jump to address
	LDA #$8E			 ; A9 8E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_951
; Address: $D7E206
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_951:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E214			; 4C 14 E2 | Jump to address
	LDA #$8F			 ; A9 8F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_953
; Address: $D7E215
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_953:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E27C			; 4C 7C E2 | Jump to address
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8B			 ; A9 8B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8D			 ; A9 8D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8E			 ; A9 8E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8F			 ; A9 8F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$91			 ; A9 91 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$92			 ; A9 92 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_954
; Address: $D7E25A
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_954:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$93			 ; A9 93 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$94			 ; A9 94 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$95			 ; A9 95 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$96			 ; A9 96 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $E2AD			; 4C AD E2 | Jump to address
	LDA #$97			 ; A9 97 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$98			 ; A9 98 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$99			 ; A9 99 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$9A			 ; A9 9A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$9B			 ; A9 9B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$9C			 ; A9 9C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$9D			 ; A9 9D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$9E			 ; A9 9E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_955
; Address: $D7E2B2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_955:
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$9F			 ; A9 9F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_956
; Address: $D7E2C3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_956:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E2D6			; 4C D6 E2 | Jump to address
	LDA #$A1			 ; A9 A1 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $E2EB			; 4C EB E2 | Jump to address
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A3			 ; A9 A3 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A4			 ; A9 A4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_957
; Address: $D7E2EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_957:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E345			; 4C 45 E3 | Jump to address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_963
; Address: $D7E33E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_963:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E376			; 4C 76 E3 | Jump to address
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_96B
; Address: $D7E377
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_96B:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E38A			; 4C 8A E3 | Jump to address
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_96C
; Address: $D7E383
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_96C:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E39F			; 4C 9F E3 | Jump to address
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_970
; Address: $D7E3A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_970:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E3B3			; 4C B3 E3 | Jump to address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_971
; Address: $D7E3AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_971:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E3BA			; 4C BA E3 | Jump to address
	LDA #$26			 ; A9 26 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_97B
; Address: $D7E3E8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_97B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E40C			; 4C 0C E4 | Jump to address
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E40C			; 4C 0C E4 | Jump to address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_97C
; Address: $D7E405
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_97C:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E413			; 4C 13 E4 | Jump to address
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_97E
; Address: $D7E414
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_97E:
	LDA #$E4			 ; A9 E4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_983
; Address: $D7E42C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_983:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E4EB			; 4C EB E4 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_984
; Address: $D7E437
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_984:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E4B3			; 4C B3 E4 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E471			; 4C 71 E4 | Jump to address
	LDA #$D4			 ; A9 D4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_98A
; Address: $D7E46A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_98A:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E49B			; 4C 9B E4 | Jump to address
	LDA #$C9			 ; A9 C9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_993
; Address: $D7E4AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_993:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E4E8			; 4C E8 E4 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E4C5			; 4C C5 E4 | Jump to address
	LDA #$D9			 ; A9 D9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_999
; Address: $D7E4E4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_999:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E5AB			; 4C AB E5 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $E52E			; 4C 2E E5 | Jump to address
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9A2
; Address: $D7E52E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9A2:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E57D			; 4C 7D E5 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E557			; 4C 57 E5 | Jump to address
	LDA #$BA			 ; A9 BA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9AA
; Address: $D7E576
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9AA:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E5AB			; 4C AB E5 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E58F			; 4C 8F E5 | Jump to address
	LDA #$C2			 ; A9 C2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B0
; Address: $D7E5AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B0:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E5F0			; 4C F0 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B1
; Address: $D7E5B7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B1:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E5CA			; 4C CA E5 | Jump to address
	LDA #$DD			 ; A9 DD | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B2
; Address: $D7E5C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B2:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E5ED			; 4C ED E5 | Jump to address
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B3
; Address: $D7E5CD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B3:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E5E6			; 4C E6 E5 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B4
; Address: $D7E5DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B4:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E5ED			; 4C ED E5 | Jump to address
	LDA #$DF			 ; A9 DF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B6
; Address: $D7E5F0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B6:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E60E			; 4C 0E E6 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E60B			; 4C 0B E6 | Jump to address
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9B7
; Address: $D7E607
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9B7:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E627			; 4C 27 E6 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E620			; 4C 20 E6 | Jump to address
	LDA #$DB			 ; A9 DB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9BA
; Address: $D7E628
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9BA:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E662			; 4C 62 E6 | Jump to address
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E65B			; 4C 5B E6 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9BB
; Address: $D7E642
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9BB:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E651			; 4C 51 E6 | Jump to address
	LDA #$E3			 ; A9 E3 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9BC
; Address: $D7E64A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9BC:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E658			; 4C 58 E6 | Jump to address
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9BD
; Address: $D7E654
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9BD:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E662			; 4C 62 E6 | Jump to address
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9BF
; Address: $D7E663
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9BF:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E6B2			; 4C B2 E6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C0
; Address: $D7E66E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C0:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E68C			; 4C 8C E6 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E689			; 4C 89 E6 | Jump to address
	LDA #$E9			 ; A9 E9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C1
; Address: $D7E685
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C1:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E6AF			; 4C AF E6 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E6A1			; 4C A1 E6 | Jump to address
	LDA #$EA			 ; A9 EA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C2
; Address: $D7E69A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C2:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E6A8			; 4C A8 E6 | Jump to address
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C4
; Address: $D7E6AB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C4:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E6DE			; 4C DE E6 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E6DE			; 4C DE E6 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C5
; Address: $D7E6BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C5:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E6D0			; 4C D0 E6 | Jump to address
	LDA #$E4			 ; A9 E4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C6
; Address: $D7E6C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C6:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E6DE			; 4C DE E6 | Jump to address
	LDA #$E5			 ; A9 E5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9C9
; Address: $D7E6DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9C9:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E720			; 4C 20 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9CA
; Address: $D7E6EA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9CA:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E70F			; 4C 0F E7 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E705			; 4C 05 E7 | Jump to address
	LDA #$F1			 ; A9 F1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9CC
; Address: $D7E708
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9CC:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E71D			; 4C 1D E7 | Jump to address
	LDA #$EF			 ; A9 EF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9CF
; Address: $D7E720
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9CF:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E733			; 4C 33 E7 | Jump to address
	LDA #$EB			 ; A9 EB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9D0
; Address: $D7E72C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9D0:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E74C			; 4C 4C E7 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E745			; 4C 45 E7 | Jump to address
	LDA #$EC			 ; A9 EC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9D3
; Address: $D7E74D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9D3:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7AD			; 4C AD E7 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9D4
; Address: $D7E758
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9D4:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E79C			; 4C 9C E7 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E784			; 4C 84 E7 | Jump to address
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9D7
; Address: $D7E77D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9D7:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E792			; 4C 92 E7 | Jump to address
	LDA #$F5			 ; A9 F5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9DA
; Address: $D7E795
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9DA:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E7AA			; 4C AA E7 | Jump to address
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9DD
; Address: $D7E7AD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9DD:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E7D2			; 4C D2 E7 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7C8			; 4C C8 E7 | Jump to address
	LDA #$F2			 ; A9 F2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9DF
; Address: $D7E7CB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9DF:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E7EE			; 4C EE E7 | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7E7			; 4C E7 E7 | Jump to address
	LDA #$F4			 ; A9 F4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9E0
; Address: $D7E7E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9E0:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E7EE			; 4C EE E7 | Jump to address
	LDA #$F3			 ; A9 F3 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9E2
; Address: $D7E7EF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9E2:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E8B8			; 4C B8 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9E3
; Address: $D7E7FA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9E3:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E876			; 4C 76 E8 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9E7
; Address: $D7E81F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9E7:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E842			; 4C 42 E8 | Jump to address
	LDA #$13			 ; A9 13 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9F2
; Address: $D7E86F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9F2:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E8B5			; 4C B5 E8 | Jump to address
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_9FC
; Address: $D7E8B8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_9FC:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E918			; 4C 18 E9 | Jump to address
	LDA #$FD			 ; A9 FD | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A08
; Address: $D7E911
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A08:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E969			; 4C 69 E9 | Jump to address
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A11
; Address: $D7E953
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A11:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E969			; 4C 69 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A14
; Address: $D7E96A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A14:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E996			; 4C 96 E9 | Jump to address
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E988			; 4C 88 E9 | Jump to address
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A15
; Address: $D7E981
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A15:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E996			; 4C 96 E9 | Jump to address
	LDA #$2A			 ; A9 2A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A18
; Address: $D7E997
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A18:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E9DB			; 4C DB E9 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E9B7			; 4C B7 E9 | Jump to address
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A1A
; Address: $D7E9B7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A1A:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E9CA			; 4C CA E9 | Jump to address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A1B
; Address: $D7E9C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A1B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $E9D1			; 4C D1 E9 | Jump to address
	LDA #$39			 ; A9 39 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A1E
; Address: $D7E9DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A1E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EA0A			; 4C 0A EA | Jump to address
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A23
; Address: $D7EA03
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A23:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $EA2D			; 4C 2D EA | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A29
; Address: $D7EA2E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A29:
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EA61			; 4C 61 EA | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EA5E			; 4C 5E EA | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A2A
; Address: $D7EA44
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A2A:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EA57			; 4C 57 EA | Jump to address
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A2B
; Address: $D7EA50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A2B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $EA5E			; 4C 5E EA | Jump to address
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A2D
; Address: $D7EA61
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A2D:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EA74			; 4C 74 EA | Jump to address
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A2E
; Address: $D7EA6D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A2E:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $EA7B			; 4C 7B EA | Jump to address
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A45
; Address: $D7EAEB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A45:
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A46
; Address: $D7EAF3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A46:
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A47
; Address: $D7EB02
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A47:
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A48
; Address: $D7EB12
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A48:
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$13			 ; A9 13 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$15			 ; A9 15 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A49
; Address: $D7EB5E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A49:
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A4A
; Address: $D7EB69
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A4A:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A4B
; Address: $D7EB7B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A4B:
	LDA #$1D			 ; A9 1D | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A4E
; Address: $D7EB8B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A4E:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$21			 ; A9 21 | PPU graphics register access
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$22			 ; A9 22 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A4F
; Address: $D7EBA1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A4F:
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A50
; Address: $D7EBA9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A50:
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A51
; Address: $D7EBB1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A51:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EBE3			; 4C E3 EB | Jump to address
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EBE3			; 4C E3 EB | Jump to address

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A52
; Address: $D7EBC7
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A52:
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$27			 ; A9 27 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EBF5			; 4C F5 EB | Jump to address
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A53
; Address: $D7EBF6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A53:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EC1A			; 4C 1A EC | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EC1A			; 4C 1A EC | Jump to address
	LDA #$2A			 ; A9 2A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A54
; Address: $D7EC1B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A54:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EC42			; 4C 42 EC | Jump to address
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A55
; Address: $D7EC2D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A55:
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A57
; Address: $D7EC44
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A57:
	JSL $CCCFD2		  ; 22 D2 CF CC | Jump to subroutine long
	LDA #$4C			 ; A9 4C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A58
; Address: $D7EC6C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A58:
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A59
; Address: $D7EC74
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A59:
	JSL $CCCFD2		  ; 22 D2 CF CC | Jump to subroutine long
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A5A
; Address: $D7EC86
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A5A:
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A5B
; Address: $D7EC9C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A5B:
	JSL $CCCFD2		  ; 22 D2 CF CC | Jump to subroutine long
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A5C
; Address: $D7ECD2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A5C:
	JSL $CCCFD2		  ; 22 D2 CF CC | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A5D
; Address: $D7ECE1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A5D:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5F			 ; A9 5F | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A5E
; Address: $D7ECF3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A5E:
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A64
; Address: $D7ED15
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A64:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $EDB6			; 4C B6 ED | Jump to address
	JMP $ED80			; 4C 80 ED | Jump to address
	JMP $EDB6			; 4C B6 ED | Jump to address
	JMP $EDB6			; 4C B6 ED | Jump to address
	JMP $EDB6			; 4C B6 ED | Jump to address
	JMP $EDB6			; 4C B6 ED | Jump to address
	JMP $EDB6			; 4C B6 ED | Jump to address
	JMP $EDB6			; 4C B6 ED | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED7D			; 4C 7D ED | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED7D			; 4C 7D ED | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED7D			; 4C 7D ED | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A65
; Address: $D7ED5E
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A65:
	JMP $ED7D			; 4C 7D ED | Jump to address
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED7D			; 4C 7D ED | Jump to address
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED7D			; 4C 7D ED | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	EOR ($35),Y		  ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
	JMP $EDB6			; 4C B6 ED | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$B3			 ; C9 B3 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED23			; 4C 23 ED | Jump to address
	CMP #$B5			 ; C9 B5 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED26			; 4C 26 ED | Jump to address
	CMP #$B6			 ; C9 B6 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED29			; 4C 29 ED | Jump to address
	CMP #$B7			 ; C9 B7 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED2C			; 4C 2C ED | Jump to address
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED2F			; 4C 2F ED | Jump to address
	CMP #$BC			 ; C9 BC | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED32			; 4C 32 ED | Jump to address
	JMP $ED35			; 4C 35 ED | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A66
; Address: $D7EDB7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A66:
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EDC8			; 4C C8 ED | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A68
; Address: $D7EDCE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A68:
	JSL $C0CF6B		  ; 22 6B CF C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $EDE1			; 4C E1 ED | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A69
; Address: $D7EDDA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A69:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $EDCE			; 4C CE ED | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A77
; Address: $D7EE2B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A77:
	JSL $C0CF6B		  ; 22 6B CF C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $EE3E			; 4C 3E EE | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A78
; Address: $D7EE37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A78:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $EE2B			; 4C 2B EE | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A7A
; Address: $D7EE44
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A7A:
	JSL $C0CF6B		  ; 22 6B CF C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $EE57			; 4C 57 EE | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A7B
; Address: $D7EE50
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A7B:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $EE44			; 4C 44 EE | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A8D
; Address: $D7EEB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A8D:
	JSL $C0CF6B		  ; 22 6B CF C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $EEC5			; 4C C5 EE | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A8E
; Address: $D7EEBE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A8E:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $EEB2			; 4C B2 EE | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A99
; Address: $D7EEFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A99:
	JSL $C9A7D5		  ; 22 D5 A7 C9 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $EF11			; 4C 11 EF | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2E_DmaFunction_A9A
; Address: $D7EF0A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2E_DmaFunction_A9A:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $EEFE			; 4C FE EE | Jump to address
	RTL				  ; 6B | Return from subroutine long
