;==============================================================================
; Dragon Quest III - Bank $32
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $D90000-$D97FFF
; Instructions: 10279
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_32"

;------------------------------------------------------------------------------
; Bank32_DmaFunction_000
; Address: $D98000
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_000:
	BRA $AD			  ; 80 AD | Branch always
	ROL $8334			; 2E 34 83 | Rotate left (absolute)
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8029			; 4C 29 80 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $803A			; 4C 3A 80 | Jump to address
	LDA $3424			; AD 24 34 | Load from absolute address into accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8039			; 4C 39 80 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $803A			; 4C 3A 80 | Jump to address
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_001
; Address: $D9803E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_001:
	JSL $C750A7		  ; 22 A7 50 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8057			; 4C 57 80 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_002
; Address: $D9804A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_002:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8057			; 4C 57 80 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8058			; 4C 58 80 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_003
; Address: $D98059
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_003:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8073			; 4C 73 80 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8073			; 4C 73 80 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8074			; 4C 74 80 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_005
; Address: $D9807A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_005:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8088			; 4C 88 80 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8089			; 4C 89 80 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_007
; Address: $D9808E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_007:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $80EC			; 4C EC 80 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_008
; Address: $D9809A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_008:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $80EC			; 4C EC 80 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $80EC			; 4C EC 80 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_009
; Address: $D980AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_009:
	JSL $CC9081		  ; 22 81 90 CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $80EC			; 4C EC 80 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_00A
; Address: $D980B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_00A:
	JSL $CC80EF		  ; 22 EF 80 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $80EC			; 4C EC 80 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_00C
; Address: $D980C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_00C:
	JSL $CDD687		  ; 22 87 D6 CD | Jump to subroutine long
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_00F
; Address: $D980D9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_00F:
	JSL $C73C16		  ; 22 16 3C C7 | Jump to subroutine long
	LDA $3422			; AD 22 34 | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $80EC			; 4C EC 80 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $80ED			; 4C ED 80 | Jump to address
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_010
; Address: $D980EF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_010:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $361A			; 8D 1A 36 | Store accumulator to absolute address
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank32_DmaFunction_017
; Address: $D98116
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_017:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA $361A			; AD 1A 36 | Load from absolute address into accumulator
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	JMP $8129			; 4C 29 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $812A			; 4C 2A 81 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_018
; Address: $D9812B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_018:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8152			; 4C 52 81 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_019
; Address: $D98134
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_019:
	JSL $CCD70B		  ; 22 0B D7 CC | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$53			 ; C9 53 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $814F			; 4C 4F 81 | Jump to address
	LDA $361A			; AD 1A 36 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $361A			; 8D 1A 36 | Store accumulator to absolute address
	JMP $815C			; 4C 5C 81 | Jump to address
	LDA $361A			; AD 1A 36 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $361A			; 8D 1A 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_01A
; Address: $D9815D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_01A:
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8173			; 4C 73 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8174			; 4C 74 81 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_01B
; Address: $D98175
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_01B:
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$90			 ; A2 90 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_01D
; Address: $D9817E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_01D:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $818B			; 4C 8B 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $81B8			; 4C B8 81 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_01E
; Address: $D98194
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_01E:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81A1			; 4C A1 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $81B8			; 4C B8 81 | Jump to address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$58			 ; A2 58 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $81B7			; 4C B7 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $81B8			; 4C B8 81 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_01F
; Address: $D981B9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_01F:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $81D3			; 4C D3 81 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $81D3			; 4C D3 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $81D4			; 4C D4 81 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_020
; Address: $D981D5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_020:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $81FA			; 4C FA 81 | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_021
; Address: $D981E8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_021:
	JMP $81FA			; 4C FA 81 | Jump to address
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $81FA			; 4C FA 81 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $81FB			; 4C FB 81 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_022
; Address: $D981FC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_022:
	JSL $CC7BA2		  ; 22 A2 7B CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $821E			; 4C 1E 82 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	LDX #$16			 ; A2 16 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_023
; Address: $D9820B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_023:
	JSL $C78B3F		  ; 22 3F 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $821E			; 4C 1E 82 | Jump to address
	LDA $C173			; AD 73 C1 | Load from absolute address into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $821F			; 4C 1F 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_024
; Address: $D98220
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_024:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $822F			; 4C 2F 82 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8230			; 4C 30 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_025
; Address: $D98231
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_025:
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$44			 ; C9 44 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8240			; 4C 40 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $827D			; 4C 7D 82 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$46			 ; C9 46 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $824F			; 4C 4F 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $827D			; 4C 7D 82 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$47			 ; C9 47 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $825E			; 4C 5E 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $827D			; 4C 7D 82 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_026
; Address: $D98261
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_026:
	CMP #$45			 ; C9 45 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $826D			; 4C 6D 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $827D			; 4C 7D 82 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$48			 ; C9 48 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $827C			; 4C 7C 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $827D			; 4C 7D 82 | Jump to address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_027
; Address: $D9827E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_027:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8299			; 4C 99 82 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $82AE			; 4C AE 82 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $82C3			; 4C C3 82 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $82D8			; 4C D8 82 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_028
; Address: $D982E0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_028:
	JMP $82ED			; 4C ED 82 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $82FC			; 4C FC 82 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $82FD			; 4C FD 82 | Jump to address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_029
; Address: $D982FE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_029:
	LDA #$A7			 ; A9 A7 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8311			; 4C 11 83 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8312			; 4C 12 83 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_02A
; Address: $D98313
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_02A:
	LDA #$21			 ; A9 21 | PPU graphics register access
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $84D2			; 4C D2 84 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_02B
; Address: $D9831F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_02B:
	JSL $CC84D4		  ; 22 D4 84 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8368			; 4C 68 83 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_02C
; Address: $D9832C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_02C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8365			; 4C 65 83 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_02D
; Address: $D9834C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_02D:
	JSL $C9062D		  ; 22 2D 06 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $343A			; 8D 3A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $84D3			; 4C D3 84 | Jump to address
	JMP $84D2			; 4C D2 84 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_02E
; Address: $D98368
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_02E:
	JSL $CC8552		  ; 22 52 85 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $83B1			; 4C B1 83 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_02F
; Address: $D98375
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_02F:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $83AE			; 4C AE 83 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_030
; Address: $D98395
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_030:
	JSL $C9062D		  ; 22 2D 06 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $343A			; 8D 3A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $84D3			; 4C D3 84 | Jump to address
	JMP $84D2			; 4C D2 84 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_031
; Address: $D983B1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_031:
	JSL $CC85D0		  ; 22 D0 85 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $83FA			; 4C FA 83 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_032
; Address: $D983BE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_032:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $83F7			; 4C F7 83 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_033
; Address: $D983DE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_033:
	JSL $C9062D		  ; 22 2D 06 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $343A			; 8D 3A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $84D3			; 4C D3 84 | Jump to address
	JMP $84D2			; 4C D2 84 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_035
; Address: $D98400
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_035:
	JMP $8443			; 4C 43 84 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_036
; Address: $D98407
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_036:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8440			; 4C 40 84 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_037
; Address: $D98427
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_037:
	JSL $C9062D		  ; 22 2D 06 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $343A			; 8D 3A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $84D3			; 4C D3 84 | Jump to address
	JMP $84D2			; 4C D2 84 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_038
; Address: $D98443
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_038:
	JSL $CC86CC		  ; 22 CC 86 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $848C			; 4C 8C 84 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_039
; Address: $D98450
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_039:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8489			; 4C 89 84 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_03A
; Address: $D98470
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_03A:
	JSL $C9062D		  ; 22 2D 06 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $343A			; 8D 3A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $84D3			; 4C D3 84 | Jump to address
	JMP $84D2			; 4C D2 84 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_03B
; Address: $D9848C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_03B:
	JSL $CC874A		  ; 22 4A 87 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $84D2			; 4C D2 84 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_03D
; Address: $D98499
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_03D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $84D2			; 4C D2 84 | Jump to address
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_03E
; Address: $D984B9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_03E:
	JSL $C9062D		  ; 22 2D 06 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $343A			; 8D 3A 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $84D3			; 4C D3 84 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_03F
; Address: $D984D4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_03F:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $84F6			; 4C F6 84 | Jump to address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $84F3			; 4C F3 84 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8551			; 4C 51 85 | Jump to address
	JMP $8550			; 4C 50 85 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_040
; Address: $D984F6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_040:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8518			; 4C 18 85 | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BMI $09			  ; 30 09 | Branch if negative
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8515			; 4C 15 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8551			; 4C 51 85 | Jump to address
	JMP $8550			; 4C 50 85 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_041
; Address: $D98518
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_041:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $853A			; 4C 3A 85 | Jump to address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8537			; 4C 37 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8551			; 4C 51 85 | Jump to address
	JMP $8550			; 4C 50 85 | Jump to address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank32_DmaFunction_043
; Address: $D98543
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_043:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8550			; 4C 50 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8551			; 4C 51 85 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_044
; Address: $D98552
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_044:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8574			; 4C 74 85 | Jump to address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8571			; 4C 71 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $85CF			; 4C CF 85 | Jump to address
	JMP $85CE			; 4C CE 85 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_045
; Address: $D98574
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_045:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8596			; 4C 96 85 | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BMI $09			  ; 30 09 | Branch if negative
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_046
; Address: $D98587
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_046:
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8593			; 4C 93 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $85CF			; 4C CF 85 | Jump to address
	JMP $85CE			; 4C CE 85 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_047
; Address: $D98596
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_047:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85B8			; 4C B8 85 | Jump to address
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85B5			; 4C B5 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $85CF			; 4C CF 85 | Jump to address
	JMP $85CE			; 4C CE 85 | Jump to address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank32_DmaFunction_049
; Address: $D985C1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_049:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85CE			; 4C CE 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $85CF			; 4C CF 85 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_04A
; Address: $D985D0
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_04A:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85F2			; 4C F2 85 | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BCS $09			  ; B0 09 | Branch if carry set
	LDY #$28			 ; A0 28 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $85EF			; 4C EF 85 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $864D			; 4C 4D 86 | Jump to address
	JMP $864C			; 4C 4C 86 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_04B
; Address: $D985F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_04B:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8614			; 4C 14 86 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_04C
; Address: $D985FB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_04C:
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_04D
; Address: $D98602
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_04D:
	JSR $2209			; 20 09 22 | Jump to subroutine
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8611			; 4C 11 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $864D			; 4C 4D 86 | Jump to address
	JMP $864C			; 4C 4C 86 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_04E
; Address: $D98614
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_04E:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8636			; 4C 36 86 | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BCS $09			  ; B0 09 | Branch if carry set
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8633			; 4C 33 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $864D			; 4C 4D 86 | Jump to address
	JMP $864C			; 4C 4C 86 | Jump to address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLV				  ; B8 | Clear overflow flag
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_04F
; Address: $D9863D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_04F:
	JSR $2209			; 20 09 22 | Jump to subroutine
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $864C			; 4C 4C 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $864D			; 4C 4D 86 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_050
; Address: $D9864E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_050:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8670			; 4C 70 86 | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BCS $09			  ; B0 09 | Branch if carry set
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $866D			; 4C 6D 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $86CB			; 4C CB 86 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_052
; Address: $D98670
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_052:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8692			; 4C 92 86 | Jump to address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CPY #$09			 ; C0 09 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_053
; Address: $D98682
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_053:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $868F			; 4C 8F 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $86CB			; 4C CB 86 | Jump to address
	JMP $86CA			; 4C CA 86 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_054
; Address: $D98692
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_054:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86B4			; 4C B4 86 | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BCS $09			  ; B0 09 | Branch if carry set
	LDY #$A8			 ; A0 A8 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86B1			; 4C B1 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $86CB			; 4C CB 86 | Jump to address
	JMP $86CA			; 4C CA 86 | Jump to address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLV				  ; B8 | Clear overflow flag
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CPY #$09			 ; C0 09 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_055
; Address: $D986BD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_055:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86CA			; 4C CA 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $86CB			; 4C CB 86 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_056
; Address: $D986CC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_056:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86EE			; 4C EE 86 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_057
; Address: $D986DF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_057:
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $86EB			; 4C EB 86 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8749			; 4C 49 87 | Jump to address
	JMP $8748			; 4C 48 87 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_058
; Address: $D986EE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_058:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8710			; 4C 10 87 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $870D			; 4C 0D 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8749			; 4C 49 87 | Jump to address
	JMP $8748			; 4C 48 87 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_059
; Address: $D98710
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_059:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8732			; 4C 32 87 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $872F			; 4C 2F 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8749			; 4C 49 87 | Jump to address
	JMP $8748			; 4C 48 87 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8748			; 4C 48 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8749			; 4C 49 87 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_05B
; Address: $D98750
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_05B:
	JMP $876C			; 4C 6C 87 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8769			; 4C 69 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $87C7			; 4C C7 87 | Jump to address
	JMP $87C6			; 4C C6 87 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_05C
; Address: $D9876C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_05C:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $878E			; 4C 8E 87 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $878B			; 4C 8B 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $87C7			; 4C C7 87 | Jump to address
	JMP $87C6			; 4C C6 87 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_05D
; Address: $D9878E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_05D:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $87B0			; 4C B0 87 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $87AD			; 4C AD 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $87C7			; 4C C7 87 | Jump to address
	JMP $87C6			; 4C C6 87 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank32_DmaFunction_05E
; Address: $D987BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_05E:
	JMP $87C6			; 4C C6 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $87C7			; 4C C7 87 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_060
; Address: $D987CC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_060:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $87E7			; 4C E7 87 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8883			; 4C 83 88 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_061
; Address: $D987EB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_061:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8806			; 4C 06 88 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8883			; 4C 83 88 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_062
; Address: $D9880A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_062:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8825			; 4C 25 88 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8883			; 4C 83 88 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_063
; Address: $D98829
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_063:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8844			; 4C 44 88 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8883			; 4C 83 88 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_064
; Address: $D98848
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_064:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_065
; Address: $D9885A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_065:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8863			; 4C 63 88 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8883			; 4C 83 88 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_066
; Address: $D98867
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_066:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8882			; 4C 82 88 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8883			; 4C 83 88 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_068
; Address: $D98888
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_068:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $892A			; 4C 2A 89 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_069
; Address: $D988A3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_069:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $892A			; 4C 2A 89 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_06A
; Address: $D988BE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_06A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $892A			; 4C 2A 89 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_06B
; Address: $D988D9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_06B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $892A			; 4C 2A 89 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_06D
; Address: $D988FD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_06D:
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $892A			; 4C 2A 89 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_06E
; Address: $D9890F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_06E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $892A			; 4C 2A 89 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $892B			; 4C 2B 89 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_06F
; Address: $D9892C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_06F:
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $895E			; 4C 5E 89 | Jump to address
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $895E			; 4C 5E 89 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_070
; Address: $D98945
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_070:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $895E			; 4C 5E 89 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_071
; Address: $D98951
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_071:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $895E			; 4C 5E 89 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $895F			; 4C 5F 89 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_072
; Address: $D98960
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_072:
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $897A			; 4C 7A 89 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $897A			; 4C 7A 89 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $897B			; 4C 7B 89 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_075
; Address: $D98982
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_075:
	JSL $C78238		  ; 22 38 82 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $898F			; 4C 8F 89 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8990			; 4C 90 89 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_076
; Address: $D98991
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_076:
	LDA $3544			; AD 44 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $89A9			; 4C A9 89 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_077
; Address: $D9899C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_077:
	JSL $CC89AB		  ; 22 AB 89 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $89A9			; 4C A9 89 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $89AA			; 4C AA 89 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_078
; Address: $D989AB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_078:
	LDA $3544			; AD 44 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $89C9			; 4C C9 89 | Jump to address
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $89C9			; 4C C9 89 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $89CA			; 4C CA 89 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_079
; Address: $D989CB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_079:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A01			; 4C 01 8A | Jump to address
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A01			; 4C 01 8A | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank32_DmaFunction_07B
; Address: $D989F4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_07B:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A01			; 4C 01 8A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8A02			; 4C 02 8A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_07C
; Address: $D98A03
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_07C:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_07D
; Address: $D98A0C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_07D:
	JSL $C782F1		  ; 22 F1 82 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A1F			; 4C 1F 8A | Jump to address
	LDA $C18F			; AD 8F C1 | Load from absolute address into accumulator
	STA $362A			; 8D 2A 36 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $8A20			; 4C 20 8A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_07E
; Address: $D98A21
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_07E:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A4B			; 4C 4B 8A | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_07F
; Address: $D98A2C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_07F:
	JSL $CC803E		  ; 22 3E 80 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A4B			; 4C 4B 8A | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_080
; Address: $D98A35
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_080:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A4B			; 4C 4B 8A | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_081
; Address: $D98A3E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_081:
	JSL $CC8A03		  ; 22 03 8A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A4B			; 4C 4B 8A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8A4C			; 4C 4C 8A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_082
; Address: $D98A4D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_082:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A5C			; 4C 5C 8A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8A5D			; 4C 5D 8A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_083
; Address: $D98A5E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_083:
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8A79			; 4C 79 8A | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_084
; Address: $D98A6C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_084:
	JSL $C77E0C		  ; 22 0C 7E C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8A79			; 4C 79 8A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8A7A			; 4C 7A 8A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_085
; Address: $D98A7B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_085:
	LDA $350E			; AD 0E 35 | Load from absolute address into accumulator
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AAF			; 4C AF 8A | Jump to address
	LDA $350E			; AD 0E 35 | Load from absolute address into accumulator
	CMP #$3C			 ; C9 3C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8AAF			; 4C AF 8A | Jump to address
	LDA $351A			; AD 1A 35 | Load from absolute address into accumulator
	CMP #$C1			 ; C9 C1 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AAF			; 4C AF 8A | Jump to address
	LDA $351A			; AD 1A 35 | Load from absolute address into accumulator
	CMP #$CB			 ; C9 CB | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8AAF			; 4C AF 8A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8AB0			; 4C B0 8A | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_086
; Address: $D98AB1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_086:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8AF0			; 4C F0 8A | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($AD,X)		  ; C1 AD | Compare accumulator ((zero page,X))
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_087
; Address: $D98ACC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_087:
	JSL $C78B25		  ; 22 25 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AE8			; 4C E8 8A | Jump to address
	LDX #$05			 ; A2 05 | Load immediate value into X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_088
; Address: $D98ADB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_088:
	JSL $C78A23		  ; 22 23 8A C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8AE8			; 4C E8 8A | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8AF1			; 4C F1 8A | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_089
; Address: $D98AEF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_089:
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_08A
; Address: $D98AF3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_08A:
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8B29			; 4C 29 8B | Jump to address
	LDA #$D2			 ; A9 D2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_08B
; Address: $D98B01
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_08B:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B29			; 4C 29 8B | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BPL $09			  ; 10 09 | Branch if positive
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B29			; 4C 29 8B | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_08C
; Address: $D98B1C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_08C:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B29			; 4C 29 8B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8B2A			; 4C 2A 8B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_08D
; Address: $D98B2B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_08D:
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8B55			; 4C 55 8B | Jump to address
	LDA #$49			 ; A9 49 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_08E
; Address: $D98B39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_08E:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B55			; 4C 55 8B | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_08F
; Address: $D98B42
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_08F:
	JSL $C691A1		  ; 22 A1 91 C6 | Jump to subroutine long
	LDA $C135			; AD 35 C1 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8B55			; 4C 55 8B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8B56			; 4C 56 8B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_090
; Address: $D98B57
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_090:
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8B94			; 4C 94 8B | Jump to address
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_092
; Address: $D98B69
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_092:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B94			; 4C 94 8B | Jump to address
	LDA #$49			 ; A9 49 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_093
; Address: $D98B71
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_093:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8B90			; 4C 90 8B | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_094
; Address: $D98B7A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_094:
	JSL $C691A1		  ; 22 A1 91 C6 | Jump to subroutine long
	LDA $C135			; AD 35 C1 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8B8D			; 4C 8D 8B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8B95			; 4C 95 8B | Jump to address
	JMP $8B94			; 4C 94 8B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8B95			; 4C 95 8B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_096
; Address: $D98B9A
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_096:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8BA7			; 4C A7 8B | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $8BDC			; 4C DC 8B | Jump to address
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BDB			; 4C DB 8B | Jump to address
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CMP #$14			 ; C9 14 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8BDB			; 4C DB 8B | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$61			 ; C9 61 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8BDB			; 4C DB 8B | Jump to address
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CMP #$65			 ; C9 65 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8BDB			; 4C DB 8B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8BDC			; 4C DC 8B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_09A
; Address: $D98BEA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_09A:
	JMP $8BF7			; 4C F7 8B | Jump to address
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3404			; 8D 04 34 | Store accumulator to absolute address
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank32_DmaFunction_09C
; Address: $D98BFE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_09C:
	JSL $CC8B96		  ; 22 96 8B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C11			; 4C 11 8C | Jump to address
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3404			; 8D 04 34 | Store accumulator to absolute address
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_09E
; Address: $D98C18
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_09E:
	JSL $CC8B96		  ; 22 96 8B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C2B			; 4C 2B 8C | Jump to address
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3404			; 8D 04 34 | Store accumulator to absolute address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A0
; Address: $D98C32
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A0:
	JSL $CC8B96		  ; 22 96 8B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8C45			; 4C 45 8C | Jump to address
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3404			; 8D 04 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A1
; Address: $D98C45
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A1:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA $3404			; AD 04 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8C58			; 4C 58 8C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8C59			; 4C 59 8C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A2
; Address: $D98C5A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A2:
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8C74			; 4C 74 8C | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8C74			; 4C 74 8C | Jump to address
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A3
; Address: $D98C71
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A3:
	JMP $8C75			; 4C 75 8C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A4
; Address: $D98C76
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A4:
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8C8E			; 4C 8E 8C | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A5
; Address: $D98C81
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A5:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8C8E			; 4C 8E 8C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8C8F			; 4C 8F 8C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A6
; Address: $D98C90
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A6:
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8CAA			; 4C AA 8C | Jump to address
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8CAA			; 4C AA 8C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8CAB			; 4C AB 8C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A7
; Address: $D98CAC
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A7:
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CBF			; 4C BF 8C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8CE6			; 4C E6 8C | Jump to address
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CD2			; 4C D2 8C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8CE6			; 4C E6 8C | Jump to address
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8CE5			; 4C E5 8C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8CE6			; 4C E6 8C | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0A9
; Address: $D98CE7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0A9:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8D1D			; 4C 1D 8D | Jump to address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0AA
; Address: $D98CF5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0AA:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D1D			; 4C 1D 8D | Jump to address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	BPL $22			  ; 10 22 | Branch if positive
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D1D			; 4C 1D 8D | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0AB
; Address: $D98D10
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0AB:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D1D			; 4C 1D 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8D1E			; 4C 1E 8D | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0AC
; Address: $D98D1F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0AC:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8D55			; 4C 55 8D | Jump to address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0AD
; Address: $D98D2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0AD:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D55			; 4C 55 8D | Jump to address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	BPL $A2			  ; 10 A2 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0AF
; Address: $D98D3F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0AF:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D55			; 4C 55 8D | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B0
; Address: $D98D48
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B0:
	JSL $C7522F		  ; 22 2F 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D55			; 4C 55 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8D56			; 4C 56 8D | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B3
; Address: $D98D60
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B3:
	JMP $8D75			; 4C 75 8D | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8D72			; 4C 72 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E14			; 4C 14 8E | Jump to address
	JMP $8E13			; 4C 13 8E | Jump to address
	LDA #$47			 ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B4
; Address: $D98D78
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B4:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8D93			; 4C 93 8D | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8D90			; 4C 90 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E14			; 4C 14 8E | Jump to address
	JMP $8E13			; 4C 13 8E | Jump to address
	LDA #$1D			 ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B5
; Address: $D98D96
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B5:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8DB1			; 4C B1 8D | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8DAE			; 4C AE 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E14			; 4C 14 8E | Jump to address
	JMP $8E13			; 4C 13 8E | Jump to address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B6
; Address: $D98DB4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B6:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8DCF			; 4C CF 8D | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8DCC			; 4C CC 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E14			; 4C 14 8E | Jump to address
	JMP $8E13			; 4C 13 8E | Jump to address
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B7
; Address: $D98DD2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B7:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8DF8			; 4C F8 8D | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8DF5			; 4C F5 8D | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B8
; Address: $D98DE9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B8:
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8DF5			; 4C F5 8D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E14			; 4C 14 8E | Jump to address
	JMP $8E13			; 4C 13 8E | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0B9
; Address: $D98DFB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0B9:
	JSL $C73341		  ; 22 41 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8E13			; 4C 13 8E | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8E13			; 4C 13 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E14			; 4C 14 8E | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0BA
; Address: $D98E15
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0BA:
	LDA $DB05			; AD 05 DB | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8E24			; 4C 24 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E43			; 4C 43 8E | Jump to address
	LDA $DB05			; AD 05 DB | Load from absolute address into accumulator
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8E33			; 4C 33 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E43			; 4C 43 8E | Jump to address
	LDA $DB05			; AD 05 DB | Load from absolute address into accumulator
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8E42			; 4C 42 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8E43			; 4C 43 8E | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0BC
; Address: $D98E47
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0BC:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F44			; 4C 44 8F | Jump to address
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8F44			; 4C 44 8F | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	LDX #$30			 ; A2 30 | Load immediate value into X register
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0BF
; Address: $D98E6D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0BF:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8E7A			; 4C 7A 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8F44			; 4C 44 8F | Jump to address
	LDA #$98			 ; A9 98 | Load immediate value into accumulator
	LDX #$A8			 ; A2 A8 | Load immediate value into X register
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C0
; Address: $D98E86
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C0:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8E9F			; 4C 9F 8E | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C1
; Address: $D98E8F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C1:
	JSL $C7522F		  ; 22 2F 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8E9C			; 4C 9C 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8F44			; 4C 44 8F | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	LDX #$30			 ; A2 30 | Load immediate value into X register
	LDY #$88			 ; A0 88 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C2
; Address: $D98EA8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C2:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8ED1			; 4C D1 8E | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C3
; Address: $D98EB1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C3:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8EC1			; 4C C1 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8ECE			; 4C CE 8E | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C4
; Address: $D98EC1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C4:
	JSL $C7522F		  ; 22 2F 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8ECE			; 4C CE 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8F44			; 4C 44 8F | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDY #$78			 ; A0 78 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C5
; Address: $D98EDA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C5:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8EF3			; 4C F3 8E | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C6
; Address: $D98EE3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C6:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8EF0			; 4C F0 8E | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8F44			; 4C 44 8F | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C7
; Address: $D98EF3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C7:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	LDX #$10			 ; A2 10 | Load immediate value into X register
	LDY #$88			 ; A0 88 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C8
; Address: $D98EFC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C8:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F25			; 4C 25 8F | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0C9
; Address: $D98F05
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0C9:
	JSL $C75219		  ; 22 19 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F15			; 4C 15 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8F22			; 4C 22 8F | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0CA
; Address: $D98F15
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0CA:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F22			; 4C 22 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	JMP $8F44			; 4C 44 8F | Jump to address
	LDA #$98			 ; A9 98 | Load immediate value into accumulator
	LDX #$A8			 ; A2 A8 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0CB
; Address: $D98F2E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0CB:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F44			; 4C 44 8F | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0CC
; Address: $D98F37
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0CC:
	JSL $C75203		  ; 22 03 52 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F44			; 4C 44 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F45			; 4C 45 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0CD
; Address: $D98F46
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0CD:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8F5E			; 4C 5E 8F | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0CE
; Address: $D98F51
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0CE:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8F5E			; 4C 5E 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F5F			; 4C 5F 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0CF
; Address: $D98F60
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0CF:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8F85			; 4C 85 8F | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8F85			; 4C 85 8F | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D0
; Address: $D98F76
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D0:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8F85			; 4C 85 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8F86			; 4C 86 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D1
; Address: $D98F87
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D1:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8FA1			; 4C A1 8F | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $8FA1			; 4C A1 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8FA2			; 4C A2 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D3
; Address: $D98FA9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D3:
	JSL $C78238		  ; 22 38 82 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $8FB6			; 4C B6 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $8FB7			; 4C B7 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D4
; Address: $D98FB8
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D4:
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$4F			 ; C9 4F | Compare accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	JMP $8FC7			; 4C C7 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $8FE6			; 4C E6 8F | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$50			 ; C9 50 | Compare accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	JMP $8FD6			; 4C D6 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $8FE6			; 4C E6 8F | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$51			 ; C9 51 | Compare accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	JMP $8FE5			; 4C E5 8F | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $8FE6			; 4C E6 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D6
; Address: $D98FEA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D6:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8FF6			; 4C F6 8F | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9006			; 4C 06 90 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9005			; 4C 05 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9006			; 4C 06 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D7
; Address: $D99007
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D7:
	LDA #$D3			 ; A9 D3 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $901A			; 4C 1A 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $901B			; 4C 1B 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D8
; Address: $D9901C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D8:
	LDA #$E4			 ; A9 E4 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $902F			; 4C 2F 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9030			; 4C 30 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0D9
; Address: $D99031
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0D9:
	LDA #$72			 ; A9 72 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9044			; 4C 44 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9045			; 4C 45 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0DA
; Address: $D99046
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0DA:
	LDA $3542			; AD 42 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9060			; 4C 60 90 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0DB
; Address: $D99059
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0DB:
	JMP $9060			; 4C 60 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9061			; 4C 61 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0DC
; Address: $D99062
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0DC:
	JSL $CC9081		  ; 22 81 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9072			; 4C 72 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9080			; 4C 80 90 | Jump to address
	JMP $907F			; 4C 7F 90 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0DD
; Address: $D99072
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0DD:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $907F			; 4C 7F 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9080			; 4C 80 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0DE
; Address: $D99081
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0DE:
	LDA $353B			; AD 3B 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9090			; 4C 90 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $90A0			; 4C A0 90 | Jump to address
	LDA $353B			; AD 3B 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $909F			; 4C 9F 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $90A0			; 4C A0 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0DF
; Address: $D990A1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0DF:
	LDA $353B			; AD 3B 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $90B0			; 4C B0 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $90B1			; 4C B1 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E0
; Address: $D990B2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E0:
	JSL $CC90A1		  ; 22 A1 90 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $90CC			; 4C CC 90 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E2
; Address: $D990BF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E2:
	JSL $CDB4EE		  ; 22 EE B4 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $90CC			; 4C CC 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $90CD			; 4C CD 90 | Jump to address
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E4
; Address: $D990CE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E4:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $90E8			; 4C E8 90 | Jump to address
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $90E8			; 4C E8 90 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $90E9			; 4C E9 90 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E5
; Address: $D990EA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E5:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9104			; 4C 04 91 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9104			; 4C 04 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9105			; 4C 05 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E6
; Address: $D99106
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E6:
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9120			; 4C 20 91 | Jump to address
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9120			; 4C 20 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9121			; 4C 21 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E7
; Address: $D99122
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E7:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $913C			; 4C 3C 91 | Jump to address
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $913C			; 4C 3C 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $913D			; 4C 3D 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0E9
; Address: $D99141
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0E9:
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9158			; 4C 58 91 | Jump to address
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9158			; 4C 58 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9159			; 4C 59 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0EA
; Address: $D9915A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0EA:
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9174			; 4C 74 91 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9174			; 4C 74 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9175			; 4C 75 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0EB
; Address: $D99176
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0EB:
	JSL $CD0D0E		  ; 22 0E 0D CD | Jump to subroutine long
	LDA $362D			; AD 2D 36 | Load from absolute address into accumulator
	CMP $362B			; CD 2B 36 | Compare accumulator (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9189			; 4C 89 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $918A			; 4C 8A 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0ED
; Address: $D9918C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0ED:
	JSL $CD0D0E		  ; 22 0E 0D CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	AND $C336			; 2D 36 C3 | Logical AND with accumulator (absolute)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	JMP $91AB			; 4C AB 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $91AC			; 4C AC 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0EE
; Address: $D991AE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0EE:
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0EF
; Address: $D991B6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0EF:
	JMP $91C8			; 4C C8 91 | Jump to address
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $91C8			; 4C C8 91 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $91C9			; 4C C9 91 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F0
; Address: $D991CA
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F0:
	LDA $3569			; AD 69 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9210			; 4C 10 92 | Jump to address
	LDA $3569			; AD 69 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9210			; 4C 10 92 | Jump to address
	LDA $3569			; AD 69 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9210			; 4C 10 92 | Jump to address
	LDA $356A			; AD 6A 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9210			; 4C 10 92 | Jump to address
	LDA $356A			; AD 6A 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9210			; 4C 10 92 | Jump to address
	LDA $356A			; AD 6A 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9210			; 4C 10 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9211			; 4C 11 92 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F2
; Address: $D99215
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F2:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $923F			; 4C 3F 92 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9230			; 4C 30 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9240			; 4C 40 92 | Jump to address
	JMP $923F			; 4C 3F 92 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F3
; Address: $D99236
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F3:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $923F			; 4C 3F 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9240			; 4C 40 92 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F4
; Address: $D99241
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F4:
	LDA $DB05			; AD 05 DB | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $926D			; 4C 6D 92 | Jump to address
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $926D			; 4C 6D 92 | Jump to address
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	LDX #$78			 ; A2 78 | Load immediate value into X register
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	ORA $A222			; 0D 22 A2 | Logical OR with accumulator (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $926D			; 4C 6D 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $926E			; 4C 6E 92 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F5
; Address: $D9926F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F5:
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$27			 ; C9 27 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $927E			; 4C 7E 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92BB			; 4C BB 92 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $928D			; 4C 8D 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92BB			; 4C BB 92 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$29			 ; C9 29 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $929C			; 4C 9C 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92BB			; 4C BB 92 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$2A			 ; C9 2A | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $92AB			; 4C AB 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92BB			; 4C BB 92 | Jump to address
	LDA $9850			; AD 50 98 | Load from absolute address into accumulator
	CMP #$2B			 ; C9 2B | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F6
; Address: $D992B1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F6:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $92BA			; 4C BA 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92BB			; 4C BB 92 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F7
; Address: $D992BC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F7:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $92DF			; 4C DF 92 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $92DF			; 4C DF 92 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $92DF			; 4C DF 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92E0			; 4C E0 92 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F8
; Address: $D992E1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F8:
	JSL $CC92BC		  ; 22 BC 92 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $92EE			; 4C EE 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92FE			; 4C FE 92 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $92FD			; 4C FD 92 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $92FE			; 4C FE 92 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0F9
; Address: $D992FF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0F9:
	LDA $3546			; AD 46 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9319			; 4C 19 93 | Jump to address
	LDA $3542			; AD 42 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9319			; 4C 19 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $931A			; 4C 1A 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0FA
; Address: $D9931B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0FA:
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9335			; 4C 35 93 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0FB
; Address: $D99326
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0FB:
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9335			; 4C 35 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9336			; 4C 36 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0FC
; Address: $D99337
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0FC:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9364			; 4C 64 93 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9351			; 4C 51 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9361			; 4C 61 93 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9360			; 4C 60 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $9361			; 4C 61 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9365			; 4C 65 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_0FD
; Address: $D99366
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_0FD:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9393			; 4C 93 93 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9380			; 4C 80 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9390			; 4C 90 93 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $938F			; 4C 8F 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $9390			; 4C 90 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9394			; 4C 94 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_100
; Address: $D993A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_100:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $93AE			; 4C AE 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $93AF			; 4C AF 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_102
; Address: $D993B6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_102:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $93C3			; 4C C3 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $93C4			; 4C C4 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_103
; Address: $D993C5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_103:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_104
; Address: $D993D1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_104:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $93DE			; 4C DE 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $93DF			; 4C DF 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_106
; Address: $D993E6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_106:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $93F3			; 4C F3 93 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $93F4			; 4C F4 93 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_107
; Address: $D993F5
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_107:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $941A			; 4C 1A 94 | Jump to address
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $941A			; 4C 1A 94 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $941A			; 4C 1A 94 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_108
; Address: $D99416
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_108:
	SEC				  ; 38 | Set carry flag
	JMP $941B			; 4C 1B 94 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_109
; Address: $D9941C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_109:
	LDA #$CB			 ; A9 CB | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $942F			; 4C 2F 94 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9430			; 4C 30 94 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_10A
; Address: $D99431
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_10A:
	JSL $CC7A7F		  ; 22 7F 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $945D			; 4C 5D 94 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_10B
; Address: $D9943A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_10B:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $945D			; 4C 5D 94 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $945D			; 4C 5D 94 | Jump to address
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $945D			; 4C 5D 94 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $945E			; 4C 5E 94 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_10C
; Address: $D9945F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_10C:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $946E			; 4C 6E 94 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $947E			; 4C 7E 94 | Jump to address
	LDA $3619			; AD 19 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $947D			; 4C 7D 94 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $947E			; 4C 7E 94 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_10D
; Address: $D9947F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_10D:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_10E
; Address: $D9948A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_10E:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $94B4			; 4C B4 94 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($A9,X)		  ; C1 A9 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_10F
; Address: $D9949A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_10F:
	JSL $C78BB9		  ; 22 B9 8B C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $94AC			; 4C AC 94 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ROL $3834,X		  ; 3E 34 38 | Rotate left (absolute,X)
	JMP $94B5			; 4C B5 94 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STA $94			  ; 85 94 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_110
; Address: $D994B7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_110:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $C109			; 8D 09 C1 | Store accumulator to absolute address
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_111
; Address: $D994C6
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_111:
	JSL $C78C3A		  ; 22 3A 8C C7 | Jump to subroutine long
	LDA $C161			; AD 61 C1 | Load from absolute address into accumulator
	STA $BE77			; 8D 77 BE | Store accumulator to absolute address
	JMP $9536			; 4C 36 95 | Jump to address
	JMP $95C0			; 4C C0 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95C0			; 4C C0 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95C0			; 4C C0 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95CA			; 4C CA 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95CA			; 4C CA 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95CA			; 4C CA 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95CA			; 4C CA 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95CA			; 4C CA 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_112
; Address: $D99518
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_112:
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95D4			; 4C D4 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	JMP $95BC			; 4C BC 95 | Jump to address
	LDA $C195			; AD 95 C1 | Load from absolute address into accumulator
	CMP #$14			 ; C9 14 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94D3			; 4C D3 94 | Jump to address
	CMP #$22			 ; C9 22 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94D9			; 4C D9 94 | Jump to address
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94DF			; 4C DF 94 | Jump to address
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94E5			; 4C E5 94 | Jump to address
	CMP #$21			 ; C9 21 | PPU graphics register access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94EB			; 4C EB 94 | Jump to address
	CMP #$0C			 ; C9 0C | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94F1			; 4C F1 94 | Jump to address
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94F7			; 4C F7 94 | Jump to address
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $94FD			; 4C FD 94 | Jump to address
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9503			; 4C 03 95 | Jump to address
	CMP #$25			 ; C9 25 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9509			; 4C 09 95 | Jump to address
	CMP #$1A			 ; C9 1A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $950F			; 4C 0F 95 | Jump to address
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9515			; 4C 15 95 | Jump to address
	CMP #$2A			 ; C9 2A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $951B			; 4C 1B 95 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_113
; Address: $D995A1
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_113:
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9521			; 4C 21 95 | Jump to address
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9527			; 4C 27 95 | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $952D			; 4C 2D 95 | Jump to address
	JMP $9533			; 4C 33 95 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $95DE			; 4C DE 95 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $95DE			; 4C DE 95 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $95DE			; 4C DE 95 | Jump to address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $95DE			; 4C DE 95 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_114
; Address: $D995DF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_114:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $C109			; 8D 09 C1 | Store accumulator to absolute address
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_115
; Address: $D995EE
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_115:
	JSL $C78C3A		  ; 22 3A 8C C7 | Jump to subroutine long
	LDA $C161			; AD 61 C1 | Load from absolute address into accumulator
	STA $BE77			; 8D 77 BE | Store accumulator to absolute address
	JMP $9679			; 4C 79 96 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_116
; Address: $D9962B
; Size: 134 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_116:
	JMP $9728			; 4C 28 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9732			; 4C 32 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9732			; 4C 32 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9732			; 4C 32 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $973C			; 4C 3C 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $973C			; 4C 3C 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $973C			; 4C 3C 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $973C			; 4C 3C 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $973C			; 4C 3C 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9746			; 4C 46 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9746			; 4C 46 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9750			; 4C 50 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	JMP $9750			; 4C 50 97 | Jump to address
	JMP $9724			; 4C 24 97 | Jump to address
	LDA $C195			; AD 95 C1 | Load from absolute address into accumulator
	CMP #$1E			 ; C9 1E | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $95FB			; 4C FB 95 | Jump to address
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9601			; 4C 01 96 | Jump to address
	CMP #$1B			 ; C9 1B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9607			; 4C 07 96 | Jump to address
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $960D			; 4C 0D 96 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9613			; 4C 13 96 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9619			; 4C 19 96 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $961F			; 4C 1F 96 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_117
; Address: $D996B9
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_117:
	JMP $9625			; 4C 25 96 | Jump to address
	CMP #$29			 ; C9 29 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $962B			; 4C 2B 96 | Jump to address
	CMP #$24			 ; C9 24 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9631			; 4C 31 96 | Jump to address
	CMP #$2D			 ; C9 2D | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9637			; 4C 37 96 | Jump to address
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $963D			; 4C 3D 96 | Jump to address
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9643			; 4C 43 96 | Jump to address
	CMP #$16			 ; C9 16 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9649			; 4C 49 96 | Jump to address
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $964F			; 4C 4F 96 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9655			; 4C 55 96 | Jump to address
	CMP #$23			 ; C9 23 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $965B			; 4C 5B 96 | Jump to address
	CMP #$2B			 ; C9 2B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9661			; 4C 61 96 | Jump to address
	CMP #$27			 ; C9 27 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9667			; 4C 67 96 | Jump to address
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $966D			; 4C 6D 96 | Jump to address
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9673			; 4C 73 96 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $975A			; 4C 5A 97 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $975A			; 4C 5A 97 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $975A			; 4C 5A 97 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_118
; Address: $D9973C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_118:
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $975A			; 4C 5A 97 | Jump to address
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $975A			; 4C 5A 97 | Jump to address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $975A			; 4C 5A 97 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_119
; Address: $D9975B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_119:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9798			; 4C 98 97 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_11A
; Address: $D99776
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_11A:
	JSL $C78A23		  ; 22 23 8A C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9790			; 4C 90 97 | Jump to address
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_11B
; Address: $D99782
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_11B:
	JSL $C788DF		  ; 22 DF 88 C7 | Jump to subroutine long
	LDA $C161			; AD 61 C1 | Load from absolute address into accumulator
	STA $BE77			; 8D 77 BE | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	JMP $9799			; 4C 99 97 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ADC ($97,X)		  ; 61 97 | Add with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_11C
; Address: $D9979B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_11C:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $97CB			; 4C CB 97 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_11E
; Address: $D997BC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_11E:
	JMP $97C3			; 4C C3 97 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $97CC			; 4C CC 97 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDA ($97,X)		  ; A1 97 | Load from (zero page,X) into accumulator
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_11F
; Address: $D997CE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_11F:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	LDA $3604			; AD 04 36 | Load from absolute address into accumulator
	STA $C10D			; 8D 0D C1 | Store accumulator to absolute address
	LDX #$07			 ; A2 07 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_120
; Address: $D997DD
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_120:
	JSL $C78C3A		  ; 22 3A 8C C7 | Jump to subroutine long
	LDA $C161			; AD 61 C1 | Load from absolute address into accumulator
	STA $BE77			; 8D 77 BE | Store accumulator to absolute address
	JMP $9853			; 4C 53 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98EA			; 4C EA 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_121
; Address: $D9984A
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_121:
	JMP $98F3			; 4C F3 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	JMP $98E1			; 4C E1 98 | Jump to address
	LDA $C195			; AD 95 C1 | Load from absolute address into accumulator
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $97EA			; 4C EA 97 | Jump to address
	CMP #$1B			 ; C9 1B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $97F0			; 4C F0 97 | Jump to address
	CMP #$1C			 ; C9 1C | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $97F6			; 4C F6 97 | Jump to address
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $97FC			; 4C FC 97 | Jump to address
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9802			; 4C 02 98 | Jump to address
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9808			; 4C 08 98 | Jump to address
	CMP #$22			 ; C9 22 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $980E			; 4C 0E 98 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9814			; 4C 14 98 | Jump to address
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $981A			; 4C 1A 98 | Jump to address
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9820			; 4C 20 98 | Jump to address
	CMP #$2B			 ; C9 2B | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9826			; 4C 26 98 | Jump to address
	CMP #$21			 ; C9 21 | PPU graphics register access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $982C			; 4C 2C 98 | Jump to address
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9832			; 4C 32 98 | Jump to address
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9838			; 4C 38 98 | Jump to address
	CMP #$0C			 ; C9 0C | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $983E			; 4C 3E 98 | Jump to address
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_122
; Address: $D998D1
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_122:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9844			; 4C 44 98 | Jump to address
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $984A			; 4C 4A 98 | Jump to address
	JMP $9850			; 4C 50 98 | Jump to address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	JMP $98FC			; 4C FC 98 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	JMP $98FC			; 4C FC 98 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	JMP $98FC			; 4C FC 98 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_123
; Address: $D998FD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_123:
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9910			; 4C 10 99 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9911			; 4C 11 99 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_124
; Address: $D99912
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_124:
	LDA $353C			; AD 3C 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9921			; 4C 21 99 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9931			; 4C 31 99 | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9930			; 4C 30 99 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9931			; 4C 31 99 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_125
; Address: $D99932
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_125:
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9945			; 4C 45 99 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $9946			; 4C 46 99 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_127
; Address: $D9994A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_127:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9962			; 4C 62 99 | Jump to address
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9962			; 4C 62 99 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $9963			; 4C 63 99 | Jump to address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_12A
; Address: $D9996F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_12A:
	JSL $C77808		  ; 22 08 78 C7 | Jump to subroutine long
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_12C
; Address: $D99981
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_12C:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $998E			; 4C 8E 99 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_12F
; Address: $D99990
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_12F:
	JSL $C77791		  ; 22 91 77 C7 | Jump to subroutine long
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_13D
; Address: $D999D1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_13D:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $99E4			; 4C E4 99 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_13E
; Address: $D999DD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_13E:
	JSL $C778C1		  ; 22 C1 78 C7 | Jump to subroutine long
	JMP $99EB			; 4C EB 99 | Jump to address
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_140
; Address: $D999EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_140:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $99FF			; 4C FF 99 | Jump to address
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_141
; Address: $D999F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_141:
	JSL $C778C1		  ; 22 C1 78 C7 | Jump to subroutine long
	JMP $9A06			; 4C 06 9A | Jump to address
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_149
; Address: $D99A1F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_149:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9A32			; 4C 32 9A | Jump to address
	LDA #$11			 ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_14A
; Address: $D99A2B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_14A:
	JSL $C778C1		  ; 22 C1 78 C7 | Jump to subroutine long
	JMP $9A39			; 4C 39 9A | Jump to address
	LDA #$12			 ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_162
; Address: $D99A92
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_162:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	AND $6B35,X		  ; 3D 35 6B | Logical AND with accumulator (absolute,X)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND $6B35,X		  ; 3D 35 6B | Logical AND with accumulator (absolute,X)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_163
; Address: $D99AA7
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_163:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_164
; Address: $D99AAE
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_164:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_165
; Address: $D99AB5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_165:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_166
; Address: $D99ABC
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_166:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_167
; Address: $D99AC3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_167:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_168
; Address: $D99ACA
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_168:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_169
; Address: $D99AD1
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_169:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_16C
; Address: $D99ADF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_16C:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_16D
; Address: $D99AE6
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_16D:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_16E
; Address: $D99AED
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_16E:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_16F
; Address: $D99AF4
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_16F:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_170
; Address: $D99AFB
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_170:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_171
; Address: $D99B02
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_171:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_172
; Address: $D99B09
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_172:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_173
; Address: $D99B10
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_173:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_174
; Address: $D99B17
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_174:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_175
; Address: $D99B1E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_175:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_176
; Address: $D99B25
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_176:
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_177
; Address: $D99B2C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_177:
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_178
; Address: $D99B33
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_178:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_179
; Address: $D99B3A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_179:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_17A
; Address: $D99B41
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_17A:
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_17B
; Address: $D99B48
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_17B:
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_17C
; Address: $D99B4F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_17C:
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_17D
; Address: $D99B56
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_17D:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $3610			; 8D 10 36 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_17F
; Address: $D99B60
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_17F:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9B7A			; 4C 7A 9B | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9B7A			; 4C 7A 9B | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_180
; Address: $D99B7B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_180:
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BA2			; 4C A2 9B | Jump to address
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BA2			; 4C A2 9B | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BA2			; 4C A2 9B | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_181
; Address: $D99BA3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_181:
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BBF			; 4C BF 9B | Jump to address
	LDA $3552			; AD 52 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BBF			; 4C BF 9B | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_182
; Address: $D99BC0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_182:
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BF1			; 4C F1 9B | Jump to address
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9BF1			; 4C F1 9B | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_183
; Address: $D99BD6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_183:
	JSL $CC827E		  ; 22 7E 82 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9BF1			; 4C F1 9B | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_184
; Address: $D99BF2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_184:
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C0E			; 4C 0E 9C | Jump to address
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C0E			; 4C 0E 9C | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_185
; Address: $D99C0F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_185:
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C20			; 4C 20 9C | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_186
; Address: $D99C21
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_186:
	LDA $3543			; AD 43 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9C40			; 4C 40 9C | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C40			; 4C 40 9C | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $9C46			; 4C 46 9C | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_187
; Address: $D99C47
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_187:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9C6F			; 4C 6F 9C | Jump to address
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9C6F			; 4C 6F 9C | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_189
; Address: $D99C63
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_189:
	JMP $9C6F			; 4C 6F 9C | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear
	JMP $9C75			; 4C 75 9C | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_18A
; Address: $D99C76
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_18A:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9C8E			; 4C 8E 9C | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_18B
; Address: $D99C7F
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_18B:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9C8E			; 4C 8E 9C | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $6B35,X		  ; 3D 35 6B | Logical AND with accumulator (absolute,X)
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9CC1			; 4C C1 9C | Jump to address
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9CC1			; 4C C1 9C | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9CC1			; 4C C1 9C | Jump to address
	LDA $353D			; AD 3D 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9CC1			; 4C C1 9C | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_18C
; Address: $D99CC2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_18C:
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $9CDC			; 4C DC 9C | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_18D
; Address: $D99CCD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_18D:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $9CDC			; 4C DC 9C | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	JMP $6B35			; 4C 35 6B | Jump to address
	LDA #$D1			 ; A9 D1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_194
; Address: $D99CF8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_194:
	BRA $AA			  ; 80 AA | Branch always
	CMP $6D22			; CD 22 6D | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP #$A6			 ; C9 A6 | Compare accumulator (immediate)
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INC $CA			  ; E6 CA | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_19A
; Address: $D99D24
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_19A:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	TAX				  ; AA | Transfer accumulator to X register
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $CDE3,X		  ; 3E E3 CD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_19B
; Address: $D99D32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_19B:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	LSR $CAE6,X		  ; 5E E6 CA | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_19F
; Address: $D99D48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_19F:
	JSL $C774E4		  ; 22 E4 74 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA $CC99,Y		  ; 99 99 CC | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1A0
; Address: $D99D53
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1A0:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	JMP $CDE3			; 4C E3 CD | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1A1
; Address: $D99D61
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1A1:
	JSL $C77889		  ; 22 89 78 C7 | Jump to subroutine long
	EOR $CAE6			; 4D E6 CA | Exclusive OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1A9
; Address: $D99D8A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1A9:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	REP #$AB			 ; C2 AB | Reset processor status bits
	CMP $7B22			; CD 22 7B | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1AA
; Address: $D99D93
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1AA:
	SEI				  ; 78 | Set interrupt disable flag
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CMP $8922			; CD 22 89 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $74			  ; E4 74 | Compare X register (zero page)
	CPY $026B			; CC 6B 02 | Compare Y register (absolute)
	JMP $9DE3			; 4C E3 9D | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1AC
; Address: $D99DA8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1AC:
	JSL $CDC592		  ; 22 92 C5 CD | Jump to subroutine long
	JMP $9E2E			; 4C 2E 9E | Jump to address
	JMP $9E2E			; 4C 2E 9E | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B3
; Address: $D99DDC
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B3:
	JSL $CDC5F3		  ; 22 F3 C5 CD | Jump to subroutine long
	JMP $9E2E			; 4C 2E 9E | Jump to address
	LDA $3610			; AD 10 36 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DA4			; 4C A4 9D | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DAF			; 4C AF 9D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DB2			; 4C B2 9D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DB9			; 4C B9 9D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DC0			; 4C C0 9D | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DC7			; 4C C7 9D | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DCE			; 4C CE 9D | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DD5			; 4C D5 9D | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B4
; Address: $D99E26
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B4:
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9DDC			; 4C DC 9D | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B5
; Address: $D99E2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B5:
	JSL $CC9B1E		  ; 22 1E 9B CC | Jump to subroutine long
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B6
; Address: $D99E39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B6:
	LDA #$AA			 ; A9 AA | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B7
; Address: $D99E44
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B7:
	LDA #$72			 ; A9 72 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B8
; Address: $D99E4F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B8:
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1B9
; Address: $D99E5A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1B9:
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1BA
; Address: $D99E65
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1BA:
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1BB
; Address: $D99E70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1BB:
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1BC
; Address: $D99E7B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1BC:
	LDA #$A7			 ; A9 A7 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1BD
; Address: $D99E86
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1BD:
	LDA #$BE			 ; A9 BE | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1BE
; Address: $D99E91
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1BE:
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C0
; Address: $D99E9C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C0:
	LDA #$CF			 ; A9 CF | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C1
; Address: $D99EA7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C1:
	LDA #$CE			 ; A9 CE | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C2
; Address: $D99EB2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C2:
	LDA #$CB			 ; A9 CB | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C3
; Address: $D99EBD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C3:
	LDA #$CD			 ; A9 CD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C4
; Address: $D99EC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C4:
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C5
; Address: $D99ED3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C5:
	LDA #$CA			 ; A9 CA | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C6
; Address: $D99EDE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C6:
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C7
; Address: $D99EE9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C7:
	LDA #$C8			 ; A9 C8 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C8
; Address: $D99EF4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C8:
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1C9
; Address: $D99EFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1C9:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1CA
; Address: $D99F08
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1CA:
	STA $C119			; 8D 19 C1 | Store accumulator to absolute address
	LDA $C119			; AD 19 C1 | Load from absolute address into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1CC
; Address: $D99F16
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1CC:
	LDA #$C9			 ; A9 C9 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1CD
; Address: $D99F21
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1CD:
	LDA #$E4			 ; A9 E4 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1CF
; Address: $D99F32
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1CF:
	JSL $C78CF3		  ; 22 F3 8C C7 | Jump to subroutine long
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D0
; Address: $D99F5F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D0:
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D1
; Address: $D99F70
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D1:
	LDA #$AA			 ; A9 AA | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D3
; Address: $D99F84
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D3:
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D4
; Address: $D99F92
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D4:
	LDA #$72			 ; A9 72 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D5
; Address: $D99FA3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D5:
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D6
; Address: $D99FB4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D6:
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D7
; Address: $D99FC5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D7:
	LDA #$87			 ; A9 87 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D8
; Address: $D99FD6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D8:
	LDA #$85			 ; A9 85 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	BVC $35			  ; 50 35 | Branch if overflow clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1D9
; Address: $D99FE7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1D9:
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1DB
; Address: $D99FFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1DB:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1DC
; Address: $D9A009
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1DC:
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1DD
; Address: $D9A01A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1DD:
	LDA #$A2			 ; A9 A2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	LDA #$76			 ; A9 76 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1DE
; Address: $D9A03C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1DE:
	LDA #$A4			 ; A9 A4 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1DF
; Address: $D9A04D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1DF:
	LDA #$A7			 ; A9 A7 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E0
; Address: $D9A05E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E0:
	LDA #$C1			 ; A9 C1 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E1
; Address: $D9A06F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E1:
	LDA #$BE			 ; A9 BE | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E2
; Address: $D9A079
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E2:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E3
; Address: $D9A080
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E3:
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E4
; Address: $D9A091
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E4:
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	WDM #$35			 ; 42 35 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E5
; Address: $D9A0A2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E5:
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E6
; Address: $D9A0B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E6:
	LDA #$CF			 ; A9 CF | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E7
; Address: $D9A0C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E7:
	LDA #$CE			 ; A9 CE | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E8
; Address: $D9A0D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E8:
	LDA #$CB			 ; A9 CB | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1E9
; Address: $D9A0E6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1E9:
	LDA #$CD			 ; A9 CD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1EA
; Address: $D9A0F7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1EA:
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1EB
; Address: $D9A0FE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1EB:
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1EC
; Address: $D9A10E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1EC:
	LDA #$CA			 ; A9 CA | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1ED
; Address: $D9A11F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1ED:
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1EE
; Address: $D9A130
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1EE:
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1EF
; Address: $D9A13B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1EF:
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F0
; Address: $D9A14C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F0:
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F1
; Address: $D9A15D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F1:
	LDA #$84			 ; A9 84 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F2
; Address: $D9A16E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F2:
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F3
; Address: $D9A17F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F3:
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F5
; Address: $D9A190
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F5:
	LDA #$D2			 ; A9 D2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F6
; Address: $D9A1A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F6:
	LDA #$C8			 ; A9 C8 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F7
; Address: $D9A1B2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F7:
	LDA #$C3			 ; A9 C3 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F8
; Address: $D9A1C3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F8:
	LDA #$11			 ; A9 11 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1F9
; Address: $D9A1D4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1F9:
	LDA #$C9			 ; A9 C9 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1FA
; Address: $D9A1E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1FA:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1FC
; Address: $D9A1F6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1FC:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1FD
; Address: $D9A207
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1FD:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1FE
; Address: $D9A212
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1FE:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_1FF
; Address: $D9A218
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_1FF:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	STA $C119			; 8D 19 C1 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C10B			; 8D 0B C1 | Store accumulator to absolute address
	LDA $C119			; AD 19 C1 | Load from absolute address into accumulator
	LDX #$05			 ; A2 05 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_200
; Address: $D9A22F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_200:
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_201
; Address: $D9A240
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_201:
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CMP $81			  ; C5 81 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_203
; Address: $D9A251
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_203:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPY $226B			; CC 6B 22 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($BA,X)		  ; C1 BA | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_204
; Address: $D9A262
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_204:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LSR $2200			; 4E 00 22 | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPY $226B			; CC 6B 22 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($BA,X)		  ; C1 BA | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_207
; Address: $D9A27E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_207:
	JSL $CC8AF3		  ; 22 F3 8A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A293			; 4C 93 A2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_209
; Address: $D9A28B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_209:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A29E			; 4C 9E A2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_20B
; Address: $D9A299
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_20B:
	JSL $CCD3F8		  ; 22 F8 D3 CC | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_20C
; Address: $D9A29F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_20C:
	JSL $CC8B2B		  ; 22 2B 8B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A2B4			; 4C B4 A2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_20E
; Address: $D9A2AC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_20E:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A2D6			; 4C D6 A2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_20F
; Address: $D9A2B4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_20F:
	JSL $CC8B57		  ; 22 57 8B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A2CB			; 4C CB A2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_210
; Address: $D9A2BD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_210:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F822			; 0D 22 F8 | Logical OR with accumulator (absolute)
	CPY $4C38			; CC 38 4C | Compare Y register (absolute)
	LDX #$22			 ; A2 22 | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($79,X)		  ; C1 79 | Compare accumulator ((zero page,X))
	ORA $F822			; 0D 22 F8 | Logical OR with accumulator (absolute)
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_211
; Address: $D9A2DD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_211:
	JSL $CC8313		  ; 22 13 83 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A2F8			; 4C F8 A2 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_213
; Address: $D9A2F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_213:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A303			; 4C 03 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_214
; Address: $D9A2F8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_214:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROR $220D,X		  ; 7E 0D 22 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_215
; Address: $D9A30A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_215:
	JSL $CC8313		  ; 22 13 83 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A325			; 4C 25 A3 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_217
; Address: $D9A31D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_217:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A330			; 4C 30 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_218
; Address: $D9A325
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_218:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROR $220D,X		  ; 7E 0D 22 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_219
; Address: $D9A32E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_219:
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_21A
; Address: $D9A337
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_21A:
	JSL $CC8313		  ; 22 13 83 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A352			; 4C 52 A3 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_21C
; Address: $D9A34A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_21C:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A35D			; 4C 5D A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_21D
; Address: $D9A352
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_21D:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROR $220D,X		  ; 7E 0D 22 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_21E
; Address: $D9A364
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_21E:
	JSL $CC8313		  ; 22 13 83 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A37F			; 4C 7F A3 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_220
; Address: $D9A377
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_220:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A38A			; 4C 8A A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_221
; Address: $D9A37F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_221:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROR $220D,X		  ; 7E 0D 22 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_222
; Address: $D9A391
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_222:
	JSL $CC8313		  ; 22 13 83 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A3AC			; 4C AC A3 | Jump to address
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_224
; Address: $D9A3A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_224:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A3B7			; 4C B7 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_225
; Address: $D9A3AC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_225:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROR $220D,X		  ; 7E 0D 22 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_227
; Address: $D9A3C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_227:
	JMP $A3D9			; 4C D9 A3 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_229
; Address: $D9A3D1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_229:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A3E4			; 4C E4 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_22A
; Address: $D9A3D9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_22A:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROR $220D,X		  ; 7E 0D 22 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_22B
; Address: $D9A3E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_22B:
	JSL $CC89CB		  ; 22 CB 89 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A3F6			; 4C F6 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_22C
; Address: $D9A3EE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_22C:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A413			; 4C 13 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_22D
; Address: $D9A3F6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_22D:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $3B22			; 0D 22 3B | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $EE22			; CD 22 EE | Compare accumulator (absolute)
	LDY #$CD			 ; A0 CD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_230
; Address: $D9A40E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_230:
	JSL $CCD3F8		  ; 22 F8 D3 CC | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_231
; Address: $D9A414
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_231:
	JSL $CC8E15		  ; 22 15 8E CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A44A			; 4C 4A A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_232
; Address: $D9A41D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_232:
	JSL $CC8E44		  ; 22 44 8E CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A430			; 4C 30 A4 | Jump to address
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	JMP $A447			; 4C 47 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_233
; Address: $D9A430
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_233:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($50,X)		  ; C1 50 | Compare accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($50,X)		  ; C1 50 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_234
; Address: $D9A442
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_234:
	JSL $CCD3F8		  ; 22 F8 D3 CC | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	JMP $A455			; 4C 55 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_238
; Address: $D9A456
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_238:
	JSL $CC8D1F		  ; 22 1F 8D CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A469			; 4C 69 A4 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	JMP $A474			; 4C 74 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_239
; Address: $D9A469
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_239:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ADC $220D,X		  ; 7D 0D 22 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $6B38			; CC 38 6B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_23A
; Address: $D9A475
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_23A:
	JSL $CC9212		  ; 22 12 92 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A488			; 4C 88 A4 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	JMP $A499			; 4C 99 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_23B
; Address: $D9A488
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_23B:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($50,X)		  ; C1 50 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_23C
; Address: $D9A494
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_23C:
	JSL $CCD3F8		  ; 22 F8 D3 CC | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_23D
; Address: $D9A49A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_23D:
	JSL $CC8CE7		  ; 22 E7 8C CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A4AD			; 4C AD A4 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	JMP $A4B2			; 4C B2 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_23E
; Address: $D9A4AD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_23E:
	JSL $CCA24B		  ; 22 4B A2 CC | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_240
; Address: $D9A4B5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_240:
	JSL $CCA587		  ; 22 87 A5 CC | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_241
; Address: $D9A4BB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_241:
	JSL $CC7DE3		  ; 22 E3 7D CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A4C8			; 4C C8 A4 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A506			; 4C 06 A5 | Jump to address
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_242
; Address: $D9A4CF
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_242:
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A4DB			; 4C DB A4 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A506			; 4C 06 A5 | Jump to address
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A4EE			; 4C EE A4 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A506			; 4C 06 A5 | Jump to address
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A501			; 4C 01 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A506			; 4C 06 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_243
; Address: $D9A501
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_243:
	JSL $CCA587		  ; 22 87 A5 CC | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_244
; Address: $D9A507
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_244:
	JSL $CC7DE3		  ; 22 E3 7D CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A514			; 4C 14 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A53F			; 4C 3F A5 | Jump to address
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A527			; 4C 27 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A53F			; 4C 3F A5 | Jump to address
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A53A			; 4C 3A A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A53F			; 4C 3F A5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_245
; Address: $D9A53A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_245:
	JSL $CCA587		  ; 22 87 A5 CC | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_247
; Address: $D9A546
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_247:
	JMP $A54D			; 4C 4D A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A565			; 4C 65 A5 | Jump to address
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A560			; 4C 60 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A565			; 4C 65 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_248
; Address: $D9A560
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_248:
	JSL $CCA587		  ; 22 87 A5 CC | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_249
; Address: $D9A566
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_249:
	LDA $3553			; AD 53 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A579			; 4C 79 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_24A
; Address: $D9A571
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_24A:
	JSL $CCA587		  ; 22 87 A5 CC | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $A57A			; 4C 7A A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_24C
; Address: $D9A581
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_24C:
	JSL $CCA587		  ; 22 87 A5 CC | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_24D
; Address: $D9A587
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_24D:
	JSL $CC8CAC		  ; 22 AC 8C CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $A59D			; 4C 9D A5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_250
; Address: $D9A59D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_250:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	STA $2200,Y		  ; 99 00 22 | Store accumulator to absolute,Y
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_251
; Address: $D9A5A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_251:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	LDY $18CD			; AC CD 18 | Load from absolute address into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_252
; Address: $D9A5B4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_252:
	LDA $C11B			; AD 1B C1 | Load from absolute address into accumulator
	CMP #$AD			 ; C9 AD | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A5C3			; 4C C3 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A5E2			; 4C E2 A5 | Jump to address
	LDA $C11B			; AD 1B C1 | Load from absolute address into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_253
; Address: $D9A5CB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_253:
	JMP $A5D2			; 4C D2 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A5E2			; 4C E2 A5 | Jump to address
	LDA $C11B			; AD 1B C1 | Load from absolute address into accumulator
	CMP #$AB			 ; C9 AB | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A5E1			; 4C E1 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A5E2			; 4C E2 A5 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_254
; Address: $D9A5E3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_254:
	LDA $C11B			; AD 1B C1 | Load from absolute address into accumulator
	CMP #$AD			 ; C9 AD | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A5F2			; 4C F2 A5 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A602			; 4C 02 A6 | Jump to address
	LDA $C11B			; AD 1B C1 | Load from absolute address into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A601			; 4C 01 A6 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A602			; 4C 02 A6 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_255
; Address: $D9A603
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_255:
	LDA $C11B			; AD 1B C1 | Load from absolute address into accumulator
	CMP #$AD			 ; C9 AD | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $A612			; 4C 12 A6 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $A613			; 4C 13 A6 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_257
; Address: $D9A616
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_257:
	LDA $3553			; AD 53 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $A625			; 4C 25 A6 | Jump to address
	CLC				  ; 18 | Clear carry flag
	JMP $A626			; 4C 26 A6 | Jump to address
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_258
; Address: $D9A627
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_258:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_259
; Address: $D9A62F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_259:
	LDA #$7C			 ; A9 7C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C76D			; 2E 6D C7 | Rotate left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_25A
; Address: $D9A637
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_25A:
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C76D			; 2E 6D C7 | Rotate left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_305
; Address: $D9AA29
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_305:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AA45			; 4C 45 AA | Jump to address
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_307
; Address: $D9AA3E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_307:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AA68			; 4C 68 AA | Jump to address
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_31C
; Address: $D9AAB9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_31C:
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AAD9			; 4C D9 AA | Jump to address
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_31F
; Address: $D9AAD5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_31F:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AAEB			; 4C EB AA | Jump to address
	LDA #$60			 ; A9 60 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_320
; Address: $D9AAE7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_320:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AAFD			; 4C FD AA | Jump to address
	LDA #$61			 ; A9 61 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_323
; Address: $D9AB02
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_323:
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB14			; 4C 14 AB | Jump to address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_324
; Address: $D9AB10
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_324:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB26			; 4C 26 AB | Jump to address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_325
; Address: $D9AB22
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_325:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB38			; 4C 38 AB | Jump to address
	LDA #$64			 ; A9 64 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_328
; Address: $D9AB3D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_328:
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB4F			; 4C 4F AB | Jump to address
	LDA #$65			 ; A9 65 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_329
; Address: $D9AB4B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_329:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB61			; 4C 61 AB | Jump to address
	LDA #$66			 ; A9 66 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_32C
; Address: $D9AB66
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_32C:
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB78			; 4C 78 AB | Jump to address
	LDA #$67			 ; A9 67 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_32D
; Address: $D9AB74
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_32D:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AB8A			; 4C 8A AB | Jump to address
	LDA #$68			 ; A9 68 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_338
; Address: $D9ABB7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_338:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $362D			; AD 2D 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AC05			; 4C 05 AC | Jump to address
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_351
; Address: $D9AC5C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_351:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AC93			; 4C 93 AC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_352
; Address: $D9AC67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_352:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AC77			; 4C 77 AC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_357
; Address: $D9AC8C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_357:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AD08			; 4C 08 AD | Jump to address
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ACD1			; 4C D1 AC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_358
; Address: $D9AC9E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_358:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ACBC			; 4C BC AC | Jump to address
	LDA #$95			 ; A9 95 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_35B
; Address: $D9ACB5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_35B:
	JSL $CCAC06		  ; 22 06 AC CC | Jump to subroutine long
	JMP $ACCE			; 4C CE AC | Jump to address
	LDA #$9C			 ; A9 9C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_35F
; Address: $D9ACD1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_35F:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ACF6			; 4C F6 AC | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_363
; Address: $D9ACEF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_363:
	JSL $CCAC06		  ; 22 06 AC CC | Jump to subroutine long
	JMP $AD08			; 4C 08 AD | Jump to address
	LDA #$9C			 ; A9 9C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_366
; Address: $D9AD04
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_366:
	JSL $CCAC38		  ; 22 38 AC CC | Jump to subroutine long
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AD26			; 4C 26 AD | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_367
; Address: $D9AD13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_367:
	JSL $CC8A7B		  ; 22 7B 8A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AD23			; 4C 23 AD | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_369
; Address: $D9AD1F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_369:
	JSL $C758DE		  ; 22 DE 58 C7 | Jump to subroutine long
	JMP $AD38			; 4C 38 AD | Jump to address
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AD38			; 4C 38 AD | Jump to address
	LDA #$8D			 ; A9 8D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_36B
; Address: $D9AD39
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_36B:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AD57			; 4C 57 AD | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AD54			; 4C 54 AD | Jump to address
	LDA #$A4			 ; A9 A4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_36C
; Address: $D9AD50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_36C:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AD77			; 4C 77 AD | Jump to address
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_36E
; Address: $D9AD61
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_36E:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $AD77			; 4C 77 AD | Jump to address
	LDA #$A7			 ; A9 A7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_370
; Address: $D9AD78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_370:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AD8B			; 4C 8B AD | Jump to address
	LDA #$A8			 ; A9 A8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_371
; Address: $D9AD84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_371:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AD92			; 4C 92 AD | Jump to address
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_37C
; Address: $D9ADC5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_37C:
	LDA $3541			; AD 41 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ADE7			; 4C E7 AD | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_37D
; Address: $D9ADD0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_37D:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ADE4			; 4C E4 AD | Jump to address
	LDA #$B2			 ; A9 B2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_380
; Address: $D9ADE7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_380:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ADFB			; 4C FB AD | Jump to address
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_383
; Address: $D9ADFC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_383:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AE9B			; 4C 9B AE | Jump to address
	LDA #$E9			 ; A9 E9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_385
; Address: $D9AE0E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_385:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AE59			; 4C 59 AE | Jump to address
	LDA #$EA			 ; A9 EA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_392
; Address: $D9AE6A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_392:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AE8A			; 4C 8A AE | Jump to address
	LDA #$F7			 ; A9 F7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_394
; Address: $D9AE83
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_394:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AE98			; 4C 98 AE | Jump to address
	LDA #$F4			 ; A9 F4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_396
; Address: $D9AE94
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_396:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B08B			; 4C 8B B0 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AF33			; 4C 33 AF | Jump to address
	LDA #$D7			 ; A9 D7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_39A
; Address: $D9AEBB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_39A:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AF06			; 4C 06 AF | Jump to address
	LDA #$D9			 ; A9 D9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3A4
; Address: $D9AEFF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3A4:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AF30			; 4C 30 AF | Jump to address
	LDA #$E3			 ; A9 E3 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3AA
; Address: $D9AF2C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3AA:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B08B			; 4C 8B B0 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $AFCB			; 4C CB AF | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3AB
; Address: $D9AF3E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3AB:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AF90			; 4C 90 AF | Jump to address
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3B5
; Address: $D9AF89
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3B5:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $AFC8			; 4C C8 AF | Jump to address
	LDA #$CF			 ; A9 CF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3BE
; Address: $D9AFC4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3BE:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B08B			; 4C 8B B0 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B032			; 4C 32 B0 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3BF
; Address: $D9AFD6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3BF:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B00C			; 4C 0C B0 | Jump to address
	LDA #$BA			 ; A9 BA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3C5
; Address: $D9B005
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3C5:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B02F			; 4C 2F B0 | Jump to address
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3CA
; Address: $D9B02B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3CA:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B08B			; 4C 8B B0 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B061			; 4C 61 B0 | Jump to address
	LDA #$B7			 ; A9 B7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3CE
; Address: $D9B050
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3CE:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B05E			; 4C 5E B0 | Jump to address
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3CF
; Address: $D9B05A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3CF:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B08B			; 4C 8B B0 | Jump to address
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B07D			; 4C 7D B0 | Jump to address
	LDA #$B5			 ; A9 B5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3D1
; Address: $D9B076
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3D1:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B08B			; 4C 8B B0 | Jump to address
	LDA #$B3			 ; A9 B3 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3D4
; Address: $D9B08C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3D4:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B0AA			; 4C AA B0 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3D5
; Address: $D9B097
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3D5:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B0A7			; 4C A7 B0 | Jump to address
	LDA #$FE			 ; A9 FE | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3D6
; Address: $D9B0A3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3D6:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B125			; 4C 25 B1 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B0CF			; 4C CF B0 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3D7
; Address: $D9B0B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3D7:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B0CC			; 4C CC B0 | Jump to address
	LDA #$FD			 ; A9 FD | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3D9
; Address: $D9B0C8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3D9:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B125			; 4C 25 B1 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B0ED			; 4C ED B0 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3DA
; Address: $D9B0DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3DA:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B0EA			; 4C EA B0 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3DC
; Address: $D9B0E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3DC:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B125			; 4C 25 B1 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B10B			; 4C 0B B1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3DD
; Address: $D9B0F8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3DD:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B108			; 4C 08 B1 | Jump to address
	LDA #$FB			 ; A9 FB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3DF
; Address: $D9B10B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3DF:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B11E			; 4C 1E B1 | Jump to address
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E0
; Address: $D9B117
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E0:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $B125			; 4C 25 B1 | Jump to address
	LDA #$FA			 ; A9 FA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E2
; Address: $D9B126
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E2:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B14B			; 4C 4B B1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E3
; Address: $D9B131
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E3:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B148			; 4C 48 B1 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B1A7			; 4C A7 B1 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B182			; 4C 82 B1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E4
; Address: $D9B156
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E4:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B17F			; 4C 7F B1 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E5
; Address: $D9B168
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E5:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B17F			; 4C 7F B1 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B1A7			; 4C A7 B1 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B197			; 4C 97 B1 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B1A7			; 4C A7 B1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E6
; Address: $D9B197
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E6:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B1A7			; 4C A7 B1 | Jump to address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E8
; Address: $D9B1A8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E8:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B20F			; 4C 0F B2 | Jump to address
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3E9
; Address: $D9B1BA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3E9:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B1E9			; 4C E9 B1 | Jump to address
	LDA #$15			 ; A9 15 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$16			 ; A9 16 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$17			 ; A9 17 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3EA
; Address: $D9B1D8
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3EA:
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$19			 ; A9 19 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B20C			; 4C 0C B2 | Jump to address
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1B			 ; A9 1B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1D			 ; A9 1D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B288			; 4C 88 B2 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B250			; 4C 50 B2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3EB
; Address: $D9B21A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3EB:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B24D			; 4C 4D B2 | Jump to address
	LDA #$0E			 ; A9 0E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$11			 ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3EC
; Address: $D9B23A
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3EC:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$13			 ; A9 13 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B288			; 4C 88 B2 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3ED
; Address: $D9B289
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3ED:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B2A0			; 4C A0 B2 | Jump to address
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3EE
; Address: $D9B296
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3EE:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3EF
; Address: $D9B2A1
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3EF:
	LDA #$21			 ; A9 21 | PPU graphics register access
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$22			 ; A9 22 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$23			 ; A9 23 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$24			 ; A9 24 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$27			 ; A9 27 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$28			 ; A9 28 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2A			 ; A9 2A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2D			 ; A9 2D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3F2
; Address: $D9B2F1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3F2:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B301			; 4C 01 B3 | Jump to address
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3F4
; Address: $D9B30F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3F4:
	JSL $CCB2A1		  ; 22 A1 B2 CC | Jump to subroutine long
	LDA #$26			 ; A9 26 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B33A			; 4C 3A B3 | Jump to address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3F6
; Address: $D9B33B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3F6:
	JSL $CC93F5		  ; 22 F5 93 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B35E			; 4C 5E B3 | Jump to address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3F7
; Address: $D9B34B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3F7:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B35B			; 4C 5B B3 | Jump to address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B36C			; 4C 6C B3 | Jump to address
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3F8
; Address: $D9B360
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3F8:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3F9
; Address: $D9B36D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3F9:
	JSL $CC93F5		  ; 22 F5 93 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B386			; 4C 86 B3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3FA
; Address: $D9B376
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3FA:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B386			; 4C 86 B3 | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3FB
; Address: $D9B387
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3FB:
	JSL $CC93F5		  ; 22 F5 93 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B3B4			; 4C B4 B3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3FC
; Address: $D9B390
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3FC:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B3A3			; 4C A3 B3 | Jump to address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B3B1			; 4C B1 B3 | Jump to address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B3C9			; 4C C9 B3 | Jump to address
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B3C2			; 4C C2 B3 | Jump to address
	JMP $B3C9			; 4C C9 B3 | Jump to address
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3FE
; Address: $D9B3CE
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3FE:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B470			; 4C 70 B4 | Jump to address
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$39			 ; A9 39 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$42			 ; A9 42 | Hardware register operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_3FF
; Address: $D9B427
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_3FF:
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$44			 ; A9 44 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$47			 ; A9 47 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$49			 ; A9 49 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4A			 ; A9 4A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4B			 ; A9 4B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4C			 ; A9 4C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B515			; 4C 15 B5 | Jump to address
	LDA #$4D			 ; A9 4D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_400
; Address: $D9B480
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_400:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$50			 ; A9 50 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$51			 ; A9 51 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$52			 ; A9 52 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$53			 ; A9 53 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$54			 ; A9 54 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$55			 ; A9 55 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$57			 ; A9 57 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$58			 ; A9 58 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$59			 ; A9 59 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5A			 ; A9 5A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_401
; Address: $D9B4D7
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_401:
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5D			 ; A9 5D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B4F9			; 4C F9 B4 | Jump to address
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$5F			 ; A9 5F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$61			 ; A9 61 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$44			 ; A9 44 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_403
; Address: $D9B516
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_403:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B529			; 4C 29 B5 | Jump to address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B542			; 4C 42 B5 | Jump to address
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B542			; 4C 42 B5 | Jump to address
	LDA #$64			 ; A9 64 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_404
; Address: $D9B53F
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_404:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_405
; Address: $D9B543
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_405:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B54F			; 4C 4F B5 | Jump to address
	JMP $B568			; 4C 68 B5 | Jump to address
	LDA #$65			 ; A9 65 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B568			; 4C 68 B5 | Jump to address
	LDA #$66			 ; A9 66 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_406
; Address: $D9B569
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_406:
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$69			 ; A9 69 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6E			 ; A9 6E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_407
; Address: $D9B59E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_407:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$71			 ; A9 71 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_408
; Address: $D9B5A9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_408:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B625			; 4C 25 B6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_409
; Address: $D9B5B4
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_409:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B5FF			; 4C FF B5 | Jump to address
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$67			 ; A9 67 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$68			 ; A9 68 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6A			 ; A9 6A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6B			 ; A9 6B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$71			 ; A9 71 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$72			 ; A9 72 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$73			 ; A9 73 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_40A
; Address: $D9B5FC
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_40A:
	JMP $B622			; 4C 22 B6 | Jump to address
	LDA #$74			 ; A9 74 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$78			 ; A9 78 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$79			 ; A9 79 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$7A			 ; A9 7A | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$77			 ; A9 77 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B6BB			; 4C BB B6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_40B
; Address: $D9B625
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_40B:
	JSL $CC8C90		  ; 22 90 8C CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B69E			; 4C 9E B6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_40C
; Address: $D9B62E
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_40C:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B662			; 4C 62 B6 | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B649			; 4C 49 B6 | Jump to address
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B65B			; 4C 5B B6 | Jump to address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_40D
; Address: $D9B65B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_40D:
	JSL $CCB569		  ; 22 69 B5 CC | Jump to subroutine long
	JMP $B69B			; 4C 9B B6 | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B674			; 4C 74 B6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_40E
; Address: $D9B66D
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_40E:
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B686			; 4C 86 B6 | Jump to address
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$74			 ; A9 74 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$75			 ; A9 75 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$76			 ; A9 76 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B6BB			; 4C BB B6 | Jump to address
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B6B0			; 4C B0 B6 | Jump to address
	LDA #$6F			 ; A9 6F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$70			 ; A9 70 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_410
; Address: $D9B6BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_410:
	LDA #$7B			 ; A9 7B | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_411
; Address: $D9B6C3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_411:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B6DE			; 4C DE B6 | Jump to address
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B6DE			; 4C DE B6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_412
; Address: $D9B6D7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_412:
	LDA #$7C			 ; A9 7C | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_413
; Address: $D9B6DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_413:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B71C			; 4C 1C B7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_414
; Address: $D9B6EA
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_414:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B704			; 4C 04 B7 | Jump to address
	LDA #$7D			 ; A9 7D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B719			; 4C 19 B7 | Jump to address
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$81			 ; A9 81 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B735			; 4C 35 B7 | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B735			; 4C 35 B7 | Jump to address
	LDA #$7D			 ; A9 7D | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_415
; Address: $D9B736
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_415:
	LDA #$82			 ; A9 82 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_416
; Address: $D9B73B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_416:
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B773			; 4C 73 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_417
; Address: $D9B748
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_417:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B75B			; 4C 5B B7 | Jump to address
	LDA #$83			 ; A9 83 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B770			; 4C 70 B7 | Jump to address
	LDA #$87			 ; A9 87 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$88			 ; A9 88 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$89			 ; A9 89 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B7AE			; 4C AE B7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_418
; Address: $D9B773
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_418:
	JSL $CC8C90		  ; 22 90 8C CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B7A7			; 4C A7 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_419
; Address: $D9B77C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_419:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B78F			; 4C 8F B7 | Jump to address
	LDA #$83			 ; A9 83 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B7A4			; 4C A4 B7 | Jump to address
	LDA #$84			 ; A9 84 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$85			 ; A9 85 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$86			 ; A9 86 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B7AE			; 4C AE B7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_41A
; Address: $D9B7A7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_41A:
	LDA #$83			 ; A9 83 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_41B
; Address: $D9B7AF
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_41B:
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A6			 ; A9 A6 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A7			 ; A9 A7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A8			 ; A9 A8 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$AA			 ; A9 AA | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_41C
; Address: $D9B7DA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_41C:
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_41D
; Address: $D9B7F7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_41D:
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_41E
; Address: $D9B7FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_41E:
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_41F
; Address: $D9B806
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_41F:
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B2			 ; A9 B2 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B3			 ; A9 B3 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B4			 ; A9 B4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B5			 ; A9 B5 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B6			 ; A9 B6 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B7			 ; A9 B7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$BA			 ; A9 BA | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$BB			 ; A9 BB | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_421
; Address: $D9B854
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_421:
	LDA #$BC			 ; A9 BC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$BD			 ; A9 BD | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$BE			 ; A9 BE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$BF			 ; A9 BF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C0			 ; A9 C0 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C1			 ; A9 C1 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C2			 ; A9 C2 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C3			 ; A9 C3 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C6			 ; A9 C6 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C7			 ; A9 C7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$C8			 ; A9 C8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_422
; Address: $D9B8AA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_422:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_423
; Address: $D9B8B0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_423:
	LDA #$C9			 ; A9 C9 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$CA			 ; A9 CA | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_424
; Address: $D9B8BF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_424:
	LDA #$CB			 ; A9 CB | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$CD			 ; A9 CD | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$CE			 ; A9 CE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_425
; Address: $D9B8DC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_425:
	LDA #$CF			 ; A9 CF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D1			 ; A9 D1 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D2			 ; A9 D2 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D3			 ; A9 D3 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_426
; Address: $D9B8FF
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_426:
	LDA #$D4			 ; A9 D4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D5			 ; A9 D5 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D6			 ; A9 D6 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D7			 ; A9 D7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$D9			 ; A9 D9 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$DB			 ; A9 DB | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$DC			 ; A9 DC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$DD			 ; A9 DD | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$DE			 ; A9 DE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$DF			 ; A9 DF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_427
; Address: $D9B957
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_427:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_428
; Address: $D9B95B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_428:
	LDA #$E1			 ; A9 E1 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $B974			; 4C 74 B9 | Jump to address
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_429
; Address: $D9B975
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_429:
	LDA #$E3			 ; A9 E3 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_42A
; Address: $D9B97D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_42A:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B9F2			; 4C F2 B9 | Jump to address
	LDA #$E5			 ; A9 E5 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$E6			 ; A9 E6 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$E9			 ; A9 E9 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$EA			 ; A9 EA | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$EB			 ; A9 EB | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_42B
; Address: $D9B9B4
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_42B:
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$EC			 ; A9 EC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$ED			 ; A9 ED | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$EE			 ; A9 EE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$EF			 ; A9 EF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F1			 ; A9 F1 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F2			 ; A9 F2 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F3			 ; A9 F3 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $BA2A			; 4C 2A BA | Jump to address
	LDA #$F4			 ; A9 F4 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F5			 ; A9 F5 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F6			 ; A9 F6 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F7			 ; A9 F7 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_42C
; Address: $D9BA0C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_42C:
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F8			 ; A9 F8 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$FA			 ; A9 FA | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$FB			 ; A9 FB | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_42D
; Address: $D9BA2B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_42D:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BA3E			; 4C 3E BA | Jump to address
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $BA4C			; 4C 4C BA | Jump to address
	LDA #$FD			 ; A9 FD | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$FE			 ; A9 FE | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_42E
; Address: $D9BA4D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_42E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BA59			; 4C 59 BA | Jump to address
	JMP $BA60			; 4C 60 BA | Jump to address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_443
; Address: $D9BACE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_443:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BAE1			; 4C E1 BA | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_444
; Address: $D9BADA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_444:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BB2E			; 4C 2E BB | Jump to address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_452
; Address: $D9BB36
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_452:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BB46			; 4C 46 BB | Jump to address
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_457
; Address: $D9BB55
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_457:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BBA0			; 4C A0 BB | Jump to address
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_460
; Address: $D9BB99
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_460:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BBCA			; 4C CA BB | Jump to address
	LDA #$47			 ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_466
; Address: $D9BBC6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_466:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3542			; AD 42 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BBDC			; 4C DC BB | Jump to address
	LDA #$47			 ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_46A
; Address: $D9BBE5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_46A:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BBF8			; 4C F8 BB | Jump to address
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_46B
; Address: $D9BBF1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_46B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BC06			; 4C 06 BC | Jump to address
	LDA #$4F			 ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_46E
; Address: $D9BC07
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_46E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BC28			; 4C 28 BC | Jump to address
	LDA #$51			 ; A9 51 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_471
; Address: $D9BC21
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_471:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BC2F			; 4C 2F BC | Jump to address
	LDA #$55			 ; A9 55 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_487
; Address: $D9BCB0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_487:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BCE7			; 4C E7 BC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_488
; Address: $D9BCBB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_488:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BCD9			; 4C D9 BC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_48E
; Address: $D9BCE7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_48E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BD17			; 4C 17 BD | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BD02			; 4C 02 BD | Jump to address
	LDA #$61			 ; A9 61 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_492
; Address: $D9BD10
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_492:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BD34			; 4C 34 BD | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BD29			; 4C 29 BD | Jump to address
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_49D
; Address: $D9BD60
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_49D:
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BD79			; 4C 79 BD | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4A0
; Address: $D9BD79
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4A0:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BDD4			; 4C D4 BD | Jump to address
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BD9F			; 4C 9F BD | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BD9F			; 4C 9F BD | Jump to address
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4A1
; Address: $D9BD9B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4A1:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BDC6			; 4C C6 BD | Jump to address
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BDBF			; 4C BF BD | Jump to address
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4A2
; Address: $D9BDB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4A2:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BDC6			; 4C C6 BD | Jump to address
	LDA #$75			 ; A9 75 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4A5
; Address: $D9BDCD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4A5:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BE34			; 4C 34 BE | Jump to address
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BDF1			; 4C F1 BD | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BDF1			; 4C F1 BD | Jump to address
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4A6
; Address: $D9BDED
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4A6:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BE03			; 4C 03 BE | Jump to address
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4B0
; Address: $D9BE38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4B0:
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BE53			; 4C 53 BE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4B1
; Address: $D9BE40
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4B1:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BE50			; 4C 50 BE | Jump to address
	LDA #$83			 ; A9 83 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4B2
; Address: $D9BE4C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4B2:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BE76			; 4C 76 BE | Jump to address
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $BE6F			; 4C 6F BE | Jump to address
	LDA #$81			 ; A9 81 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4B4
; Address: $D9BE68
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4B4:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BE76			; 4C 76 BE | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4B6
; Address: $D9BE77
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4B6:
	JSL $CC9431		  ; 22 31 94 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BE87			; 4C 87 BE | Jump to address
	LDA #$90			 ; A9 90 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4B7
; Address: $D9BE83
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4B7:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $BE99			; 4C 99 BE | Jump to address
	LDA #$84			 ; A9 84 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4BA
; Address: $D9BEA0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4BA:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BEEF			; 4C EF BE | Jump to address
	LDA #$86			 ; A9 86 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4CB
; Address: $D9BF0D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4CB:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BF51			; 4C 51 BF | Jump to address
	LDA #$92			 ; A9 92 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4D3
; Address: $D9BF4A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4D3:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BF74			; 4C 74 BF | Jump to address
	LDA #$9D			 ; A9 9D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4DE
; Address: $D9BF84
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4DE:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $BF97			; 4C 97 BF | Jump to address
	LDA #$A4			 ; A9 A4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4DF
; Address: $D9BF90
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4DF:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $BFA5			; 4C A5 BF | Jump to address
	LDA #$A5			 ; A9 A5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_4F6
; Address: $D9C01D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_4F6:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C084			; 4C 84 C0 | Jump to address
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_501
; Address: $D9C06B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_501:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C081			; 4C 81 C0 | Jump to address
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_502
; Address: $D9C07D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_502:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C0B6			; 4C B6 C0 | Jump to address
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_505
; Address: $D9C095
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_505:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C0B6			; 4C B6 C0 | Jump to address
	LDA $362C			; AD 2C 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C0B6			; 4C B6 C0 | Jump to address
	LDA #$C8			 ; A9 C8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_508
; Address: $D9C0BD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_508:
	JMP $C0F1			; 4C F1 C0 | Jump to address
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C0D5			; 4C D5 C0 | Jump to address
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_509
; Address: $D9C0CE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_509:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C0E7			; 4C E7 C0 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C0E7			; 4C E7 C0 | Jump to address
	LDA #$CB			 ; A9 CB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_50B
; Address: $D9C0EA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_50B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C114			; 4C 14 C1 | Jump to address
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C10D			; 4C 0D C1 | Jump to address
	LDA #$CC			 ; A9 CC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_50D
; Address: $D9C106
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_50D:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C114			; 4C 14 C1 | Jump to address
	LDA #$CA			 ; A9 CA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_50F
; Address: $D9C115
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_50F:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C15A			; 4C 5A C1 | Jump to address
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C130			; 4C 30 C1 | Jump to address
	LDA #$CD			 ; A9 CD | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_510
; Address: $D9C12C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_510:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C145			; 4C 45 C1 | Jump to address
	LDA #$CE			 ; A9 CE | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_511
; Address: $D9C13E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_511:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C157			; 4C 57 C1 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C157			; 4C 57 C1 | Jump to address
	LDA #$CE			 ; A9 CE | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_512
; Address: $D9C153
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_512:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C161			; 4C 61 C1 | Jump to address
	LDA #$CF			 ; A9 CF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_517
; Address: $D9C170
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_517:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C18E			; 4C 8E C1 | Jump to address
	LDA #$D2			 ; A9 D2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_51B
; Address: $D9C18F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_51B:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C1B0			; 4C B0 C1 | Jump to address
	LDA #$D5			 ; A9 D5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_51E
; Address: $D9C1A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_51E:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C1BE			; 4C BE C1 | Jump to address
	LDA #$D8			 ; A9 D8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_522
; Address: $D9C1C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_522:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C1EE			; 4C EE C1 | Jump to address
	LDA #$DB			 ; A9 DB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_526
; Address: $D9C1E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_526:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C203			; 4C 03 C2 | Jump to address
	LDA #$DF			 ; A9 DF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_52B
; Address: $D9C204
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_52B:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C21E			; 4C 1E C2 | Jump to address
	LDA #$E2			 ; A9 E2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_52D
; Address: $D9C217
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_52D:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C225			; 4C 25 C2 | Jump to address
	LDA #$E4			 ; A9 E4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_52F
; Address: $D9C226
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_52F:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C232			; 4C 32 C2 | Jump to address
	JMP $C247			; 4C 47 C2 | Jump to address
	LDA #$E5			 ; A9 E5 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_533
; Address: $D9C248
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_533:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C2BD			; 4C BD C2 | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_543
; Address: $D9C2B6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_543:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C2D2			; 4C D2 C2 | Jump to address
	LDA #$F7			 ; A9 F7 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_547
; Address: $D9C2D3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_547:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C3AA			; 4C AA C3 | Jump to address
	LDA #$FA			 ; A9 FA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_549
; Address: $D9C2E6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_549:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3557			; AD 57 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C2FF			; 4C FF C2 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_54A
; Address: $D9C2F8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_54A:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C3A7			; 4C A7 C3 | Jump to address
	LDA $3544			; AD 44 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C314			; 4C 14 C3 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_54B
; Address: $D9C30D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_54B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C3A7			; 4C A7 C3 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C322			; 4C 22 C3 | Jump to address
	JMP $C3A7			; 4C A7 C3 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C384			; 4C 84 C3 | Jump to address
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_558
; Address: $D9C37D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_558:
	JSL $C758DE		  ; 22 DE 58 C7 | Jump to subroutine long
	JMP $C3A7			; 4C A7 C3 | Jump to address
	LDA #$FC			 ; A9 FC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_55D
; Address: $D9C3A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_55D:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C3AA			; 4C AA C3 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_55E
; Address: $D9C3AB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_55E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C3D3			; 4C D3 C3 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_562
; Address: $D9C3CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_562:
	JSL $C758DE		  ; 22 DE 58 C7 | Jump to subroutine long
	JMP $C3D3			; 4C D3 C3 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_564
; Address: $D9C3DA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_564:
	JMP $C3FD			; 4C FD C3 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C3FA			; 4C FA C3 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C3FA			; 4C FA C3 | Jump to address
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_565
; Address: $D9C3F6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_565:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C404			; 4C 04 C4 | Jump to address
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_567
; Address: $D9C405
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_567:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C465			; 4C 65 C4 | Jump to address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_573
; Address: $D9C45E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_573:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C48F			; 4C 8F C4 | Jump to address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_57A
; Address: $D9C490
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_57A:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C4A3			; 4C A3 C4 | Jump to address
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_57B
; Address: $D9C49C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_57B:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C4B1			; 4C B1 C4 | Jump to address
	LDA #$23			 ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_57E
; Address: $D9C4B2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_57E:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C4CC			; 4C CC C4 | Jump to address
	LDA #$25			 ; A9 25 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_580
; Address: $D9C4C5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_580:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C4D3			; 4C D3 C4 | Jump to address
	LDA #$27			 ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_58E
; Address: $D9C521
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_58E:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C533			; 4C 33 C5 | Jump to address
	LDA #$31			 ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_590
; Address: $D9C534
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_590:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C55D			; 4C 5D C5 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C55A			; 4C 5A C5 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $C55A			; 4C 5A C5 | Jump to address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_591
; Address: $D9C556
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_591:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C564			; 4C 64 C5 | Jump to address
	LDA #$35			 ; A9 35 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_593
; Address: $D9C565
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_593:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C5A2			; 4C A2 C5 | Jump to address
	LDA #$36			 ; A9 36 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_59A
; Address: $D9C59B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_59A:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C5C5			; 4C C5 C5 | Jump to address
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5A1
; Address: $D9C5C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5A1:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C600			; 4C 00 C6 | Jump to address
	LDA #$42			 ; A9 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5A5
; Address: $D9C5E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5A5:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C5FD			; 4C FD C5 | Jump to address
	LDA #$46			 ; A9 46 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5A6
; Address: $D9C5F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5A6:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C600			; 4C 00 C6 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5AF
; Address: $D9C626
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5AF:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C640			; 4C 40 C6 | Jump to address
	LDA #$4C			 ; A9 4C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5B1
; Address: $D9C639
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5B1:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C647			; 4C 47 C6 | Jump to address
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5B7
; Address: $D9C65D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5B7:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C68C			; 4C 8C C6 | Jump to address
	LDA #$50			 ; A9 50 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5BC
; Address: $D9C685
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5BC:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C6BD			; 4C BD C6 | Jump to address
	LDA #$57			 ; A9 57 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5C4
; Address: $D9C6BE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5C4:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C6E6			; 4C E6 C6 | Jump to address
	LDA #$5E			 ; A9 5E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5C8
; Address: $D9C6DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5C8:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C6ED			; 4C ED C6 | Jump to address
	LDA #$62			 ; A9 62 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5CF
; Address: $D9C70B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5CF:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C779			; 4C 79 C7 | Jump to address
	LDA #$66			 ; A9 66 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5DD
; Address: $D9C772
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5DD:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C7BF			; 4C BF C7 | Jump to address
	LDA #$75			 ; A9 75 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5E8
; Address: $D9C7BB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5E8:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C7D1			; 4C D1 C7 | Jump to address
	LDA #$71			 ; A9 71 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5EA
; Address: $D9C7D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5EA:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C81D			; 4C 1D C8 | Jump to address
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5F3
; Address: $D9C816
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5F3:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C839			; 4C 39 C8 | Jump to address
	LDA #$88			 ; A9 88 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_5F8
; Address: $D9C83A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_5F8:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C84D			; 4C 4D C8 | Jump to address
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_602
; Address: $D9C87F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_602:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C891			; 4C 91 C8 | Jump to address
	LDA #$94			 ; A9 94 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_608
; Address: $D9C8A2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_608:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C8BB			; 4C BB C8 | Jump to address
	LDA #$97			 ; A9 97 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_60B
; Address: $D9C8BC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_60B:
	LDA $3551			; AD 51 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $C8CE			; 4C CE C8 | Jump to address
	LDA #$98			 ; A9 98 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_618
; Address: $D9C915
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_618:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C94F			; 4C 4F C9 | Jump to address
	LDA #$A1			 ; A9 A1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_623
; Address: $D9C95E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_623:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $C971			; 4C 71 C9 | Jump to address
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_624
; Address: $D9C96A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_624:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $C994			; 4C 94 C9 | Jump to address
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_652
; Address: $D9CA75
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_652:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $CB0F			; 4C 0F CB | Jump to address
	LDA #$50			 ; A9 50 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_667
; Address: $D9CB08
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_667:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	JMP $CB40			; 4C 40 CB | Jump to address
	LDA #$68			 ; A9 68 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_671
; Address: $D9CB49
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_671:
	JSL $CC931B		  ; 22 1B 93 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $CB6E			; 4C 6E CB | Jump to address
	LDA #$55			 ; A9 55 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6A1
; Address: $D9CC4A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6A1:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CC67			; 4C 67 CC | Jump to address
	LDA #$6C			 ; A9 6C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6B7
; Address: $D9CCD4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6B7:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $CCE4			; 4C E4 CC | Jump to address
	LDA #$DB			 ; A9 DB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6B9
; Address: $D9CCE5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6B9:
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CD1A			; 4C 1A CD | Jump to address
	LDA #$DF			 ; A9 DF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6CA
; Address: $D9CD5A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6CA:
	JSL $CBB629		  ; 22 29 B6 CB | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $CD6A			; 4C 6A CD | Jump to address
	LDA #$E8			 ; A9 E8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6CB
; Address: $D9CD66
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6CB:
	JSL $C75828		  ; 22 28 58 C7 | Jump to subroutine long
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CDD7			; 4C D7 CD | Jump to address
	LDA #$E9			 ; A9 E9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6DA
; Address: $D9CDD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6DA:
	JSL $CBB6B2		  ; 22 B2 B6 CB | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $CDE8			; 4C E8 CD | Jump to address
	LDA #$F2			 ; A9 F2 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6DE
; Address: $D9CDF3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6DE:
	JSL $C758DE		  ; 22 DE 58 C7 | Jump to subroutine long
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CE4C			; 4C 4C CE | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CE29			; 4C 29 CE | Jump to address
	LDA #$F6			 ; A9 F6 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6EA
; Address: $D9CE54
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6EA:
	JSL $CC81B9		  ; 22 B9 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $CE64			; 4C 64 CE | Jump to address
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6EC
; Address: $D9CE65
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6EC:
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CE77			; 4C 77 CE | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6EE
; Address: $D9CE77
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6EE:
	JSL $CC81B9		  ; 22 B9 81 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $CE8E			; 4C 8E CE | Jump to address
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6F2
; Address: $D9CE96
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6F2:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6F3
; Address: $D9CE9E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6F3:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$84			 ; A9 84 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6F7
; Address: $D9CED0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6F7:
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6F8
; Address: $D9CEED
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6F8:
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6FA
; Address: $D9CEF5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6FA:
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6FB
; Address: $D9CEFD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6FB:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CF16			; 4C 16 CF | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$31			 ; A9 31 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6FC
; Address: $D9CF17
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6FC:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CF30			; 4C 30 CF | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$86			 ; A9 86 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6FE
; Address: $D9CF31
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6FE:
	LDA #$33			 ; A9 33 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_6FF
; Address: $D9CF42
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_6FF:
	JSL $C758DE		  ; 22 DE 58 C7 | Jump to subroutine long
	LDA $3629			; AD 29 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $CF58			; 4C 58 CF | Jump to address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_700
; Address: $D9CF59
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_700:
	LDA #$36			 ; A9 36 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$37			 ; A9 37 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$39			 ; A9 39 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3A			 ; A9 3A | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3C			 ; A9 3C | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3E			 ; A9 3E | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$3F			 ; A9 3F | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$8A			 ; A9 8A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_702
; Address: $D9CFA7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_702:
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $CFC3			; 4C C3 CF | Jump to address
	LDA #$42			 ; A9 42 | Hardware register operation
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank32_DmaFunction_704
; Address: $D9CFBC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_704:
	JSL $C758DE		  ; 22 DE 58 C7 | Jump to subroutine long
	JMP $CFD1			; 4C D1 CF | Jump to address
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$41			 ; A9 41 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_70F
; Address: $D9D015
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_70F:
	LDA $3559			; AD 59 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $D027			; 4C 27 D0 | Jump to address
	LDA #$43			 ; A9 43 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$44			 ; A9 44 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_710
; Address: $D9D02F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_710:
	LDA #$45			 ; A9 45 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_711
; Address: $D9D036
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_711:
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$47			 ; A9 47 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$48			 ; A9 48 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDA #$49			 ; A9 49 | Load immediate value into accumulator
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank32_DmaFunction_71F
; Address: $D9D08E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_71F:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDA $3426			; AD 26 34 | Load from absolute address into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	STA $9682			; 8D 82 96 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_720
; Address: $D9D0A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_720:
	JSL $C750CD		  ; 22 CD 50 C7 | Jump to subroutine long
	LDA $C135			; AD 35 C1 | Load from absolute address into accumulator
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_721
; Address: $D9D0B4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_721:
	JMP $D0C7			; 4C C7 D0 | Jump to address
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_722
; Address: $D9D0C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_722:
	JSL $C734DE		  ; 22 DE 34 C7 | Jump to subroutine long
	JMP $D0D1			; 4C D1 D0 | Jump to address
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_725
; Address: $D9D0D6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_725:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDA $3426			; AD 26 34 | Load from absolute address into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	STA $9682			; 8D 82 96 | Store accumulator to absolute address
	LDX #$A1			 ; A2 A1 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_735
; Address: $D9D134
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_735:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	LDA $3426			; AD 26 34 | Load from absolute address into accumulator
	STA $9680			; 8D 80 96 | Store accumulator to absolute address
	LDA $3428			; AD 28 34 | Load from absolute address into accumulator
	STA $9682			; 8D 82 96 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_739
; Address: $D9D15C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_739:
	JSL $CCD108		  ; 22 08 D1 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDX #$FE			 ; A2 FE | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_75A
; Address: $D9D1F4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_75A:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $D209			; 4C 09 D2 | Jump to address
	LDA #$47			 ; A9 47 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_75B
; Address: $D9D202
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_75B:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	JMP $D210			; 4C 10 D2 | Jump to address
	LDA #$53			 ; A9 53 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_765
; Address: $D9D234
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_765:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	JMP $D228			; 4C 28 D2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_76B
; Address: $D9D251
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_76B:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	JMP $D245			; 4C 45 D2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_771
; Address: $D9D26E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_771:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	JMP $D262			; 4C 62 D2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_77C
; Address: $D9D29C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_77C:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $D29C			; 4C 9C D2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_782
; Address: $D9D2B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_782:
	JSL $CCD2A4		  ; 22 A4 D2 CC | Jump to subroutine long
	JMP $D2B9			; 4C B9 D2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_787
; Address: $D9D2D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_787:
	JSL $CCD2C1		  ; 22 C1 D2 CC | Jump to subroutine long
	JMP $D2D2			; 4C D2 D2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_78E
; Address: $D9D2F4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_78E:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $C1A5			; 8D A5 C1 | Store accumulator to absolute address
	STA $C399			; 8D 99 C3 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_7BB
; Address: $D9D3B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_7BB:
	JSL $CCD3A6		  ; 22 A6 D3 CC | Jump to subroutine long
	JMP $D3B7			; 4C B7 D3 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_7BE
; Address: $D9D3CB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_7BE:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $D3C0			; 4C C0 D3 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_7CB
; Address: $D9D400
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_7CB:
	LDA $3618			; AD 18 36 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $D40F			; 4C 0F D4 | Jump to address
	JMP $D400			; 4C 00 D4 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_7E4
; Address: $D9D47B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_7E4:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D4A5			; 4C A5 D4 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_7EF
; Address: $D9D4BB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_7EF:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D4E5			; 4C E5 D4 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_7FA
; Address: $D9D4FB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_7FA:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D525			; 4C 25 D5 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_805
; Address: $D9D53B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_805:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $D565			; 4C 65 D5 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_80D
; Address: $D9D56A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_80D:
	JSL $C75FBF		  ; 22 BF 5F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $D57A			; 4C 7A D5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_80E
; Address: $D9D573
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_80E:
	JSL $C76954		  ; 22 54 69 C7 | Jump to subroutine long
	JMP $D56A			; 4C 6A D5 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_80F
; Address: $D9D57B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_80F:
	JSL $C76013		  ; 22 13 60 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $D58B			; 4C 8B D5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_810
; Address: $D9D584
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_810:
	JSL $C76954		  ; 22 54 69 C7 | Jump to subroutine long
	JMP $D57B			; 4C 7B D5 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_811
; Address: $D9D58C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_811:
	JSL $C75FBF		  ; 22 BF 5F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $D59C			; 4C 9C D5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_814
; Address: $D9D59D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_814:
	JSL $C76013		  ; 22 13 60 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $D5AD			; 4C AD D5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_815
; Address: $D9D5A6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_815:
	JSL $C76A78		  ; 22 78 6A C7 | Jump to subroutine long
	JMP $D59D			; 4C 9D D5 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_816
; Address: $D9D5AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_816:
	JSL $C75FBF		  ; 22 BF 5F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $D5C2			; 4C C2 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_818
; Address: $D9D5BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_818:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	JMP $D5AE			; 4C AE D5 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_819
; Address: $D9D5C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_819:
	JSL $C76013		  ; 22 13 60 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $D5D7			; 4C D7 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_81B
; Address: $D9D5D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_81B:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	JMP $D5C3			; 4C C3 D5 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_81C
; Address: $D9D5D8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_81C:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 5F C7 90 | Load from absolute long,X into accumulator
	JMP $D60C			; 4C 0C D6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_81D
; Address: $D9D5E7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_81D:
	JSL $C76A78		  ; 22 78 6A C7 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $D609			; 4C 09 D6 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_81E
; Address: $D9D605
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_81E:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $D5DE			; 4C DE D5 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_81F
; Address: $D9D60E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_81F:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank32_DmaFunction_821
; Address: $D9D61D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_821:
	JSL $C76A78		  ; 22 78 6A C7 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_822
; Address: $D9D62A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_822:
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $D63F			; 4C 3F D6 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_823
; Address: $D9D63B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_823:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $D614			; 4C 14 D6 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_82E
; Address: $D9D678
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_82E:
	JSL $CDD687		  ; 22 87 D6 CD | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	STA $342E			; 8D 2E 34 | Store accumulator to absolute address
	LDX $342C			; AE 2C 34 | Load from absolute address into X register
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_830
; Address: $D9D691
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_830:
	JSL $CDD687		  ; 22 87 D6 CD | Jump to subroutine long
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	STA $342C			; 8D 2C 34 | Store accumulator to absolute address
	LDX $342C			; AE 2C 34 | Load from absolute address into X register
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_832
; Address: $D9D6AA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_832:
	JSL $CDD687		  ; 22 87 D6 CD | Jump to subroutine long
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	STA $342E			; 8D 2E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_835
; Address: $D9D6C3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_835:
	JSL $CDD687		  ; 22 87 D6 CD | Jump to subroutine long
	LDA $342C			; AD 2C 34 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	STA $342C			; 8D 2C 34 | Store accumulator to absolute address
	LDX $342C			; AE 2C 34 | Load from absolute address into X register
	LDA $342E			; AD 2E 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_83E
; Address: $D9D6FA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_83E:
	JSL $C7556C		  ; 22 6C 55 C7 | Jump to subroutine long
	LDA $C129			; AD 29 C1 | Load from absolute address into accumulator
	STA $342C			; 8D 2C 34 | Store accumulator to absolute address
	LDA $C12B			; AD 2B C1 | Load from absolute address into accumulator
	STA $342E			; 8D 2E 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_841
; Address: $D9D714
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_841:
	JSL $C75556		  ; 22 56 55 C7 | Jump to subroutine long
	LDA $C125			; AD 25 C1 | Load from absolute address into accumulator
	STA $3430			; 8D 30 34 | Store accumulator to absolute address
	LDA $C127			; AD 27 C1 | Load from absolute address into accumulator
	STA $3432			; 8D 32 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_847
; Address: $D9D73B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_847:
	JSL $C7556C		  ; 22 6C 55 C7 | Jump to subroutine long
	LDA $C129			; AD 29 C1 | Load from absolute address into accumulator
	STA $3422			; 8D 22 34 | Store accumulator to absolute address
	LDA $C12B			; AD 2B C1 | Load from absolute address into accumulator
	STA $3424			; 8D 24 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_848
; Address: $D9D74C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_848:
	JSL $C75556		  ; 22 56 55 C7 | Jump to subroutine long
	LDA $C125			; AD 25 C1 | Load from absolute address into accumulator
	STA $3426			; 8D 26 34 | Store accumulator to absolute address
	LDA $C127			; AD 27 C1 | Load from absolute address into accumulator
	STA $3428			; 8D 28 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8CB
; Address: $D9D9B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8CB:
	JSL $C751DF		  ; 22 DF 51 C7 | Jump to subroutine long
	LDA $C11D			; AD 1D C1 | Load from absolute address into accumulator
	STA $342A			; 8D 2A 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8CF
; Address: $D9D9CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8CF:
	JSL $C751DF		  ; 22 DF 51 C7 | Jump to subroutine long
	LDA $C11D			; AD 1D C1 | Load from absolute address into accumulator
	STA $3420			; 8D 20 34 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8D4
; Address: $D9D9E6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8D4:
	JSL $CCD9B3		  ; 22 B3 D9 CC | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($49,X)		  ; 01 49 | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8EE
; Address: $D9DA69
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8EE:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA $342A			; AD 2A 34 | Load from absolute address into accumulator
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($49,X)		  ; 01 49 | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8F0
; Address: $D9DA7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8F0:
	JSR $2234			; 20 34 22 | Jump to subroutine
	STY $C751			; 8C 51 C7 | Store Y register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8F1
; Address: $D9DA88
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8F1:
	JSL $CCD9CC		  ; 22 CC D9 CC | Jump to subroutine long
	LDA $3420			; AD 20 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $3420			; 8D 20 34 | Store accumulator to absolute address
	LDA $3420			; AD 20 34 | Load from absolute address into accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $3420			; 8D 20 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_8F3
; Address: $D9DAA4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_8F3:
	JSL $CCD9CC		  ; 22 CC D9 CC | Jump to subroutine long
	LDA $3420			; AD 20 34 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	STA $3420			; 8D 20 34 | Store accumulator to absolute address
	LDA $3420			; AD 20 34 | Load from absolute address into accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $3420			; 8D 20 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_93E
; Address: $D9DBF8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_93E:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	JMP $DBDC			; 4C DC DB | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_945
; Address: $D9DC1B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_945:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	JMP $DC49			; 4C 49 DC | Jump to address
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_946
; Address: $D9DC28
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_946:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $DC64			; 4C 64 DC | Jump to address
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	LDX #$27			 ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_947
; Address: $D9DC35
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_947:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $DC64			; 4C 64 DC | Jump to address
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	LDX #$29			 ; A2 29 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_948
; Address: $D9DC42
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_948:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $DC64			; 4C 64 DC | Jump to address
	LDA $3438			; AD 38 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DC22			; 4C 22 DC | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DC2F			; 4C 2F DC | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DC3C			; 4C 3C DC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_94D
; Address: $D9DC74
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_94D:
	JSL $CDAF31		  ; 22 31 AF CD | Jump to subroutine long
	JMP $DC99			; 4C 99 DC | Jump to address
	LDA #$24			 ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_94E
; Address: $D9DC7E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_94E:
	JSL $C75446		  ; 22 46 54 C7 | Jump to subroutine long
	JMP $DCB4			; 4C B4 DC | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_94F
; Address: $D9DC88
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_94F:
	JSL $C75446		  ; 22 46 54 C7 | Jump to subroutine long
	JMP $DCB4			; 4C B4 DC | Jump to address
	LDA #$27			 ; A9 27 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_951
; Address: $D9DC96
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_951:
	JMP $DCB4			; 4C B4 DC | Jump to address
	LDA $3438			; AD 38 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DC7B			; 4C 7B DC | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DC85			; 4C 85 DC | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DC8F			; 4C 8F DC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_954
; Address: $D9DCBC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_954:
	JSL $CDAF71		  ; 22 71 AF CD | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_958
; Address: $D9DCD2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_958:
	JSL $CDADAB		  ; 22 AB AD CD | Jump to subroutine long
	JMP $DC1B			; 4C 1B DC | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_95E
; Address: $D9DCEF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_95E:
	JSL $CCD418		  ; 22 18 D4 CC | Jump to subroutine long
	JMP $DD1D			; 4C 1D DD | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	LDX #$25			 ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_95F
; Address: $D9DCFC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_95F:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $DD38			; 4C 38 DD | Jump to address
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	LDX #$27			 ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_960
; Address: $D9DD09
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_960:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $DD38			; 4C 38 DD | Jump to address
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	LDX #$29			 ; A2 29 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_961
; Address: $D9DD16
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_961:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $DD38			; 4C 38 DD | Jump to address
	LDA $3438			; AD 38 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DCF6			; 4C F6 DC | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DD03			; 4C 03 DD | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_967
; Address: $D9DD48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_967:
	JSL $CDAF31		  ; 22 31 AF CD | Jump to subroutine long
	JMP $DD6D			; 4C 6D DD | Jump to address
	LDA #$26			 ; A9 26 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_968
; Address: $D9DD52
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_968:
	JSL $C75446		  ; 22 46 54 C7 | Jump to subroutine long
	JMP $DD88			; 4C 88 DD | Jump to address
	LDA #$22			 ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_969
; Address: $D9DD5C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_969:
	JSL $C75446		  ; 22 46 54 C7 | Jump to subroutine long
	JMP $DD88			; 4C 88 DD | Jump to address
	LDA #$29			 ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_96A
; Address: $D9DD66
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_96A:
	JSL $C75446		  ; 22 46 54 C7 | Jump to subroutine long
	JMP $DD88			; 4C 88 DD | Jump to address
	LDA $3438			; AD 38 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DD4F			; 4C 4F DD | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DD59			; 4C 59 DD | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DD63			; 4C 63 DD | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_96D
; Address: $D9DD90
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_96D:
	JSL $CDAF71		  ; 22 71 AF CD | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_971
; Address: $D9DDA6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_971:
	JSL $CDADAB		  ; 22 AB AD CD | Jump to subroutine long
	JMP $DCEB			; 4C EB DC | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_972
; Address: $D9DDAE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_972:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	ROL $6B35,X		  ; 3E 35 6B | Rotate left (absolute,X)
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	ROL $A235,X		  ; 3E 35 A2 | Rotate left (absolute,X)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_974
; Address: $D9DDC6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_974:
	PHA				  ; 48 | Push accumulator to stack
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $7E22			; CC 22 7E | Compare Y register (absolute)
	CPY $01A3			; CC A3 01 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_975
; Address: $D9DDD6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_975:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $DDE4			; 4C E4 DD | Jump to address
	CLV				  ; B8 | Clear overflow flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $DE01			; 4C 01 DE | Jump to address
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $DDF4			; 4C F4 DD | Jump to address
	LDA $4C0A,Y		  ; B9 0A 4C | Load from absolute,Y into accumulator
	ORA ($DE,X)		  ; 01 DE | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $DE01			; 4C 01 DE | Jump to address
	JMP $DE05			; 4C 05 DE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_978
; Address: $D9DE09
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_978:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_97F
; Address: $D9DE30
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_97F:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $DE45			; 4C 45 DE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_983
; Address: $D9DE4A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_983:
	PHA				  ; 48 | Push accumulator to stack
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR $CCD3,X		  ; 7E D3 CC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_993
; Address: $D9DEB2
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_993:
	JSL $CDC151		  ; 22 51 C1 CD | Jump to subroutine long
	JMP $DF0B			; 4C 0B DF | Jump to address
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE73			; 4C 73 DE | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE7A			; 4C 7A DE | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE81			; 4C 81 DE | Jump to address
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE88			; 4C 88 DE | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE8F			; 4C 8F DE | Jump to address
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE96			; 4C 96 DE | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DE9D			; 4C 9D DE | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DEA4			; 4C A4 DE | Jump to address
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_994
; Address: $D9DF00
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_994:
	JMP $DEAB			; 4C AB DE | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DEB2			; 4C B2 DE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_995
; Address: $D9DF0B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_995:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_996
; Address: $D9DF11
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_996:
	PHA				  ; 48 | Push accumulator to stack
	LDA $343E			; AD 3E 34 | Load from absolute address into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR $CCD3,X		  ; 7E D3 CC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_99B
; Address: $D9DF2F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_99B:
	JSL $CDC5B0		  ; 22 B0 C5 CD | Jump to subroutine long
	JMP $DFB4			; 4C B4 DF | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_99C
; Address: $D9DF39
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_99C:
	JSL $CDBE27		  ; 22 27 BE CD | Jump to subroutine long
	BMI $0A			  ; 30 0A | Branch if negative
	JMP $E006			; 4C 06 E0 | Game work RAM access
	AND ($0A,X)		  ; 21 0A | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_99D
; Address: $D9DF46
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_99D:
	JSL $CDBE1D		  ; 22 1D BE CD | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $E006			; 4C 06 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_99E
; Address: $D9DF53
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_99E:
	JSL $CDBE27		  ; 22 27 BE CD | Jump to subroutine long
	BMI $0A			  ; 30 0A | Branch if negative
	JMP $E006			; 4C 06 E0 | Game work RAM access
	JMP $E006			; 4C 06 E0 | Game work RAM access
	AND ($0A,X)		  ; 21 0A | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_99F
; Address: $D9DF69
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_99F:
	JSL $CDBE18		  ; 22 18 BE CD | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $E006			; 4C 06 E0 | Game work RAM access
	AND ($0A,X)		  ; 21 0A | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9A0
; Address: $D9DF76
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9A0:
	JSL $CDBE18		  ; 22 18 BE CD | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $E006			; 4C 06 E0 | Game work RAM access
	EOR $0A			  ; 45 0A | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9A1
; Address: $D9DF83
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9A1:
	JSL $CDBE22		  ; 22 22 BE CD | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $E006			; 4C 06 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9A2
; Address: $D9DF90
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9A2:
	JSL $CDBE27		  ; 22 27 BE CD | Jump to subroutine long
	BMI $0A			  ; 30 0A | Branch if negative
	JMP $E006			; 4C 06 E0 | Game work RAM access
	AND ($0A,X)		  ; 21 0A | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9A5
; Address: $D9DFAA
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9A5:
	JSL $CDBE18		  ; 22 18 BE CD | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $E006			; 4C 06 E0 | Game work RAM access
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF36			; 4C 36 DF | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF43			; 4C 43 DF | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF50			; 4C 50 DF | Jump to address
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF5D			; 4C 5D DF | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF66			; 4C 66 DF | Jump to address
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF73			; 4C 73 DF | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF80			; 4C 80 DF | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF8D			; 4C 8D DF | Jump to address
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DF9A			; 4C 9A DF | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $DFA7			; 4C A7 DF | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9A8
; Address: $D9E00E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9A8:
	JSL $CC9A99		  ; 22 99 9A CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9AA
; Address: $D9E01B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9AA:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E02D			; 4C 2D E0 | Game work RAM access
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $3438			; 8D 38 34 | Store accumulator to absolute address
	JMP $E054			; 4C 54 E0 | Game work RAM access
	LDA #$59			 ; A9 59 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9AB
; Address: $D9E030
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9AB:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E042			; 4C 42 E0 | Game work RAM access
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $3438			; 8D 38 34 | Store accumulator to absolute address
	JMP $E054			; 4C 54 E0 | Game work RAM access
	LDA #$64			 ; A9 64 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9AC
; Address: $D9E045
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9AC:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E054			; 4C 54 E0 | Game work RAM access
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $3438			; 8D 38 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9AF
; Address: $D9E05D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9AF:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	JMP $E0DA			; 4C DA E0 | Game work RAM access
	LDA #$35			 ; A9 35 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9B1
; Address: $D9E06B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9B1:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$25			 ; A2 25 | Load immediate value into X register
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9B6
; Address: $D9E088
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9B6:
	JSL $CDE0E5		  ; 22 E5 E0 CD | Jump to subroutine long
	JMP $E0F5			; 4C F5 E0 | Game work RAM access
	LDA #$3B			 ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9B8
; Address: $D9E096
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9B8:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$21			 ; A2 21 | PPU graphics register access
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9BD
; Address: $D9E0B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9BD:
	JSL $CDE0E5		  ; 22 E5 E0 CD | Jump to subroutine long
	JMP $E0F5			; 4C F5 E0 | Game work RAM access
	LDX #$28			 ; A2 28 | Load immediate value into X register
	LDA #$32			 ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9C2
; Address: $D9E0D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9C2:
	JSL $CDE0E5		  ; 22 E5 E0 CD | Jump to subroutine long
	JMP $E0F5			; 4C F5 E0 | Game work RAM access
	LDA $3438			; AD 38 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9C3
; Address: $D9E0DD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9C3:
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E064			; 4C 64 E0 | Game work RAM access
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E08F			; 4C 8F E0 | Game work RAM access
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E0BA			; 4C BA E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9CB
; Address: $D9E111
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9CB:
	JSL $CDE093		  ; 22 93 E0 CD | Jump to subroutine long
	JMP $E136			; 4C 36 E1 | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9CC
; Address: $D9E11B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9CC:
	JSL $C74263		  ; 22 63 42 C7 | Jump to subroutine long
	JMP $E151			; 4C 51 E1 | Jump to address
	LDA #$30			 ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9CD
; Address: $D9E125
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9CD:
	JSL $C74263		  ; 22 63 42 C7 | Jump to subroutine long
	JMP $E151			; 4C 51 E1 | Jump to address
	LDA #$32			 ; A9 32 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9CE
; Address: $D9E12F
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9CE:
	JSL $C74263		  ; 22 63 42 C7 | Jump to subroutine long
	JMP $E151			; 4C 51 E1 | Jump to address
	LDA $3438			; AD 38 34 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E118			; 4C 18 E1 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E122			; 4C 22 E1 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E12C			; 4C 2C E1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9D9
; Address: $D9E182
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9D9:
	JMP $E1A0			; 4C A0 E1 | Jump to address
	LDA $C149			; AD 49 C1 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E170			; 4C 70 E1 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E177			; 4C 77 E1 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E17E			; 4C 7E E1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9DA
; Address: $D9E1A0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9DA:
	JSL $C7996B		  ; 22 6B 99 C7 | Jump to subroutine long
	JMP $E055			; 4C 55 E0 | Game work RAM access
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9DC
; Address: $D9E1AD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9DC:
	JSL $CCD2E7		  ; 22 E7 D2 CC | Jump to subroutine long
	JMP $E1AD			; 4C AD E1 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9E3
; Address: $D9E1D1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9E3:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $E1E7			; 4C E7 E1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9E4
; Address: $D9E1E0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9E4:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $E1D5			; 4C D5 E1 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9E5
; Address: $D9E1E8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9E5:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E1FA			; 4C FA E1 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9E9
; Address: $D9E202
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9E9:
	JSL $C77E0C		  ; 22 0C 7E C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E20F			; 4C 0F E2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9EB
; Address: $D9E20F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9EB:
	JSL $C78FB9		  ; 22 B9 8F C7 | Jump to subroutine long
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9EC
; Address: $D9E219
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9EC:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E225			; 4C 25 E2 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9F0
; Address: $D9E22E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9F0:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $E253			; 4C 53 E2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9F2
; Address: $D9E241
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9F2:
	JSL $CC9241		  ; 22 41 92 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E250			; 4C 50 E2 | Jump to address
	LDA #$B8			 ; A9 B8 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	JMP $E232			; 4C 32 E2 | Jump to address
	JMP $E26B			; 4C 6B E2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9F5
; Address: $D9E264
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9F5:
	JSL $CD123E		  ; 22 3E 12 CD | Jump to subroutine long
	JMP $E286			; 4C 86 E2 | Jump to address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E256			; 4C 56 E2 | Jump to address
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E25D			; 4C 5D E2 | Jump to address
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E264			; 4C 64 E2 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	JMP $E232			; 4C 32 E2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9F7
; Address: $D9E291
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9F7:
	JSL $C78FB9		  ; 22 B9 8F C7 | Jump to subroutine long
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E2A7			; 4C A7 E2 | Jump to address
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9F9
; Address: $D9E2A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9F9:
	JSL $CC9122		  ; 22 22 91 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E2B6			; 4C B6 E2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9FD
; Address: $D9E2BF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9FD:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $E2D5			; 4C D5 E2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_9FE
; Address: $D9E2CE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_9FE:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $E2C3			; 4C C3 E2 | Jump to address
	JMP $E2E6			; 4C E6 E2 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A00
; Address: $D9E2DF
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A00:
	JSL $CD186D		  ; 22 6D 18 CD | Jump to subroutine long
	JMP $E2F9			; 4C F9 E2 | Jump to address
	LDA $3400			; AD 00 34 | Load from absolute address into accumulator
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E2D8			; 4C D8 E2 | Jump to address
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E2DF			; 4C DF E2 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $3400			; 8D 00 34 | Store accumulator to absolute address
	JMP $E2C3			; 4C C3 E2 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A01
; Address: $D9E304
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A01:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E321			; 4C 21 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A07
; Address: $D9E326
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A07:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E353			; 4C 53 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A12
; Address: $D9E35D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A12:
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E388			; 4C 88 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A13
; Address: $D9E368
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A13:
	JSL $CC8A7B		  ; 22 7B 8A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E385			; 4C 85 E3 | Jump to address
	LDX #$62			 ; A2 62 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A14
; Address: $D9E377
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A14:
	JSL $C77C10		  ; 22 10 7C C7 | Jump to subroutine long
	LDX #$06			 ; A2 06 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A15
; Address: $D9E381
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A15:
	JSL $C77C10		  ; 22 10 7C C7 | Jump to subroutine long
	JMP $E39D			; 4C 9D E3 | Jump to address
	LDA $3547			; AD 47 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E39D			; 4C 9D E3 | Jump to address
	LDX #$06			 ; A2 06 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A17
; Address: $D9E39E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A17:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E3B8			; 4C B8 E3 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A1A
; Address: $D9E3B8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A1A:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E3D2			; 4C D2 E3 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A24
; Address: $D9E3ED
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A24:
	JSL $CC9C21		  ; 22 21 9C CC | Jump to subroutine long
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E417			; 4C 17 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A25
; Address: $D9E3FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A25:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E410			; 4C 10 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A28
; Address: $D9E410
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A28:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E503			; 4C 03 E5 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E461			; 4C 61 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A29
; Address: $D9E422
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A29:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E448			; 4C 48 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A2A
; Address: $D9E42B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A2A:
	JSL $CCE3D7		  ; 22 D7 E3 CC | Jump to subroutine long
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E441			; 4C 41 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A2C
; Address: $D9E441
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A2C:
	JSL $CB0E36		  ; 22 36 0E CB | Jump to subroutine long
	JMP $E45E			; 4C 5E E4 | Jump to address
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E45A			; 4C 5A E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A2E
; Address: $D9E45A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A2E:
	JSL $CB0E36		  ; 22 36 0E CB | Jump to subroutine long
	JMP $E503			; 4C 03 E5 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E4A9			; 4C A9 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A2F
; Address: $D9E46C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A2F:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E480			; 4C 80 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A31
; Address: $D9E479
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A31:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $E4A6			; 4C A6 E4 | Jump to address
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A34
; Address: $D9E492
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A34:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E4A2			; 4C A2 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A36
; Address: $D9E4A2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A36:
	JSL $CB0CAD		  ; 22 AD 0C CB | Jump to subroutine long
	JMP $E503			; 4C 03 E5 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E4D5			; 4C D5 E4 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	EOR #$35			 ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A37
; Address: $D9E4BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A37:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E4CE			; 4C CE E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A3A
; Address: $D9E4CE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A3A:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E503			; 4C 03 E5 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E4ED			; 4C ED E4 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	EOR #$35			 ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A3B
; Address: $D9E4E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A3B:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E503			; 4C 03 E5 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E4FF			; 4C FF E4 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A3E
; Address: $D9E504
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A3E:
	LDA $3549			; AD 49 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E516			; 4C 16 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A3F
; Address: $D9E50F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A3F:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E53C			; 4C 3C E5 | Jump to address
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A41
; Address: $D9E521
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A41:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E531			; 4C 31 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A45
; Address: $D9E53D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A45:
	LDA $3548			; AD 48 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E54F			; 4C 4F E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A46
; Address: $D9E548
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A46:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E565			; 4C 65 E5 | Jump to address
	LDA $362B			; AD 2B 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E561			; 4C 61 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A49
; Address: $D9E566
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A49:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E592			; 4C 92 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A50
; Address: $D9E58B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A50:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $E5A8			; 4C A8 E5 | Jump to address
	LDA $354A			; AD 4A 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E5A4			; 4C A4 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A53
; Address: $D9E5A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A53:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E5CD			; 4C CD E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A59
; Address: $D9E5CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A59:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E5DD			; 4C DD E5 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A5B
; Address: $D9E5DD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A5B:
	JSL $CCD73B		  ; 22 3B D7 CC | Jump to subroutine long
	LDA $3424			; AD 24 34 | Load from absolute address into accumulator
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $E5F5			; 4C F5 E5 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	JMP $E60F			; 4C 0F E6 | Jump to address
	LDA $3424			; AD 24 34 | Load from absolute address into accumulator
	CMP #$37			 ; C9 37 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $E609			; 4C 09 E6 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	JMP $E60F			; 4C 0F E6 | Jump to address
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $3402			; 8D 02 34 | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	EOR $CC80,Y		  ; 59 80 CC | Exclusive OR with accumulator (absolute,Y)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E625			; 4C 25 E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A5C
; Address: $D9E61E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A5C:
	JSL $CB1F02		  ; 22 02 1F CB | Jump to subroutine long
	JMP $E63B			; 4C 3B E6 | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E637			; 4C 37 E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A5F
; Address: $D9E63C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A5F:
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E64E			; 4C 4E E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A63
; Address: $D9E656
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A63:
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E665			; 4C 65 E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A66
; Address: $D9E66A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A66:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E68F			; 4C 8F E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A6E
; Address: $D9E694
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A6E:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E6B9			; 4C B9 E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A77
; Address: $D9E6C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A77:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E6E4			; 4C E4 E6 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A7E
; Address: $D9E6E9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A7E:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E70A			; 4C 0A E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A85
; Address: $D9E70F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A85:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E730			; 4C 30 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A8D
; Address: $D9E73A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A8D:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E757			; 4C 57 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A93
; Address: $D9E75C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A93:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E77D			; 4C 7D E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A9A
; Address: $D9E782
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A9A:
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E791			; 4C 91 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A9B
; Address: $D9E78D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A9B:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7A3			; 4C A3 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A9D
; Address: $D9E7A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A9D:
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7B5			; 4C B5 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_A9E
; Address: $D9E7AE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_A9E:
	JSL $CB447F		  ; 22 7F 44 CB | Jump to subroutine long
	JMP $E7CF			; 4C CF E7 | Jump to address
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7CB			; 4C CB E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AA2
; Address: $D9E7D0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AA2:
	LDA $354C			; AD 4C 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7E2			; 4C E2 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AA5
; Address: $D9E7E7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AA5:
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E7F9			; 4C F9 E7 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AA6
; Address: $D9E7F2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AA6:
	JSL $CCE1B5		  ; 22 B5 E1 CC | Jump to subroutine long
	JMP $E80F			; 4C 0F E8 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E80B			; 4C 0B E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AA9
; Address: $D9E810
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AA9:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E835			; 4C 35 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ABA
; Address: $D9E864
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ABA:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E888			; 4C 88 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ABF
; Address: $D9E881
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ABF:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $E8EE			; 4C EE E8 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E89A			; 4C 9A E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AC0
; Address: $D9E893
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AC0:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E8EE			; 4C EE E8 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E8C2			; 4C C2 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AC1
; Address: $D9E8A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AC1:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E8B5			; 4C B5 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AC2
; Address: $D9E8AE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AC2:
	JSL $CB51AA		  ; 22 AA 51 CB | Jump to subroutine long
	JMP $E8BF			; 4C BF E8 | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	LSR $2235			; 4E 35 22 | Logical shift right (absolute)
	ORA ($D2),Y		  ; 11 D2 | Logical OR with accumulator ((zero page),Y)
	CPY $EE4C			; CC 4C EE | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E8D4			; 4C D4 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AC3
; Address: $D9E8CD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AC3:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $E8EE			; 4C EE E8 | Jump to address
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AC8
; Address: $D9E8EF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AC8:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E8FF			; 4C FF E8 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AC9
; Address: $D9E8F8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AC9:
	JSL $CB5954		  ; 22 54 59 CB | Jump to subroutine long
	JMP $E915			; 4C 15 E9 | Jump to address
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E911			; 4C 11 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ACC
; Address: $D9E916
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ACC:
	LDA $354D			; AD 4D 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E928			; 4C 28 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ACF
; Address: $D9E92D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ACF:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E947			; 4C 47 E9 | Jump to address
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AD2
; Address: $D9E947
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AD2:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E961			; 4C 61 E9 | Jump to address
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AD6
; Address: $D9E966
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AD6:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E9AD			; 4C AD E9 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AD7
; Address: $D9E975
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AD7:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E983			; 4C 83 E9 | Jump to address
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	JMP $E989			; 4C 89 E9 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AD8
; Address: $D9E989
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AD8:
	JSL $CCDE4A		  ; 22 4A DE CC | Jump to subroutine long
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E9A6			; 4C A6 E9 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $E9A6			; 4C A6 E9 | Jump to address
	JMP $E9E6			; 4C E6 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ADA
; Address: $D9E9AD
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ADA:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $E9DB			; 4C DB E9 | Jump to address
	LDA $354E			; AD 4E 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E9CA			; 4C CA E9 | Jump to address
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address
	JMP $E9D0			; 4C D0 E9 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ADC
; Address: $D9E9D4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ADC:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $E9F1			; 4C F1 E9 | Jump to address
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E9ED			; 4C ED E9 | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_ADF
; Address: $D9E9F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_ADF:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EA0F			; 4C 0F EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AE4
; Address: $D9EA0F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AE4:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EA67			; 4C 67 EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AE5
; Address: $D9EA1A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AE5:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EA3C			; 4C 3C EA | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EA35			; 4C 35 EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AE7
; Address: $D9EA35
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AE7:
	JSL $CB7308		  ; 22 08 73 CB | Jump to subroutine long
	JMP $EA64			; 4C 64 EA | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EA4E			; 4C 4E EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AE8
; Address: $D9EA47
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AE8:
	JSL $CB7342		  ; 22 42 73 CB | Jump to subroutine long
	JMP $EA64			; 4C 64 EA | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EA60			; 4C 60 EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AEC
; Address: $D9EA6C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AEC:
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EA7E			; 4C 7E EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AEF
; Address: $D9EA83
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AEF:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EA9D			; 4C 9D EA | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AF2
; Address: $D9EA9D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AF2:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EAB7			; 4C B7 EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AF5
; Address: $D9EAB0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AF5:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	JMP $EADF			; 4C DF EA | Jump to address
	LDA $354F			; AD 4F 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EAC9			; 4C C9 EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AF6
; Address: $D9EAC2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AF6:
	JSL $CB72E0		  ; 22 E0 72 CB | Jump to subroutine long
	JMP $EADF			; 4C DF EA | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EADB			; 4C DB EA | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AFA
; Address: $D9EAE5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AFA:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EAFF			; 4C FF EA | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_AFD
; Address: $D9EAFF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_AFD:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EB19			; 4C 19 EB | Jump to address
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B00
; Address: $D9EB19
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B00:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EB29			; 4C 29 EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B01
; Address: $D9EB22
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B01:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $EB3F			; 4C 3F EB | Jump to address
	LDA $362A			; AD 2A 36 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EB3B			; 4C 3B EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B05
; Address: $D9EB45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B05:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EB55			; 4C 55 EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B06
; Address: $D9EB4E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B06:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $EB6B			; 4C 6B EB | Jump to address
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EB67			; 4C 67 EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B09
; Address: $D9EB6C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B09:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EB86			; 4C 86 EB | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B0C
; Address: $D9EB86
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B0C:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EBA0			; 4C A0 EB | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B10
; Address: $D9EBA5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B10:
	LDA $3550			; AD 50 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EBB7			; 4C B7 EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B13
; Address: $D9EBBC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B13:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EBCE			; 4C CE EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B17
; Address: $D9EBD6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B17:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EBE5			; 4C E5 EB | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B1A
; Address: $D9EBEA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B1A:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EC04			; 4C 04 EC | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B1D
; Address: $D9EC04
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B1D:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EC1E			; 4C 1E EC | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B21
; Address: $D9EC23
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B21:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EC40			; 4C 40 EC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B27
; Address: $D9EC45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B27:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EC66			; 4C 66 EC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B2E
; Address: $D9EC6B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B2E:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EC7D			; 4C 7D EC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B30
; Address: $D9EC7D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B30:
	JSL $CC7A15		  ; 22 15 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EC97			; 4C 97 EC | Jump to address
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B33
; Address: $D9EC97
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B33:
	JSL $CC7A26		  ; 22 26 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ECB1			; 4C B1 EC | Jump to address
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	STA $343E			; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B37
; Address: $D9ECB6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B37:
	LDA $3553			; AD 53 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ECC8			; 4C C8 EC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B3A
; Address: $D9ECCD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B3A:
	JSL $CC931B		  ; 22 1B 93 CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $ECDD			; 4C DD EC | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B3E
; Address: $D9ECE7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B3E:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ED04			; 4C 04 ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B44
; Address: $D9ED09
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B44:
	JSL $C78FB9		  ; 22 B9 8F C7 | Jump to subroutine long
	LDA $353E			; AD 3E 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B45
; Address: $D9ED13
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B45:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED2C			; 4C 2C ED | Jump to address
	LDX #$27			 ; A2 27 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B47
; Address: $D9ED25
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B47:
	JSL $C77D1B		  ; 22 1B 7D C7 | Jump to subroutine long
	JMP $ED36			; 4C 36 ED | Jump to address
	LDX #$26			 ; A2 26 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B4B
; Address: $D9ED40
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B4B:
	LDA $3545			; AD 45 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED52			; 4C 52 ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B4E
; Address: $D9ED57
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B4E:
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $ED69			; 4C 69 ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B51
; Address: $D9ED6E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B51:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $ED8B			; 4C 8B ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B57
; Address: $D9ED90
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B57:
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EDA2			; 4C A2 ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B58
; Address: $D9ED9B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B58:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $EDBC			; 4C BC ED | Jump to address
	LDA $3554			; AD 54 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B5D
; Address: $D9EDBD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B5D:
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EDCF			; 4C CF ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B60
; Address: $D9EDD4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B60:
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EDE6			; 4C E6 ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B61
; Address: $D9EDDF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B61:
	JSL $CCD211		  ; 22 11 D2 CC | Jump to subroutine long
	JMP $EE12			; 4C 12 EE | Jump to address
	LDA $3555			; AD 55 35 | Load from absolute address into accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EDF8			; 4C F8 ED | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B62
; Address: $D9EDF1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B62:
	JSL $CD40AE		  ; 22 AE 40 CD | Jump to subroutine long
	JMP $EE12			; 4C 12 EE | Jump to address
	LDA $354B			; AD 4B 35 | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EE0E			; 4C 0E EE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B66
; Address: $D9EE13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B66:
	JSL $CC81B9		  ; 22 B9 81 CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $EE23			; 4C 23 EE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B6B
; Address: $D9EE32
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B6B:
	JSL $CC7A53		  ; 22 53 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $EE4F			; 4C 4F EE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B71
; Address: $D9EE54
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B71:
	LDA $3556			; AD 56 35 | Load from absolute address into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $EE66			; 4C 66 EE | Jump to address

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B74
; Address: $D9EE6B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B74:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $C187			; 8D 87 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B75
; Address: $D9EE72
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B75:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $C187			; 8D 87 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B76
; Address: $D9EE79
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B76:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $C187			; 8D 87 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B77
; Address: $D9EE80
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B77:
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $C187			; 8D 87 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B78
; Address: $D9EE87
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B78:
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $C187			; 8D 87 C1 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B79
; Address: $D9EE95
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B79:
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B7E
; Address: $D9EED8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B7E:
	JSR $E000			; 20 00 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank32_DmaFunction_B7F
; Address: $D9EF18
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank32_DmaFunction_B7F:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $01			  ; F0 01 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	ROL $0200,X		  ; 3E 00 02 | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
