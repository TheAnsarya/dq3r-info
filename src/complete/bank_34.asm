;==============================================================================
; Dragon Quest III - Bank $34
; Type: Audio
; Purpose: Audio processing and sound management
; Address Range: $DA0000-$DA7FFF
; Instructions: 10702
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_34"

;------------------------------------------------------------------------------
; Bank34_AudioFunction_007
; Address: $DA8024
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_007:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_00B
; Address: $DA8040
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_00B:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA $3634			; AD 34 36 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $3634			; 8D 34 36 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_00D
; Address: $DA8055
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_00D:
	JSL $C799AA		  ; 22 AA 99 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $019F			; 4C 9F 01 | Jump to address
	LDA $C193			; AD 93 C1 | Audio system operation
	STA $3636			; 8D 36 36 | Audio system operation
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_00E
; Address: $DA8067
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_00E:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LDA #$0A			 ; A9 0A | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_00F
; Address: $DA8074
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_00F:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$0B			 ; A9 0B | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C72F			; EE 2F C7 | Increment (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0088			; 4C 88 00 | Jump to address
	JMP $0078			; 4C 78 00 | Jump to address
	JMP $0149			; 4C 49 01 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_011
; Address: $DA8091
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_011:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	JMP $019C			; 4C 9C 01 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_013
; Address: $DA80A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_013:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	JMP $019C			; 4C 9C 01 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_015
; Address: $DA80B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_015:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$80			 ; A9 80 | Audio system operation
	JMP $019C			; 4C 9C 01 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_017
; Address: $DA80CA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_017:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $2201			; 9C 01 22 | Store zero to absolute
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_018
; Address: $DA80DD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_018:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $2201			; 9C 01 22 | Store zero to absolute
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_019
; Address: $DA80F0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_019:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $2201			; 9C 01 22 | Store zero to absolute
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)
	ORA $220C			; 0D 0C 22 | Logical OR with accumulator (absolute)
	CMP $08A9			; CD A9 08 | Compare accumulator (absolute)
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $2201			; 9C 01 22 | Store zero to absolute
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)
	BPL $0C			  ; 10 0C | Branch if positive

;------------------------------------------------------------------------------
; Bank34_AudioFunction_01A
; Address: $DA8116
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_01A:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $2201			; 9C 01 22 | Store zero to absolute
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_01B
; Address: $DA8129
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_01B:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$20			 ; A9 20 | Audio system operation
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $2201			; 9C 01 22 | Store zero to absolute
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_01C
; Address: $DA813C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_01C:
	JSL $CD0007		  ; 22 07 00 CD | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	BIT $4C36			; 2C 36 4C | Test bits in accumulator (absolute)
	STZ $AD01			; 9C 01 AD | Store zero to absolute
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $008B			; 4C 8B 00 | Jump to address
	CMP #$16			 ; C9 16 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $009E			; 4C 9E 00 | Jump to address
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_01D
; Address: $DA8161
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_01D:
	JMP $00B1			; 4C B1 00 | Jump to address
	CMP #$14			 ; C9 14 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $00C4			; 4C C4 00 | Jump to address
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $00D7			; 4C D7 00 | Jump to address
	CMP #$12			 ; C9 12 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $00EA			; 4C EA 00 | Jump to address
	CMP #$11			 ; C9 11 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $00FD			; 4C FD 00 | Jump to address
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0110			; 4C 10 01 | Jump to address
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0123			; 4C 23 01 | Jump to address
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0136			; 4C 36 01 | Jump to address
	JMP $01AE			; 4C AE 01 | Jump to address
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01AE			; 4C AE 01 | Jump to address
	JMP $019F			; 4C 9F 01 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_022
; Address: $DA81C6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_022:
	JMP $0248			; 4C 48 02 | Jump to address
	LDA #$36			 ; A9 36 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02A3			; 4C A3 02 | Jump to address
	LDA #$36			 ; A9 36 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02A3			; 4C A3 02 | Jump to address
	LDA #$36			 ; A9 36 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02A3			; 4C A3 02 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_029
; Address: $DA8207
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_029:
	JSL $CD02A4		  ; 22 A4 02 CD | Jump to subroutine long
	JMP $02A3			; 4C A3 02 | Jump to address
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0222			; 4C 22 02 | Jump to address
	LDA #$37			 ; A9 37 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $023C			; 4C 3C 02 | Jump to address
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0236			; 4C 36 02 | Jump to address
	LDA #$34			 ; A9 34 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $023C			; 4C 3C 02 | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02A3			; 4C A3 02 | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02A3			; 4C A3 02 | Jump to address
	LDA $3634			; AD 34 36 | Audio system operation
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01C9			; 4C C9 01 | Jump to address
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01D2			; 4C D2 01 | Jump to address
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01DB			; 4C DB 01 | Jump to address
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01E4			; 4C E4 01 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01EB			; 4C EB 01 | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01F2			; 4C F2 01 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $01F9			; 4C F9 01 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_02A
; Address: $DA8286
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_02A:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0200			; 4C 00 02 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0207			; 4C 07 02 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $020E			; 4C 0E 02 | Jump to address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $023F			; 4C 3F 02 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_02B
; Address: $DA82A4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_02B:
	JSL $CD030F		  ; 22 0F 03 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $02B6			; 4C B6 02 | Jump to address
	LDA #$34			 ; A9 34 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02BC			; 4C BC 02 | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_02C
; Address: $DA82BD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_02C:
	JSL $CD02E8		  ; 22 E8 02 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $02CF			; 4C CF 02 | Jump to address
	LDA #$35			 ; A9 35 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02E7			; 4C E7 02 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_02D
; Address: $DA82CF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_02D:
	JSL $CD030F		  ; 22 0F 03 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $02E1			; 4C E1 02 | Jump to address
	LDA #$34			 ; A9 34 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	JMP $02E7			; 4C E7 02 | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	STA $363A			; 8D 3A 36 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_02E
; Address: $DA82E8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_02E:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $030D			; 4C 0D 03 | Jump to address
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $030D			; 4C 0D 03 | Jump to address
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $030D			; 4C 0D 03 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $030E			; 4C 0E 03 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_030
; Address: $DA830F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_030:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $031E			; 4C 1E 03 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $031F			; 4C 1F 03 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_032
; Address: $DA8327
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_032:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$C9			 ; A9 C9 | Audio system operation
	LDX #$AD			 ; A2 AD | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_033
; Address: $DA8334
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_033:
	JSL $C73C96		  ; 22 96 3C C7 | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0348			; 4C 48 03 | Jump to address
	JMP $0339			; 4C 39 03 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_034
; Address: $DA834E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_034:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_036
; Address: $DA835D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_036:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	JMP $0339			; 4C 39 03 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_037
; Address: $DA836B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_037:
	JSL $CCD7EF		  ; 22 EF D7 CC | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $037F			; 4C 7F 03 | Jump to address
	JMP $0370			; 4C 70 03 | Jump to address
	LDA $3636			; AD 36 36 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_038
; Address: $DA8382
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_038:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$C9			 ; A9 C9 | Audio system operation
	LDX #$AD			 ; A2 AD | Load immediate value into X register
	LDY #$11			 ; A0 11 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_039
; Address: $DA838F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_039:
	JSL $C73C96		  ; 22 96 3C C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$11			 ; A0 11 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_03A
; Address: $DA8399
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_03A:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	LDA #$0B			 ; A9 0B | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $362B			; AD 2B 36 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_03B
; Address: $DA83A7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_03B:
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $03B7			; 4C B7 03 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_03D
; Address: $DA83B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_03D:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	JMP $0370			; 4C 70 03 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_03F
; Address: $DA83C4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_03F:
	JSL $CD01B5		  ; 22 B5 01 CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $03D6			; 4C D6 03 | Jump to address
	JMP $03D9			; 4C D9 03 | Jump to address
	JMP $03C4			; 4C C4 03 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_040
; Address: $DA83D9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_040:
	JSL $CD004F		  ; 22 4F 00 CD | Jump to subroutine long
	JMP $03C4			; 4C C4 03 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_041
; Address: $DA83E1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_041:
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$1B			 ; A9 1B | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$1B			 ; A9 1B | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_043
; Address: $DA8403
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_043:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $041C			; 4C 1C 04 | Jump to address
	JMP $040D			; 4C 0D 04 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_045
; Address: $DA8420
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_045:
	JSL $CD01B5		  ; 22 B5 01 CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0432			; 4C 32 04 | Jump to address
	JMP $0443			; 4C 43 04 | Jump to address
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0440			; 4C 40 04 | Jump to address
	JMP $045A			; 4C 5A 04 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_049
; Address: $DA844D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_049:
	JSL $CCD863		  ; 22 63 D8 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	JMP $0420			; 4C 20 04 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_04A
; Address: $DA845A
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_04A:
	JSL $CD004F		  ; 22 4F 00 CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $046C			; 4C 6C 04 | Jump to address
	JMP $046F			; 4C 6F 04 | Jump to address
	JMP $0420			; 4C 20 04 | Jump to address
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$1B			 ; A9 1B | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$1B			 ; A9 1B | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_04C
; Address: $DA8492
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_04C:
	LDA #$0F			 ; A9 0F | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$18			 ; A9 18 | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$0F			 ; A9 0F | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$1D			 ; A9 1D | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_04D
; Address: $DA84B0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_04D:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$2C			 ; A9 2C | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$50			 ; A9 50 | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$30			 ; A9 30 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$50			 ; A9 50 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_050
; Address: $DA84DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_050:
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $04EA			; 4C EA 04 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_051
; Address: $DA84E6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_051:
	JSL $CD03E1		  ; 22 E1 03 CD | Jump to subroutine long
	LDA $361A			; AD 1A 36 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0528			; 4C 28 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_052
; Address: $DA84F5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_052:
	JSL $CD01B5		  ; 22 B5 01 CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $050A			; 4C 0A 05 | Jump to address
	JMP $058B			; 4C 8B 05 | Jump to address
	JMP $0525			; 4C 25 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_053
; Address: $DA850A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_053:
	JSL $CD0AF3		  ; 22 F3 0A CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0519			; 4C 19 05 | Jump to address
	JMP $052B			; 4C 2B 05 | Jump to address
	JMP $0525			; 4C 25 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_054
; Address: $DA8519
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_054:
	JSL $CD0B6C		  ; 22 6C 0B CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0525			; 4C 25 05 | Jump to address
	JMP $055B			; 4C 5B 05 | Jump to address
	JMP $04EA			; 4C EA 04 | Jump to address
	JMP $0592			; 4C 92 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_055
; Address: $DA852B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_055:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0544			; 4C 44 05 | Jump to address
	JMP $0535			; 4C 35 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_057
; Address: $DA854A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_057:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $EA4C			; CC 4C EA | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_058
; Address: $DA855B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_058:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0574			; 4C 74 05 | Jump to address
	JMP $0565			; 4C 65 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_05D
; Address: $DA8592
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_05D:
	JSL $CD01C6		  ; 22 C6 01 CD | Jump to subroutine long
	LDA #$20			 ; A9 20 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_05E
; Address: $DA859C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_05E:
	JSL $CC2808		  ; 22 08 28 CC | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ROL $A935,X		  ; 3E 35 A9 | Rotate left (absolute,X)
	SBC $2200,Y		  ; F9 00 22 | Subtract with carry (absolute,Y)
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_060
; Address: $DA85B1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_060:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $05C3			; 4C C3 05 | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $361A			; 8D 1A 36 | Audio system operation
	JMP $05C7			; 4C C7 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_063
; Address: $DA85CB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_063:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $061C			; 4C 1C 06 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_064
; Address: $DA85D7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_064:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $05ED			; 4C ED 05 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_065
; Address: $DA85E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_065:
	JSL $CCD2F4		  ; 22 F4 D2 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	JMP $061C			; 4C 1C 06 | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_066
; Address: $DA85F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_066:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0606			; 4C 06 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_067
; Address: $DA85F9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_067:
	JSL $CCD2F4		  ; 22 F4 D2 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	JMP $061C			; 4C 1C 06 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_068
; Address: $DA8609
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_068:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $061C			; 4C 1C 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_069
; Address: $DA8612
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_069:
	JSL $CCD2F4		  ; 22 F4 D2 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_06A
; Address: $DA861D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_06A:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0631			; 4C 31 06 | Jump to address
	JMP $0622			; 4C 22 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_06D
; Address: $DA863B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_06D:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0654			; 4C 54 06 | Jump to address
	JMP $0645			; 4C 45 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_06F
; Address: $DA8658
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_06F:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	SBC $220B,X		  ; FD 0B 22 | Subtract with carry (absolute,X)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CLD				  ; D8 | Clear decimal mode flag
	CPY $5E22			; CC 22 5E | Compare Y register (absolute)
	CPY $30A9			; CC A9 30 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_071
; Address: $DA8671
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_071:
	JSL $CCD58C		  ; 22 8C D5 CC | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_073
; Address: $DA8680
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_073:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0694			; 4C 94 06 | Jump to address
	JMP $0685			; 4C 85 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_079
; Address: $DA86AA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_079:
	JSL $CCD35E		  ; 22 5E D3 CC | Jump to subroutine long
	LDX #$3A			 ; A2 3A | Load immediate value into X register
	LDA #$1C			 ; A9 1C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_07D
; Address: $DA86C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_07D:
	JSL $CCD58C		  ; 22 8C D5 CC | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_07F
; Address: $DA86D2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_07F:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $06E6			; 4C E6 06 | Jump to address
	JMP $06D7			; 4C D7 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_080
; Address: $DA86E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_080:
	JSL $CCD85D		  ; 22 5D D8 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $06F9			; 4C F9 06 | Jump to address
	JMP $06EA			; 4C EA 06 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_082
; Address: $DA86FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_082:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	INC $220B,X		  ; FE 0B 22 | Increment (absolute,X)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_087
; Address: $DA871C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_087:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_088
; Address: $DA8728
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_088:
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0737			; 4C 37 07 | Jump to address
	JMP $0728			; 4C 28 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_08C
; Address: $DA8744
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_08C:
	JSL $CCD794		  ; 22 94 D7 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_08D
; Address: $DA8750
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_08D:
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $075F			; 4C 5F 07 | Jump to address
	JMP $0750			; 4C 50 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_08E
; Address: $DA875F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_08E:
	JSL $CC73AA		  ; 22 AA 73 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_091
; Address: $DA8776
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_091:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0784			; 4C 84 07 | Jump to address
	JMP $0841			; 4C 41 08 | Jump to address
	JMP $07AE			; 4C AE 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_092
; Address: $DA8784
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_092:
	JSL $CD0B9A		  ; 22 9A 0B CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0793			; 4C 93 07 | Jump to address
	JMP $07B1			; 4C B1 07 | Jump to address
	JMP $07AE			; 4C AE 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_093
; Address: $DA8793
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_093:
	JSL $CD0BC8		  ; 22 C8 0B CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $07A2			; 4C A2 07 | Jump to address
	JMP $07E1			; 4C E1 07 | Jump to address
	JMP $07AE			; 4C AE 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_094
; Address: $DA87A2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_094:
	JSL $CD0BF6		  ; 22 F6 0B CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $07AE			; 4C AE 07 | Jump to address
	JMP $0811			; 4C 11 08 | Jump to address
	JMP $076F			; 4C 6F 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_095
; Address: $DA87B1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_095:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $07CA			; 4C CA 07 | Jump to address
	JMP $07BB			; 4C BB 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_097
; Address: $DA87D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_097:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $6F4C			; CC 4C 6F | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_098
; Address: $DA87E1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_098:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $07FA			; 4C FA 07 | Jump to address
	JMP $07EB			; 4C EB 07 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_09A
; Address: $DA8800
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_09A:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $6F4C			; CC 4C 6F | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_09C
; Address: $DA8818
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_09C:
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $082A			; 4C 2A 08 | Jump to address
	JMP $081B			; 4C 1B 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_09E
; Address: $DA8830
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_09E:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $6F4C			; CC 4C 6F | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_09F
; Address: $DA8841
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_09F:
	JSL $CD004F		  ; 22 4F 00 CD | Jump to subroutine long
	JMP $076F			; 4C 6F 07 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A0
; Address: $DA884A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A0:
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0859			; 4C 59 08 | Jump to address
	JMP $084A			; 4C 4A 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A1
; Address: $DA8859
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A1:
	JSL $CC76C1		  ; 22 C1 76 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A2
; Address: $DA8865
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A2:
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0874			; 4C 74 08 | Jump to address
	JMP $0865			; 4C 65 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A3
; Address: $DA8874
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A3:
	JSL $CCDA33		  ; 22 33 DA CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A4
; Address: $DA8881
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A4:
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0890			; 4C 90 08 | Jump to address
	JMP $0881			; 4C 81 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A5
; Address: $DA8890
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A5:
	JSL $CC73AA		  ; 22 AA 73 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A7
; Address: $DA88A0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A7:
	JSL $CD01B5		  ; 22 B5 01 CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $08B5			; 4C B5 08 | Jump to address
	JMP $097F			; 4C 7F 09 | Jump to address
	JMP $08EC			; 4C EC 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A8
; Address: $DA88B5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A8:
	JSL $CD0C3D		  ; 22 3D 0C CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $08C4			; 4C C4 08 | Jump to address
	JMP $08EF			; 4C EF 08 | Jump to address
	JMP $08EC			; 4C EC 08 | Jump to address
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $08E0			; 4C E0 08 | Jump to address
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $08DD			; 4C DD 08 | Jump to address
	JMP $091F			; 4C 1F 09 | Jump to address
	JMP $08EC			; 4C EC 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0A9
; Address: $DA88E0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0A9:
	JSL $CD0C6B		  ; 22 6B 0C CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $08EC			; 4C EC 08 | Jump to address
	JMP $094F			; 4C 4F 09 | Jump to address
	JMP $08A0			; 4C A0 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0AA
; Address: $DA88EF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0AA:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0908			; 4C 08 09 | Jump to address
	JMP $08F9			; 4C F9 08 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0AC
; Address: $DA890E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0AC:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $A04C			; CC 4C A0 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0AD
; Address: $DA891F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0AD:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0938			; 4C 38 09 | Jump to address
	JMP $0929			; 4C 29 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0AE
; Address: $DA8938
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0AE:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	ASL $220C			; 0E 0C 22 | Arithmetic shift left (absolute)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0B2
; Address: $DA8956
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0B2:
	STA $3402			; 8D 02 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0968			; 4C 68 09 | Jump to address
	JMP $0959			; 4C 59 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0B4
; Address: $DA896E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0B4:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $A04C			; CC 4C A0 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0B5
; Address: $DA897F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0B5:
	JSL $CD004F		  ; 22 4F 00 CD | Jump to subroutine long
	JMP $08A0			; 4C A0 08 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0B6
; Address: $DA8988
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0B6:
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0997			; 4C 97 09 | Jump to address
	JMP $0988			; 4C 88 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0B9
; Address: $DA899F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0B9:
	JSL $CCD794		  ; 22 94 D7 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0BA
; Address: $DA89AA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0BA:
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $09BD			; 4C BD 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0BB
; Address: $DA89B5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0BB:
	JSL $CCD847		  ; 22 47 D8 CC | Jump to subroutine long
	JMP $09DB			; 4C DB 09 | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $09CD			; 4C CD 09 | Jump to address
	JMP $09BE			; 4C BE 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0BD
; Address: $DA89D1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0BD:
	JSL $CCD940		  ; 22 40 D9 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $09EA			; 4C EA 09 | Jump to address
	JMP $09DB			; 4C DB 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0BE
; Address: $DA89EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0BE:
	JSL $CC73AA		  ; 22 AA 73 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C0
; Address: $DA89FA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C0:
	JSL $CD01B5		  ; 22 B5 01 CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0A0F			; 4C 0F 0A | Jump to address
	JMP $0A8D			; 4C 8D 0A | Jump to address
	JMP $0A2A			; 4C 2A 0A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C1
; Address: $DA8A0F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C1:
	JSL $CD0C99		  ; 22 99 0C CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0A1E			; 4C 1E 0A | Jump to address
	JMP $0A2D			; 4C 2D 0A | Jump to address
	JMP $0A2A			; 4C 2A 0A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C2
; Address: $DA8A1E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C2:
	JSL $CD0CE0		  ; 22 E0 0C CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0A2A			; 4C 2A 0A | Jump to address
	JMP $0A5D			; 4C 5D 0A | Jump to address
	JMP $09FA			; 4C FA 09 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C3
; Address: $DA8A2D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C3:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0A46			; 4C 46 0A | Jump to address
	JMP $0A37			; 4C 37 0A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C5
; Address: $DA8A4C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C5:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $FA4C			; CC 4C FA | Compare Y register (absolute)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $CCD3,X		  ; 7E D3 CC | Rotate right (absolute,X)
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0A76			; 4C 76 0A | Jump to address
	JMP $0A67			; 4C 67 0A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C7
; Address: $DA8A7C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C7:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $FA4C			; CC 4C FA | Compare Y register (absolute)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	CMP $FA4C			; CD 4C FA | Compare accumulator (absolute)
	ORA #$6B			 ; 09 6B | Logical OR with accumulator (immediate)
	LDA $3400			; AD 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C8
; Address: $DA8A99
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C8:
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0AA5			; 4C A5 0A | Jump to address
	JMP $0A96			; 4C 96 0A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0C9
; Address: $DA8AA5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0C9:
	JSL $CC73CF		  ; 22 CF 73 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0CA
; Address: $DA8AB0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0CA:
	JSL $CCD153		  ; 22 53 D1 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0AC4			; 4C C4 0A | Jump to address
	JMP $0AB5			; 4C B5 0A | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0CB
; Address: $DA8ACB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0CB:
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0AE6			; 4C E6 0A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0CC
; Address: $DA8AD6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0CC:
	JSL $CDDAF6		  ; 22 F6 DA CD | Jump to subroutine long
	LDA #$0A			 ; A9 0A | Audio system operation
	STA $3634			; 8D 34 36 | Audio system operation
	LDA #$08			 ; A9 08 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0CE
; Address: $DA8AEB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0CE:
	JSL $CCD2A4		  ; 22 A4 D2 CC | Jump to subroutine long
	JMP $0AEB			; 4C EB 0A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0CF
; Address: $DA8AF3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0CF:
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0B6A			; 4C 6A 0B | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0B6A			; 4C 6A 0B | Jump to address
	LDA #$70			 ; A9 70 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D0
; Address: $DA8B12
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D0:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0B22			; 4C 22 0B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0B6B			; 4C 6B 0B | Jump to address
	JMP $0B6A			; 4C 6A 0B | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D1
; Address: $DA8B25
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D1:
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D2
; Address: $DA8B2B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D2:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0B3B			; 4C 3B 0B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0B6B			; 4C 6B 0B | Jump to address
	JMP $0B6A			; 4C 6A 0B | Jump to address
	LDA #$50			 ; A9 50 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0B54			; 4C 54 0B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0B6B			; 4C 6B 0B | Jump to address
	JMP $0B6A			; 4C 6A 0B | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	BVC $09			  ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D3
; Address: $DA8B5D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D3:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0B6A			; 4C 6A 0B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0B6B			; 4C 6B 0B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D4
; Address: $DA8B6C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D4:
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0B98			; 4C 98 0B | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0B98			; 4C 98 0B | Jump to address
	LDA #$70			 ; A9 70 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$80			 ; A2 80 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0B98			; 4C 98 0B | Jump to address
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D5
; Address: $DA8B95
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D5:
	JMP $0B99			; 4C 99 0B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D6
; Address: $DA8B9A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D6:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0BC6			; 4C C6 0B | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0BC6			; 4C C6 0B | Jump to address
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$F0			 ; A2 F0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D7
; Address: $DA8BB9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D7:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0BC6			; 4C C6 0B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0BC7			; 4C C7 0B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D8
; Address: $DA8BC8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D8:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0BF4			; 4C F4 0B | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0BF4			; 4C F4 0B | Jump to address
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$D8			 ; A2 D8 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0BF4			; 4C F4 0B | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0BF5			; 4C F5 0B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0D9
; Address: $DA8BF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0D9:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0C3B			; 4C 3B 0C | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0DA
; Address: $DA8C04
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0DA:
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0C3B			; 4C 3B 0C | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0DB
; Address: $DA8C15
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0DB:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0C25			; 4C 25 0C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0C3C			; 4C 3C 0C | Jump to address
	JMP $0C3B			; 4C 3B 0C | Jump to address
	LDA #$78			 ; A9 78 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$90			 ; A2 90 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0C3B			; 4C 3B 0C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0C3C			; 4C 3C 0C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0DC
; Address: $DA8C3D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0DC:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0C69			; 4C 69 0C | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0C69			; 4C 69 0C | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0DD
; Address: $DA8C5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0DD:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0C69			; 4C 69 0C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0C6A			; 4C 6A 0C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0DF
; Address: $DA8C6E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0DF:
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0C97			; 4C 97 0C | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0C97			; 4C 97 0C | Jump to address
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BPL $09			  ; 10 09 | Branch if positive
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E0
; Address: $DA8C8A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E0:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0C97			; 4C 97 0C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0C98			; 4C 98 0C | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E1
; Address: $DA8C99
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E1:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0CDE			; 4C DE 0C | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0CDE			; 4C DE 0C | Jump to address
	LDA #$B0			 ; A9 B0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E2
; Address: $DA8CB8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E2:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0CC8			; 4C C8 0C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0CDF			; 4C DF 0C | Jump to address
	JMP $0CDE			; 4C DE 0C | Jump to address
	LDA #$B0			 ; A9 B0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E3
; Address: $DA8CD1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E3:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0CDE			; 4C DE 0C | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0CDF			; 4C DF 0C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E5
; Address: $DA8CE0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E5:
	LDA $362C			; AD 2C 36 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0D0C			; 4C 0C 0D | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0D0C			; 4C 0C 0D | Jump to address
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E6
; Address: $DA8CFF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E6:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0D0C			; 4C 0C 0D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $0D0D			; 4C 0D 0D | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E7
; Address: $DA8D0E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E7:
	JMP $0D35			; 4C 35 0D | Jump to address
	LDA #$23			 ; A9 23 | Audio system operation
	STA $362B			; 8D 2B 36 | Audio system operation
	JMP $0D58			; 4C 58 0D | Jump to address
	LDA #$19			 ; A9 19 | Audio system operation
	STA $362B			; 8D 2B 36 | Audio system operation
	JMP $0D58			; 4C 58 0D | Jump to address
	LDA #$0F			 ; A9 0F | Audio system operation
	STA $362B			; 8D 2B 36 | Audio system operation
	JMP $0D58			; 4C 58 0D | Jump to address
	LDA #$0F			 ; A9 0F | Audio system operation
	STA $362B			; 8D 2B 36 | Audio system operation
	JMP $0D58			; 4C 58 0D | Jump to address
	LDA $3606			; AD 06 36 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0D11			; 4C 11 0D | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0D1A			; 4C 1A 0D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0D23			; 4C 23 0D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0D2C			; 4C 2C 0D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0E8
; Address: $DA8D59
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0E8:
	JSL $CDAD91		  ; 22 91 AD CD | Jump to subroutine long
	LDA $362D			; AD 2D 36 | Audio system operation
	STA $BE81			; 8D 81 BE | Audio system operation
	LDA $BE81			; AD 81 BE | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $BE81			; 8D 81 BE | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0EA
; Address: $DA8D72
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0EA:
	JSL $CD0D0E		  ; 22 0E 0D CD | Jump to subroutine long
	LDA $362B			; AD 2B 36 | Audio system operation
	STA $BE81			; 8D 81 BE | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0EB
; Address: $DA8D7D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0EB:
	LDA #$04			 ; A9 04 | Audio system operation
	LDA $3606			; AD 06 36 | Audio system operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0D9B			; 4C 9B 0D | Jump to address
	LDA $3606			; AD 06 36 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $3606			; 8D 06 36 | Audio system operation
	JMP $0DA1			; 4C A1 0D | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3606			; 8D 06 36 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0ED
; Address: $DA8DA6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0ED:
	JSL $CC9B41		  ; 22 41 9B CC | Jump to subroutine long
	LDA #$1C			 ; A9 1C | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0EE
; Address: $DA8DB2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0EE:
	JSL $CDACE0		  ; 22 E0 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0DD1			; 4C D1 0D | Jump to address
	JMP $0DC2			; 4C C2 0D | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F0
; Address: $DA8DDB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F0:
	JSL $C687A0		  ; 22 A0 87 C6 | Jump to subroutine long
	JMP $0FCC			; 4C CC 0F | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F1
; Address: $DA8DEE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F1:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0DF7			; 4C F7 0D | Jump to address
	JMP $0DE8			; 4C E8 0D | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation
	LDA $23D0			; AD D0 23 | Audio system operation
	STA $362D			; 8D 2D 36 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F3
; Address: $DA8E07
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F3:
	JSL $CC9176		  ; 22 76 91 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0F98			; 4C 98 0F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F4
; Address: $DA8E10
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F4:
	JSL $CD0D59		  ; 22 59 0D CD | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	EOR $A909,Y		  ; 59 09 A9 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F5
; Address: $DA8E1D
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F5:
	JSL $C73814		  ; 22 14 38 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0E2A			; 4C 2A 0E | Jump to address
	JMP $0E1A			; 4C 1A 0E | Jump to address
	JMP $0F76			; 4C 76 0F | Jump to address
	LDA $3557			; AD 57 35 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0E53			; 4C 53 0E | Jump to address
	PHY				  ; 5A | Push Y register to stack
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0E4D			; 4C 4D 0E | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ASL $504C			; 0E 4C 50 | Arithmetic shift left (absolute)
	ASL $174C			; 0E 4C 17 | Arithmetic shift left (absolute)
	ASL $7A4C			; 0E 4C 7A | Arithmetic shift left (absolute)
	ASL $5A00			; 0E 00 5A | Arithmetic shift left (absolute)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0E77			; 4C 77 0E | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F7
; Address: $DA8E70
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F7:
	JSL $CD0DA2		  ; 22 A2 0D CD | Jump to subroutine long
	JMP $0E7A			; 4C 7A 0E | Jump to address
	JMP $0E17			; 4C 17 0E | Jump to address
	JMP $0F91			; 4C 91 0F | Jump to address
	LDA $3557			; AD 57 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0EA3			; 4C A3 0E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0F8
; Address: $DA8E89
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0F8:
	JMP $662209		  ; 5C 09 22 66 | Jump to address long
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $0E9D			; 4C 9D 0E | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ASL $A04C			; 0E 4C A0 | Arithmetic shift left (absolute)
	ASL $174C			; 0E 4C 17 | Arithmetic shift left (absolute)
	ASL $CA4C			; 0E 4C CA | Arithmetic shift left (absolute)
	ASL $5C00			; 0E 00 5C | Arithmetic shift left (absolute)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0EC7			; 4C C7 0E | Jump to address
	EOR $2209,X		  ; 5D 09 22 | Exclusive OR with accumulator (absolute,X)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0FA
; Address: $DA8EC0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0FA:
	JSL $CD0DA2		  ; 22 A2 0D CD | Jump to subroutine long
	JMP $0ECA			; 4C CA 0E | Jump to address
	JMP $0E17			; 4C 17 0E | Jump to address
	JMP $0F91			; 4C 91 0F | Jump to address
	LDA $3557			; AD 57 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0F24			; 4C 24 0F | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0F1E			; 4C 1E 0F | Jump to address
	STZ $09			  ; 64 09 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0FC
; Address: $DA8EEC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0FC:
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDA #$28			 ; A9 28 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_0FE
; Address: $DA8EFB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_0FE:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0F08			; 4C 08 0F | Jump to address
	JMP $0EF8			; 4C F8 0E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_102
; Address: $DA8F17
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_102:
	JSL $CD0DA2		  ; 22 A2 0D CD | Jump to subroutine long
	JMP $0F21			; 4C 21 0F | Jump to address
	JMP $0E17			; 4C 17 0E | Jump to address
	JMP $0F73			; 4C 73 0F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_103
; Address: $DA8F25
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_103:
	LSR $2209,X		  ; 5E 09 22 | Logical shift right (absolute,X)
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $0F70			; 4C 70 0F | Jump to address
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank34_AudioFunction_104
; Address: $DA8F38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_104:
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDA #$2F			 ; A9 2F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_106
; Address: $DA8F47
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_106:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $0F54			; 4C 54 0F | Jump to address
	JMP $0F44			; 4C 44 0F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_10A
; Address: $DA8F69
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_10A:
	JSL $CD0DA2		  ; 22 A2 0D CD | Jump to subroutine long
	JMP $0F73			; 4C 73 0F | Jump to address
	JMP $0E17			; 4C 17 0E | Jump to address
	JMP $0F91			; 4C 91 0F | Jump to address
	LDA $C13B			; AD 3B C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0E2D			; 4C 2D 0E | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0E7D			; 4C 7D 0E | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0ECD			; 4C CD 0E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_10C
; Address: $DA8F98
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_10C:
	JSL $CC918B		  ; 22 8B 91 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $0FB3			; 4C B3 0F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_10D
; Address: $DA8FA1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_10D:
	JSL $CD0D59		  ; 22 59 0D CD | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	LDX #$0D			 ; A2 0D | Load immediate value into X register
	CMP $C24C			; CD 4C C2 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_10E
; Address: $DA8FB3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_10E:
	JSL $CD0D59		  ; 22 59 0D CD | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	LDX #$0D			 ; A2 0D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_110
; Address: $DA8FC5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_110:
	JSL $C67A85		  ; 22 85 7A C6 | Jump to subroutine long
	JMP $0FDF			; 4C DF 0F | Jump to address
	LDA $C149			; AD 49 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0DE2			; 4C E2 0D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0FC5			; 4C C5 0F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_111
; Address: $DA8FE0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_111:
	JSL $C78FB9		  ; 22 B9 8F C7 | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$16			 ; A9 16 | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$30			 ; A9 30 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$16			 ; A9 16 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_116
; Address: $DA9013
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_116:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA $3556			; AD 56 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1083			; 4C 83 10 | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1036			; 4C 36 10 | Jump to address
	EOR ($09),Y		  ; 51 09 | Exclusive OR with accumulator ((zero page),Y)
	JMP $1095			; 4C 95 10 | Jump to address
	JMP $1080			; 4C 80 10 | Jump to address
	LDA $3557			; AD 57 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $104E			; 4C 4E 10 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_117
; Address: $DA9041
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_117:
	JSL $CD0D6E		  ; 22 6E 0D CD | Jump to subroutine long
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BPL $4C			  ; 10 4C | Branch if positive
	BRA $10			  ; 80 10 | Branch always
	LDA $3557			; AD 57 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1066			; 4C 66 10 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_118
; Address: $DA9059
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_118:
	JSL $CD0D6E		  ; 22 6E 0D CD | Jump to subroutine long
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BPL $4C			  ; 10 4C | Branch if positive
	BRA $10			  ; 80 10 | Branch always
	LDA $3557			; AD 57 35 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $107A			; 4C 7A 10 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BPL $4C			  ; 10 4C | Branch if positive
	BRA $10			  ; 80 10 | Branch always
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BPL $4C			  ; 10 4C | Branch if positive
	BPL $A9			  ; 10 A9 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	LSR $0009			; 4E 09 00 | Logical shift right (absolute)
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BPL $4C			  ; 10 4C | Branch if positive
	BPL $22			  ; 10 22 | Branch if positive
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $03B0			; CD B0 03 | Compare accumulator (absolute)
	JMP $10A5			; 4C A5 10 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_119
; Address: $DA909E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_119:
	JSL $CD0DB2		  ; 22 B2 0D CD | Jump to subroutine long
	JMP $10B2			; 4C B2 10 | Jump to address
	BVC $09			  ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_11A
; Address: $DA90A8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_11A:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CMP ($AD),Y		  ; D1 AD | Compare accumulator ((zero page),Y)
	CMP $8322			; CD 22 83 | Compare accumulator (absolute)
	CPY $0F4C			; CC 4C 0F | Compare Y register (absolute)
	BPL $6B			  ; 10 6B | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	LDA #$38			 ; A9 38 | Audio system operation
	LDX #$61			 ; A2 61 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	LDA $2208,X		  ; BD 08 22 | Audio system operation
	WDM #$3C			 ; 42 3C | Reserved instruction

;------------------------------------------------------------------------------
; Bank34_AudioFunction_11B
; Address: $DA90CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_11B:
	JSL $CC7593		  ; 22 93 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_11C
; Address: $DA90D8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_11C:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $10EF			; 4C EF 10 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_11F
; Address: $DA90F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_11F:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_121
; Address: $DA9104
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_121:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $111D			; 4C 1D 11 | Jump to address
	JMP $110E			; 4C 0E 11 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_122
; Address: $DA911D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_122:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDX #$61			 ; A2 61 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	LDA $2208,X		  ; BD 08 22 | Audio system operation
	CMP ($3C),Y		  ; D1 3C | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_123
; Address: $DA912B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_123:
	JSL $CC7593		  ; 22 93 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_124
; Address: $DA9135
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_124:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_125
; Address: $DA913F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_125:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $113F			; 4C 3F 11 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_126
; Address: $DA9148
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_126:
	JSL $CD115A		  ; 22 5A 11 CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1159			; 4C 59 11 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_12A
; Address: $DA915D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_12A:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1176			; 4C 76 11 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_12B
; Address: $DA9169
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_12B:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1176			; 4C 76 11 | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $1177			; 4C 77 11 | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_12C
; Address: $DA9178
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_12C:
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1187			; 4C 87 11 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_12E
; Address: $DA9187
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_12E:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($74,X)		  ; C1 74 | Compare accumulator ((zero page,X))
	ORA $36A9			; 0D A9 36 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_12F
; Address: $DA9196
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_12F:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $11A9			; 4C A9 11 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_131
; Address: $DA91AC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_131:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_132
; Address: $DA91B6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_132:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $CD			  ; C6 CD | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_135
; Address: $DA91CC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_135:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $11D9			; 4C D9 11 | Jump to address
	JMP $11C9			; 4C C9 11 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_136
; Address: $DA91D9
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_136:
	JSL $CDE34C		  ; 22 4C E3 CD | Jump to subroutine long
	LDA #$48			 ; A9 48 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$68			 ; A9 68 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $3428			; 8D 28 34 | Audio system operation
	LDA $3426			; AD 26 34 | Audio system operation
	STA $3430			; 8D 30 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	STA $3432			; 8D 32 34 | Audio system operation
	LDA #$28			 ; A9 28 | Audio system operation
	STA $3420			; 8D 20 34 | Audio system operation
	LDA #$3E			 ; A9 3E | Audio system operation
	STA $342A			; 8D 2A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_137
; Address: $DA9201
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_137:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $0390			; 4E 90 03 | Logical shift right (absolute)
	JMP $121A			; 4C 1A 12 | Jump to address
	JMP $120B			; 4C 0B 12 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_139
; Address: $DA921F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_139:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	SBC $E2			  ; E5 E2 | Subtract with carry (zero page)
	CMP $40A9			; CD A9 40 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_13C
; Address: $DA9233
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_13C:
	JSL $CC9E86		  ; 22 86 9E CC | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	LSR $35			  ; 46 35 | Logical shift right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_142
; Address: $DA9252
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_142:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STX $2201			; 8E 01 22 | Store X register to absolute address
	ASL $CB			  ; 06 CB | Arithmetic shift left (zero page)
	CMP $D222			; CD 22 D2 | Compare accumulator (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CMP ($9A),Y		  ; D1 9A | Compare accumulator ((zero page),Y)
	CPY $B522			; CC 22 B5 | Compare Y register (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $FB22			; CC 22 FB | Compare Y register (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $01A9			; CC A9 01 | Compare Y register (absolute)
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_144
; Address: $DA9276
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_144:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $12B9			; 4C B9 12 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_146
; Address: $DA928F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_146:
	JSL $C76954		  ; 22 54 69 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $12A0			; 4C A0 12 | Jump to address
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_147
; Address: $DA92A4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_147:
	JSL $C655F5		  ; 22 F5 55 C6 | Jump to subroutine long
	LDA $3629			; AD 29 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $12B6			; 4C B6 12 | Jump to address
	JMP $12BC			; 4C BC 12 | Jump to address
	JMP $127F			; 4C 7F 12 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_149
; Address: $DA92BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_149:
	JSL $CD1178		  ; 22 78 11 CD | Jump to subroutine long
	JMP $12D3			; 4C D3 12 | Jump to address
	LDA #$37			 ; A9 37 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_14A
; Address: $DA92C6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_14A:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $12D3			; 4C D3 12 | Jump to address
	JMP $12C3			; 4C C3 12 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_14D
; Address: $DA92DB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_14D:
	JSL $CC9AF4		  ; 22 F4 9A CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	CPY $9722			; CC 22 97 | Compare Y register (absolute)
	CPY $3722			; CC 22 37 | Compare Y register (absolute)
	CMP $EE22			; CD 22 EE | Compare accumulator (absolute)
	LDY #$CD			 ; A0 CD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_14E
; Address: $DA92FB
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_14E:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	LDA $3546			; AD 46 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1313			; 4C 13 13 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	ROL $2213,X		  ; 3E 13 22 | Rotate left (absolute,X)
	STX $63			  ; 86 63 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank34_AudioFunction_14F
; Address: $DA9317
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_14F:
	JSL $C76954		  ; 22 54 69 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1329			; 4C 29 13 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	ROL $2213,X		  ; 3E 13 22 | Rotate left (absolute,X)
	DEC $AD			  ; C6 AD | Decrement (zero page)
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $133B			; 4C 3B 13 | Jump to address
	JMP $12BC			; 4C BC 12 | Jump to address
	JMP $1313			; 4C 13 13 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_150
; Address: $DA9340
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_150:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1351			; 4C 51 13 | Jump to address
	JMP $1342			; 4C 42 13 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_151
; Address: $DA9351
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_151:
	LDA $3426			; AD 26 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC $3420			; ED 20 34 | Subtract with carry (absolute)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC $342A			; ED 2A 34 | Subtract with carry (absolute)
	STA $3428			; 8D 28 34 | Audio system operation
	LDA $3426			; AD 26 34 | Audio system operation
	STA $3436			; 8D 36 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	STA $3438			; 8D 38 34 | Audio system operation
	LDA $3436			; AD 36 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $3436			; 8D 36 34 | Audio system operation
	LDA $3438			; AD 38 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$14			 ; 69 14 | Add with carry (immediate)
	STA $3438			; 8D 38 34 | Audio system operation
	LDA #$CA			 ; A9 CA | Audio system operation
	LDX $3436			; AE 36 34 | Load from absolute address into X register
	LDY $3438			; AC 38 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_153
; Address: $DA9397
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_153:
	JSL $C740B4		  ; 22 B4 40 C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_158
; Address: $DA93B7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_158:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $13D0			; 4C D0 13 | Jump to address
	JMP $13C1			; 4C C1 13 | Jump to address
	LDA #$18			 ; A9 18 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_159
; Address: $DA93D3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_159:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$CA			 ; A9 CA | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_15D
; Address: $DA93F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_15D:
	JSL $C74042		  ; 22 42 40 C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_15F
; Address: $DA93FF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_15F:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3452			; 8D 52 34 | Audio system operation
	LDA $3452			; AD 52 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_160
; Address: $DA940C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_160:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1424			; 4C 24 14 | Jump to address
	JMP $1414			; 4C 14 14 | Jump to address
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1439			; 4C 39 14 | Jump to address
	JMP $142A			; 4C 2A 14 | Jump to address
	LDA #$9D			 ; A9 9D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_161
; Address: $DA943C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_161:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1449			; 4C 49 14 | Jump to address
	JMP $1439			; 4C 39 14 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_163
; Address: $DA9450
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_163:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$9E			 ; A9 9E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_166
; Address: $DA9468
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_166:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$B0			 ; C9 B0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1485			; 4C 85 14 | Jump to address
	JMP $1476			; 4C 76 14 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_16A
; Address: $DA9496
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_16A:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$98			 ; A9 98 | Audio system operation
	DEC				  ; 3A | Decrement accumulator
	STA $3406			; 8D 06 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_16D
; Address: $DA94AB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_16D:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	STA $D72201		  ; 8F 01 22 D7 | Audio system operation
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	ROL $C1A9			; 2E A9 C1 | Rotate left (absolute)
	BCC $01			  ; 90 01 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_173
; Address: $DA94D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_173:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_174
; Address: $DA94E1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_174:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$A1			 ; A9 A1 | Audio system operation
	LDA $7FFEA0		  ; AF A0 FE 7F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_175
; Address: $DA94EB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_175:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	LDX $0102			; AE 02 01 | Load from absolute address into X register
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $150D			; 4C 0D 15 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_176
; Address: $DA9501
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_176:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDA #$50			 ; A9 50 | Audio system operation
	LSR $8D			  ; 46 8D | Logical shift right (zero page)
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_177
; Address: $DA9513
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_177:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3452			; 8D 52 34 | Audio system operation
	LDA $3452			; AD 52 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_17A
; Address: $DA9533
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_17A:
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $154A			; 4C 4A 15 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_17B
; Address: $DA953E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_17B:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1559			; 4C 59 15 | Jump to address
	JMP $154A			; 4C 4A 15 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_17C
; Address: $DA9559
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_17C:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1569			; 4C 69 15 | Jump to address
	JMP $1559			; 4C 59 15 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_17D
; Address: $DA9569
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_17D:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1579			; 4C 79 15 | Jump to address
	JMP $1569			; 4C 69 15 | Jump to address
	LDA #$32			 ; A9 32 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_17E
; Address: $DA957C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_17E:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1589			; 4C 89 15 | Jump to address
	JMP $1579			; 4C 79 15 | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation
	LSR $068D			; 4E 8D 06 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_17F
; Address: $DA958F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_17F:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_180
; Address: $DA9595
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_180:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $15A6			; 4C A6 15 | Jump to address
	JMP $1597			; 4C 97 15 | Jump to address
	LDA #$CB			 ; A9 CB | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_181
; Address: $DA95AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_181:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	BCS $02			  ; B0 02 | Branch if carry set
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_182
; Address: $DA95B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_182:
	JSL $C740B4		  ; 22 B4 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_185
; Address: $DA95CA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_185:
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3452			; 8D 52 34 | Audio system operation
	LDA #$9C			 ; A9 9C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_187
; Address: $DA95DA
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_187:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDX $F646			; AE 46 F6 | Load from absolute address into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$AE			 ; C0 AE | Compare Y register (immediate)
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $15F2			; 4C F2 15 | Jump to address
	JMP $15E2			; 4C E2 15 | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1607			; 4C 07 16 | Jump to address
	JMP $15F8			; 4C F8 15 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_188
; Address: $DA9607
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_188:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3452			; 8D 52 34 | Audio system operation
	LDA $3452			; AD 52 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_189
; Address: $DA9614
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_189:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $162B			; 4C 2B 16 | Jump to address
	JMP $161C			; 4C 1C 16 | Jump to address
	LDX #$7D			 ; A2 7D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_18B
; Address: $DA9632
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_18B:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$50			 ; C9 50 | Compare accumulator (immediate)
	LSR $90			  ; 46 90 | Logical shift right (zero page)
	JMP $164F			; 4C 4F 16 | Jump to address
	JMP $1640			; 4C 40 16 | Jump to address
	LDX #$7F			 ; A2 7F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_18C
; Address: $DA9652
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_18C:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_18E
; Address: $DA9665
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_18E:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_18F
; Address: $DA9671
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_18F:
	JSL $C047B2		  ; 22 B2 47 C0 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	LDA #$38			 ; A9 38 | Audio system operation
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $3406			; 8D 06 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_190
; Address: $DA967E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_190:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_191
; Address: $DA9685
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_191:
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1694			; 4C 94 16 | Jump to address
	JMP $1685			; 4C 85 16 | Jump to address
	LDA $3430			; AD 30 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $3420			; 6D 20 34 | Add with carry (absolute)
	STA $3430			; 8D 30 34 | Audio system operation
	LDA $3432			; AD 32 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $342A			; 6D 2A 34 | Add with carry (absolute)
	STA $3432			; 8D 32 34 | Audio system operation
	LDA $3430			; AD 30 34 | Audio system operation
	STA $3436			; 8D 36 34 | Audio system operation
	LDA $3432			; AD 32 34 | Audio system operation
	STA $3438			; 8D 38 34 | Audio system operation
	LDA $3436			; AD 36 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $3436			; 8D 36 34 | Audio system operation
	LDA $3438			; AD 38 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$14			 ; 69 14 | Add with carry (immediate)
	STA $3438			; 8D 38 34 | Audio system operation
	LDA #$CA			 ; A9 CA | Audio system operation
	LDX $3436			; AE 36 34 | Load from absolute address into X register
	LDY $3438			; AC 38 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_193
; Address: $DA96DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_193:
	JSL $C740B4		  ; 22 B4 40 C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_197
; Address: $DA96F3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_197:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $170C			; 4C 0C 17 | Jump to address
	JMP $16FD			; 4C FD 16 | Jump to address
	LDA #$19			 ; A9 19 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_198
; Address: $DA970F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_198:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$CA			 ; A9 CA | Audio system operation
	LDX $3430			; AE 30 34 | Load from absolute address into X register
	LDY $3432			; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_19C
; Address: $DA972D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_19C:
	JSL $C74064		  ; 22 64 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_19E
; Address: $DA973B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_19E:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3452			; 8D 52 34 | Audio system operation
	LDA $3452			; AD 52 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_19F
; Address: $DA9748
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_19F:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1760			; 4C 60 17 | Jump to address
	JMP $1750			; 4C 50 17 | Jump to address
	LDA #$58			 ; A9 58 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1A3
; Address: $DA9772
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1A3:
	JSL $C7409B		  ; 22 9B 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1A5
; Address: $DA9783
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1A5:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1A6
; Address: $DA9795
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1A6:
	JMP $179C			; 4C 9C 17 | Jump to address
	JMP $178D			; 4C 8D 17 | Jump to address
	LDX #$7C			 ; A2 7C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1A8
; Address: $DA97A3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1A8:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$98			 ; C9 98 | Compare accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $17C0			; 4C C0 17 | Jump to address
	JMP $17B1			; 4C B1 17 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1AA
; Address: $DA97C6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1AA:
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $17D5			; 4C D5 17 | Jump to address
	JMP $17C6			; 4C C6 17 | Jump to address
	LDA #$CB			 ; A9 CB | Audio system operation
	LDX $3430			; AE 30 34 | Load from absolute address into X register
	LDY $3432			; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1AB
; Address: $DA97DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1AB:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	BCS $02			  ; B0 02 | Branch if carry set
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1AC
; Address: $DA97E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1AC:
	JSL $C740B4		  ; 22 B4 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1AE
; Address: $DA97F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1AE:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3452			; 8D 52 34 | Audio system operation
	LDA #$9D			 ; A9 9D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1B0
; Address: $DA9809
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1B0:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDX $F646			; AE 46 F6 | Load from absolute address into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$AE			 ; C0 AE | Compare Y register (immediate)
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1821			; 4C 21 18 | Jump to address
	JMP $1811			; 4C 11 18 | Jump to address
	LDA #$70			 ; A9 70 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1B1
; Address: $DA982A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1B1:
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1836			; 4C 36 18 | Jump to address
	JMP $1827			; 4C 27 18 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1B2
; Address: $DA9836
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1B2:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1B3
; Address: $DA9840
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1B3:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1853			; 4C 53 18 | Jump to address
	JMP $1844			; 4C 44 18 | Jump to address
	LDX #$7E			 ; A2 7E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1B5
; Address: $DA985A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1B5:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $3406			; 8D 06 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1BB
; Address: $DA987A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1BB:
	JSL $CDCB52		  ; 22 52 CB CD | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1893			; 4C 93 18 | Jump to address
	JMP $1884			; 4C 84 18 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1BF
; Address: $DA98A4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1BF:
	JSL $CDACD7		  ; 22 D7 AC CD | Jump to subroutine long
	LDA #$70			 ; A9 70 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$07			 ; A9 07 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1C2
; Address: $DA98BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1C2:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1C4
; Address: $DA98CA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1C4:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $CD			  ; C6 CD | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1C6
; Address: $DA98D5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1C6:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $18EE			; 4C EE 18 | Jump to address
	JMP $18DF			; 4C DF 18 | Jump to address
	LDA #$07			 ; A9 07 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1C7
; Address: $DA98F1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1C7:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $18FE			; 4C FE 18 | Jump to address
	JMP $18EE			; 4C EE 18 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1C8
; Address: $DA98FE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1C8:
	JSL $CDDA82		  ; 22 82 DA CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3430			; 8D 30 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1966			; 4C 66 19 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	LDA #$29			 ; A9 29 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1C9
; Address: $DA9922
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1C9:
	JSL $C7891B		  ; 22 1B 89 C7 | Jump to subroutine long
	LDA $C161			; AD 61 C1 | Audio system operation
	STA $BE77			; 8D 77 BE | Audio system operation
	LDA $C17F			; AD 7F C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $195E			; 4C 5E 19 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1CA
; Address: $DA9937
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1CA:
	JSL $CDD682		  ; 22 82 D6 CD | Jump to subroutine long
	LDA $3430			; AD 30 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $194A			; 4C 4A 19 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1CD
; Address: $DA994E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1CD:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	LDA $3430			; AD 30 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $3430			; 8D 30 34 | Audio system operation
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1CE
; Address: $DA9964
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1CE:
	ORA $2219			; 0D 19 22 | Logical OR with accumulator (absolute)
	CMP $0822			; CD 22 08 | Compare accumulator (absolute)
	CMP $A9CD,X		  ; DD CD A9 | Compare accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1CF
; Address: $DA9971
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1CF:
	JSL $C72F73		  ; 22 73 2F C7 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1984			; 4C 84 19 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1D2
; Address: $DA998B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1D2:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	INC $9A			  ; E6 9A | Increment (zero page)
	CPY $8322			; CC 22 83 | Compare Y register (absolute)
	CPY $6B68			; CC 68 6B | Compare Y register (absolute)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1D4
; Address: $DA99AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1D4:
	JSL $CDA886		  ; 22 86 A8 CD | Jump to subroutine long
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $19C1			; 4C C1 19 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1D6
; Address: $DA99C1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1D6:
	JSL $CDA88E		  ; 22 8E A8 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $19E0			; 4C E0 19 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1D7
; Address: $DA99D4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1D7:
	JSL $CDE1B1		  ; 22 B1 E1 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	ORA $9622,Y		  ; 19 22 96 | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $00A9			; CD A9 00 | Compare accumulator (absolute)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $19FF			; 4C FF 19 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1D8
; Address: $DA99F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1D8:
	JSL $CDE1A5		  ; 22 A5 E1 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1DA
; Address: $DA99FF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1DA:
	JSL $CDA89E		  ; 22 9E A8 CD | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1A18			; 4C 18 1A | Jump to address
	JMP $1A09			; 4C 09 1A | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	STA $33D6			; 8D D6 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1DB
; Address: $DA9A1E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1DB:
	JSL $C9A13F		  ; 22 3F A1 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1A3F			; 4C 3F 1A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1DC
; Address: $DA9A2D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1DC:
	JSL $C9A1DE		  ; 22 DE A1 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $33D6			; 8D D6 33 | Audio system operation
	JMP $1A22			; 4C 22 1A | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1A52			; 4C 52 1A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1DD
; Address: $DA9A4A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1DD:
	JSL $C9A1DE		  ; 22 DE A1 C9 | Jump to subroutine long
	JMP $1A3F			; 4C 3F 1A | Jump to address
	LDA $33D6			; AD D6 33 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1A71			; 4C 71 1A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1DE
; Address: $DA9A5F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1DE:
	JSL $C9A1DE		  ; 22 DE A1 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $33D6			; 8D D6 33 | Audio system operation
	JMP $1A52			; 4C 52 1A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1DF
; Address: $DA9A71
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1DF:
	JSL $C9A1C3		  ; 22 C3 A1 C9 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1E2
; Address: $DA9A84
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1E2:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1A94			; 4C 94 1A | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1E4
; Address: $DA9A96
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1E4:
	LDA #$28			 ; A9 28 | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$3E			 ; A9 3E | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$3E			 ; A9 3E | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1E5
; Address: $DA9AB4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1E5:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1AC8			; 4C C8 1A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1E6
; Address: $DA9AC4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1E6:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $0390			; 4E 90 03 | Logical shift right (absolute)
	JMP $1ADA			; 4C DA 1A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1EB
; Address: $DA9AE6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1EB:
	JSL $CDE073		  ; 22 73 E0 CD | Jump to subroutine long
	LDA #$34			 ; A9 34 | Audio system operation
	LDX #$2E			 ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1F3
; Address: $DA9B15
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1F3:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1B22			; 4C 22 1B | Jump to address
	JMP $1B12			; 4C 12 1B | Jump to address
	LDA #$90			 ; A9 90 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1F5
; Address: $DA9B2C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1F5:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1B39			; 4C 39 1B | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_1FB
; Address: $DA9B4F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_1FB:
	JSL $CDC701		  ; 22 01 C7 CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$E8			 ; A9 E8 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$13			 ; A9 13 | Audio system operation
	LDX #$11			 ; A2 11 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_209
; Address: $DA9BB1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_209:
	JSL $CCDB2B		  ; 22 2B DB CC | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0009,X		  ; 1D 09 00 | Logical OR with accumulator (absolute,X)
	ASL $0009,X		  ; 1E 09 00 | Arithmetic shift left (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_210
; Address: $DA9BE1
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_210:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	LDA #$80			 ; A9 80 | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	LSR $35			  ; 46 35 | Logical shift right (zero page)
	LDA #$04			 ; A9 04 | Audio system operation
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$3E			 ; A9 3E | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$3E			 ; A9 3E | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_217
; Address: $DA9C2C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_217:
	JSL $CCE1D1		  ; 22 D1 E1 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $1CA3			; 4C A3 1C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_219
; Address: $DA9C42
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_219:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$68			 ; A9 68 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_21E
; Address: $DA9C60
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_21E:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_220
; Address: $DA9C75
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_220:
	JSL $CD1A7D		  ; 22 7D 1A CD | Jump to subroutine long
	LDA #$0B			 ; A9 0B | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C72F			; EE 2F C7 | Increment (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1C89			; 4C 89 1C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_222
; Address: $DA9C89
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_222:
	JSL $CC8884		  ; 22 84 88 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1C98			; 4C 98 1C | Jump to address
	JMP $1CA3			; 4C A3 1C | Jump to address
	JMP $1CA3			; 4C A3 1C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_22A
; Address: $DA9CBD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_22A:
	JSL $CDE073		  ; 22 73 E0 CD | Jump to subroutine long
	LDA #$34			 ; A9 34 | Audio system operation
	LDX #$2E			 ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_22D
; Address: $DA9CD2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_22D:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_22E
; Address: $DA9CDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_22E:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC $CD			  ; C6 CD | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_230
; Address: $DA9CEB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_230:
	JSL $CC79F7		  ; 22 F7 79 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1D35			; 4C 35 1D | Jump to address
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_231
; Address: $DA9D0F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_231:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$30			 ; A9 30 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_232
; Address: $DA9D1F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_232:
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_233
; Address: $DA9D2E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_233:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	JMP $1D54			; 4C 54 1D | Jump to address
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$E8			 ; A9 E8 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$13			 ; A9 13 | Audio system operation
	LDX #$11			 ; A2 11 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_236
; Address: $DA9D58
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_236:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	ASL $90			  ; 06 90 | Arithmetic shift left (zero page)
	JMP $1D71			; 4C 71 1D | Jump to address
	JMP $1D62			; 4C 62 1D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_237
; Address: $DA9D71
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_237:
	JSL $CCD07D		  ; 22 7D D0 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_239
; Address: $DA9D82
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_239:
	JSL $C74A3A		  ; 22 3A 4A C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1DAC			; 4C AC 1D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_23C
; Address: $DA9DA0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_23C:
	JSL $CD4073		  ; 22 73 40 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	ORA $3C22,X		  ; 1D 22 3C | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CMP $2022			; CD 22 20 | Compare accumulator (absolute)
	CPY $38A9			; CC A9 38 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_23D
; Address: $DA9DB7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_23D:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1DC4			; 4C C4 1D | Jump to address
	JMP $1DB4			; 4C B4 1D | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_23E
; Address: $DA9DCA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_23E:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$98			 ; A9 98 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_23F
; Address: $DA9DD4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_23F:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_240
; Address: $DA9DDE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_240:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$28			 ; A9 28 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_241
; Address: $DA9DE8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_241:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_242
; Address: $DA9DF2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_242:
	JSL $CCD420		  ; 22 20 D4 CC | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_244
; Address: $DA9E03
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_244:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1E10			; 4C 10 1E | Jump to address
	JMP $1E00			; 4C 00 1E | Jump to address
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_245
; Address: $DA9E16
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_245:
	JSL $CCD430		  ; 22 30 D4 CC | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $1E2F			; 4C 2F 1E | Jump to address
	JMP $1E20			; 4C 20 1E | Jump to address
	LDA #$70			 ; A9 70 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	ORA $0390,Y		  ; 19 90 03 | Logical OR with accumulator (absolute,Y)
	JMP $1E44			; 4C 44 1E | Jump to address
	JMP $1E35			; 4C 35 1E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_24B
; Address: $DA9E58
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_24B:
	JSL $CDE0D0		  ; 22 D0 E0 CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank34_AudioFunction_24E
; Address: $DA9E76
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_24E:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_24F
; Address: $DA9E7C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_24F:
	JSL $CC892C		  ; 22 2C 89 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1ECD			; 4C CD 1E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_255
; Address: $DA9E9F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_255:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT $0009			; 2C 09 00 | Test bits in accumulator (absolute)
	AND $0009			; 2D 09 00 | Logical AND with accumulator (absolute)
	ROL $2209			; 2E 09 22 | Rotate left (absolute)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_25B
; Address: $DA9ECE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_25B:
	JMP $1F07			; 4C 07 1F | Jump to address
	LDA #$CF			 ; A9 CF | Audio system operation
	STA $BE79			; 8D 79 BE | Audio system operation
	JMP $1F3A			; 4C 3A 1F | Jump to address
	LDA #$CE			 ; A9 CE | Audio system operation
	STA $BE79			; 8D 79 BE | Audio system operation
	JMP $1F3A			; 4C 3A 1F | Jump to address
	LDA #$CB			 ; A9 CB | Audio system operation
	STA $BE79			; 8D 79 BE | Audio system operation
	JMP $1F3A			; 4C 3A 1F | Jump to address
	LDA #$CD			 ; A9 CD | Audio system operation
	STA $BE79			; 8D 79 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_25C
; Address: $DA9EF2
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_25C:
	JMP $1F3A			; 4C 3A 1F | Jump to address
	LDA #$CC			 ; A9 CC | Audio system operation
	STA $BE79			; 8D 79 BE | Audio system operation
	JMP $1F3A			; 4C 3A 1F | Jump to address
	LDA #$CA			 ; A9 CA | Audio system operation
	STA $BE79			; 8D 79 BE | Audio system operation
	JMP $1F3A			; 4C 3A 1F | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1ED1			; 4C D1 1E | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1EDA			; 4C DA 1E | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1EE3			; 4C E3 1E | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1EEC			; 4C EC 1E | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1EF5			; 4C F5 1E | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1EFE			; 4C FE 1E | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_25D
; Address: $DA9F3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_25D:
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1F4A			; 4C 4A 1F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_261
; Address: $DA9F55
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_261:
	LDA #$00			 ; A9 00 | Audio system operation
	STA $343E			; 8D 3E 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_262
; Address: $DA9F5F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_262:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1F90			; 4C 90 1F | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_263
; Address: $DA9F7A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_263:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_264
; Address: $DA9F8C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_264:
	JSL $CD209A		  ; 22 9A 20 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_265
; Address: $DA9F94
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_265:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1FC5			; 4C C5 1F | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_266
; Address: $DA9FAF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_266:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_267
; Address: $DA9FC1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_267:
	JSL $CD209A		  ; 22 9A 20 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_268
; Address: $DA9FC9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_268:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1FFA			; 4C FA 1F | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_269
; Address: $DA9FE4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_269:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_26A
; Address: $DA9FF6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_26A:
	JSL $CD209A		  ; 22 9A 20 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_26B
; Address: $DA9FFE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_26B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $202F			; 4C 2F 20 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_26C
; Address: $DAA019
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_26C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_26D
; Address: $DAA02B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_26D:
	JSL $CD209A		  ; 22 9A 20 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_26F
; Address: $DAA03F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_26F:
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2064			; 4C 64 20 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_270
; Address: $DAA04E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_270:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_271
; Address: $DAA060
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_271:
	JSL $CD209A		  ; 22 9A 20 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_272
; Address: $DAA068
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_272:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2099			; 4C 99 20 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_273
; Address: $DAA083
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_273:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_275
; Address: $DAA09A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_275:
	LDA $343E			; AD 3E 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $343E			; 8D 3E 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_276
; Address: $DAA0A4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_276:
	JSL $CD1ECE		  ; 22 CE 1E CD | Jump to subroutine long
	JMP $20DE			; 4C DE 20 | Jump to address
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_277
; Address: $DAA0B1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_277:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA $4C09			; 0D 09 4C | Logical OR with accumulator (absolute)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_278
; Address: $DAA0BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_278:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $4C09			; 0E 09 4C | Arithmetic shift left (absolute)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_279
; Address: $DAA0C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_279:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_27A
; Address: $DAA0CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_27A:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $4C09			; 0E 09 4C | Arithmetic shift left (absolute)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_27B
; Address: $DAA0D5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_27B:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_27C
; Address: $DAA0DE
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_27C:
	LDA $343E			; AD 3E 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $20AB			; 4C AB 20 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $20B1			; 4C B1 20 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $20BA			; 4C BA 20 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $20C3			; 4C C3 20 | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $20CC			; 4C CC 20 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $20D5			; 4C D5 20 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_27F
; Address: $DAA11D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_27F:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2172			; 4C 72 21 | PPU graphics register access
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $216F			; 4C 6F 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_284
; Address: $DAA14D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_284:
	JSL $CCD878		  ; 22 78 D8 CC | Jump to subroutine long
	JMP $216F			; 4C 6F 21 | PPU graphics register access
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $213F			; 4C 3F 21 | PPU graphics register access
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2146			; 4C 46 21 | PPU graphics register access
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $214D			; 4C 4D 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_285
; Address: $DAA16F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_285:
	JMP $21BB			; 4C BB 21 | PPU graphics register access
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $21BB			; 4C BB 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_28A
; Address: $DAA199
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_28A:
	JSL $CCD88A		  ; 22 8A D8 CC | Jump to subroutine long
	JMP $21BB			; 4C BB 21 | PPU graphics register access
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $218B			; 4C 8B 21 | PPU graphics register access
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2192			; 4C 92 21 | PPU graphics register access
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2199			; 4C 99 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_28E
; Address: $DAA1CB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_28E:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $222B			; 4C 2B 22 | Jump to address
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2224			; 4C 24 22 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_294
; Address: $DAA1FF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_294:
	JSL $CCD878		  ; 22 78 D8 CC | Jump to subroutine long
	JMP $2221			; 4C 21 22 | Jump to address
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_295
; Address: $DAA20C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_295:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $21F1			; 4C F1 21 | PPU graphics register access
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $21F8			; 4C F8 21 | PPU graphics register access
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $21FF			; 4C FF 21 | PPU graphics register access
	JMP $2228			; 4C 28 22 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_296
; Address: $DAA224
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_296:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	JMP $227F			; 4C 7F 22 | Jump to address
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $227B			; 4C 7B 22 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_29C
; Address: $DAA256
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_29C:
	JSL $CCD88A		  ; 22 8A D8 CC | Jump to subroutine long
	JMP $2278			; 4C 78 22 | Jump to address
	LDA $3420			; AD 20 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2248			; 4C 48 22 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $224F			; 4C 4F 22 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2256			; 4C 56 22 | Jump to address
	JMP $227F			; 4C 7F 22 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2AB
; Address: $DAA2BC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2AB:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	AND ($CD,X)		  ; 21 CD | Logical AND with accumulator ((zero page,X))
	ORA $0009,X		  ; 1D 09 00 | Logical OR with accumulator (absolute,X)
	ASL $0009,X		  ; 1E 09 00 | Arithmetic shift left (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2B0
; Address: $DAA2E3
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2B0:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	CPY #$21			 ; C0 21 | PPU graphics register access
	CMP $1400			; CD 00 14 | Compare accumulator (absolute)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDA $CDAC,X		  ; BD AC CD | Audio system operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0009,Y		  ; 19 09 00 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$A9			 ; 09 A9 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2B2
; Address: $DAA317
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2B2:
	JSL $C751DF		  ; 22 DF 51 C7 | Jump to subroutine long
	LDA $C11D			; AD 1D C1 | Audio system operation
	STA $361A			; 8D 1A 36 | Audio system operation
	LDA #$17			 ; A9 17 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2B4
; Address: $DAA328
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2B4:
	JSL $C751DF		  ; 22 DF 51 C7 | Jump to subroutine long
	LDA $C11D			; AD 1D C1 | Audio system operation
	STA $361C			; 8D 1C 36 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2B9
; Address: $DAA343
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2B9:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	CPY #$21			 ; C0 21 | PPU graphics register access
	CMP $0800			; CD 00 08 | Compare accumulator (absolute)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDA $CDAC,X		  ; BD AC CD | Audio system operation
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	CPY $03B0			; CC B0 03 | Compare Y register (absolute)
	JMP $2379			; 4C 79 23 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2BA
; Address: $DAA367
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2BA:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	CMP $BD22			; CD 22 BD | Compare accumulator (absolute)
	LDY $00CD			; AC CD 00 | Load from absolute address into Y register
	BPL $09			  ; 10 09 | Branch if positive

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2BE
; Address: $DAA386
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2BE:
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $23C6			; 4C C6 23 | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $23BF			; 4C BF 23 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2C0
; Address: $DAA3A1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2C0:
	JSL $122209		  ; 22 09 22 12 | Jump to subroutine long
	AND ($CD,X)		  ; 21 CD | Logical AND with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT $09			  ; 24 09 | Test bits in accumulator (zero page)
	AND $09			  ; 25 09 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2C4
; Address: $DAA3BF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2C4:
	JSL $CD22BC		  ; 22 BC 22 CD | Jump to subroutine long
	JMP $23DC			; 4C DC 23 | Jump to address
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $23D8			; 4C D8 23 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2C9
; Address: $DAA3E2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2C9:
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2425			; 4C 25 24 | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $241E			; 4C 1E 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2CB
; Address: $DAA3FF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2CB:
	JSL $CD2112		  ; 22 12 21 CD | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	STY $22			  ; 84 22 | Store Y register to zero page
	CMP $8322			; CD 22 83 | Compare accumulator (absolute)
	CPY $224C			; CC 4C 22 | Compare Y register (absolute)
	BIT $22			  ; 24 22 | Test bits in accumulator (zero page)
	LDY $CD22,X		  ; BC 22 CD | Load from absolute,X into Y register
	JMP $243B			; 4C 3B 24 | Jump to address
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2437			; 4C 37 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2CE
; Address: $DAA43C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2CE:
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $244E			; 4C 4E 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2D0
; Address: $DAA44E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2D0:
	JSL $C751F0		  ; 22 F0 51 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $245E			; 4C 5E 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2D6
; Address: $DAA46F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2D6:
	JSL $CCD7EF		  ; 22 EF D7 CC | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	ADC $09			  ; 65 09 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2D7
; Address: $DAA47C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2D7:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2D9
; Address: $DAA48D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2D9:
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $249F			; 4C 9F 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2DD
; Address: $DAA4A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2DD:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $24B9			; 4C B9 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2DF
; Address: $DAA4BC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2DF:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$A8			 ; C9 A8 | Compare accumulator (immediate)
	ADC ($90,X)		  ; 61 90 | Add with carry ((zero page,X))
	JMP $24D2			; 4C D2 24 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2E0
; Address: $DAA4CB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2E0:
	JSL $CC7782		  ; 22 82 77 CC | Jump to subroutine long
	JMP $24C0			; 4C C0 24 | Jump to address
	LDA #$76			 ; A9 76 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2E2
; Address: $DAA4DC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2E2:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2E4
; Address: $DAA4ED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2E4:
	JSL $C73E56		  ; 22 56 3E C7 | Jump to subroutine long
	LDA #$06			 ; A9 06 | Audio system operation
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	ADC $09			  ; 65 09 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2E5
; Address: $DAA4FA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2E5:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2E7
; Address: $DAA50D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2E7:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$32			 ; A9 32 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2E9
; Address: $DAA51E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2E9:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2EA
; Address: $DAA528
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2EA:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2EC
; Address: $DAA536
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2EC:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2ED
; Address: $DAA540
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2ED:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2EF
; Address: $DAA54E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2EF:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2F0
; Address: $DAA558
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2F0:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2F2
; Address: $DAA566
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2F2:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2F3
; Address: $DAA570
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2F3:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2F5
; Address: $DAA57E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2F5:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2F8
; Address: $DAA593
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2F8:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$0D			 ; A9 0D | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2F9
; Address: $DAA59D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2F9:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$70			 ; A9 70 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2FD
; Address: $DAA5B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2FD:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$58			 ; A9 58 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_2FF
; Address: $DAA5C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_2FF:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$0F			 ; A9 0F | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_300
; Address: $DAA5CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_300:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_302
; Address: $DAA5DB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_302:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$17			 ; A9 17 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_304
; Address: $DAA5EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_304:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$0A			 ; A9 0A | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_306
; Address: $DAA5FD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_306:
	JSL $C73E56		  ; 22 56 3E C7 | Jump to subroutine long
	LDA #$07			 ; A9 07 | Audio system operation
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	ADC $09			  ; 65 09 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_307
; Address: $DAA60A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_307:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_30A
; Address: $DAA624
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_30A:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$58			 ; A9 58 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_30D
; Address: $DAA639
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_30D:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_310
; Address: $DAA64E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_310:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_314
; Address: $DAA667
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_314:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_317
; Address: $DAA679
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_317:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_318
; Address: $DAA683
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_318:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$B0			 ; A9 B0 | Audio system operation
	STA $340C			; 8D 0C 34 | Audio system operation
	LDA #$70			 ; A9 70 | Audio system operation
	STA $3408			; 8D 08 34 | Audio system operation
	LDA $3408			; AD 08 34 | Audio system operation
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $26A2			; 4C A2 26 | Jump to address
	JMP $2693			; 4C 93 26 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_31A
; Address: $DAA6A9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_31A:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_31D
; Address: $DAA6BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_31D:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$06			 ; A9 06 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_320
; Address: $DAA6D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_320:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$07			 ; A9 07 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_321
; Address: $DAA6DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_321:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$68			 ; A9 68 | Audio system operation
	WDM #$8D			 ; 42 8D | Reserved instruction

;------------------------------------------------------------------------------
; Bank34_AudioFunction_324
; Address: $DAA6EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_324:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$08			 ; A9 08 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_325
; Address: $DAA6F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_325:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$50			 ; A9 50 | Audio system operation
	LSR $8D			  ; 46 8D | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_327
; Address: $DAA707
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_327:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2726			; 4C 26 27 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_328
; Address: $DAA71A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_328:
	JSL $CC7578		  ; 22 78 75 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BPL $27			  ; 10 27 | Branch if positive

;------------------------------------------------------------------------------
; Bank34_AudioFunction_329
; Address: $DAA726
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_329:
	JSL $C73F9F		  ; 22 9F 3F C7 | Jump to subroutine long
	LDA $C125			; AD 25 C1 | Audio system operation
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $C127			; AD 27 C1 | Audio system operation
	STA $3428			; 8D 28 34 | Audio system operation
	LDA $C125			; AD 25 C1 | Audio system operation
	STA $3430			; 8D 30 34 | Audio system operation
	LDA $C127			; AD 27 C1 | Audio system operation
	STA $3432			; 8D 32 34 | Audio system operation
	LDA #$28			 ; A9 28 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3426			; AD 26 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$18			 ; 69 18 | Add with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_32C
; Address: $DAA76A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_32C:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$09			 ; A9 09 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_32E
; Address: $DAA77D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_32E:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_32F
; Address: $DAA787
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_32F:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$A8			 ; A9 A8 | Audio system operation
	ADC ($8D,X)		  ; 61 8D | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_335
; Address: $DAA7A9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_335:
	JSL $CD2463		  ; 22 63 24 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $27BD			; 4C BD 27 | Jump to address
	JMP $27AE			; 4C AE 27 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_337
; Address: $DAA7C4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_337:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ADC #$3F			 ; 69 3F | Add with carry (immediate)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$69			 ; C0 69 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $27DC			; 4C DC 27 | Jump to address
	JMP $27CC			; 4C CC 27 | Jump to address
	LDA #$38			 ; A9 38 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA $0390,Y		  ; 19 90 03 | Logical OR with accumulator (absolute,Y)
	JMP $27F1			; 4C F1 27 | Jump to address
	JMP $27E2			; 4C E2 27 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_33A
; Address: $DAA800
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_33A:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	STA $90F63F		  ; 8F 3F F6 90 | Audio system operation
	JMP $2810			; 4C 10 28 | Jump to address
	JMP $2800			; 4C 00 28 | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation
	ORA $0A8D,Y		  ; 19 8D 0A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_33B
; Address: $DAA816
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_33B:
	JSL $CDAF51		  ; 22 51 AF CD | Jump to subroutine long
	LDA #$0A			 ; A9 0A | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C72F			; EE 2F C7 | Increment (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $282A			; 4C 2A 28 | Jump to address
	JMP $281A			; 4C 1A 28 | Jump to address
	LDA #$3C			 ; A9 3C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_33D
; Address: $DAA834
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_33D:
	JSL $C72FE4		  ; 22 E4 2F C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	ORA $6B36,Y		  ; 19 36 6B | Logical OR with accumulator (absolute,Y)
	LDA $3554			; AD 54 35 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_33E
; Address: $DAA842
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_33E:
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2853			; 4C 53 28 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_33F
; Address: $DAA84A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_33F:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	EOR $2228,Y		  ; 59 28 22 | Exclusive OR with accumulator (absolute,Y)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_341
; Address: $DAA85F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_341:
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $286E			; 4C 6E 28 | Jump to address
	JMP $285F			; 4C 5F 28 | Jump to address
	LDA #$08			 ; A9 08 | Audio system operation
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	ADC $09			  ; 65 09 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_342
; Address: $DAA877
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_342:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_343
; Address: $DAA883
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_343:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2896			; 4C 96 28 | Jump to address
	JMP $2887			; 4C 87 28 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_344
; Address: $DAA896
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_344:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $28A9			; 4C A9 28 | Jump to address
	JMP $289A			; 4C 9A 28 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_345
; Address: $DAA8AF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_345:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $28C2			; 4C C2 28 | Jump to address
	JMP $28B3			; 4C B3 28 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_346
; Address: $DAA8C2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_346:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $28D5			; 4C D5 28 | Jump to address
	JMP $28C6			; 4C C6 28 | Jump to address
	LDX $3430			; AE 30 34 | Load from absolute address into X register
	LDY $3432			; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_348
; Address: $DAA8DF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_348:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_349
; Address: $DAA8E9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_349:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $28FC			; 4C FC 28 | Jump to address
	JMP $28ED			; 4C ED 28 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_34B
; Address: $DAA901
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_34B:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3408			; AD 08 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2912			; 4C 12 29 | Jump to address
	JMP $2903			; 4C 03 29 | Jump to address
	LDA #$07			 ; A9 07 | Audio system operation
	LDX #$A0			 ; A2 A0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	LDA #$0B			 ; A9 0B | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_34E
; Address: $DAA92F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_34E:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$58			 ; A9 58 | Audio system operation
	STA $3408			; 8D 08 34 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_34F
; Address: $DAA93B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_34F:
	PHA				  ; 48 | Push accumulator to stack
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $294C			; 4C 4C 29 | Jump to address
	JMP $293D			; 4C 3D 29 | Jump to address
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_350
; Address: $DAA94F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_350:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$18			 ; A9 18 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_351
; Address: $DAA95D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_351:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_352
; Address: $DAA96B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_352:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_353
; Address: $DAA976
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_353:
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2985			; 4C 85 29 | Jump to address
	JMP $2976			; 4C 76 29 | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_354
; Address: $DAA988
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_354:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $299B			; 4C 9B 29 | Jump to address
	JMP $298C			; 4C 8C 29 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_355
; Address: $DAA99E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_355:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$7C			 ; A9 7C | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $29B8			; 4C B8 29 | Jump to address
	JMP $29A9			; 4C A9 29 | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_356
; Address: $DAA9BB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_356:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$24			 ; A9 24 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $29D5			; 4C D5 29 | Jump to address
	JMP $29C6			; 4C C6 29 | Jump to address
	LDA #$3E			 ; A9 3E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_357
; Address: $DAA9D8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_357:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$7C			 ; A9 7C | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $29F2			; 4C F2 29 | Jump to address
	JMP $29E3			; 4C E3 29 | Jump to address
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_358
; Address: $DAA9F5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_358:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$7C			 ; A9 7C | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$18			 ; A9 18 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_359
; Address: $DAAA03
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_359:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$7C			 ; A9 7C | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_35A
; Address: $DAAA16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_35A:
	JMP $2A1D			; 4C 1D 2A | Jump to address
	JMP $2A0E			; 4C 0E 2A | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_35B
; Address: $DAAA20
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_35B:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$24			 ; A9 24 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$B0			 ; C9 B0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2A3A			; 4C 3A 2A | Jump to address
	JMP $2A2B			; 4C 2B 2A | Jump to address
	LDA #$90			 ; A9 90 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_35D
; Address: $DAAA44
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_35D:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$68			 ; C9 68 | Compare accumulator (immediate)
	WDM #$90			 ; 42 90 | Reserved instruction
	JMP $2A57			; 4C 57 2A | Jump to address
	JMP $2A48			; 4C 48 2A | Jump to address
	LDA #$38			 ; A9 38 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_35E
; Address: $DAAA5A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_35E:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$50			 ; C9 50 | Compare accumulator (immediate)
	LSR $90			  ; 46 90 | Logical shift right (zero page)
	JMP $2A74			; 4C 74 2A | Jump to address
	JMP $2A65			; 4C 65 2A | Jump to address
	LDA #$18			 ; A9 18 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_35F
; Address: $DAAA77
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_35F:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4C			 ; A9 4C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_360
; Address: $DAAA85
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_360:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4C			 ; A9 4C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_361
; Address: $DAAA93
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_361:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$51			 ; A9 51 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_362
; Address: $DAAAA1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_362:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4D			 ; A9 4D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_363
; Address: $DAAAAF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_363:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4C			 ; A9 4C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_364
; Address: $DAAABD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_364:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4C			 ; A9 4C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_365
; Address: $DAAACB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_365:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4C			 ; A9 4C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_366
; Address: $DAAAD9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_366:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$4C			 ; A9 4C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_367
; Address: $DAAAE7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_367:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $340C			; AD 0C 34 | Audio system operation
	CMP #$A8			 ; C9 A8 | Compare accumulator (immediate)
	ADC ($90,X)		  ; 61 90 | Add with carry ((zero page,X))
	JMP $2B01			; 4C 01 2B | Jump to address
	JMP $2AF2			; 4C F2 2A | Jump to address
	LDA #$A9			 ; A9 A9 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_36B
; Address: $DAAB19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_36B:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$28			 ; A9 28 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_371
; Address: $DAAB4A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_371:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$45			 ; A9 45 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_372
; Address: $DAAB58
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_372:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$A9			 ; A9 A9 | Audio system operation
	LDX #$51			 ; A2 51 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_375
; Address: $DAAB68
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_375:
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_376
; Address: $DAAB6C
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_376:
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_377
; Address: $DAAB70
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_377:
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_37D
; Address: $DAAB8A
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_37D:
	JMP $2C0B			; 4C 0B 2C | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $2C3E			; 4C 3E 2C | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $2C3E			; 4C 3E 2C | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$A0			 ; A9 A0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $2C3E			; 4C 3E 2C | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$A0			 ; A9 A0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_37E
; Address: $DAABD8
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_37E:
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $2C3E			; 4C 3E 2C | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$F0			 ; A9 F0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $2C3E			; 4C 3E 2C | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$F0			 ; A9 F0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $2C3E			; 4C 3E 2C | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2B8D			; 4C 8D 2B | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BA2			; 4C A2 2B | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BB7			; 4C B7 2B | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BCC			; 4C CC 2B | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BE1			; 4C E1 2B | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2BF6			; 4C F6 2B | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	STA $9680			; 8D 80 96 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	STA $9682			; 8D 82 96 | Audio system operation
	JMP $2D2B			; 4C 2B 2D | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2C65			; 4C 65 2C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_380
; Address: $DAAC5E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_380:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2C6F			; 4C 6F 2C | Jump to address
	LDX #$62			 ; A2 62 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_381
; Address: $DAAC6B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_381:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D5E			; 4C 5E 2D | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2C8A			; 4C 8A 2C | Jump to address
	LDX #$65			 ; A2 65 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_382
; Address: $DAAC83
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_382:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2C94			; 4C 94 2C | Jump to address
	LDX #$64			 ; A2 64 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_383
; Address: $DAAC90
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_383:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D5E			; 4C 5E 2D | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2CAF			; 4C AF 2C | Jump to address
	LDX #$67			 ; A2 67 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_384
; Address: $DAACA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_384:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2CB9			; 4C B9 2C | Jump to address
	LDX #$66			 ; A2 66 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_385
; Address: $DAACB5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_385:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D5E			; 4C 5E 2D | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2CD4			; 4C D4 2C | Jump to address
	LDX #$69			 ; A2 69 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_386
; Address: $DAACCD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_386:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2CDE			; 4C DE 2C | Jump to address
	LDX #$68			 ; A2 68 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_387
; Address: $DAACDA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_387:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D5E			; 4C 5E 2D | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2CF9			; 4C F9 2C | Jump to address
	LDX #$6B			 ; A2 6B | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_388
; Address: $DAACF2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_388:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D03			; 4C 03 2D | Jump to address
	LDX #$6A			 ; A2 6A | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_389
; Address: $DAACFF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_389:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D5E			; 4C 5E 2D | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $2D1E			; 4C 1E 2D | Jump to address
	LDX #$6D			 ; A2 6D | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_38A
; Address: $DAAD17
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_38A:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D28			; 4C 28 2D | Jump to address
	LDX #$6C			 ; A2 6C | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_38B
; Address: $DAAD24
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_38B:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2D5E			; 4C 5E 2D | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2C4D			; 4C 4D 2C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2C72			; 4C 72 2C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2C97			; 4C 97 2C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2CBC			; 4C BC 2C | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2CE1			; 4C E1 2C | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2D06			; 4C 06 2D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_38C
; Address: $DAAD5F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_38C:
	JMP $2E7C			; 4C 7C 2E | Jump to address
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_38D
; Address: $DAAD74
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_38D:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always

;------------------------------------------------------------------------------
; Bank34_AudioFunction_38E
; Address: $DAAD7E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_38E:
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_38F
; Address: $DAAD8A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_38F:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2EAF			; 4C AF 2E | Jump to address
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_390
; Address: $DAADA3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_390:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_391
; Address: $DAADB9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_391:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2EAF			; 4C AF 2E | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6F			 ; A2 6F | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_392
; Address: $DAADD2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_392:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$70			 ; A2 70 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_393
; Address: $DAADE8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_393:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2EAF			; 4C AF 2E | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6F			 ; A2 6F | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_394
; Address: $DAAE01
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_394:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_395
; Address: $DAAE09
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_395:
	BRA $96			  ; 80 96 | Branch always
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$70			 ; A2 70 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_396
; Address: $DAAE17
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_396:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2EAF			; 4C AF 2E | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_397
; Address: $DAAE30
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_397:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_398
; Address: $DAAE46
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_398:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2EAF			; 4C AF 2E | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_399
; Address: $DAAE5F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_399:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$6E			 ; A2 6E | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_39A
; Address: $DAAE75
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_39A:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	JMP $2EAF			; 4C AF 2E | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2D62			; 4C 62 2D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2D91			; 4C 91 2D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_39B
; Address: $DAAE94
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_39B:
	JMP $2DC0			; 4C C0 2D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2DEF			; 4C EF 2D | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2E1E			; 4C 1E 2E | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2E4D			; 4C 4D 2E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_39C
; Address: $DAAEAF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_39C:
	JSL $CC7A06		  ; 22 06 7A CC | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2EBB			; 4C BB 2E | Jump to address
	JMP $300B			; 4C 0B 30 | Jump to address
	JMP $2FD8			; 4C D8 2F | Jump to address
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_39D
; Address: $DAAED0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_39D:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_39E
; Address: $DAAEE6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_39E:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $300B			; 4C 0B 30 | Jump to address
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_39F
; Address: $DAAEFF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_39F:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A0
; Address: $DAAF15
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A0:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $300B			; 4C 0B 30 | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A1
; Address: $DAAF1E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A1:
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A2
; Address: $DAAF2E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A2:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A3
; Address: $DAAF44
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A3:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $300B			; 4C 0B 30 | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A4
; Address: $DAAF5D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A4:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CC			 ; A2 CC | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A5
; Address: $DAAF73
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A5:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $300B			; 4C 0B 30 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A6
; Address: $DAAF8C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A6:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A8
; Address: $DAAFA9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A8:
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3A9
; Address: $DAAFBB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3A9:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3AA
; Address: $DAAFD1
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3AA:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $300B			; 4C 0B 30 | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2EBE			; 4C BE 2E | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2EED			; 4C ED 2E | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2F1C			; 4C 1C 2F | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2F4B			; 4C 4B 2F | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2F7A			; 4C 7A 2F | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $2FA9			; 4C A9 2F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3AC
; Address: $DAB010
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3AC:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3052			; 4C 52 30 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3AD
; Address: $DAB027
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3AD:
	JSL $CD2B74		  ; 22 74 2B CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3AE
; Address: $DAB02F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3AE:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B0
; Address: $DAB047
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B0:
	JSL $CD2B81		  ; 22 81 2B CD | Jump to subroutine long
	JMP $3095			; 4C 95 30 | Jump to address
	JMP $31A8			; 4C A8 31 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B2
; Address: $DAB057
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B2:
	JSL $CDB292		  ; 22 92 B2 CD | Jump to subroutine long
	LDA $343A			; AD 3A 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $306D			; 4C 6D 30 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B3
; Address: $DAB066
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B3:
	JSL $CDB27B		  ; 22 7B B2 CD | Jump to subroutine long
	JMP $3057			; 4C 57 30 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B4
; Address: $DAB071
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B4:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B7
; Address: $DAB091
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B7:
	JSL $CDB274		  ; 22 74 B2 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $30A4			; 4C A4 30 | Jump to address
	JMP $3095			; 4C 95 30 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B8
; Address: $DAB0A8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B8:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3B9
; Address: $DAB0C0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3B9:
	JSL $CD39F3		  ; 22 F3 39 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$98			 ; C9 98 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $30DD			; 4C DD 30 | Jump to address
	JMP $30CE			; 4C CE 30 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3BD
; Address: $DAB0FA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3BD:
	JSL $CD3BC8		  ; 22 C8 3B CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $310D			; 4C 0D 31 | Jump to address
	JMP $30FE			; 4C FE 30 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3BE
; Address: $DAB111
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3BE:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA #$74			 ; A9 74 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3C0
; Address: $DAB130
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3C0:
	JSL $CD3CB3		  ; 22 B3 3C CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3146			; 4C 46 31 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3C1
; Address: $DAB13F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3C1:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $3134			; 4C 34 31 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA #$64			 ; A9 64 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3C3
; Address: $DAB157
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3C3:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3174			; 4C 74 31 | Jump to address
	JMP $3165			; 4C 65 31 | Jump to address
	LDX #$A8			 ; A2 A8 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	BVS $09			  ; 70 09 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3C5
; Address: $DAB17E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3C5:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$0A			 ; A9 0A | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$6C			 ; A9 6C | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3C8
; Address: $DAB19A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3C8:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA $0A8D,Y		  ; 19 8D 0A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3CB
; Address: $DAB1AD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3CB:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $31EF			; 4C EF 31 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3CC
; Address: $DAB1C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3CC:
	JSL $CD2B74		  ; 22 74 2B CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3CD
; Address: $DAB1CC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3CD:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3CE
; Address: $DAB1E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3CE:
	JSL $CD2B81		  ; 22 81 2B CD | Jump to subroutine long
	JMP $3232			; 4C 32 32 | Jump to address
	JMP $32F4			; 4C F4 32 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D0
; Address: $DAB1F4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D0:
	JSL $CDB292		  ; 22 92 B2 CD | Jump to subroutine long
	LDA $343A			; AD 3A 34 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $320A			; 4C 0A 32 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D1
; Address: $DAB203
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D1:
	JSL $CDB27B		  ; 22 7B B2 CD | Jump to subroutine long
	JMP $31F4			; 4C F4 31 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D2
; Address: $DAB20E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D2:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D5
; Address: $DAB22E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D5:
	JSL $CDB274		  ; 22 74 B2 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D6
; Address: $DAB23A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D6:
	JMP $3241			; 4C 41 32 | Jump to address
	JMP $3232			; 4C 32 32 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D7
; Address: $DAB245
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D7:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D8
; Address: $DAB25D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D8:
	JSL $CD39F3		  ; 22 F3 39 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $327A			; 4C 7A 32 | Jump to address
	JMP $326B			; 4C 6B 32 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3D9
; Address: $DAB27E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3D9:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$9D			 ; A9 9D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3DB
; Address: $DAB297
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3DB:
	JSL $CD3BC8		  ; 22 C8 3B CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $32AA			; 4C AA 32 | Jump to address
	JMP $329B			; 4C 9B 32 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3DC
; Address: $DAB2AE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3DC:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3DD
; Address: $DAB2C6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3DD:
	JSL $CD3CB3		  ; 22 B3 3C CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $32DC			; 4C DC 32 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E0
; Address: $DAB2E2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E0:
	JSL $CD3DDB		  ; 22 DB 3D CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E3
; Address: $DAB2F9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E3:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $333B			; 4C 3B 33 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E4
; Address: $DAB310
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E4:
	JSL $CD2B74		  ; 22 74 2B CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E5
; Address: $DAB318
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E5:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E6
; Address: $DAB330
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E6:
	JSL $CD2B81		  ; 22 81 2B CD | Jump to subroutine long
	JMP $337E			; 4C 7E 33 | Jump to address
	JMP $344E			; 4C 4E 34 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E8
; Address: $DAB340
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E8:
	JSL $CDB292		  ; 22 92 B2 CD | Jump to subroutine long
	LDA $343A			; AD 3A 34 | Audio system operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3356			; 4C 56 33 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3E9
; Address: $DAB34F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3E9:
	JSL $CDB27B		  ; 22 7B B2 CD | Jump to subroutine long
	JMP $3340			; 4C 40 33 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3EA
; Address: $DAB35A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3EA:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3ED
; Address: $DAB37A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3ED:
	JSL $CDB274		  ; 22 74 B2 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3EE
; Address: $DAB384
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3EE:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $338D			; 4C 8D 33 | Jump to address
	JMP $337E			; 4C 7E 33 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3EF
; Address: $DAB391
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3EF:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3F0
; Address: $DAB3A9
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3F0:
	JSL $CD39F3		  ; 22 F3 39 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $33C6			; 4C C6 33 | Jump to address
	JMP $33B7			; 4C B7 33 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3F1
; Address: $DAB3CA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3F1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$93			 ; A9 93 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3F5
; Address: $DAB3F1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3F5:
	JSL $CD3BC8		  ; 22 C8 3B CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3404			; 4C 04 34 | Jump to address
	JMP $33F5			; 4C F5 33 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3F6
; Address: $DAB408
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3F6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3F7
; Address: $DAB420
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3F7:
	JSL $CD3CB3		  ; 22 B3 3C CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3F9
; Address: $DAB42F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3F9:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $3424			; 4C 24 34 | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3FA
; Address: $DAB43C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3FA:
	JSL $CD3DDB		  ; 22 DB 3D CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3FD
; Address: $DAB453
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3FD:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3495			; 4C 95 34 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3FE
; Address: $DAB46A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3FE:
	JSL $CD2B74		  ; 22 74 2B CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_3FF
; Address: $DAB472
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_3FF:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_400
; Address: $DAB48A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_400:
	JSL $CD2B81		  ; 22 81 2B CD | Jump to subroutine long
	JMP $34D8			; 4C D8 34 | Jump to address
	JMP $359A			; 4C 9A 35 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_402
; Address: $DAB49A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_402:
	JSL $CDB292		  ; 22 92 B2 CD | Jump to subroutine long
	LDA $343A			; AD 3A 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $34B0			; 4C B0 34 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_403
; Address: $DAB4A9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_403:
	JSL $CDB27B		  ; 22 7B B2 CD | Jump to subroutine long
	JMP $349A			; 4C 9A 34 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_404
; Address: $DAB4B4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_404:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_407
; Address: $DAB4D4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_407:
	JSL $CDB274		  ; 22 74 B2 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $34E7			; 4C E7 34 | Jump to address
	JMP $34D8			; 4C D8 34 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_408
; Address: $DAB4EB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_408:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_409
; Address: $DAB503
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_409:
	JSL $CD39F3		  ; 22 F3 39 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3520			; 4C 20 35 | Jump to address
	JMP $3511			; 4C 11 35 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_40A
; Address: $DAB524
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_40A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$9F			 ; A9 9F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_40C
; Address: $DAB53D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_40C:
	JSL $CD3BC8		  ; 22 C8 3B CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3550			; 4C 50 35 | Jump to address
	JMP $3541			; 4C 41 35 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_40D
; Address: $DAB554
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_40D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_40E
; Address: $DAB56C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_40E:
	JSL $CD3CB3		  ; 22 B3 3C CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_410
; Address: $DAB57B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_410:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $3570			; 4C 70 35 | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_411
; Address: $DAB588
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_411:
	JSL $CD3DDB		  ; 22 DB 3D CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_414
; Address: $DAB59F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_414:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $35E1			; 4C E1 35 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_415
; Address: $DAB5B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_415:
	JSL $CD2B74		  ; 22 74 2B CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_416
; Address: $DAB5BE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_416:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$05			 ; A9 05 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_417
; Address: $DAB5D6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_417:
	JSL $CD2B81		  ; 22 81 2B CD | Jump to subroutine long
	JMP $3624			; 4C 24 36 | Jump to address
	JMP $36E6			; 4C E6 36 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_419
; Address: $DAB5E6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_419:
	JSL $CDB292		  ; 22 92 B2 CD | Jump to subroutine long
	LDA $343A			; AD 3A 34 | Audio system operation
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $35FC			; 4C FC 35 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_41A
; Address: $DAB5F5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_41A:
	JSL $CDB27B		  ; 22 7B B2 CD | Jump to subroutine long
	JMP $35E6			; 4C E6 35 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_41B
; Address: $DAB600
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_41B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$05			 ; A9 05 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_41E
; Address: $DAB620
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_41E:
	JSL $CDB274		  ; 22 74 B2 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3633			; 4C 33 36 | Jump to address
	JMP $3624			; 4C 24 36 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_41F
; Address: $DAB637
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_41F:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$05			 ; A9 05 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_420
; Address: $DAB64F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_420:
	JSL $CD39F3		  ; 22 F3 39 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$60			 ; C9 60 | Compare accumulator (immediate)
	ORA #$90			 ; 09 90 | Logical OR with accumulator (immediate)
	JMP $366C			; 4C 6C 36 | Jump to address
	JMP $365D			; 4C 5D 36 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_421
; Address: $DAB670
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_421:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$9C			 ; A9 9C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_423
; Address: $DAB689
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_423:
	JSL $CD3BC8		  ; 22 C8 3B CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $369C			; 4C 9C 36 | Jump to address
	JMP $368D			; 4C 8D 36 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_424
; Address: $DAB6A0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_424:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$05			 ; A9 05 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_425
; Address: $DAB6B8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_425:
	JSL $CD3CB3		  ; 22 B3 3C CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_427
; Address: $DAB6C7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_427:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $36BC			; 4C BC 36 | Jump to address
	LDA #$05			 ; A9 05 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_428
; Address: $DAB6D4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_428:
	JSL $CD3DDB		  ; 22 DB 3D CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_42B
; Address: $DAB6EB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_42B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $372D			; 4C 2D 37 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_42C
; Address: $DAB702
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_42C:
	JSL $CD2B74		  ; 22 74 2B CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_42D
; Address: $DAB70A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_42D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$06			 ; A9 06 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_42E
; Address: $DAB722
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_42E:
	JSL $CD2B81		  ; 22 81 2B CD | Jump to subroutine long
	JMP $3770			; 4C 70 37 | Jump to address
	JMP $3832			; 4C 32 38 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_430
; Address: $DAB732
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_430:
	JSL $CDB292		  ; 22 92 B2 CD | Jump to subroutine long
	LDA $343A			; AD 3A 34 | Audio system operation
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3748			; 4C 48 37 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_431
; Address: $DAB741
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_431:
	JSL $CDB27B		  ; 22 7B B2 CD | Jump to subroutine long
	JMP $3732			; 4C 32 37 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_432
; Address: $DAB74C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_432:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$06			 ; A9 06 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_435
; Address: $DAB76C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_435:
	JSL $CDB274		  ; 22 74 B2 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $377F			; 4C 7F 37 | Jump to address
	JMP $3770			; 4C 70 37 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_436
; Address: $DAB783
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_436:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$06			 ; A9 06 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_437
; Address: $DAB79B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_437:
	JSL $CD39F3		  ; 22 F3 39 CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $37B8			; 4C B8 37 | Jump to address
	JMP $37A9			; 4C A9 37 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_438
; Address: $DAB7BC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_438:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$9E			 ; A9 9E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_43A
; Address: $DAB7D5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_43A:
	JSL $CD3BC8		  ; 22 C8 3B CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $37E8			; 4C E8 37 | Jump to address
	JMP $37D9			; 4C D9 37 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_43B
; Address: $DAB7EC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_43B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation
	LDA #$06			 ; A9 06 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_43D
; Address: $DAB80B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_43D:
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $381A			; 4C 1A 38 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_43E
; Address: $DAB813
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_43E:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $3808			; 4C 08 38 | Jump to address
	LDA #$06			 ; A9 06 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_43F
; Address: $DAB820
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_43F:
	JSL $CD3DDB		  ; 22 DB 3D CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_442
; Address: $DAB837
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_442:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_443
; Address: $DAB846
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_443:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $387A			; 4C 7A 38 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_444
; Address: $DAB861
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_444:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_448
; Address: $DAB883
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_448:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $38B7			; 4C B7 38 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_449
; Address: $DAB89E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_449:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_44D
; Address: $DAB8C0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_44D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $38F4			; 4C F4 38 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_44E
; Address: $DAB8DB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_44E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_452
; Address: $DAB8FD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_452:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3931			; 4C 31 39 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_453
; Address: $DAB918
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_453:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_457
; Address: $DAB93A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_457:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $396E			; 4C 6E 39 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_45D
; Address: $DAB977
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_45D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $39AB			; 4C AB 39 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_45E
; Address: $DAB992
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_45E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_462
; Address: $DAB9B7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_462:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $3410			; AD 10 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $39E5			; 4C E5 39 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_463
; Address: $DAB9CC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_463:
	JSL $C77E0C		  ; 22 0C 7E C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $39D8			; 4C D8 39 | Jump to address
	JMP $39EC			; 4C EC 39 | Jump to address
	LDA $3410			; AD 10 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $3410			; 8D 10 34 | Audio system operation
	JMP $39BB			; 4C BB 39 | Jump to address
	LDA #$05			 ; A9 05 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_464
; Address: $DAB9E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_464:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$80			 ; A9 80 | Audio system operation
	LSR $35			  ; 46 35 | Logical shift right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_465
; Address: $DAB9F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_465:
	JMP $3A74			; 4C 74 3A | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_466
; Address: $DAB9FC
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_466:
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3AA7			; 4C A7 3A | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$70			 ; A9 70 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3AA7			; 4C A7 3A | Jump to address
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$90			 ; A9 90 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$00			 ; A9 00 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3AA7			; 4C A7 3A | Jump to address
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$90			 ; A9 90 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$A0			 ; A9 A0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3AA7			; 4C A7 3A | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3AA7			; 4C A7 3A | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$70			 ; A9 70 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_467
; Address: $DABA6F
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_467:
	PLP				  ; 28 | Pull processor status from stack
	JMP $3AA7			; 4C A7 3A | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $39F6			; 4C F6 39 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A0B			; 4C 0B 3A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A20			; 4C 20 3A | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A35			; 4C 35 3A | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A4A			; 4C 4A 3A | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3A5F			; 4C 5F 3A | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	STA $9680			; 8D 80 96 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	STA $9682			; 8D 82 96 | Audio system operation
	JMP $3B94			; 4C 94 3B | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3ACE			; 4C CE 3A | Jump to address
	LDX #$EB			 ; A2 EB | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_468
; Address: $DABAC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_468:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3AD8			; 4C D8 3A | Jump to address
	LDX #$F1			 ; A2 F1 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_469
; Address: $DABAD4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_469:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3BC7			; 4C C7 3B | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3AF3			; 4C F3 3A | Jump to address
	LDX #$F0			 ; A2 F0 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_46A
; Address: $DABAEC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_46A:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3AFD			; 4C FD 3A | Jump to address
	LDX #$F6			 ; A2 F6 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_46C
; Address: $DABB00
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_46C:
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3B18			; 4C 18 3B | Jump to address
	LDX #$ED			 ; A2 ED | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_46D
; Address: $DABB11
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_46D:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3B22			; 4C 22 3B | Jump to address
	LDX #$F3			 ; A2 F3 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_46E
; Address: $DABB1E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_46E:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3BC7			; 4C C7 3B | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3B3D			; 4C 3D 3B | Jump to address
	LDX #$EF			 ; A2 EF | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_46F
; Address: $DABB36
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_46F:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3B47			; 4C 47 3B | Jump to address
	LDX #$F5			 ; A2 F5 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_470
; Address: $DABB43
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_470:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3BC7			; 4C C7 3B | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3B62			; 4C 62 3B | Jump to address
	LDX #$EC			 ; A2 EC | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_471
; Address: $DABB5B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_471:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3B6C			; 4C 6C 3B | Jump to address
	LDX #$F2			 ; A2 F2 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_472
; Address: $DABB68
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_472:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3BC7			; 4C C7 3B | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3B87			; 4C 87 3B | Jump to address
	LDX #$EE			 ; A2 EE | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_473
; Address: $DABB80
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_473:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3B91			; 4C 91 3B | Jump to address
	LDX #$F4			 ; A2 F4 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_474
; Address: $DABB8D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_474:
	JSL $C734A5		  ; 22 A5 34 C7 | Jump to subroutine long
	JMP $3BC7			; 4C C7 3B | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_475
; Address: $DABB9A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_475:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3AB6			; 4C B6 3A | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3ADB			; 4C DB 3A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3B00			; 4C 00 3B | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3B25			; 4C 25 3B | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3B4A			; 4C 4A 3B | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3B6F			; 4C 6F 3B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_477
; Address: $DABBCE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_477:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3BE6			; 4C E6 3B | Jump to address
	JMP $3BD6			; 4C D6 3B | Jump to address
	JMP $3CB2			; 4C B2 3C | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_478
; Address: $DABBEC
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_478:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	INC $F641			; EE 41 F6 | Increment (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$EE			 ; C0 EE | Compare Y register (immediate)
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3C04			; 4C 04 3C | Jump to address
	JMP $3BF4			; 4C F4 3B | Jump to address
	JMP $3CB2			; 4C B2 3C | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_479
; Address: $DABC0A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_479:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank34_AudioFunction_47A
; Address: $DABC1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_47A:
	JMP $3C22			; 4C 22 3C | Jump to address
	JMP $3C12			; 4C 12 3C | Jump to address
	JMP $3CB2			; 4C B2 3C | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_47B
; Address: $DABC28
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_47B:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3C40			; 4C 40 3C | Jump to address
	JMP $3C30			; 4C 30 3C | Jump to address
	JMP $3CB2			; 4C B2 3C | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_47C
; Address: $DABC46
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_47C:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$B6			 ; C0 B6 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3C5E			; 4C 5E 3C | Jump to address
	JMP $3C4E			; 4C 4E 3C | Jump to address
	JMP $3CB2			; 4C B2 3C | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_47D
; Address: $DABC64
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_47D:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3C7C			; 4C 7C 3C | Jump to address
	JMP $3C6C			; 4C 6C 3C | Jump to address
	JMP $3CB2			; 4C B2 3C | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3BCB			; 4C CB 3B | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3BE9			; 4C E9 3B | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3C07			; 4C 07 3C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3C25			; 4C 25 3C | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_47E
; Address: $DABCA5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_47E:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3C43			; 4C 43 3C | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3C61			; 4C 61 3C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_47F
; Address: $DABCB3
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_47F:
	JMP $3D10			; 4C 10 3D | Jump to address
	LDA #$51			 ; A9 51 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$4D			 ; A9 4D | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3D43			; 4C 43 3D | Jump to address
	LDA #$51			 ; A9 51 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$8D			 ; A9 8D | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3D43			; 4C 43 3D | Jump to address
	LDA #$A9			 ; A9 A9 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$1D			 ; A9 1D | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3D43			; 4C 43 3D | Jump to address
	LDA #$A9			 ; A9 A9 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$BD			 ; A9 BD | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3D43			; 4C 43 3D | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$4D			 ; A9 4D | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3D43			; 4C 43 3D | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$8D			 ; A9 8D | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	JMP $3D43			; 4C 43 3D | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_480
; Address: $DABD13
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_480:
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3CB6			; 4C B6 3C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3CC5			; 4C C5 3C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3CD4			; 4C D4 3C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3CE3			; 4C E3 3C | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3CF2			; 4C F2 3C | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D01			; 4C 01 3D | Jump to address
	LDA #$C7			 ; A9 C7 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_482
; Address: $DABD52
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_482:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	JMP $3DA7			; 4C A7 3D | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_483
; Address: $DABD5F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_483:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $3DDA			; 4C DA 3D | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_484
; Address: $DABD6C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_484:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $3DDA			; 4C DA 3D | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_485
; Address: $DABD79
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_485:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $3DDA			; 4C DA 3D | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_486
; Address: $DABD86
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_486:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $3DDA			; 4C DA 3D | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_487
; Address: $DABD93
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_487:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $3DDA			; 4C DA 3D | Jump to address
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_488
; Address: $DABDA0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_488:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $3DDA			; 4C DA 3D | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_489
; Address: $DABDAA
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_489:
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D59			; 4C 59 3D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D66			; 4C 66 3D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D73			; 4C 73 3D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D80			; 4C 80 3D | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D8D			; 4C 8D 3D | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D9A			; 4C 9A 3D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_48B
; Address: $DABDE1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_48B:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	JMP $3E4D			; 4C 4D 3E | Jump to address
	LDX #$83			 ; A2 83 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_48C
; Address: $DABDEB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_48C:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	JMP $3E4D			; 4C 4D 3E | Jump to address
	LDX #$82			 ; A2 82 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_48D
; Address: $DABDF5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_48D:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	JMP $3E4D			; 4C 4D 3E | Jump to address
	LDX #$81			 ; A2 81 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_48E
; Address: $DABDFF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_48E:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	JMP $3E4D			; 4C 4D 3E | Jump to address
	LDX #$86			 ; A2 86 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_48F
; Address: $DABE09
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_48F:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	JMP $3E4D			; 4C 4D 3E | Jump to address
	LDX #$85			 ; A2 85 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_490
; Address: $DABE13
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_490:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	JMP $3E4D			; 4C 4D 3E | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3DDE			; 4C DE 3D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3DE8			; 4C E8 3D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3DF2			; 4C F2 3D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_491
; Address: $DABE3A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_491:
	JMP $3DFC			; 4C FC 3D | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3E06			; 4C 06 3E | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3E10			; 4C 10 3E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_494
; Address: $DABE55
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_494:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	ROL $00F6,X		  ; 3E F6 00 | Rotate left (absolute,X)
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_495
; Address: $DABE60
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_495:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	BCS $3E			  ; B0 3E | Branch if carry set
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_496
; Address: $DABE6B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_496:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_497
; Address: $DABE76
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_497:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_498
; Address: $DABE81
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_498:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_499
; Address: $DABE8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_499:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_49A
; Address: $DABE97
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_49A:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_49B
; Address: $DABEA2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_49B:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CMP $F641			; CD 41 F6 | Compare accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_49C
; Address: $DABEAB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_49C:
	JSL $C047B2		  ; 22 B2 47 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	ROL $22F6,X		  ; 3E F6 22 | Rotate left (absolute,X)
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	ROL $22F6,X		  ; 3E F6 22 | Rotate left (absolute,X)
	CPY #$47			 ; C0 47 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A2
; Address: $DABEE3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A2:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	ROL $90F6,X		  ; 3E F6 90 | Rotate left (absolute,X)
	JMP $3EF3			; 4C F3 3E | Jump to address
	JMP $3EE3			; 4C E3 3E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A3
; Address: $DABEF3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A3:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	BCS $3E			  ; B0 3E | Branch if carry set
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F03			; 4C 03 3F | Jump to address
	JMP $3EF3			; 4C F3 3E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A4
; Address: $DABF03
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A4:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F13			; 4C 13 3F | Jump to address
	JMP $3F03			; 4C 03 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A5
; Address: $DABF13
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A5:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F23			; 4C 23 3F | Jump to address
	JMP $3F13			; 4C 13 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A6
; Address: $DABF23
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A6:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F33			; 4C 33 3F | Jump to address
	JMP $3F23			; 4C 23 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A7
; Address: $DABF33
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A7:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F43			; 4C 43 3F | Jump to address
	JMP $3F33			; 4C 33 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A8
; Address: $DABF43
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A8:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F53			; 4C 53 3F | Jump to address
	JMP $3F43			; 4C 43 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4A9
; Address: $DABF53
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4A9:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	CMP $F641			; CD 41 F6 | Compare accumulator (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F63			; 4C 63 3F | Jump to address
	JMP $3F53			; 4C 53 3F | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4AC
; Address: $DABF71
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4AC:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	AND $F63F,X		  ; 3D 3F F6 | Logical AND with accumulator (absolute,X)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4AD
; Address: $DABF7E
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4AD:
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	ROL $42			  ; 26 42 | Hardware register operation
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	WDM #$F6			 ; 42 F6 | Reserved instruction
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	WDM #$F6			 ; 42 F6 | Reserved instruction
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	WDM #$F6			 ; 42 F6 | Reserved instruction
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	WDM #$F6			 ; 42 F6 | Reserved instruction
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	ADC ($42),Y		  ; 71 42 | Hardware register operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3FCB			; 4C CB 3F | Jump to address
	JMP $3FBB			; 4C BB 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4AE
; Address: $DABFCB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4AE:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND $F63F,X		  ; 3D 3F F6 | Logical AND with accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3FDB			; 4C DB 3F | Jump to address
	JMP $3FCB			; 4C CB 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4AF
; Address: $DABFDB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4AF:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ROL $42			  ; 26 42 | Hardware register operation
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3FEB			; 4C EB 3F | Jump to address
	JMP $3FDB			; 4C DB 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B0
; Address: $DABFEB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B0:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	WDM #$F6			 ; 42 F6 | Reserved instruction
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3FFB			; 4C FB 3F | Jump to address
	JMP $3FEB			; 4C EB 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B1
; Address: $DABFFB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B1:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	WDM #$F6			 ; 42 F6 | Reserved instruction
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $400B			; 4C 0B 40 | Jump to address
	JMP $3FFB			; 4C FB 3F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B3
; Address: $DAC012
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B3:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $401B			; 4C 1B 40 | Jump to address
	JMP $400B			; 4C 0B 40 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B4
; Address: $DAC01B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B4:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	WDM #$F6			 ; 42 F6 | Reserved instruction
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $402B			; 4C 2B 40 | Jump to address
	JMP $401B			; 4C 1B 40 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B5
; Address: $DAC02B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B5:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ADC ($42),Y		  ; 71 42 | Hardware register operation
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $403B			; 4C 3B 40 | Jump to address
	JMP $402B			; 4C 2B 40 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B7
; Address: $DAC03F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B7:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	INC $3E			  ; E6 3E | Increment (zero page)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Audio system operation
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$E6			 ; C0 E6 | Compare Y register (immediate)
	ROL $90F6,X		  ; 3E F6 90 | Rotate left (absolute,X)
	JMP $4062			; 4C 62 40 | Jump to address
	JMP $4052			; 4C 52 40 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4B8
; Address: $DAC062
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4B8:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4072			; 4C 72 40 | Jump to address
	JMP $4062			; 4C 62 40 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4BC
; Address: $DAC081
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4BC:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	AND $F63F,X		  ; 3D 3F F6 | Logical AND with accumulator (absolute,X)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4099			; 4C 99 40 | Jump to address
	JMP $4089			; 4C 89 40 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4BD
; Address: $DAC099
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4BD:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND $F63F,X		  ; 3D 3F F6 | Logical AND with accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $40A9			; 4C A9 40 | Jump to address
	JMP $4099			; 4C 99 40 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4C1
; Address: $DAC0B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4C1:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $40CD			; 4C CD 40 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4C2
; Address: $DAC0C6
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4C2:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	JMP $411C			; 4C 1C 41 | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $40F3			; 4C F3 40 | Jump to address
	LDA #$90			 ; A9 90 | Audio system operation
	LDX #$B8			 ; A2 B8 | Load immediate value into X register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $40F3			; 4C F3 40 | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	JMP $411C			; 4C 1C 41 | Jump to address
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4119			; 4C 19 41 | Jump to address
	LDA #$90			 ; A9 90 | Audio system operation
	LDX #$B8			 ; A2 B8 | Load immediate value into X register
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4119			; 4C 19 41 | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	JMP $411C			; 4C 1C 41 | Jump to address
	JMP $40B7			; 4C B7 40 | Jump to address
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $412A			; 4C 2A 41 | Jump to address
	JMP $4184			; 4C 84 41 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4C3
; Address: $DAC12A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4C3:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4157			; 4C 57 41 | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4C4
; Address: $DAC13F
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4C4:
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $414E			; 4C 4E 41 | Jump to address
	JMP $413F			; 4C 3F 41 | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	ADC $AD41,X		  ; 7D 41 AD | Add with carry (absolute,X)
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $417D			; 4C 7D 41 | Jump to address
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4177			; 4C 77 41 | Jump to address
	JMP $4168			; 4C 68 41 | Jump to address
	LDA #$08			 ; A9 08 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $B74C			; CC 4C B7 | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA #$3F			 ; A9 3F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4C5
; Address: $DAC187
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4C5:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4194			; 4C 94 41 | Jump to address
	JMP $4184			; 4C 84 41 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4C9
; Address: $DAC1A0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4C9:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$90			 ; A9 90 | Audio system operation
	LDX #$B8			 ; A2 B8 | Load immediate value into X register
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $41B9			; 4C B9 41 | Jump to address
	JMP $41BC			; 4C BC 41 | Jump to address
	JMP $41A0			; 4C A0 41 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4D1
; Address: $DAC1D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4D1:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4D2
; Address: $DAC1E0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4D2:
	BCC $09			  ; 90 09 | Branch if carry clear
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4D3
; Address: $DAC1E5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4D3:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $41F1			; 4C F1 41 | Jump to address
	JMP $41F4			; 4C F4 41 | Jump to address
	JMP $41D8			; 4C D8 41 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4D6
; Address: $DAC1FC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4D6:
	JSL $CDAFE1		  ; 22 E1 AF CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	CPY $34AD			; CC AD 34 | Compare Y register (absolute)
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $0390			; 4E 90 03 | Logical shift right (absolute)
	JMP $421C			; 4C 1C 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4DC
; Address: $DAC232
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4DC:
	JSL $CDAE6B		  ; 22 6B AE CD | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Audio system operation
	LDX #$51			 ; A2 51 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4EA
; Address: $DAC278
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4EA:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BVS $09			  ; 70 09 | Branch if overflow set
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4EC
; Address: $DAC289
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4EC:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4291			; 4C 91 42 | Hardware register operation
	JMP $4294			; 4C 94 42 | Hardware register operation
	JMP $4278			; 4C 78 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4F1
; Address: $DAC2A7
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4F1:
	JSL $CCE1D1		  ; 22 D1 E1 CC | Jump to subroutine long
	LDA $3556			; AD 56 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $42DC			; 4C DC 42 | Hardware register operation
	STA $662208		  ; 8F 08 22 66 | Audio system operation
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $42C8			; 4C C8 42 | Hardware register operation
	BCC $08			  ; 90 08 | Branch if carry clear
	JMP $42CE			; 4C CE 42 | Hardware register operation
	STA ($08),Y		  ; 91 08 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4F3
; Address: $DAC2D2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4F3:
	JSL $CDADD1		  ; 22 D1 AD CD | Jump to subroutine long
	JMP $42A3			; 4C A3 42 | Hardware register operation
	JMP $4303			; 4C 03 43 | Jump to address
	STA $662208		  ; 8F 08 22 66 | Audio system operation
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $42FC			; 4C FC 42 | Hardware register operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4F5
; Address: $DAC2EF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4F5:
	JSL $CDADD1		  ; 22 D1 AD CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	WDM #$00			 ; 42 00 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4F6
; Address: $DAC2FF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4F6:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $2236,Y		  ; 19 36 22 | Logical OR with accumulator (absolute,Y)
	PEA #$CDAD		   ; F4 AD CD | Push effective address to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4FA
; Address: $DAC31C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4FA:
	JSL $CDADD1		  ; 22 D1 AD CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_4FF
; Address: $DAC33B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_4FF:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$60			 ; A9 60 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	BVS $09			  ; 70 09 | Branch if overflow set
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_500
; Address: $DAC348
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_500:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4354			; 4C 54 43 | Jump to address
	JMP $4357			; 4C 57 43 | Jump to address
	JMP $433B			; 4C 3B 43 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_503
; Address: $DAC35F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_503:
	JSL $CDAEE1		  ; 22 E1 AE CD | Jump to subroutine long
	STA $2208			; 8D 08 22 | Audio system operation
	LDA $CDAC,X		  ; BD AC CD | Audio system operation
	STX $2208			; 8E 08 22 | Store X register to absolute address
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $9822			; CC 22 98 | Compare Y register (absolute)
	CPY $AD6B			; CC 6B AD | Compare Y register (absolute)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4390			; 4C 90 43 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_50F
; Address: $DAC3B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_50F:
	JSL $CDADC6		  ; 22 C6 AD CD | Jump to subroutine long
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $43C9			; 4C C9 43 | Jump to address
	JMP $43BA			; 4C BA 43 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_511
; Address: $DAC3CE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_511:
	LDA $354B			; AD 4B 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $440E			; 4C 0E 44 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_512
; Address: $DAC3D9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_512:
	LDA $3556			; AD 56 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4403			; 4C 03 44 | Jump to address
	STA $662208		  ; 8F 08 22 66 | Audio system operation
	LDY $B0CD			; AC CD B0 | Load from absolute address into Y register
	JMP $43F6			; 4C F6 43 | Jump to address
	BCC $08			  ; 90 08 | Branch if carry clear
	JMP $43FC			; 4C FC 43 | Jump to address
	STA ($08),Y		  ; 91 08 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_515
; Address: $DAC407
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_515:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	JMP $4415			; 4C 15 44 | Jump to address
	STA $2208			; 8D 08 22 | Audio system operation
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA $354B			; AD 4B 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $442C			; 4C 2C 44 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_521
; Address: $DAC452
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_521:
	JSL $CDADC6		  ; 22 C6 AD CD | Jump to subroutine long
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4465			; 4C 65 44 | Jump to address
	JMP $4456			; 4C 56 44 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_523
; Address: $DAC46A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_523:
	LDA $354B			; AD 4B 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4495			; 4C 95 44 | Jump to address
	LDA $3556			; AD 56 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_524
; Address: $DAC47B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_524:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $448A			; 4C 8A 44 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_527
; Address: $DAC48E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_527:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	JMP $449C			; 4C 9C 44 | Jump to address
	STX $2208			; 8E 08 22 | Store X register to absolute address
	LDY $6BCD			; AC CD 6B | Load from absolute address into Y register
	LDA $354B			; AD 4B 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $44AC			; 4C AC 44 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_52B
; Address: $DAC4B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_52B:
	JSL $CCD35E		  ; 22 5E D3 CC | Jump to subroutine long
	LDX #$2C			 ; A2 2C | Load immediate value into X register
	LDA #$4F			 ; A9 4F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_52E
; Address: $DAC4C8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_52E:
	JSL $CDADC6		  ; 22 C6 AD CD | Jump to subroutine long
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $44DB			; 4C DB 44 | Jump to address
	JMP $44CC			; 4C CC 44 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_530
; Address: $DAC4E0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_530:
	LDA $354B			; AD 4B 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $44EF			; 4C EF 44 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_534
; Address: $DAC4F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_534:
	JSL $CCD35E		  ; 22 5E D3 CC | Jump to subroutine long
	LDX #$2E			 ; A2 2E | Load immediate value into X register
	LDA #$4F			 ; A9 4F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_538
; Address: $DAC50F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_538:
	JSL $CDADC6		  ; 22 C6 AD CD | Jump to subroutine long
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4522			; 4C 22 45 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_53B
; Address: $DAC527
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_53B:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $453B			; 4C 3B 45 | Jump to address
	JMP $452C			; 4C 2C 45 | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4558			; 4C 58 45 | Jump to address
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4555			; 4C 55 45 | Jump to address
	JMP $457B			; 4C 7B 45 | Jump to address
	JMP $453B			; 4C 3B 45 | Jump to address
	LDX #$34			 ; A2 34 | Load immediate value into X register
	LDA #$6E			 ; A9 6E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_53F
; Address: $DAC56D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_53F:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_540
; Address: $DAC577
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_540:
	JSL $CDAEE1		  ; 22 E1 AE CD | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$76			 ; A9 76 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_542
; Address: $DAC585
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_542:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA #$2C			 ; A9 2C | Audio system operation
	LDX #$75			 ; A2 75 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_546
; Address: $DAC59B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_546:
	JSL $CDAF01		  ; 22 01 AF CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $45D4			; 4C D4 45 | Jump to address
	LDX #$2E			 ; A2 2E | Load immediate value into X register
	LDA #$74			 ; A9 74 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_548
; Address: $DAC5B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_548:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$2C			 ; A2 2C | Load immediate value into X register
	LDA #$76			 ; A9 76 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_556
; Address: $DAC5FE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_556:
	JSL $CCD88A		  ; 22 8A D8 CC | Jump to subroutine long
	STA $2208,X		  ; 9D 08 22 | Audio system operation
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $6F22			; CC 22 6F | Compare Y register (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	CPY $2C22			; CC 22 2C | Compare Y register (absolute)
	LDX $A9CD			; AE CD A9 | Load from absolute address into X register
	ADC $00			  ; 65 00 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_558
; Address: $DAC61C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_558:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA #$2C			 ; A9 2C | Audio system operation
	LDX #$4E			 ; A2 4E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_560
; Address: $DAC645
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_560:
	JSL $CDAFC1		  ; 22 C1 AF CD | Jump to subroutine long
	STZ $2208,X		  ; 9E 08 22 | Store zero to absolute,X
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $5622			; CC 22 56 | Compare Y register (absolute)
	LDX $22CD			; AE CD 22 | Load from absolute address into X register
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	CMP $32A9			; CD A9 32 | Compare accumulator (absolute)
	LDX #$51			 ; A2 51 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_563
; Address: $DAC66A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_563:
	JSL $CDB031		  ; 22 31 B0 CD | Jump to subroutine long
	LDX #$2F			 ; A2 2F | Load immediate value into X register
	LDA #$4E			 ; A9 4E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_56D
; Address: $DAC69B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_56D:
	JSL $CDB081		  ; 22 81 B0 CD | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$45			 ; A9 45 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_573
; Address: $DAC6BA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_573:
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $46CB			; 4C CB 46 | Jump to address
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	JMP $46CE			; 4C CE 46 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_574
; Address: $DAC6CF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_574:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $46E3			; 4C E3 46 | Jump to address
	JMP $46D4			; 4C D4 46 | Jump to address
	LDX #$26			 ; A2 26 | Load immediate value into X register
	LDA #$6E			 ; A9 6E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_577
; Address: $DAC6F1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_577:
	JSL $CCD85D		  ; 22 5D D8 CC | Jump to subroutine long
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4703			; 4C 03 47 | Jump to address
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_578
; Address: $DAC706
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_578:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_57D
; Address: $DAC725
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_57D:
	JSL $CDADED		  ; 22 ED AD CD | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$74			 ; A9 74 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_57F
; Address: $DAC733
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_57F:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Audio system operation
	LDX #$75			 ; A2 75 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_583
; Address: $DAC749
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_583:
	JSL $CDADFB		  ; 22 FB AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4782			; 4C 82 47 | Jump to address
	LDX #$2C			 ; A2 2C | Load immediate value into X register
	LDA #$76			 ; A9 76 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_585
; Address: $DAC762
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_585:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$2E			 ; A2 2E | Load immediate value into X register
	LDA #$74			 ; A9 74 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_58D
; Address: $DAC78E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_58D:
	JSL $CC73CF		  ; 22 CF 73 CC | Jump to subroutine long
	STZ $2208			; 9C 08 22 | Store zero to absolute
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $2522			; CC 22 25 | Compare Y register (absolute)
	LDX $22CD			; AE CD 22 | Load from absolute address into X register
	CLD				  ; D8 | Clear decimal mode flag
	CPY $7122			; CC 22 71 | Compare Y register (absolute)
	LDA $65A9CD		  ; AF CD A9 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_58F
; Address: $DAC7B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_58F:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Audio system operation
	LDX #$4E			 ; A2 4E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_598
; Address: $DAC7DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_598:
	JSL $CDB001		  ; 22 01 B0 CD | Jump to subroutine long
	LDA #$32			 ; A9 32 | Audio system operation
	LDX #$4F			 ; A2 4F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_59B
; Address: $DAC7EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_59B:
	JSL $CDB031		  ; 22 31 B0 CD | Jump to subroutine long
	LDX #$2D			 ; A2 2D | Load immediate value into X register
	LDA #$4E			 ; A9 4E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5A3
; Address: $DAC818
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5A3:
	JSL $CCD878		  ; 22 78 D8 CC | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5A8
; Address: $DAC82F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5A8:
	JSL $CCD881		  ; 22 81 D8 CC | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5B1
; Address: $DAC85A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5B1:
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $486B			; 4C 6B 48 | Jump to address
	LDA ($08,X)		  ; A1 08 | Audio system operation
	JMP $486E			; 4C 6E 48 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5B4
; Address: $DAC878
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5B4:
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4887			; 4C 87 48 | Jump to address
	JMP $4878			; 4C 78 48 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5B5
; Address: $DAC887
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5B5:
	JSL $CDAFA1		  ; 22 A1 AF CD | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Audio system operation
	LDX #$4B			 ; A2 4B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5BB
; Address: $DAC8A8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5BB:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	STA				  ; 9F 08 22 D2 | Store accumulator to absolute long,X
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	EOR $CDAE,X		  ; 5D AE CD | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5BC
; Address: $DAC8B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5BC:
	JSL $CDB001		  ; 22 01 B0 CD | Jump to subroutine long
	LDA #$2D			 ; A9 2D | Audio system operation
	LDX #$4E			 ; A2 4E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5C0
; Address: $DAC8CD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5C0:
	JSL $CC73CF		  ; 22 CF 73 CC | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	LDY $08			  ; A4 08 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5C1
; Address: $DAC8D7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5C1:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $48E6			; 4C E6 48 | Jump to address
	LDA $08			  ; A5 08 | Audio system operation
	JMP $48D4			; 4C D4 48 | Jump to address
	LDX $08			  ; A6 08 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5CE
; Address: $DAC924
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5CE:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $492D			; 4C 2D 49 | Jump to address
	JMP $491E			; 4C 1E 49 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5CF
; Address: $DAC92D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5CF:
	JSL $CDAFA1		  ; 22 A1 AF CD | Jump to subroutine long
	LDA #$2C			 ; A9 2C | Audio system operation
	LDX #$49			 ; A2 49 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5D5
; Address: $DAC94D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5D5:
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $495C			; 4C 5C 49 | Jump to address
	JMP $494D			; 4C 4D 49 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5D6
; Address: $DAC95C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5D6:
	JSL $CDAFA1		  ; 22 A1 AF CD | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Audio system operation
	LDX #$49			 ; A2 49 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5DC
; Address: $DAC97B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5DC:
	LDA #$E0			 ; A9 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$80			 ; A9 80 | Audio system operation
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$1B			 ; A2 1B | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5DE
; Address: $DAC995
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5DE:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $49B5			; 4C B5 49 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5DF
; Address: $DAC9A4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5DF:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	STA $2208,Y		  ; 99 08 22 | Audio system operation
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	CPY $044C			; CC 4C 04 | Compare Y register (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5E7
; Address: $DAC9D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5E7:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5E8
; Address: $DAC9DA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5E8:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$08			 ; A9 08 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $3555			; AD 55 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $49F9			; 4C F9 49 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5EC
; Address: $DACA05
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5EC:
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4A51			; 4C 51 4A | Jump to address
	LDA #$24			 ; A9 24 | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$6E			 ; A9 6E | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$27			 ; A9 27 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$71			 ; A9 71 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5EE
; Address: $DACA32
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5EE:
	JSL $CCD7EF		  ; 22 EF D7 CC | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4A46			; 4C 46 4A | Jump to address
	JMP $4A37			; 4C 37 4A | Jump to address
	LDA #$0F			 ; A9 0F | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BIT $C6			  ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F1
; Address: $DACA58
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F1:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4A9E			; 4C 9E 4A | Jump to address
	LDA #$34			 ; A9 34 | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$6E			 ; A9 6E | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$37			 ; A9 37 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$71			 ; A9 71 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F3
; Address: $DACA7F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F3:
	JSL $CCD7EF		  ; 22 EF D7 CC | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4A93			; 4C 93 4A | Jump to address
	JMP $4A84			; 4C 84 4A | Jump to address
	LDA #$10			 ; A9 10 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BIT $C6			  ; 24 C6 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F5
; Address: $DACAA0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F5:
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4B15			; 4C 15 4B | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F6
; Address: $DACAAE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F6:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	JMP $4ADD			; 4C DD 4A | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F7
; Address: $DACAB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F7:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4B00			; 4C 00 4B | Jump to address
	LDA #$96			 ; A9 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F8
; Address: $DACAC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F8:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4B00			; 4C 00 4B | Jump to address
	LDA #$78			 ; A9 78 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5F9
; Address: $DACACC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5F9:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4B00			; 4C 00 4B | Jump to address
	LDA #$50			 ; A9 50 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5FA
; Address: $DACAD6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5FA:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4B00			; 4C 00 4B | Jump to address
	LDA $C141			; AD 41 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4AB5			; 4C B5 4A | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4ABF			; 4C BF 4A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5FB
; Address: $DACAF0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5FB:
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4AC9			; 4C C9 4A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4AD3			; 4C D3 4A | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5FE
; Address: $DACB0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5FE:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	JMP $4AA0			; 4C A0 4A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_5FF
; Address: $DACB16
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_5FF:
	JSL $CC803E		  ; 22 3E 80 CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4B2E			; 4C 2E 4B | Jump to address
	LDA $3629			; AD 29 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4B2E			; 4C 2E 4B | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_601
; Address: $DACB2F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_601:
	LDA #$5F			 ; A9 5F | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$5F			 ; A9 5F | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$45			 ; A9 45 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_609
; Address: $DACB73
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_609:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_612
; Address: $DACBA4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_612:
	LDA #$65			 ; A9 65 | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$43			 ; A9 43 | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$65			 ; A9 65 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$45			 ; A9 45 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_616
; Address: $DACBD0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_616:
	JSL $CCD7EA		  ; 22 EA D7 CC | Jump to subroutine long
	LDA #$CF			 ; A9 CF | Audio system operation
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_618
; Address: $DACBE3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_618:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_619
; Address: $DACBED
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_619:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4C04			; 4C 04 4C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_61A
; Address: $DACBFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_61A:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $4BF2			; 4C F2 4B | Jump to address
	LDA #$8A			 ; A9 8A | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_61C
; Address: $DACC0E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_61C:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4C2D			; 4C 2D 4C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_61D
; Address: $DACC21
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_61D:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	JMP $4C17			; 4C 17 4C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_61F
; Address: $DACC31
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_61F:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4C3A			; 4C 3A 4C | Jump to address
	JMP $4C2D			; 4C 2D 4C | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_622
; Address: $DACC48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_622:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_628
; Address: $DACC6F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_628:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4C7C			; 4C 7C 4C | Jump to address
	JMP $4C6C			; 4C 6C 4C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_62A
; Address: $DACC80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_62A:
	JSL $C75930		  ; 22 30 59 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_62B
; Address: $DACC87
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_62B:
	LDA $3629			; AD 29 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4CB7			; 4C B7 4C | Jump to address
	LDA #$97			 ; A9 97 | Audio system operation
	LDX #$30			 ; A2 30 | Load immediate value into X register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_62D
; Address: $DACCA1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_62D:
	JSL $CC7593		  ; 22 93 75 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_62F
; Address: $DACCB0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_62F:
	JSL $CC7505		  ; 22 05 75 CC | Jump to subroutine long
	JMP $4D1D			; 4C 1D 4D | Jump to address
	LDA #$97			 ; A9 97 | Audio system operation
	LDX #$C8			 ; A2 C8 | Load immediate value into X register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_630
; Address: $DACCC0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_630:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_632
; Address: $DACCD1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_632:
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4CE0			; 4C E0 4C | Jump to address
	JMP $4CD1			; 4C D1 4C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_633
; Address: $DACCE0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_633:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDX #$30			 ; A2 30 | Load immediate value into X register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_636
; Address: $DACCF5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_636:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_63A
; Address: $DACD0B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_63A:
	JSL $CC7593		  ; 22 93 75 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_63E
; Address: $DACD22
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_63E:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4DED			; 4C ED 4D | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_63F
; Address: $DACD34
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_63F:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	JMP $4D63			; 4C 63 4D | Jump to address
	LDA #$78			 ; A9 78 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_640
; Address: $DACD3E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_640:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4D86			; 4C 86 4D | Jump to address
	LDA #$64			 ; A9 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_641
; Address: $DACD48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_641:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4D86			; 4C 86 4D | Jump to address
	LDA #$50			 ; A9 50 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_642
; Address: $DACD52
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_642:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4D86			; 4C 86 4D | Jump to address
	LDA #$3C			 ; A9 3C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_643
; Address: $DACD5C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_643:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $4D86			; 4C 86 4D | Jump to address
	LDA $C141			; AD 41 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4D3B			; 4C 3B 4D | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_644
; Address: $DACD71
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_644:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4D45			; 4C 45 4D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4D4F			; 4C 4F 4D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4D59			; 4C 59 4D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_645
; Address: $DACD86
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_645:
	JSL $C691A1		  ; 22 A1 91 C6 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4D98			; 4C 98 4D | Jump to address
	JMP $4DED			; 4C ED 4D | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_646
; Address: $DACD9B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_646:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	JMP $4DC3			; 4C C3 4D | Jump to address
	JMP $4DE6			; 4C E6 4D | Jump to address
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_647
; Address: $DACDA8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_647:
	JSL $C73083		  ; 22 83 30 C7 | Jump to subroutine long
	JMP $4DE6			; 4C E6 4D | Jump to address
	LDX #$C8			 ; A2 C8 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_648
; Address: $DACDB2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_648:
	JSL $C73083		  ; 22 83 30 C7 | Jump to subroutine long
	JMP $4DE6			; 4C E6 4D | Jump to address
	LDX #$82			 ; A2 82 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_649
; Address: $DACDBC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_649:
	JSL $C73083		  ; 22 83 30 C7 | Jump to subroutine long
	JMP $4DE6			; 4C E6 4D | Jump to address
	LDA $C135			; AD 35 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4DA2			; 4C A2 4D | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4DA5			; 4C A5 4D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4DAF			; 4C AF 4D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4DB9			; 4C B9 4D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_64A
; Address: $DACDE6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_64A:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	JMP $4D26			; 4C 26 4D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_64D
; Address: $DACDF4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_64D:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$90			 ; A9 90 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_64F
; Address: $DACE01
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_64F:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4E0D			; 4C 0D 4E | Jump to address
	JMP $4E10			; 4C 10 4E | Jump to address
	JMP $4DF4			; 4C F4 4D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_653
; Address: $DACE1F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_653:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	LDA #$08			 ; A9 08 | Audio system operation
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_655
; Address: $DACE36
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_655:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $90A9			; CC A9 90 | Compare Y register (absolute)
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_656
; Address: $DACE4C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_656:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4E58			; 4C 58 4E | Jump to address
	JMP $4E5B			; 4C 5B 4E | Jump to address
	JMP $4E3F			; 4C 3F 4E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_658
; Address: $DACE5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_658:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_659
; Address: $DACE68
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_659:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4E81			; 4C 81 4E | Jump to address
	JMP $4E72			; 4C 72 4E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_65A
; Address: $DACE81
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_65A:
	JSL $CD5010		  ; 22 10 50 CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4E94			; 4C 94 4E | Jump to address
	JMP $4E85			; 4C 85 4E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_65E
; Address: $DACE9F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_65E:
	JSL $CDBD31		  ; 22 31 BD CD | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_660
; Address: $DACEAD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_660:
	JSL $CCD06C		  ; 22 6C D0 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$68			 ; C9 68 | Compare accumulator (immediate)
	BPL $90			  ; 10 90 | Branch if positive
	JMP $4EC0			; 4C C0 4E | Jump to address
	JMP $4EB1			; 4C B1 4E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_663
; Address: $DACEC8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_663:
	JSL $CDC5B0		  ; 22 B0 C5 CD | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $4EDE			; 4C DE 4E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_665
; Address: $DACEDE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_665:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$90			 ; A9 90 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_666
; Address: $DACEEB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_666:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4EF7			; 4C F7 4E | Jump to address
	JMP $4EFA			; 4C FA 4E | Jump to address
	JMP $4EDE			; 4C DE 4E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_667
; Address: $DACEFA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_667:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4F13			; 4C 13 4F | Jump to address
	JMP $4F04			; 4C 04 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_668
; Address: $DACF13
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_668:
	JSL $CD5010		  ; 22 10 50 CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$58			 ; C9 58 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4F26			; 4C 26 4F | Jump to address
	JMP $4F17			; 4C 17 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_66B
; Address: $DACF31
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_66B:
	JSL $CDBD31		  ; 22 31 BD CD | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_66D
; Address: $DACF3F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_66D:
	JSL $CCD06C		  ; 22 6C D0 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_66E
; Address: $DACF48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_66E:
	JSR $0390			; 20 90 03 | Jump to subroutine
	JMP $4F52			; 4C 52 4F | Jump to address
	JMP $4F43			; 4C 43 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_672
; Address: $DACF5E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_672:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$90			 ; A9 90 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_673
; Address: $DACF6B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_673:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4F77			; 4C 77 4F | Jump to address
	JMP $4F7A			; 4C 7A 4F | Jump to address
	JMP $4F5E			; 4C 5E 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_674
; Address: $DACF7A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_674:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	LDA #$28			 ; A9 28 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4F93			; 4C 93 4F | Jump to address
	JMP $4F84			; 4C 84 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_675
; Address: $DACF93
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_675:
	JSL $CD5010		  ; 22 10 50 CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$F8			 ; C9 F8 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4FA6			; 4C A6 4F | Jump to address
	JMP $4F97			; 4C 97 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_678
; Address: $DACFB1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_678:
	JSL $CDBD31		  ; 22 31 BD CD | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ROL $008D			; 2E 8D 00 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_67A
; Address: $DACFBF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_67A:
	JSL $CCD06C		  ; 22 6C D0 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$A8			 ; C9 A8 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_67B
; Address: $DACFC9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_67B:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $4FD2			; 4C D2 4F | Jump to address
	JMP $4FC3			; 4C C3 4F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_682
; Address: $DACFF6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_682:
	JSL $CCD066		  ; 22 66 D0 CC | Jump to subroutine long
	LDA #$80			 ; A9 80 | Audio system operation
	LDA #$08			 ; A9 08 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_684
; Address: $DAD00A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_684:
	JSL $CCD298		  ; 22 98 D2 CC | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_688
; Address: $DAD021
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_688:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CMP ($47,X)		  ; C1 47 | Compare accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5039			; 4C 39 50 | Jump to address
	JMP $5029			; 4C 29 50 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_689
; Address: $DAD03A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_689:
	LDA #$D3			 ; A9 D3 | Audio system operation
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLV				  ; B8 | Clear overflow flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_68A
; Address: $DAD043
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_68A:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_68B
; Address: $DAD056
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_68B:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $506A			; 4C 6A 50 | Jump to address
	JMP $505B			; 4C 5B 50 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_68C
; Address: $DAD06A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_68C:
	JSL $CD515C		  ; 22 5C 51 CD | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_68D
; Address: $DAD074
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_68D:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $508D			; 4C 8D 50 | Jump to address
	JMP $507E			; 4C 7E 50 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_68E
; Address: $DAD08D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_68E:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$D3			 ; A9 D3 | Audio system operation
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_68F
; Address: $DAD09A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_68F:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_690
; Address: $DAD0AD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_690:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $50CA			; 4C CA 50 | Jump to address
	JMP $50BB			; 4C BB 50 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_691
; Address: $DAD0CA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_691:
	JSL $CD515C		  ; 22 5C 51 CD | Jump to subroutine long
	LDA #$70			 ; A9 70 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_692
; Address: $DAD0D4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_692:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$58			 ; A9 58 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $50ED			; 4C ED 50 | Jump to address
	JMP $50DE			; 4C DE 50 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_693
; Address: $DAD0ED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_693:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$D3			 ; A9 D3 | Audio system operation
	LDX #$C0			 ; A2 C0 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_695
; Address: $DAD100
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_695:
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_696
; Address: $DAD10D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_696:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $512A			; 4C 2A 51 | Jump to address
	JMP $511B			; 4C 1B 51 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_697
; Address: $DAD12A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_697:
	JSL $CD515C		  ; 22 5C 51 CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_698
; Address: $DAD134
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_698:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$F8			 ; A9 F8 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E0			 ; C9 E0 | Game work RAM access
	ROL $0390			; 2E 90 03 | Rotate left (absolute)
	JMP $514D			; 4C 4D 51 | Jump to address
	JMP $513E			; 4C 3E 51 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_699
; Address: $DAD14D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_699:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_69B
; Address: $DAD163
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_69B:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$03			 ; A9 03 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_69D
; Address: $DAD178
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_69D:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_69E
; Address: $DAD183
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_69E:
	LDA #$D3			 ; A9 D3 | Audio system operation
	LDX #$20			 ; A2 20 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A0
; Address: $DAD192
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A0:
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A1
; Address: $DAD19F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A1:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $51B3			; 4C B3 51 | Jump to address
	JMP $51A4			; 4C A4 51 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A3
; Address: $DAD1B7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A3:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $51CA			; 4C CA 51 | Jump to address
	JMP $51BB			; 4C BB 51 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A4
; Address: $DAD1CA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A4:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$D3			 ; A9 D3 | Audio system operation
	LDX #$20			 ; A2 20 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A5
; Address: $DAD1D7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A5:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A6
; Address: $DAD1EA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A6:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5207			; 4C 07 52 | Jump to address
	JMP $51F8			; 4C F8 51 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A8
; Address: $DAD20B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A8:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $521E			; 4C 1E 52 | Jump to address
	JMP $520F			; 4C 0F 52 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6A9
; Address: $DAD21E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6A9:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$D3			 ; A9 D3 | Audio system operation
	LDX #$20			 ; A2 20 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$38			 ; A0 38 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6AB
; Address: $DAD22B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6AB:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6AC
; Address: $DAD23E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6AC:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $525B			; 4C 5B 52 | Jump to address
	JMP $524C			; 4C 4C 52 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6AE
; Address: $DAD25F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6AE:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E0			 ; C9 E0 | Game work RAM access
	ROL $0390			; 2E 90 03 | Rotate left (absolute)
	JMP $5272			; 4C 72 52 | Jump to address
	JMP $5263			; 4C 63 52 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6AF
; Address: $DAD272
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6AF:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B0
; Address: $DAD281
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B0:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B2
; Address: $DAD297
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B2:
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$98			 ; A9 98 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B3
; Address: $DAD2B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B3:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B4
; Address: $DAD2BA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B4:
	BRA $96			  ; 80 96 | Branch always
	LDA #$B8			 ; A9 B8 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CA			 ; A2 CA | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B5
; Address: $DAD2C8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B5:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$98			 ; A9 98 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B6
; Address: $DAD2E7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B6:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$B8			 ; A9 B8 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B8
; Address: $DAD302
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B8:
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$58			 ; A9 58 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6B9
; Address: $DAD31D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6B9:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$78			 ; A9 78 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CA			 ; A2 CA | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6BB
; Address: $DAD337
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6BB:
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$58			 ; A9 58 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6BC
; Address: $DAD352
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6BC:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$78			 ; A9 78 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6BE
; Address: $DAD36D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6BE:
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$18			 ; A9 18 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6BF
; Address: $DAD388
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6BF:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$38			 ; A9 38 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CA			 ; A2 CA | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6C0
; Address: $DAD39E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6C0:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$18			 ; A9 18 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6C1
; Address: $DAD3B1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6C1:
	STA $9684			; 8D 84 96 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$03			 ; A2 03 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6C2
; Address: $DAD3BD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6C2:
	JSL $C734FC		  ; 22 FC 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$38			 ; A9 38 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CB			 ; A2 CB | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6C4
; Address: $DAD3D8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6C4:
	LDA #$54			 ; A9 54 | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$6C			 ; A9 6C | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$5A			 ; A9 5A | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$6C			 ; A9 6C | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6C7
; Address: $DAD3FF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6C7:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$20			 ; A9 20 | Audio system operation
	LDX #$48			 ; A2 48 | Load immediate value into X register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDX #$53			 ; A2 53 | Load immediate value into X register
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5418			; 4C 18 54 | Jump to address
	JMP $541B			; 4C 1B 54 | Jump to address
	JMP $53FF			; 4C FF 53 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6CB
; Address: $DAD425
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6CB:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$20			 ; A9 20 | Audio system operation
	LSR $008D			; 4E 8D 00 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6D3
; Address: $DAD451
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6D3:
	JSL $CCD37E		  ; 22 7E D3 CC | Jump to subroutine long
	JMP ($0008)		  ; 6C 08 00 | Jump to address (absolute indirect)
	ADC $2208			; 6D 08 22 | Add with carry (absolute)
	LDY $22CD			; AC CD 22 | Load from absolute address into Y register
	PEA #$CDAD		   ; F4 AD CD | Push effective address to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6D8
; Address: $DAD47D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6D8:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$D6			 ; A9 D6 | Audio system operation
	LDX #$80			 ; A2 80 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6DA
; Address: $DAD48D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6DA:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6DB
; Address: $DAD497
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6DB:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $54BA			; 4C BA 54 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6DC
; Address: $DAD4A7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6DC:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $54B6			; 4C B6 54 | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	JMP $549C			; 4C 9C 54 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6DD
; Address: $DAD4BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6DD:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDX #$78			 ; A2 78 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6DE
; Address: $DAD4C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6DE:
	JSL $C73CD1		  ; 22 D1 3C C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6E2
; Address: $DAD4DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6E2:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6E3
; Address: $DAD4E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6E3:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5514			; 4C 14 55 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6E5
; Address: $DAD4F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6E5:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6E7
; Address: $DAD508
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6E7:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	INC $54			  ; E6 54 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6EA
; Address: $DAD51C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6EA:
	JSL $C75930		  ; 22 30 59 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6EB
; Address: $DAD522
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6EB:
	LDA #$D0			 ; A9 D0 | Audio system operation
	LDX #$58			 ; A2 58 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6ED
; Address: $DAD531
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6ED:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6EE
; Address: $DAD53B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6EE:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5552			; 4C 52 55 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F2
; Address: $DAD55C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F2:
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $0390			; 4E 90 03 | Logical shift right (absolute)
	JMP $55B1			; 4C B1 55 | Jump to address
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5576			; 4C 76 55 | Jump to address
	JMP $5567			; 4C 67 55 | Jump to address
	LDA #$0B			 ; A9 0B | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F3
; Address: $DAD579
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F3:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F4
; Address: $DAD583
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F4:
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $558F			; 4C 8F 55 | Jump to address
	LDA #$BB			 ; A9 BB | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F6
; Address: $DAD592
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F6:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $55A8			; 4C A8 55 | Jump to address
	LDA #$BC			 ; A9 BC | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F7
; Address: $DAD5A4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F7:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	JMP $555C			; 4C 5C 55 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F8
; Address: $DAD5B3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F8:
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $0390			; 4E 90 03 | Logical shift right (absolute)
	JMP $5621			; 4C 21 56 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6F9
; Address: $DAD5C1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6F9:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	JMP $55E6			; 4C E6 55 | Jump to address
	LDA #$78			 ; A9 78 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6FA
; Address: $DAD5CB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6FA:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $5601			; 4C 01 56 | Jump to address
	LDA #$64			 ; A9 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6FB
; Address: $DAD5D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6FB:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $5601			; 4C 01 56 | Jump to address
	LDA #$50			 ; A9 50 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6FC
; Address: $DAD5DF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6FC:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $5601			; 4C 01 56 | Jump to address
	LDA $C141			; AD 41 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $55C8			; 4C C8 55 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $55D2			; 4C D2 55 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $55DC			; 4C DC 55 | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $561E			; 4C 1E 56 | Jump to address
	LDA #$88			 ; A9 88 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_6FF
; Address: $DAD61A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_6FF:
	JSL $CCD428		  ; 22 28 D4 CC | Jump to subroutine long
	JMP $55B3			; 4C B3 55 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_700
; Address: $DAD622
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_700:
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5660			; 4C 60 56 | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_701
; Address: $DAD630
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_701:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5660			; 4C 60 56 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_702
; Address: $DAD63C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_702:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $564E			; 4C 4E 56 | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	JMP $5660			; 4C 60 56 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_703
; Address: $DAD651
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_703:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5660			; 4C 60 56 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_704
; Address: $DAD661
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_704:
	PHA				  ; 48 | Push accumulator to stack
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5671			; 4C 71 56 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_706
; Address: $DAD672
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_706:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5687			; 4C 87 56 | Jump to address
	JMP $5914			; 4C 14 59 | Jump to address
	JMP $56A6			; 4C A6 56 | Jump to address
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5698			; 4C 98 56 | Jump to address
	JMP $58CE			; 4C CE 58 | Jump to address
	JMP $56A6			; 4C A6 56 | Jump to address
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $56A6			; 4C A6 56 | Jump to address
	JMP $5888			; 4C 88 58 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_708
; Address: $DAD6AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_708:
	LDA #$00			 ; A9 00 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_709
; Address: $DAD6B3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_709:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $56BF			; 4C BF 56 | Jump to address
	JMP $56C2			; 4C C2 56 | Jump to address
	JMP $56A6			; 4C A6 56 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_70B
; Address: $DAD6C9
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_70B:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$4C			 ; C9 4C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $56E2			; 4C E2 56 | Jump to address
	JMP $56D3			; 4C D3 56 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$7A			 ; A9 7A | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_70C
; Address: $DAD6EE
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_70C:
	JSL $CD5CBF		  ; 22 BF 5C CD | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5707			; 4C 07 57 | Jump to address
	JMP $56F8			; 4C F8 56 | Jump to address
	LDA #$10			 ; A9 10 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$7A			 ; A9 7A | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_70D
; Address: $DAD713
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_70D:
	JSL $CD5CBF		  ; 22 BF 5C CD | Jump to subroutine long
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$1C			 ; C9 1C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $572C			; 4C 2C 57 | Jump to address
	JMP $571D			; 4C 1D 57 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_70E
; Address: $DAD72C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_70E:
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$A8			 ; A9 A8 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_70F
; Address: $DAD738
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_70F:
	JSL $CD5CBF		  ; 22 BF 5C CD | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BPL $90			  ; 10 90 | Branch if positive
	JMP $5751			; 4C 51 57 | Jump to address
	JMP $5742			; 4C 42 57 | Jump to address
	LDA #$40			 ; A9 40 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$A8			 ; A9 A8 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_710
; Address: $DAD75D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_710:
	JSL $CD5CBF		  ; 22 BF 5C CD | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$EC			 ; C9 EC | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5776			; 4C 76 57 | Jump to address
	JMP $5767			; 4C 67 57 | Jump to address
	LDA #$B0			 ; A9 B0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$08			 ; A9 08 | Audio system operation
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_711
; Address: $DAD782
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_711:
	JSL $CD5CBF		  ; 22 BF 5C CD | Jump to subroutine long
	LDA #$70			 ; A9 70 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D4			 ; C9 D4 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $579B			; 4C 9B 57 | Jump to address
	JMP $578C			; 4C 8C 57 | Jump to address
	LDA #$40			 ; A9 40 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$08			 ; A9 08 | Audio system operation
	STA $9682			; 8D 82 96 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_714
; Address: $DAD7B5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_714:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$92			 ; C0 92 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $57CD			; 4C CD 57 | Jump to address
	JMP $57BD			; 4C BD 57 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_715
; Address: $DAD7D0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_715:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$30			 ; A9 30 | Audio system operation
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $57E9			; 4C E9 57 | Jump to address
	JMP $57DA			; 4C DA 57 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_717
; Address: $DAD7F3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_717:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5800			; 4C 00 58 | Jump to address
	JMP $57F0			; 4C F0 57 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_719
; Address: $DAD804
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_719:
	JSL $CDAED1		  ; 22 D1 AE CD | Jump to subroutine long
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5819			; 4C 19 58 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $581C			; 4C 1C 58 | Jump to address
	ROR $0008			; 6E 08 00 | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_71A
; Address: $DAD81F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_71A:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$08			 ; A9 08 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_71C
; Address: $DAD830
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_71C:
	JSL $C687A0		  ; 22 A0 87 C6 | Jump to subroutine long
	LDA $C149			; AD 49 C1 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5849			; 4C 49 58 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_71F
; Address: $DAD84D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_71F:
	JSL $CDAEF1		  ; 22 F1 AE CD | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_721
; Address: $DAD85B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_721:
	LDA #$01			 ; A9 01 | Audio system operation
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_723
; Address: $DAD865
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_723:
	JSL $CCD07D		  ; 22 7D D0 CC | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_724
; Address: $DAD86F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_724:
	JSL $CDE326		  ; 22 26 E3 CD | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_728
; Address: $DAD888
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_728:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_729
; Address: $DAD890
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_729:
	JSR $A00A			; 20 0A A0 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_72A
; Address: $DAD895
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_72A:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $58A1			; 4C A1 58 | Jump to address
	JMP $58A4			; 4C A4 58 | Jump to address
	JMP $5888			; 4C 88 58 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_72C
; Address: $DAD8AB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_72C:
	JSL $C687A0		  ; 22 A0 87 C6 | Jump to subroutine long
	LDA $C149			; AD 49 C1 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $58C4			; 4C C4 58 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_72D
; Address: $DAD8C0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_72D:
	JSL $C67A85		  ; 22 85 7A C6 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_72F
; Address: $DAD8CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_72F:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_730
; Address: $DAD8D6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_730:
	JSR $A00A			; 20 0A A0 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $58E7			; 4C E7 58 | Jump to address
	JMP $58EA			; 4C EA 58 | Jump to address
	JMP $58CE			; 4C CE 58 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_732
; Address: $DAD8F1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_732:
	JSL $C687A0		  ; 22 A0 87 C6 | Jump to subroutine long
	LDA $C149			; AD 49 C1 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $590A			; 4C 0A 59 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_733
; Address: $DAD906
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_733:
	JSL $C67A85		  ; 22 85 7A C6 | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_735
; Address: $DAD914
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_735:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$F8			 ; A9 F8 | Audio system operation
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ADC $53			  ; 65 53 | Add with carry (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $592D			; 4C 2D 59 | Jump to address
	JMP $5930			; 4C 30 59 | Jump to address
	JMP $5914			; 4C 14 59 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_738
; Address: $DAD93B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_738:
	JSL $CDA0E5		  ; 22 E5 A0 CD | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_739
; Address: $DAD94E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_739:
	JSL $C687A0		  ; 22 A0 87 C6 | Jump to subroutine long
	LDA $C149			; AD 49 C1 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5967			; 4C 67 59 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_73B
; Address: $DAD967
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_73B:
	JSL $CDE093		  ; 22 93 E0 CD | Jump to subroutine long
	LDA #$41			 ; A9 41 | Audio system operation
	LDX #$2E			 ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_73D
; Address: $DAD975
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_73D:
	JSL $CDE0D0		  ; 22 D0 E0 CD | Jump to subroutine long
	LDA #$41			 ; A9 41 | Audio system operation
	LDX #$2E			 ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_740
; Address: $DAD987
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_740:
	JSL $CDD806		  ; 22 06 D8 CD | Jump to subroutine long
	LDX #$04			 ; A2 04 | Load immediate value into X register
	LDA #$08			 ; A9 08 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_742
; Address: $DAD995
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_742:
	JSL $CDD682		  ; 22 82 D6 CD | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $59A8			; 4C A8 59 | Jump to address
	JMP $5999			; 4C 99 59 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_747
; Address: $DAD9C4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_747:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$4C			 ; C9 4C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $59DD			; 4C DD 59 | Jump to address
	JMP $59CE			; 4C CE 59 | Jump to address
	ADC ($08),Y		  ; 71 08 | Add with carry ((zero page),Y)
	LDA #$D0			 ; A9 D0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $59F5			; 4C F5 59 | Jump to address
	JMP $59E6			; 4C E6 59 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_748
; Address: $DAD9F5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_748:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$1C			 ; C9 1C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5A11			; 4C 11 5A | Jump to address
	JMP $5A02			; 4C 02 5A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_749
; Address: $DADA11
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_749:
	JSL $CDACBD		  ; 22 BD AC CD | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BPL $90			  ; 10 90 | Branch if positive
	JMP $5A2D			; 4C 2D 5A | Jump to address
	JMP $5A1E			; 4C 1E 5A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_74D
; Address: $DADA3F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_74D:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5A7B			; 4C 7B 5A | Jump to address
	LDA $9977			; AD 77 99 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_74E
; Address: $DADA5B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_74E:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5A73			; 4C 73 5A | Jump to address
	JMP $5A63			; 4C 63 5A | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LSR $A95A			; 4E 5A A9 | Logical shift right (absolute)
	LDY $A200			; AC 00 A2 | Load from absolute address into Y register
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_750
; Address: $DADA88
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_750:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5AA0			; 4C A0 5A | Jump to address
	JMP $5A90			; 4C 90 5A | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_751
; Address: $DADAA9
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_751:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5AC2			; 4C C2 5A | Jump to address
	JMP $5AB3			; 4C B3 5A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_754
; Address: $DADACD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_754:
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5ADF			; 4C DF 5A | Jump to address
	JMP $5AD0			; 4C D0 5A | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation
	ORA $A936,Y		  ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_755
; Address: $DADAEB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_755:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_756
; Address: $DADAF8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_756:
	JSL $C02EC7		  ; 22 C7 2E C0 | Jump to subroutine long
	LDX $0101,Y		  ; BE 01 01 | Load from absolute,Y into X register
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$70			 ; A9 70 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$CE			 ; A2 CE | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_757
; Address: $DADB11
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_757:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$35			 ; A9 35 | Audio system operation
	STA $9C0D			; 8D 0D 9C | Audio system operation
	LDA #$20			 ; A9 20 | Audio system operation
	STA $9C0F			; 8D 0F 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$A7			 ; A9 A7 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_759
; Address: $DADB2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_759:
	JSL $CCD06C		  ; 22 6C D0 CC | Jump to subroutine long
	LDA #$F8			 ; A9 F8 | Audio system operation
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_75A
; Address: $DADB38
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_75A:
	JSL $C733E5		  ; 22 E5 33 C7 | Jump to subroutine long
	LDA #$F8			 ; A9 F8 | Audio system operation
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_75C
; Address: $DADB46
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_75C:
	JSL $CCD07D		  ; 22 7D D0 CC | Jump to subroutine long
	LDA #$3E			 ; A9 3E | Audio system operation
	STA $9C11			; 8D 11 9C | Audio system operation
	LDA #$41			 ; A9 41 | Audio system operation
	STA $9C13			; 8D 13 9C | Audio system operation
	LDA #$44			 ; A9 44 | Audio system operation
	STA $9C15			; 8D 15 9C | Audio system operation
	LDA #$41			 ; A9 41 | Audio system operation
	STA $9C17			; 8D 17 9C | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_75E
; Address: $DADB68
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_75E:
	JSL $C736D0		  ; 22 D0 36 C7 | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_764
; Address: $DADB8F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_764:
	JSL $C74A4A		  ; 22 4A 4A C7 | Jump to subroutine long
	LDA #$A0			 ; A9 A0 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA #$AC			 ; A9 AC | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_765
; Address: $DADB9C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_765:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5BA9			; 4C A9 5B | Jump to address
	JMP $5B99			; 4C 99 5B | Jump to address
	LDA #$78			 ; A9 78 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_76B
; Address: $DADBCA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_76B:
	JSL $C74743		  ; 22 43 47 C7 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $340A			; 8D 0A 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_76C
; Address: $DADBD4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_76C:
	JSL $CCD430		  ; 22 30 D4 CC | Jump to subroutine long
	LDA #$88			 ; A9 88 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5BED			; 4C ED 5B | Jump to address
	JMP $5BDE			; 4C DE 5B | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_76E
; Address: $DADBF1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_76E:
	JSL $CC9AE6		  ; 22 E6 9A CC | Jump to subroutine long
	LDA #$08			 ; A9 08 | Audio system operation
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	LDA #$80			 ; A9 80 | Audio system operation
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_76F
; Address: $DADC01
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_76F:
	JSL $CC7B8A		  ; 22 8A 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5C10			; 4C 10 5C | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_770
; Address: $DADC10
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_770:
	LDA #$10			 ; A9 10 | Audio system operation
	ADC $A935,X		  ; 7D 35 A9 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROR $A935,X		  ; 7E 35 A9 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_771
; Address: $DADC1D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_771:
	JSR $0C00			; 20 00 0C | Jump to subroutine
	STX $35			  ; 86 35 | Store X register to zero page
	LDA #$40			 ; A9 40 | Audio system operation
	STX $35			  ; 86 35 | Store X register to zero page
	LDA #$80			 ; A9 80 | Audio system operation
	STX $35			  ; 86 35 | Store X register to zero page
	LDA #$40			 ; A9 40 | Audio system operation
	LDA #$02			 ; A9 02 | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_772
; Address: $DADC40
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_772:
	JSL $CCD383		  ; 22 83 D3 CC | Jump to subroutine long
	LDA $3408			; AD 08 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5C56			; 4C 56 5C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_773
; Address: $DADC4F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_773:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	JMP $5C44			; 4C 44 5C | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation
	LSR $0A8D			; 4E 8D 0A | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_775
; Address: $DADC63
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_775:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$E8			 ; A9 E8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$CF			 ; A2 CF | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_776
; Address: $DADC79
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_776:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$E8			 ; A9 E8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_77F
; Address: $DADCB2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_77F:
	JSL $CDC5E7		  ; 22 E7 C5 CD | Jump to subroutine long
	LDA #$2B			 ; A9 2B | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_783
; Address: $DADCD0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_783:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$DA			 ; C0 DA | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5CE8			; 4C E8 5C | Jump to address
	JMP $5CD8			; 4C D8 5C | Jump to address
	LDX #$02			 ; A2 02 | Load immediate value into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_786
; Address: $DADCF9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_786:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_789
; Address: $DADD12
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_789:
	PHA				  ; 48 | Push accumulator to stack
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5D42			; 4C 42 5D | Jump to address
	LDA #$D2			 ; A9 D2 | Audio system operation
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_78A
; Address: $DADD2D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_78A:
	JSL $C7400E		  ; 22 0E 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_78B
; Address: $DADD37
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_78B:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	JMP $5DC7			; 4C C7 5D | Jump to address
	JMP $5D60			; 4C 60 5D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_78C
; Address: $DADD42
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_78C:
	LDA #$D2			 ; A9 D2 | Audio system operation
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_78E
; Address: $DADD51
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_78E:
	JSL $C7400E		  ; 22 0E 40 C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_790
; Address: $DADD60
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_790:
	JSL $CDAEB1		  ; 22 B1 AE CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5D7F			; 4C 7F 5D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_791
; Address: $DADD73
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_791:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ADC #$5D			 ; 69 5D | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_792
; Address: $DADD7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_792:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_795
; Address: $DADD94
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_795:
	JSL $CDADE6		  ; 22 E6 AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5DA7			; 4C A7 5D | Jump to address
	JMP $5D98			; 4C 98 5D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_796
; Address: $DADDA7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_796:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	CMP ($3C),Y		  ; D1 3C | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_797
; Address: $DADDB5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_797:
	JSL $C7400E		  ; 22 0E 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_799
; Address: $DADDC3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_799:
	JSL $CDADF4		  ; 22 F4 AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5DD6			; 4C D6 5D | Jump to address
	JMP $5DC7			; 4C C7 5D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_79C
; Address: $DADDDE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_79C:
	JSL $C75930		  ; 22 30 59 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_79D
; Address: $DADDE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_79D:
	LDA $3545			; AD 45 35 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5DF6			; 4C F6 5D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A0
; Address: $DADDFB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A0:
	LDA $3545			; AD 45 35 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5E1F			; 4C 1F 5E | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A1
; Address: $DADE09
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A1:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5E1B			; 4C 1B 5E | Jump to address
	LDA #$E8			 ; A9 E8 | Audio system operation
	STA $3408			; 8D 08 34 | Audio system operation
	JMP $5E1F			; 4C 1F 5E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A3
; Address: $DADE20
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A3:
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5E7E			; 4C 7E 5E | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A4
; Address: $DADE2E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A4:
	JSL $C74C04		  ; 22 04 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5E7E			; 4C 7E 5E | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$D8			 ; A2 D8 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A5
; Address: $DADE40
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A5:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5E5C			; 4C 5C 5E | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A6
; Address: $DADE4C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A6:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5E59			; 4C 59 5E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A7
; Address: $DADE55
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A7:
	JSL $CCD2F4		  ; 22 F4 D2 CC | Jump to subroutine long
	JMP $5E7E			; 4C 7E 5E | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A8
; Address: $DADE5F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A8:
	LDX #$D8			 ; A2 D8 | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7A9
; Address: $DADE65
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7A9:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5E7E			; 4C 7E 5E | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7AA
; Address: $DADE71
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7AA:
	JSL $C76374		  ; 22 74 63 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $5E7E			; 4C 7E 5E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7AC
; Address: $DADE7F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7AC:
	JSL $CCD7EF		  ; 22 EF D7 CC | Jump to subroutine long
	LDA #$D8			 ; A9 D8 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7AD
; Address: $DADE8C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7AD:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDY $6B02,X		  ; BC 02 6B | Load from absolute,X into Y register
	LDA #$00			 ; A9 00 | Audio system operation
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$0B			 ; A9 0B | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7AF
; Address: $DADEAB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7AF:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B0
; Address: $DADEB9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B0:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B1
; Address: $DADEC3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B1:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5EDA			; 4C DA 5E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B2
; Address: $DADED2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B2:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	JMP $5EC7			; 4C C7 5E | Jump to address
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B4
; Address: $DADEE9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B4:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$C9			 ; A9 C9 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B6
; Address: $DADEF3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B6:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA $2202			; AD 02 22 | Audio system operation
	CPY $0BA9			; CC A9 0B | Compare Y register (absolute)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B8
; Address: $DADF0E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B8:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL $9000,X		  ; 1E 00 90 | Arithmetic shift left (absolute,X)
	JMP $5F2E			; 4C 2E 5F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7B9
; Address: $DADF21
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7B9:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDA $3404			; AD 04 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3404			; 8D 04 34 | Audio system operation
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5F4B			; 4C 4B 5F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7BB
; Address: $DADF4B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7BB:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA $3404			; AD 04 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3404			; 8D 04 34 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7BC
; Address: $DADF5B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7BC:
	LDA #$D4			 ; A9 D4 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7BD
; Address: $DADF64
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7BD:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA $03			  ; A5 03 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C0
; Address: $DADF78
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C0:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C4
; Address: $DADF8F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C4:
	PHA				  ; 48 | Push accumulator to stack
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5F9F			; 4C 9F 5F | Jump to address
	JMP $5FC3			; 4C C3 5F | Jump to address
	LDA #$F8			 ; A9 F8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$80			 ; A9 80 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C5
; Address: $DADFAB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C5:
	JSL $CD5E7F		  ; 22 7F 5E CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5FBF			; 4C BF 5F | Jump to address
	JMP $5FB0			; 4C B0 5F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C6
; Address: $DADFBF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C6:
	JSL $CD5E93		  ; 22 93 5E CD | Jump to subroutine long
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5FD2			; 4C D2 5F | Jump to address
	JMP $5FC3			; 4C C3 5F | Jump to address
	LDA #$FA			 ; A9 FA | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$43			 ; A9 43 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C7
; Address: $DADFDE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C7:
	JSL $CD5EE9		  ; 22 E9 5E CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $5FF1			; 4C F1 5F | Jump to address
	JMP $5FE2			; 4C E2 5F | Jump to address
	LDA #$D4			 ; A9 D4 | Audio system operation
	LDX #$20			 ; A2 20 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C8
; Address: $DADFFA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C8:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA $03			  ; A5 03 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7C9
; Address: $DAE008
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7C9:
	JSL $C73C23		  ; 22 23 3C C7 | Jump to subroutine long
	JMP $6041			; 4C 41 60 | Jump to address
	LDA #$97			 ; A9 97 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7CC
; Address: $DAE01C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7CC:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $606C			; 4C 6C 60 | Jump to address
	LDA #$60			 ; A9 60 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7CD
; Address: $DAE026
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7CD:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $606C			; 4C 6C 60 | Jump to address
	LDA #$40			 ; A9 40 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7CE
; Address: $DAE030
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7CE:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $606C			; 4C 6C 60 | Jump to address
	LDA #$30			 ; A9 30 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7CF
; Address: $DAE03A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7CF:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $606C			; 4C 6C 60 | Jump to address
	LDA $C141			; AD 41 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $600F			; 4C 0F 60 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6019			; 4C 19 60 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6023			; 4C 23 60 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $602D			; 4C 2D 60 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6037			; 4C 37 60 | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7D2
; Address: $DAE077
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7D2:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	JMP $60C3			; 4C C3 60 | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$3C			 ; E9 3C | Subtract with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$46			 ; E9 46 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation
	JMP $60DD			; 4C DD 60 | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$14			 ; E9 14 | Subtract with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$46			 ; E9 46 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7D3
; Address: $DAE0A9
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7D3:
	JMP $60DD			; 4C DD 60 | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$30			 ; 69 30 | Add with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$46			 ; E9 46 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation
	JMP $60DD			; 4C DD 60 | Jump to address
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $607E			; 4C 7E 60 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6095			; 4C 95 60 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $60AC			; 4C AC 60 | Jump to address
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7D5
; Address: $DAE0E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7D5:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7D8
; Address: $DAE0F9
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7D8:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $6118			; 4C 18 61 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ADC ($A9,X)		  ; 61 A9 | Add with carry ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ADC ($A9,X)		  ; 61 A9 | Add with carry ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ADC ($A3,X)		  ; 61 A3 | Add with carry ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6100			; 4C 00 61 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6108			; 4C 08 61 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6110			; 4C 10 61 | Jump to address
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $03F0			; 4E F0 03 | Logical shift right (absolute)
	JMP $6140			; 4C 40 61 | Jump to address
	JMP $6143			; 4C 43 61 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7D9
; Address: $DAE140
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7D9:
	JMP $6005			; 4C 05 60 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7DA
; Address: $DAE145
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7DA:
	PHA				  ; 48 | Push accumulator to stack
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6155			; 4C 55 61 | Jump to address
	JMP $6179			; 4C 79 61 | Jump to address
	LDA #$28			 ; A9 28 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$80			 ; A9 80 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7DB
; Address: $DAE161
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7DB:
	JSL $CD5E7F		  ; 22 7F 5E CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6175			; 4C 75 61 | Jump to address
	JMP $6166			; 4C 66 61 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7DC
; Address: $DAE175
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7DC:
	JSL $CD5E93		  ; 22 93 5E CD | Jump to subroutine long
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6188			; 4C 88 61 | Jump to address
	JMP $6179			; 4C 79 61 | Jump to address
	LDA #$13			 ; A9 13 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$3B			 ; A9 3B | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7DD
; Address: $DAE194
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7DD:
	JSL $CD5EE9		  ; 22 E9 5E CD | Jump to subroutine long
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $61A7			; 4C A7 61 | Jump to address
	JMP $6198			; 4C 98 61 | Jump to address
	LDA #$D4			 ; A9 D4 | Audio system operation
	LDX #$20			 ; A2 20 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7DE
; Address: $DAE1B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7DE:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA $03			  ; A5 03 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E1
; Address: $DAE1C8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E1:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $6222			; 4C 22 62 | Jump to address
	LDA #$92			 ; A9 92 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E2
; Address: $DAE1D2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E2:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $6222			; 4C 22 62 | Jump to address
	LDA #$70			 ; A9 70 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E3
; Address: $DAE1DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E3:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $6222			; 4C 22 62 | Jump to address
	LDA #$54			 ; A9 54 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E4
; Address: $DAE1E6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E4:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $6222			; 4C 22 62 | Jump to address
	LDA #$39			 ; A9 39 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E5
; Address: $DAE1F0
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E5:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $6222			; 4C 22 62 | Jump to address
	LDA $C141			; AD 41 C1 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $61C5			; 4C C5 61 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $61CF			; 4C CF 61 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $61D9			; 4C D9 61 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $61E3			; 4C E3 61 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $61ED			; 4C ED 61 | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E8
; Address: $DAE22D
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E8:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	JMP $6279			; 4C 79 62 | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$46			 ; E9 46 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation
	JMP $6293			; 4C 93 62 | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$16			 ; 69 16 | Add with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7E9
; Address: $DAE258
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7E9:
	SEC				  ; 38 | Set carry flag
	SBC #$46			 ; E9 46 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation
	JMP $6293			; 4C 93 62 | Jump to address
	LDA $3426			; AD 26 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$28			 ; E9 28 | Subtract with carry (immediate)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA $3428			; AD 28 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$46			 ; E9 46 | Subtract with carry (immediate)
	STA $3428			; 8D 28 34 | Audio system operation
	JMP $6293			; 4C 93 62 | Jump to address
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6234			; 4C 34 62 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $624B			; 4C 4B 62 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6262			; 4C 62 62 | Jump to address
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7EB
; Address: $DAE29D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7EB:
	JSL $CC7587		  ; 22 87 75 CC | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7EE
; Address: $DAE2AF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7EE:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $62CE			; 4C CE 62 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	LDA #$02			 ; A9 02 | Audio system operation
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $62B6			; 4C B6 62 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $62BE			; 4C BE 62 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $62C6			; 4C C6 62 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7EF
; Address: $DAE2E8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7EF:
	LDA $340A			; AD 0A 34 | Audio system operation
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	LSR $03F0			; 4E F0 03 | Logical shift right (absolute)
	JMP $62F6			; 4C F6 62 | Jump to address
	JMP $62F9			; 4C F9 62 | Jump to address
	JMP $61BB			; 4C BB 61 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F0
; Address: $DAE2FB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F0:
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $630A			; 4C 0A 63 | Jump to address
	JMP $632E			; 4C 2E 63 | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$B0			 ; A9 B0 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F1
; Address: $DAE316
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F1:
	JSL $CD5E7F		  ; 22 7F 5E CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $632A			; 4C 2A 63 | Jump to address
	JMP $631B			; 4C 1B 63 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F2
; Address: $DAE32A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F2:
	JSL $CD5E93		  ; 22 93 5E CD | Jump to subroutine long
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $633D			; 4C 3D 63 | Jump to address
	JMP $632E			; 4C 2E 63 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$35			 ; A9 35 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F4
; Address: $DAE34E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F4:
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $635D			; 4C 5D 63 | Jump to address
	JMP $6381			; 4C 81 63 | Jump to address
	LDA #$58			 ; A9 58 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$B0			 ; A9 B0 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F5
; Address: $DAE369
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F5:
	JSL $CD5E7F		  ; 22 7F 5E CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $637D			; 4C 7D 63 | Jump to address
	JMP $636E			; 4C 6E 63 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F6
; Address: $DAE37D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F6:
	JSL $CD5E93		  ; 22 93 5E CD | Jump to subroutine long
	LDA $3404			; AD 04 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6390			; 4C 90 63 | Jump to address
	JMP $6381			; 4C 81 63 | Jump to address
	LDA #$0E			 ; A9 0E | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$2D			 ; A9 2D | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F8
; Address: $DAE3A1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F8:
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $63B0			; 4C B0 63 | Jump to address
	JMP $63D4			; 4C D4 63 | Jump to address
	LDA #$C8			 ; A9 C8 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	LDA #$10			 ; A9 10 | Audio system operation
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7F9
; Address: $DAE3BC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7F9:
	JSL $CD5E7F		  ; 22 7F 5E CD | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $63D0			; 4C D0 63 | Jump to address
	JMP $63C1			; 4C C1 63 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7FB
; Address: $DAE3D5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7FB:
	PHA				  ; 48 | Push accumulator to stack
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $63E5			; 4C E5 63 | Jump to address
	JMP $6409			; 4C 09 64 | Jump to address
	LDA #$58			 ; A9 58 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3426			; 8D 26 34 | Audio system operation
	LDA #$10			 ; A9 10 | Audio system operation
	STA $3428			; 8D 28 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7FD
; Address: $DAE3F6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7FD:
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6405			; 4C 05 64 | Jump to address
	JMP $63F6			; 4C F6 63 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7FE
; Address: $DAE405
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7FE:
	JSL $CD5E93		  ; 22 93 5E CD | Jump to subroutine long
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6418			; 4C 18 64 | Jump to address
	JMP $6409			; 4C 09 64 | Jump to address
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $642A			; 4C 2A 64 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_7FF
; Address: $DAE423
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_7FF:
	JSL $CDE1BD		  ; 22 BD E1 CD | Jump to subroutine long
	JMP $6418			; 4C 18 64 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6445			; 4C 45 64 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_800
; Address: $DAE439
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_800:
	JSL $CDE1B1		  ; 22 B1 E1 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STZ $A9			  ; 64 A9 | Store zero to zero page
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6460			; 4C 60 64 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_801
; Address: $DAE454
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_801:
	JSL $CDE1A5		  ; 22 A5 E1 CD | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $A9			  ; 64 A9 | Store zero to zero page
	BVS $17			  ; 70 17 | Branch if overflow set
	STA $3406			; 8D 06 34 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_802
; Address: $DAE468
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_802:
	PHA				  ; 48 | Push accumulator to stack
	LDA $362A			; AD 2A 36 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $6487			; 4C 87 64 | Jump to address
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6484			; 4C 84 64 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_804
; Address: $DAE487
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_804:
	JSL $CCD7EF		  ; 22 EF D7 CC | Jump to subroutine long
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$88			 ; C9 88 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $64A5			; 4C A5 64 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_806
; Address: $DAE49E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_806:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $648C			; 4C 8C 64 | Jump to address
	LDA #$70			 ; A9 70 | Audio system operation
	STA $3402			; 8D 02 34 | Audio system operation
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $64BA			; 4C BA 64 | Jump to address
	JMP $64AB			; 4C AB 64 | Jump to address
	LDA $3406			; AD 06 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $64CC			; 4C CC 64 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_807
; Address: $DAE4C5
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_807:
	JSL $CDE1BD		  ; 22 BD E1 CD | Jump to subroutine long
	JMP $64BA			; 4C BA 64 | Jump to address
	LDA #$B8			 ; A9 B8 | Audio system operation
	STA $3406			; 8D 06 34 | Audio system operation
	LDA $3402			; AD 02 34 | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $64E1			; 4C E1 64 | Jump to address
	JMP $64D2			; 4C D2 64 | Jump to address
	LDX #$9D			 ; A2 9D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_809
; Address: $DAE4EB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_809:
	JSL $C74414		  ; 22 14 44 C7 | Jump to subroutine long
	JMP $64E8			; 4C E8 64 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_80A
; Address: $DAE4F5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_80A:
	LDA $3545			; AD 45 35 | Audio system operation
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6504			; 4C 04 65 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_80D
; Address: $DAE509
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_80D:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $651B			; 4C 1B 65 | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation
	JMP $6521			; 4C 21 65 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_80F
; Address: $DAE521
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_80F:
	JSL $C76F8C		  ; 22 8C 6F C7 | Jump to subroutine long
	LDA $C13F			; AD 3F C1 | Audio system operation
	STA $3442			; 8D 42 34 | Audio system operation
	LDA $3442			; AD 42 34 | Audio system operation
	STA $3444			; 8D 44 34 | Audio system operation
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6546			; 4C 46 65 | Jump to address
	LDA $3444			; AD 44 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $3444			; 8D 44 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_812
; Address: $DAE54F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_812:
	JSL $CCD276		  ; 22 76 D2 CC | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_813
; Address: $DAE55C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_813:
	JSL $C753A2		  ; 22 A2 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $656B			; 4C 6B 65 | Jump to address
	JMP $6583			; 4C 83 65 | Jump to address
	JMP $6580			; 4C 80 65 | Jump to address
	LDA #$F0			 ; A9 F0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_814
; Address: $DAE574
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_814:
	JSL $C75365		  ; 22 65 53 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6580			; 4C 80 65 | Jump to address
	JMP $6583			; 4C 83 65 | Jump to address
	JMP $654F			; 4C 4F 65 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_815
; Address: $DAE583
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_815:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $65A7			; 4C A7 65 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_816
; Address: $DAE58C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_816:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $659E			; 4C 9E 65 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3450			; 8D 50 34 | Audio system operation
	JMP $65A4			; 4C A4 65 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	STA $3450			; 8D 50 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_818
; Address: $DAE5A7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_818:
	JSL $CC7D1C		  ; 22 1C 7D CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $65B9			; 4C B9 65 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3450			; 8D 50 34 | Audio system operation
	JMP $65BF			; 4C BF 65 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	STA $3450			; 8D 50 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_81C
; Address: $DAE5CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_81C:
	JSL $CCD392		  ; 22 92 D3 CC | Jump to subroutine long
	LDA #$F4			 ; A9 F4 | Audio system operation
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX #$1F			 ; A2 1F | Load immediate value into X register
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_820
; Address: $DAE5E7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_820:
	JSL $CDADD8		  ; 22 D8 AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$78			 ; C9 78 | Compare accumulator (immediate)
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	JMP $65FA			; 4C FA 65 | Jump to address
	JMP $65EB			; 4C EB 65 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_821
; Address: $DAE5FB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_821:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3446			; 8D 46 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $3448			; 8D 48 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $344A			; 8D 4A 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $344C			; 8D 4C 34 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	STA $344E			; 8D 4E 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_822
; Address: $DAE61A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_822:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6695			; 4C 95 66 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6692			; 4C 92 66 | Jump to address
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ROL $2234,X		  ; 3E 34 22 | Rotate left (absolute,X)
	STX $7C			  ; 86 7C | Store X register to zero page
	CPY $03B0			; CC B0 03 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_823
; Address: $DAE63D
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_823:
	JMP $668A			; 4C 8A 66 | Jump to address
	JMP $6667			; 4C 67 66 | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation
	STA $344E			; 8D 4E 34 | Audio system operation
	JMP $668A			; 4C 8A 66 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation
	STA $344E			; 8D 4E 34 | Audio system operation
	JMP $668A			; 4C 8A 66 | Jump to address
	LDA #$03			 ; A9 03 | Audio system operation
	STA $344E			; 8D 4E 34 | Audio system operation
	JMP $668A			; 4C 8A 66 | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation
	STA $344E			; 8D 4E 34 | Audio system operation
	JMP $668A			; 4C 8A 66 | Jump to address
	LDA $343E			; AD 3E 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6643			; 4C 43 66 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $664C			; 4C 4C 66 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6655			; 4C 55 66 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $665E			; 4C 5E 66 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ROR $4C			  ; 66 4C | Rotate right (zero page)
	ROR $A9			  ; 66 A9 | Rotate right (zero page)
	STA $344E			; 8D 4E 34 | Audio system operation
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_825
; Address: $DAE6A2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_825:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $66B5			; 4C B5 66 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_826
; Address: $DAE6AB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_826:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Audio system operation
	STA $3446			; 8D 46 34 | Audio system operation
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_828
; Address: $DAE6BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_828:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $66CF			; 4C CF 66 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_829
; Address: $DAE6C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_829:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Audio system operation
	STA $3448			; 8D 48 34 | Audio system operation
	LDA #$22			 ; A9 22 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_82B
; Address: $DAE6D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_82B:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $66E9			; 4C E9 66 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_82C
; Address: $DAE6DF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_82C:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Audio system operation
	STA $344A			; 8D 4A 34 | Audio system operation
	LDA #$23			 ; A9 23 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_82E
; Address: $DAE6F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_82E:
	JSL $C74C86		  ; 22 86 4C C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6703			; 4C 03 67 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_82F
; Address: $DAE6F9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_82F:
	JSL $C74D4E		  ; 22 4E 4D C7 | Jump to subroutine long
	LDA $C18D			; AD 8D C1 | Audio system operation
	STA $344C			; 8D 4C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_830
; Address: $DAE703
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_830:
	JSL $C74BC2		  ; 22 C2 4B C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_834
; Address: $DAE716
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_834:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$78			 ; C9 78 | Compare accumulator (immediate)
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	JMP $6729			; 4C 29 67 | Jump to address
	JMP $671A			; 4C 1A 67 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_837
; Address: $DAE731
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_837:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$60			 ; C9 60 | Compare accumulator (immediate)
	ORA #$90			 ; 09 90 | Logical OR with accumulator (immediate)
	JMP $6744			; 4C 44 67 | Jump to address
	JMP $6735			; 4C 35 67 | Jump to address
	LDA $362B			; AD 2B 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $6753			; 4C 53 67 | Jump to address
	JMP $6744			; 4C 44 67 | Jump to address
	LDA #$14			 ; A9 14 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_839
; Address: $DAE75A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_839:
	JSL $CDADED		  ; 22 ED AD CD | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $67F4			; 4C F4 67 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_83F
; Address: $DAE77F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_83F:
	JSL $CCD903		  ; 22 03 D9 CC | Jump to subroutine long
	JMP $67E5			; 4C E5 67 | Jump to address
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_842
; Address: $DAE794
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_842:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	JMP $67E5			; 4C E5 67 | Jump to address
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_845
; Address: $DAE7A6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_845:
	JSL $CCD903		  ; 22 03 D9 CC | Jump to subroutine long
	JMP $67E5			; 4C E5 67 | Jump to address
	LDX #$1D			 ; A2 1D | Load immediate value into X register
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_848
; Address: $DAE7BB
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_848:
	JSL $CCD893		  ; 22 93 D8 CC | Jump to subroutine long
	JMP $67E5			; 4C E5 67 | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6774			; 4C 74 67 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6786			; 4C 86 67 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $679B			; 4C 9B 67 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $67AD			; 4C AD 67 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_851
; Address: $DAE811
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_851:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $6866			; 4C 66 68 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_855
; Address: $DAE82A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_855:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $6866			; 4C 66 68 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_858
; Address: $DAE83C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_858:
	JSL $CCD85D		  ; 22 5D D8 CC | Jump to subroutine long
	JMP $6866			; 4C 66 68 | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6811			; 4C 11 68 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6818			; 4C 18 68 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $682A			; 4C 2A 68 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6831			; 4C 31 68 | Jump to address
	LDA #$A4			 ; A9 A4 | Audio system operation
	STA $3434			; 8D 34 34 | Audio system operation
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_859
; Address: $DAE871
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_859:
	JSR $0390			; 20 90 03 | Jump to subroutine
	JMP $687B			; 4C 7B 68 | Jump to address
	JMP $686C			; 4C 6C 68 | Jump to address
	LDA #$6C			 ; A9 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_85A
; Address: $DAE87D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_85A:
	JSR $348D			; 20 8D 34 | Jump to subroutine
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_85B
; Address: $DAE886
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_85B:
	JSR $0390			; 20 90 03 | Jump to subroutine
	JMP $6890			; 4C 90 68 | Jump to address
	JMP $6881			; 4C 81 68 | Jump to address
	LDA #$34			 ; A9 34 | Audio system operation
	AND ($8D,X)		  ; 21 8D | Logical AND with accumulator ((zero page,X))
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$98			 ; C9 98 | Compare accumulator (immediate)
	AND ($90,X)		  ; 21 90 | Logical AND with accumulator ((zero page,X))
	JMP $68A5			; 4C A5 68 | Jump to address
	JMP $6896			; 4C 96 68 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_85D
; Address: $DAE8AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_85D:
	JSL $CDAE1E		  ; 22 1E AE CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_85E
; Address: $DAE8B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_85E:
	ROL				  ; 2A | Rotate left (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $68BF			; 4C BF 68 | Jump to address
	JMP $68B0			; 4C B0 68 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_863
; Address: $DAE8D5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_863:
	JSL $CDAE33		  ; 22 33 AE CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $68E8			; 4C E8 68 | Jump to address
	JMP $68D9			; 4C D9 68 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_864
; Address: $DAE8EB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_864:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6915			; 4C 15 69 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_867
; Address: $DAE902
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_867:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$A4			 ; C9 A4 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6915			; 4C 15 69 | Jump to address
	JMP $6906			; 4C 06 69 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_86B
; Address: $DAE924
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_86B:
	JSL $CDC5B9		  ; 22 B9 C5 CD | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_870
; Address: $DAE941
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_870:
	JSL $CDAED1		  ; 22 D1 AE CD | Jump to subroutine long
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $697E			; 4C 7E 69 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_871
; Address: $DAE952
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_871:
	JSL $CCD73B		  ; 22 3B D7 CC | Jump to subroutine long
	LDA $3424			; AD 24 34 | Audio system operation
	CMP #$1D			 ; C9 1D | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $696C			; 4C 6C 69 | Jump to address
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_873
; Address: $DAE968
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_873:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$1F			 ; A2 1F | Load immediate value into X register
	LDA #$1F			 ; A9 1F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_877
; Address: $DAE97E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_877:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A14			; 4C 14 6A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_879
; Address: $DAE991
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_879:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $69DA			; 4C DA 69 | Jump to address
	JMP $69FD			; 4C FD 69 | Jump to address
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_87C
; Address: $DAE9A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_87C:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	JMP $69FD			; 4C FD 69 | Jump to address
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	LDA #$23			 ; A9 23 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_87F
; Address: $DAE9BE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_87F:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	JMP $69FD			; 4C FD 69 | Jump to address
	LDX #$21			 ; A2 21 | PPU graphics register access
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_882
; Address: $DAE9D3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_882:
	JSL $CCD869		  ; 22 69 D8 CC | Jump to subroutine long
	JMP $69FD			; 4C FD 69 | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6998			; 4C 98 69 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $699B			; 4C 9B 69 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $69B0			; 4C B0 69 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_883
; Address: $DAE9F5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_883:
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $69C5			; 4C C5 69 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_888
; Address: $DAEA0D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_888:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	JMP $6A8F			; 4C 8F 6A | Jump to address
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$A4			 ; C9 A4 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6A23			; 4C 23 6A | Jump to address
	JMP $6A14			; 4C 14 6A | Jump to address
	JMP $6A68			; 4C 68 6A | Jump to address
	JMP $6A8B			; 4C 8B 6A | Jump to address
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_88B
; Address: $DAEA37
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_88B:
	JSL $CCD8A3		  ; 22 A3 D8 CC | Jump to subroutine long
	JMP $6A8B			; 4C 8B 6A | Jump to address
	LDX #$1D			 ; A2 1D | Load immediate value into X register
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_88E
; Address: $DAEA4C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_88E:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $6A8B			; 4C 8B 6A | Jump to address
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_891
; Address: $DAEA61
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_891:
	JSL $CCD8A3		  ; 22 A3 D8 CC | Jump to subroutine long
	JMP $6A8B			; 4C 8B 6A | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A26			; 4C 26 6A | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A29			; 4C 29 6A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A3E			; 4C 3E 6A | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A53			; 4C 53 6A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_897
; Address: $DAEAA1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_897:
	JSL $CDAED1		  ; 22 D1 AE CD | Jump to subroutine long
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6ADE			; 4C DE 6A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_898
; Address: $DAEAB2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_898:
	JSL $CCD73B		  ; 22 3B D7 CC | Jump to subroutine long
	LDA $3424			; AD 24 34 | Audio system operation
	CMP #$1D			 ; C9 1D | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6ACC			; 4C CC 6A | Jump to address
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_89A
; Address: $DAEAC8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_89A:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$1F			 ; A2 1F | Load immediate value into X register
	LDA #$21			 ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank34_AudioFunction_89E
; Address: $DAEADE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_89E:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6B62			; 4C 62 6B | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8A0
; Address: $DAEAF1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8A0:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $6B28			; 4C 28 6B | Jump to address
	JMP $6B4B			; 4C 4B 6B | Jump to address
	JMP $6B4B			; 4C 4B 6B | Jump to address
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA #$23			 ; A9 23 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8A3
; Address: $DAEB0C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8A3:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	JMP $6B4B			; 4C 4B 6B | Jump to address
	LDX #$1D			 ; A2 1D | Load immediate value into X register
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8A6
; Address: $DAEB21
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8A6:
	JSL $CCD893		  ; 22 93 D8 CC | Jump to subroutine long
	JMP $6B4B			; 4C 4B 6B | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6AF8			; 4C F8 6A | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8A7
; Address: $DAEB38
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8A7:
	JMP $6AFB			; 4C FB 6A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6AFE			; 4C FE 6A | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6B13			; 4C 13 6B | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8AC
; Address: $DAEB5B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8AC:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	JMP $6BE1			; 4C E1 6B | Jump to address
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$6C			 ; C9 6C | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8AD
; Address: $DAEB67
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8AD:
	JSR $0390			; 20 90 03 | Jump to subroutine
	JMP $6B71			; 4C 71 6B | Jump to address
	JMP $6B62			; 4C 62 6B | Jump to address
	JMP $6BBA			; 4C BA 6B | Jump to address
	JMP $6BDD			; 4C DD 6B | Jump to address
	JMP $6BDD			; 4C DD 6B | Jump to address
	LDA #$1F			 ; A9 1F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8AF
; Address: $DAEB81
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8AF:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$21			 ; A2 21 | PPU graphics register access
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8B2
; Address: $DAEB93
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8B2:
	JSL $CCD8A3		  ; 22 A3 D8 CC | Jump to subroutine long
	JMP $6BDD			; 4C DD 6B | Jump to address
	LDA #$1F			 ; A9 1F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8B4
; Address: $DAEBA1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8B4:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8B7
; Address: $DAEBB3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8B7:
	JSL $CCD8A3		  ; 22 A3 D8 CC | Jump to subroutine long
	JMP $6BDD			; 4C DD 6B | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6B74			; 4C 74 6B | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6B77			; 4C 77 6B | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6B7A			; 4C 7A 6B | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8BE
; Address: $DAEBF3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8BE:
	JSL $CDAED1		  ; 22 D1 AE CD | Jump to subroutine long
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6C30			; 4C 30 6C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8BF
; Address: $DAEC04
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8BF:
	JSL $CCD73B		  ; 22 3B D7 CC | Jump to subroutine long
	LDA $3424			; AD 24 34 | Audio system operation
	CMP #$1D			 ; C9 1D | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6C1E			; 4C 1E 6C | Jump to address
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8C1
; Address: $DAEC1A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8C1:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$1F			 ; A2 1F | Load immediate value into X register
	LDA #$23			 ; A9 23 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8C5
; Address: $DAEC30
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8C5:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6CA2			; 4C A2 6C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8C7
; Address: $DAEC43
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8C7:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $6C68			; 4C 68 6C | Jump to address
	JMP $6C8B			; 4C 8B 6C | Jump to address
	JMP $6C8B			; 4C 8B 6C | Jump to address
	JMP $6C8B			; 4C 8B 6C | Jump to address
	LDX #$21			 ; A2 21 | PPU graphics register access
	LDA #$20			 ; A9 20 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8CA
; Address: $DAEC61
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8CA:
	JSL $CCD8D3		  ; 22 D3 D8 CC | Jump to subroutine long
	JMP $6C8B			; 4C 8B 6C | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6C4A			; 4C 4A 6C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8CB
; Address: $DAEC78
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8CB:
	JMP $6C4D			; 4C 4D 6C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6C50			; 4C 50 6C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6C53			; 4C 53 6C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8D0
; Address: $DAEC9B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8D0:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	JMP $6D04			; 4C 04 6D | Jump to address
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	AND ($90,X)		  ; 21 90 | Logical AND with accumulator ((zero page,X))
	JMP $6CB1			; 4C B1 6C | Jump to address
	JMP $6CA2			; 4C A2 6C | Jump to address
	JMP $6CDD			; 4C DD 6C | Jump to address
	JMP $6D00			; 4C 00 6D | Jump to address
	JMP $6D00			; 4C 00 6D | Jump to address
	JMP $6D00			; 4C 00 6D | Jump to address
	LDA #$1F			 ; A9 1F | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8D2
; Address: $DAECC4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8D2:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDX #$22			 ; A2 22 | Load immediate value into X register
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8D5
; Address: $DAECD6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8D5:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	JMP $6D00			; 4C 00 6D | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6CB4			; 4C B4 6C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6CB7			; 4C B7 6C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6CBA			; 4C BA 6C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6CBD			; 4C BD 6C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8D7
; Address: $DAED05
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8D7:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8D8
; Address: $DAED0E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8D8:
	JMP $6E23			; 4C 23 6E | Jump to address
	LDA $353D			; AD 3D 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6D26			; 4C 26 6D | Jump to address
	LDA #$01			 ; A9 01 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8D9
; Address: $DAED1F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8D9:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	JMP $6D2D			; 4C 2D 6D | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8DC
; Address: $DAED31
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8DC:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$5C			 ; C9 5C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6D45			; 4C 45 6D | Jump to address
	JMP $6D36			; 4C 36 6D | Jump to address
	LDA #$CC			 ; A9 CC | Audio system operation
	LDX #$F8			 ; A2 F8 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$E0			 ; A0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8DD
; Address: $DAED4E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8DD:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDX $2202			; AE 02 22 | Load from absolute address into X register
	CPY $73A9			; CC A9 73 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8DE
; Address: $DAED5B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8DE:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8E0
; Address: $DAED69
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8E0:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	LDA #$C0			 ; A9 C0 | Audio system operation
	STA $3434			; 8D 34 34 | Audio system operation
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6D85			; 4C 85 6D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8E2
; Address: $DAED85
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8E2:
	JSL $CC750E		  ; 22 0E 75 CC | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Audio system operation
	LDX #$1E			 ; A2 1E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8E4
; Address: $DAED93
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8E4:
	JSL $CCD837		  ; 22 37 D8 CC | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Audio system operation
	STA $33D6			; 8D D6 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8E5
; Address: $DAED9D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8E5:
	JSL $C9A125		  ; 22 25 A1 C9 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8E7
; Address: $DAEDB0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8E7:
	JSL $C9A200		  ; 22 00 A2 C9 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDX $6D			  ; A6 6D | Load from zero page into X register
	LDA #$A1			 ; A9 A1 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8E9
; Address: $DAEDC4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8E9:
	JSL $CCD767		  ; 22 67 D7 CC | Jump to subroutine long
	LDA #$38			 ; A9 38 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	STA $3434			; 8D 34 34 | Audio system operation
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$64			 ; C9 64 | Compare accumulator (immediate)
	ORA $0390,Y		  ; 19 90 03 | Logical OR with accumulator (absolute,Y)
	JMP $6DE1			; 4C E1 6D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8EA
; Address: $DAEDD9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8EA:
	JSL $C9A200		  ; 22 00 A2 C9 | Jump to subroutine long
	JMP $6DCE			; 4C CE 6D | Jump to address
	LDA #$A1			 ; A9 A1 | Audio system operation
	LDX #$A0			 ; A2 A0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8EB
; Address: $DAEDE7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8EB:
	JSL $C72FE9		  ; 22 E9 2F C7 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6E0A			; 4C 0A 6E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8EC
; Address: $DAEDF8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8EC:
	JSL $C9A200		  ; 22 00 A2 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	STA $33D6			; 8D D6 33 | Audio system operation
	JMP $6DEB			; 4C EB 6D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8ED
; Address: $DAEE0A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8ED:
	JSL $C9A1C3		  ; 22 C3 A1 C9 | Jump to subroutine long
	LDA #$2C			 ; A9 2C | Audio system operation
	INC				  ; 1A | Increment accumulator
	STA $3434			; 8D 34 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8F1
; Address: $DAEE23
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8F1:
	JSL $C75930		  ; 22 30 59 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8F2
; Address: $DAEE29
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8F2:
	LDA #$9B			 ; A9 9B | Audio system operation
	LDX #$F8			 ; A2 F8 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8F6
; Address: $DAEE43
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8F6:
	JSL $CD6E29		  ; 22 29 6E CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6E5B			; 4C 5B 6E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8F7
; Address: $DAEE53
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8F7:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	JMP $6E48			; 4C 48 6E | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8F8
; Address: $DAEE5C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8F8:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$F4			 ; C9 F4 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	JMP $6E6D			; 4C 6D 6E | Jump to address
	JMP $6E5E			; 4C 5E 6E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_8F9
; Address: $DAEE6D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_8F9:
	JSL $CDE073		  ; 22 73 E0 CD | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Audio system operation
	LDX #$1F			 ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_901
; Address: $DAEE9E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_901:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	JMP $6EB1			; 4C B1 6E | Jump to address
	JMP $6EA2			; 4C A2 6E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_903
; Address: $DAEEB5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_903:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6F21			; 4C 21 6F | Jump to address
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6EE8			; 4C E8 6E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_909
; Address: $DAEEE1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_909:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	JMP $6F1E			; 4C 1E 6F | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6EFC			; 4C FC 6E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_90A
; Address: $DAEEF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_90A:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	EOR ($08),Y		  ; 51 08 | Exclusive OR with accumulator ((zero page),Y)
	JMP $6F02			; 4C 02 6F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_911
; Address: $DAEF21
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_911:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	EOR $2208,Y		  ; 59 08 22 | Exclusive OR with accumulator (absolute,Y)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	STZ $01			  ; 64 01 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank34_AudioFunction_915
; Address: $DAEF40
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_915:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_918
; Address: $DAEF53
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_918:
	JSL $CDACD7		  ; 22 D7 AC CD | Jump to subroutine long
	LDA #$5C			 ; A9 5C | Audio system operation
	STA $3434			; 8D 34 34 | Audio system operation
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6F6C			; 4C 6C 6F | Jump to address
	JMP $6F5D			; 4C 5D 6F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_91A
; Address: $DAEF70
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_91A:
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$7C			 ; C9 7C | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6F7F			; 4C 7F 6F | Jump to address
	JMP $6F70			; 4C 70 6F | Jump to address
	LDA #$C1			 ; A9 C1 | Audio system operation
	LDX #$4A			 ; A2 4A | Load immediate value into X register
	AND #$A0			 ; 29 A0 | Logical AND with accumulator (immediate)
	INC $227F,X		  ; FE 7F 22 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank34_AudioFunction_91B
; Address: $DAEF8C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_91B:
	JSL $CDAE02		  ; 22 02 AE CD | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6F9F			; 4C 9F 6F | Jump to address
	JMP $6F90			; 4C 90 6F | Jump to address
	LDA #$3C			 ; A9 3C | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_91F
; Address: $DAEFB1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_91F:
	JSL $CDC7B5		  ; 22 B5 C7 CD | Jump to subroutine long
	LDA #$64			 ; A9 64 | Audio system operation
	ORA $348D,Y		  ; 19 8D 34 | Logical OR with accumulator (absolute,Y)
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $6FCA			; 4C CA 6F | Jump to address
	JMP $6FBB			; 4C BB 6F | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_924
; Address: $DAEFE3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_924:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7007			; 4C 07 70 | Jump to address
	LDA #$36			 ; A9 36 | Audio system operation
	INC				  ; 1A | Increment accumulator
	STA $3434			; 8D 34 34 | Audio system operation
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$5E			 ; C9 5E | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank34_AudioFunction_925
; Address: $DAEFFE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_925:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7007			; 4C 07 70 | Jump to address
	JMP $6FF8			; 4C F8 6F | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_927
; Address: $DAF00E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_927:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	JMP $2E2208		  ; 5C 08 22 2E | Jump to address long
	LDA #$C1			 ; A9 C1 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_92C
; Address: $DAF02F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_92C:
	JSL $CDAFA1		  ; 22 A1 AF CD | Jump to subroutine long
	LDA #$9A			 ; A9 9A | Audio system operation
	LDX #$F0			 ; A2 F0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	WDM #$3C			 ; 42 3C | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_92E
; Address: $DAF04F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_92E:
	JSL $C73EAE		  ; 22 AE 3E C7 | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $70C6			; 4C C6 70 | Jump to address
	JMP $7085			; 4C 85 70 | Jump to address
	LDA #$0D			 ; A9 0D | Audio system operation
	STA $343E			; 8D 3E 34 | Audio system operation
	JMP $70A8			; 4C A8 70 | Jump to address
	LDA #$0D			 ; A9 0D | Audio system operation
	STA $343E			; 8D 3E 34 | Audio system operation
	JMP $70A8			; 4C A8 70 | Jump to address
	LDA #$0A			 ; A9 0A | Audio system operation
	STA $343E			; 8D 3E 34 | Audio system operation
	JMP $70A8			; 4C A8 70 | Jump to address
	LDA #$0D			 ; A9 0D | Audio system operation
	STA $343E			; 8D 3E 34 | Audio system operation
	JMP $70A8			; 4C A8 70 | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7061			; 4C 61 70 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_92F
; Address: $DAF093
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_92F:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $706A			; 4C 6A 70 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7073			; 4C 73 70 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $707C			; 4C 7C 70 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($CD,X)		  ; 01 CD | Logical OR with accumulator ((zero page,X))
	ROL $9034,X		  ; 3E 34 90 | Rotate left (absolute,X)
	JMP $70C3			; 4C C3 70 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_930
; Address: $DAF0B7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_930:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDA $4C70			; AD 70 4C | Audio system operation
	SBC ($70,X)		  ; E1 70 | Subtract with carry ((zero page,X))
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $70E1			; 4C E1 70 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_931
; Address: $DAF0D5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_931:
	JSL $CC752A		  ; 22 2A 75 CC | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BVS $22			  ; 70 22 | Branch if overflow set
	ROL $A9C7,X		  ; 3E C7 A9 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_933
; Address: $DAF0EF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_933:
	JSL $CDAE48		  ; 22 48 AE CD | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_935
; Address: $DAF0F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_935:
	LDA #$9C			 ; A9 9C | Audio system operation
	LDX #$10			 ; A2 10 | Load immediate value into X register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_936
; Address: $DAF0FF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_936:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7115			; 4C 15 71 | Jump to address
	JMP $7106			; 4C 06 71 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_93A
; Address: $DAF129
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_93A:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7168			; 4C 68 71 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_940
; Address: $DAF14F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_940:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $0236,Y		  ; 19 36 02 | Logical OR with accumulator (absolute,Y)
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_948
; Address: $DAF17F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_948:
	JSL $CCD8E3		  ; 22 E3 D8 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	ORA $0236,Y		  ; 19 36 02 | Logical OR with accumulator (absolute,Y)
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_94B
; Address: $DAF196
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_94B:
	LDA $3552			; AD 52 35 | Audio system operation
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $71B6			; 4C B6 71 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_94C
; Address: $DAF1A1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_94C:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $71B0			; 4C B0 71 | Jump to address
	EOR $4C08			; 4D 08 4C | Exclusive OR with accumulator (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	JMP $7207			; 4C 07 72 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_94D
; Address: $DAF1B6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_94D:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $71FB			; 4C FB 71 | Jump to address
	LSR $08			  ; 46 08 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_94E
; Address: $DAF1C2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_94E:
	JSL $CC7A64		  ; 22 64 7A CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $71D1			; 4C D1 71 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $71D4			; 4C D4 71 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	LDA $3554			; AD 54 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $71E8			; 4C E8 71 | Jump to address
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	JMP $71EB			; 4C EB 71 | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_94F
; Address: $DAF1EB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_94F:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	JMP $A908			; 4C 08 A9 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	JMP $7207			; 4C 07 72 | Jump to address
	LSR $0008			; 4E 08 00 | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDA #$80			 ; A9 80 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_952
; Address: $DAF20E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_952:
	JSL $CCD869		  ; 22 69 D8 CC | Jump to subroutine long
	LDA #$40			 ; A9 40 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$38			 ; A9 38 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$A9			 ; A2 A9 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_955
; Address: $DAF22F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_955:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_959
; Address: $DAF23F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_959:
	JSL $CCD863		  ; 22 63 D8 CC | Jump to subroutine long
	LDA #$90			 ; A9 90 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$E1			 ; A9 E1 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_95A
; Address: $DAF24C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_95A:
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$A8			 ; A2 A8 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_95D
; Address: $DAF260
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_95D:
	JSL $CDADBB		  ; 22 BB AD CD | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_95F
; Address: $DAF26B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_95F:
	LDA $3619			; AD 19 36 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $727A			; 4C 7A 72 | Jump to address
	JMP $726B			; 4C 6B 72 | Jump to address
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_960
; Address: $DAF280
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_960:
	JSL $C73CD1		  ; 22 D1 3C C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_963
; Address: $DAF294
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_963:
	JSL $CCD863		  ; 22 63 D8 CC | Jump to subroutine long
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$30			 ; A9 30 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$A7			 ; A2 A7 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_968
; Address: $DAF2BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_968:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $72CD			; 4C CD 72 | Jump to address
	WDM #$08			 ; 42 08 | Reserved instruction
	JMP $72D0			; 4C D0 72 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_96A
; Address: $DAF2D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_96A:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA #$99			 ; A9 99 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_96C
; Address: $DAF2E3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_96C:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_971
; Address: $DAF303
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_971:
	JSL $CCD74C		  ; 22 4C D7 CC | Jump to subroutine long
	LDA #$99			 ; A9 99 | Audio system operation
	LDX $3426			; AE 26 34 | Load from absolute address into X register
	LDY $3428			; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_972
; Address: $DAF310
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_972:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$03			 ; A9 03 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_97E
; Address: $DAF347
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_97E:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_97F
; Address: $DAF351
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_97F:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7367			; 4C 67 73 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_980
; Address: $DAF360
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_980:
	JSL $CC74F6		  ; 22 F6 74 CC | Jump to subroutine long
	JMP $7355			; 4C 55 73 | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_98D
; Address: $DAF3AE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_98D:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_98E
; Address: $DAF3B8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_98E:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $73CE			; 4C CE 73 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_99A
; Address: $DAF3FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_99A:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_99B
; Address: $DAF405
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_99B:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $741B			; 4C 1B 74 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9A0
; Address: $DAF429
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9A0:
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9A7
; Address: $DAF448
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9A7:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9A8
; Address: $DAF452
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9A8:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7468			; 4C 68 74 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9B3
; Address: $DAF48E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9B3:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9B4
; Address: $DAF498
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9B4:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $74AE			; 4C AE 74 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9B9
; Address: $DAF4BB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9B9:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $74CD			; 4C CD 74 | Jump to address
	ROL $0008,X		  ; 3E 08 00 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9BA
; Address: $DAF4CA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9BA:
	JMP $74D3			; 4C D3 74 | Jump to address
	ROL $0008,X		  ; 3E 08 00 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9C1
; Address: $DAF4F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9C1:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9C2
; Address: $DAF4FA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9C2:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7510			; 4C 10 75 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9C7
; Address: $DAF51D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9C7:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $752C			; 4C 2C 75 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	JMP $752F			; 4C 2F 75 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9CE
; Address: $DAF54C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9CE:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9CF
; Address: $DAF556
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9CF:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $756C			; 4C 6C 75 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9D4
; Address: $DAF579
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9D4:
	JSL $CC7B6F		  ; 22 6F 7B CC | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7588			; 4C 88 75 | Jump to address
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP $758B			; 4C 8B 75 | Jump to address
	AND $6B08,Y		  ; 39 08 6B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9DB
; Address: $DAF5A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9DB:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$05			 ; A9 05 | Audio system operation
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9DC
; Address: $DAF5B2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9DC:
	JSL $C73CED		  ; 22 ED 3C C7 | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $75C8			; 4C C8 75 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9E2
; Address: $DAF5D9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9E2:
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7601			; 4C 01 76 | Jump to address
	LDA $3434			; AD 34 34 | Audio system operation
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $75F3			; 4C F3 75 | Jump to address
	JMP $75E4			; 4C E4 75 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9E3
; Address: $DAF5F3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9E3:
	JSL $CCD857		  ; 22 57 D8 CC | Jump to subroutine long
	LDA $3434			; AD 34 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	STA $3434			; 8D 34 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9E8
; Address: $DAF61B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9E8:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	CMP $A96B			; CD 6B A9 | Compare accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9EB
; Address: $DAF633
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9EB:
	JSL $CCD400		  ; 22 00 D4 CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9EE
; Address: $DAF64B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9EE:
	JSL $CDE01C		  ; 22 1C E0 CD | Jump to subroutine long
	JMP $7682			; 4C 82 76 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9EF
; Address: $DAF655
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9EF:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	EOR $4C08,X		  ; 5D 08 4C | Exclusive OR with accumulator (absolute,X)
	LDA $76			  ; A5 76 | Audio system operation
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F0
; Address: $DAF661
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F0:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	LSR $4C08,X		  ; 5E 08 4C | Logical shift right (absolute,X)
	LDA $76			  ; A5 76 | Audio system operation
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F1
; Address: $DAF66D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F1:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	JMP $76A5			; 4C A5 76 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F3
; Address: $DAF67E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F3:
	PHP				  ; 08 | Push processor status to stack
	JMP $76A5			; 4C A5 76 | Jump to address
	LDA $343E			; AD 3E 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7652			; 4C 52 76 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $765E			; 4C 5E 76 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $766A			; 4C 6A 76 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F6
; Address: $DAF6A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F6:
	JSL $CDE01C		  ; 22 1C E0 CD | Jump to subroutine long
	JMP $76E0			; 4C E0 76 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F7
; Address: $DAF6B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F7:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	ADC ($08,X)		  ; 61 08 | Add with carry ((zero page,X))
	JMP $7703			; 4C 03 77 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F8
; Address: $DAF6BF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F8:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	JMP $7703			; 4C 03 77 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9F9
; Address: $DAF6CB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9F9:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	JMP $7703			; 4C 03 77 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9FA
; Address: $DAF6D7
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9FA:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	STZ $08			  ; 64 08 | Store zero to zero page
	JMP $7703			; 4C 03 77 | Jump to address
	LDA $343E			; AD 3E 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76B0			; 4C B0 76 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76BC			; 4C BC 76 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76C8			; 4C C8 76 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76D4			; 4C D4 76 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9FB
; Address: $DAF703
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9FB:
	JSL $CD7780		  ; 22 80 77 CD | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $771E			; 4C 1E 77 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_9FC
; Address: $DAF715
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_9FC:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	ADC $08			  ; 65 08 | Add with carry (zero page)
	JMP $7727			; 4C 27 77 | Jump to address
	LDA #$11			 ; A9 11 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A03
; Address: $DAF746
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A03:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	LDA #$19			 ; A9 19 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A04
; Address: $DAF74F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A04:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Audio system operation
	LSR $35			  ; 46 35 | Logical shift right (zero page)
	LDX #$46			 ; A2 46 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A08
; Address: $DAF76E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A08:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	STA $C30B			; 8D 0B C3 | Audio system operation
	LDA #$07			 ; A9 07 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A15
; Address: $DAF7B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A15:
	JSL $CDC674		  ; 22 74 C6 CD | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A16
; Address: $DAF7BA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A16:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $77C7			; 4C C7 77 | Jump to address
	JMP $77B4			; 4C B4 77 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A1A
; Address: $DAF7D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A1A:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A1B
; Address: $DAF7E2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A1B:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $77EF			; 4C EF 77 | Jump to address
	JMP $77DC			; 4C DC 77 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A1D
; Address: $DAF7F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A1D:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	STA $33D6			; 8D D6 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A1E
; Address: $DAF802
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A1E:
	JSL $C9A167		  ; 22 67 A1 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7823			; 4C 23 78 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A1F
; Address: $DAF811
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A1F:
	JSL $C9A1DE		  ; 22 DE A1 C9 | Jump to subroutine long
	LDA $33D6			; AD D6 33 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $33D6			; 8D D6 33 | Audio system operation
	JMP $7806			; 4C 06 78 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A20
; Address: $DAF823
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A20:
	JSL $C9A1DE		  ; 22 DE A1 C9 | Jump to subroutine long
	JMP $7823			; 4C 23 78 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A23
; Address: $DAF838
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A23:
	LDA #$04			 ; A9 04 | Audio system operation
	LDA #$05			 ; A9 05 | Audio system operation
	STA $3444			; 8D 44 34 | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation
	STA $3442			; 8D 42 34 | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation
	STA $3446			; 8D 46 34 | Audio system operation
	LDA #$0A			 ; A9 0A | Audio system operation
	STA $3448			; 8D 48 34 | Audio system operation
	LDA #$12			 ; A9 12 | Audio system operation
	STA $344A			; 8D 4A 34 | Audio system operation
	LDA #$0D			 ; A9 0D | Audio system operation
	STA $344C			; 8D 4C 34 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A24
; Address: $DAF863
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A24:
	LDA $353D			; AD 3D 35 | Audio system operation
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A26
; Address: $DAF871
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A26:
	JSL $C74CD0		  ; 22 D0 4C C7 | Jump to subroutine long
	JMP $787F			; 4C 7F 78 | Jump to address
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A28
; Address: $DAF880
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A28:
	LDA $3444			; AD 44 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $789C			; 4C 9C 78 | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$54			 ; A2 54 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A2A
; Address: $DAF895
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A2A:
	JSL $CCD847		  ; 22 47 D8 CC | Jump to subroutine long
	JMP $78AA			; 4C AA 78 | Jump to address
	LDA #$3A			 ; A9 3A | Audio system operation
	LDX #$5C			 ; A2 5C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A2E
; Address: $DAF8B2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A2E:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $78D7			; 4C D7 78 | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $78D4			; 4C D4 78 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A2F
; Address: $DAF8C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A2F:
	JSL $CD7863		  ; 22 63 78 CD | Jump to subroutine long
	LDA #$1F			 ; A9 1F | Audio system operation
	LDX #$26			 ; A2 26 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A30
; Address: $DAF8D0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A30:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7959			; 4C 59 79 | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A31
; Address: $DAF8DA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A31:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7903			; 4C 03 79 | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7900			; 4C 00 79 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A32
; Address: $DAF8EE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A32:
	JSL $CD7863		  ; 22 63 78 CD | Jump to subroutine long
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$34			 ; A2 34 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A34
; Address: $DAF8FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A34:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	JMP $7959			; 4C 59 79 | Jump to address
	LDA #$32			 ; A9 32 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A35
; Address: $DAF906
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A35:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7925			; 4C 25 79 | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7922			; 4C 22 79 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A37
; Address: $DAF91E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A37:
	JSL $CD7880		  ; 22 80 78 CD | Jump to subroutine long
	JMP $7959			; 4C 59 79 | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A38
; Address: $DAF928
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A38:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7959			; 4C 59 79 | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7959			; 4C 59 79 | Jump to address
	LDA $3444			; AD 44 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7952			; 4C 52 79 | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A3A
; Address: $DAF94B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A3A:
	JSL $CD8952		  ; 22 52 89 CD | Jump to subroutine long
	JMP $7959			; 4C 59 79 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A3C
; Address: $DAF95A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A3C:
	LDA $3446			; AD 46 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $796C			; 4C 6C 79 | Jump to address
	LDA $3446			; AD 46 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A3F
; Address: $DAF973
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A3F:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $79D9			; 4C D9 79 | Jump to address
	JMP $79B3			; 4C B3 79 | Jump to address
	LDA #$1F			 ; A9 1F | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A40
; Address: $DAF985
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A40:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $79D6			; 4C D6 79 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A41
; Address: $DAF992
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A41:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $79D6			; 4C D6 79 | Jump to address
	LDA #$1F			 ; A9 1F | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A42
; Address: $DAF99F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A42:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $79D6			; 4C D6 79 | Jump to address
	LDA #$1E			 ; A9 1E | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A43
; Address: $DAF9AC
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A43:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $79D6			; 4C D6 79 | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $797F			; 4C 7F 79 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $798C			; 4C 8C 79 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7999			; 4C 99 79 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $79A6			; 4C A6 79 | Jump to address
	JMP $7B05			; 4C 05 7B | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A44
; Address: $DAF9DC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A44:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $79F6			; 4C F6 79 | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$34			 ; A2 34 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A46
; Address: $DAF9EF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A46:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	JMP $7B05			; 4C 05 7B | Jump to address
	LDA #$32			 ; A9 32 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A47
; Address: $DAF9F9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A47:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7A81			; 4C 81 7A | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7A14			; 4C 14 7A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A48
; Address: $DAFA0D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A48:
	JSL $CD7880		  ; 22 80 78 CD | Jump to subroutine long
	JMP $7A7E			; 4C 7E 7A | Jump to address
	JMP $7A5B			; 4C 5B 7A | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$54			 ; A2 54 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A4A
; Address: $DAFA21
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A4A:
	JSL $CCD847		  ; 22 47 D8 CC | Jump to subroutine long
	JMP $7A7E			; 4C 7E 7A | Jump to address
	LDA #$2F			 ; A9 2F | Audio system operation
	LDX #$5A			 ; A2 5A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A4F
; Address: $DAFA43
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A4F:
	JSL $CCD84F		  ; 22 4F D8 CC | Jump to subroutine long
	JMP $7A7E			; 4C 7E 7A | Jump to address
	LDA #$2F			 ; A9 2F | Audio system operation
	LDX #$5A			 ; A2 5A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A51
; Address: $DAFA54
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A51:
	JSL $CCD84F		  ; 22 4F D8 CC | Jump to subroutine long
	JMP $7A7E			; 4C 7E 7A | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A17			; 4C 17 7A | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A28			; 4C 28 7A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A39			; 4C 39 7A | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A4A			; 4C 4A 7A | Jump to address
	JMP $7B05			; 4C 05 7B | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A52
; Address: $DAFA84
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A52:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B05			; 4C 05 7B | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7AB1			; 4C B1 7A | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7AB1			; 4C B1 7A | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7AB1			; 4C B1 7A | Jump to address
	JMP $7B05			; 4C 05 7B | Jump to address
	JMP $7AE2			; 4C E2 7A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A53
; Address: $DAFAB4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A53:
	JSL $CD8952		  ; 22 52 89 CD | Jump to subroutine long
	JMP $7B05			; 4C 05 7B | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7ACD			; 4C CD 7A | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A57
; Address: $DAFADB
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A57:
	JSL $CD8967		  ; 22 67 89 CD | Jump to subroutine long
	JMP $7B05			; 4C 05 7B | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7AB4			; 4C B4 7A | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7ABB			; 4C BB 7A | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7AD4			; 4C D4 7A | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7ADB			; 4C DB 7A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A58
; Address: $DAFB06
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A58:
	LDA $3448			; AD 48 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B18			; 4C 18 7B | Jump to address
	LDA $3448			; AD 48 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A5B
; Address: $DAFB1F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A5B:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B7B			; 4C 7B 7B | Jump to address
	JMP $7B55			; 4C 55 7B | Jump to address
	JMP $7B78			; 4C 78 7B | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A5C
; Address: $DAFB34
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A5C:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7B78			; 4C 78 7B | Jump to address
	LDA #$1D			 ; A9 1D | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A5D
; Address: $DAFB41
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A5D:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7B78			; 4C 78 7B | Jump to address
	LDA #$20			 ; A9 20 | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A5E
; Address: $DAFB4E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A5E:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7B78			; 4C 78 7B | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B2B			; 4C 2B 7B | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A5F
; Address: $DAFB63
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A5F:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B2E			; 4C 2E 7B | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B3B			; 4C 3B 7B | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B48			; 4C 48 7B | Jump to address
	JMP $7C7F			; 4C 7F 7C | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A60
; Address: $DAFB7E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A60:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B98			; 4C 98 7B | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$34			 ; A2 34 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A62
; Address: $DAFB91
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A62:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	JMP $7C7F			; 4C 7F 7C | Jump to address
	LDA #$32			 ; A9 32 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A63
; Address: $DAFB9B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A63:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7C15			; 4C 15 7C | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7BB6			; 4C B6 7B | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A64
; Address: $DAFBAF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A64:
	JSL $CD7880		  ; 22 80 78 CD | Jump to subroutine long
	JMP $7C12			; 4C 12 7C | Jump to address
	JMP $7BEF			; 4C EF 7B | Jump to address
	JMP $7C12			; 4C 12 7C | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	LDX #$53			 ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A66
; Address: $DAFBC6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A66:
	JSL $CCD83F		  ; 22 3F D8 CC | Jump to subroutine long
	JMP $7C12			; 4C 12 7C | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	LDX #$53			 ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A68
; Address: $DAFBD7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A68:
	JSL $CCD83F		  ; 22 3F D8 CC | Jump to subroutine long
	JMP $7C12			; 4C 12 7C | Jump to address
	LDA #$34			 ; A9 34 | Audio system operation
	LDX #$59			 ; A2 59 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A6A
; Address: $DAFBE8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A6A:
	JSL $CCD83F		  ; 22 3F D8 CC | Jump to subroutine long
	JMP $7C12			; 4C 12 7C | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BB9			; 4C B9 7B | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A6B
; Address: $DAFBFD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A6B:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BBC			; 4C BC 7B | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BCD			; 4C CD 7B | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BDE			; 4C DE 7B | Jump to address
	JMP $7C7F			; 4C 7F 7C | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A6C
; Address: $DAFC18
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A6C:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7C7F			; 4C 7F 7C | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7C2F			; 4C 2F 7C | Jump to address
	JMP $7C7F			; 4C 7F 7C | Jump to address
	JMP $7C5C			; 4C 5C 7C | Jump to address
	JMP $7C7F			; 4C 7F 7C | Jump to address
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7C47			; 4C 47 7C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A70
; Address: $DAFC55
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A70:
	JSL $CD897C		  ; 22 7C 89 CD | Jump to subroutine long
	JMP $7C7F			; 4C 7F 7C | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C32			; 4C 32 7C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C35			; 4C 35 7C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C4E			; 4C 4E 7C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C55			; 4C 55 7C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A71
; Address: $DAFC80
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A71:
	LDA $344A			; AD 4A 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C92			; 4C 92 7C | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A75
; Address: $DAFC99
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A75:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7CEB			; 4C EB 7C | Jump to address
	JMP $7CC5			; 4C C5 7C | Jump to address
	JMP $7CE8			; 4C E8 7C | Jump to address
	JMP $7CE8			; 4C E8 7C | Jump to address
	LDA #$21			 ; A9 21 | PPU graphics register access
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A76
; Address: $DAFCB1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A76:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7CE8			; 4C E8 7C | Jump to address
	LDA #$1C			 ; A9 1C | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A77
; Address: $DAFCBE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A77:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7CE8			; 4C E8 7C | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7CA5			; 4C A5 7C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7CA8			; 4C A8 7C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7CAB			; 4C AB 7C | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7CB8			; 4C B8 7C | Jump to address
	JMP $7DCB			; 4C CB 7D | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A78
; Address: $DAFCEE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A78:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7D08			; 4C 08 7D | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$34			 ; A2 34 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A7A
; Address: $DAFD01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A7A:
	JSL $CCD784		  ; 22 84 D7 CC | Jump to subroutine long
	JMP $7DCB			; 4C CB 7D | Jump to address
	LDA #$32			 ; A9 32 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A7B
; Address: $DAFD0B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A7B:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7D77			; 4C 77 7D | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7D26			; 4C 26 7D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A7D
; Address: $DAFD23
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A7D:
	JMP $7D74			; 4C 74 7D | Jump to address
	JMP $7D51			; 4C 51 7D | Jump to address
	JMP $7D74			; 4C 74 7D | Jump to address
	JMP $7D74			; 4C 74 7D | Jump to address
	LDA #$2E			 ; A9 2E | Audio system operation
	LDX #$54			 ; A2 54 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A7F
; Address: $DAFD39
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A7F:
	JSL $CCD84F		  ; 22 4F D8 CC | Jump to subroutine long
	JMP $7D74			; 4C 74 7D | Jump to address
	LDA #$2E			 ; A9 2E | Audio system operation
	LDX #$54			 ; A2 54 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A81
; Address: $DAFD4A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A81:
	JSL $CCD84F		  ; 22 4F D8 CC | Jump to subroutine long
	JMP $7D74			; 4C 74 7D | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D29			; 4C 29 7D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D2C			; 4C 2C 7D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D2F			; 4C 2F 7D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D40			; 4C 40 7D | Jump to address
	JMP $7DCB			; 4C CB 7D | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A82
; Address: $DAFD7A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A82:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7DCB			; 4C CB 7D | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7D91			; 4C 91 7D | Jump to address
	JMP $7DCB			; 4C CB 7D | Jump to address
	JMP $7DA8			; 4C A8 7D | Jump to address
	JMP $7DCB			; 4C CB 7D | Jump to address
	JMP $7DCB			; 4C CB 7D | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A84
; Address: $DAFDA1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A84:
	JSL $CD8991		  ; 22 91 89 CD | Jump to subroutine long
	JMP $7DCB			; 4C CB 7D | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D94			; 4C 94 7D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A85
; Address: $DAFDB8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A85:
	JMP $7D97			; 4C 97 7D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D9A			; 4C 9A 7D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7DA1			; 4C A1 7D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A86
; Address: $DAFDCC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A86:
	LDA $344C			; AD 4C 34 | Audio system operation
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7DDE			; 4C DE 7D | Jump to address
	LDA $344C			; AD 4C 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A89
; Address: $DAFDE5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A89:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7E2D			; 4C 2D 7E | Jump to address
	JMP $7E07			; 4C 07 7E | Jump to address
	JMP $7E2A			; 4C 2A 7E | Jump to address
	JMP $7E2A			; 4C 2A 7E | Jump to address
	JMP $7E2A			; 4C 2A 7E | Jump to address
	LDA #$22			 ; A9 22 | Audio system operation
	LDX #$23			 ; A2 23 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A8A
; Address: $DAFE00
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A8A:
	JSL $C75305		  ; 22 05 53 C7 | Jump to subroutine long
	JMP $7E2A			; 4C 2A 7E | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7DF1			; 4C F1 7D | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7DF4			; 4C F4 7D | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7DF7			; 4C F7 7D | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7DFA			; 4C FA 7D | Jump to address
	JMP $7F0B			; 4C 0B 7F | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A8B
; Address: $DAFE30
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A8B:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7E4A			; 4C 4A 7E | Jump to address
	LDA #$31			 ; A9 31 | Audio system operation
	LDX #$34			 ; A2 34 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A8F
; Address: $DAFE4D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A8F:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7EAB			; 4C AB 7E | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7E68			; 4C 68 7E | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A90
; Address: $DAFE61
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A90:
	JSL $CD7880		  ; 22 80 78 CD | Jump to subroutine long
	JMP $7EA8			; 4C A8 7E | Jump to address
	JMP $7E85			; 4C 85 7E | Jump to address
	JMP $7EA8			; 4C A8 7E | Jump to address
	JMP $7EA8			; 4C A8 7E | Jump to address
	JMP $7EA8			; 4C A8 7E | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation
	LDX #$53			 ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A92
; Address: $DAFE7E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A92:
	JSL $CCD83F		  ; 22 3F D8 CC | Jump to subroutine long
	JMP $7EA8			; 4C A8 7E | Jump to address
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7E6B			; 4C 6B 7E | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7E6E			; 4C 6E 7E | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7E71			; 4C 71 7E | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7E74			; 4C 74 7E | Jump to address
	JMP $7F0B			; 4C 0B 7F | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A93
; Address: $DAFEAE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A93:
	JSL $C7334A		  ; 22 4A 33 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7F0B			; 4C 0B 7F | Jump to address
	LDA $344E			; AD 4E 34 | Audio system operation
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7EC5			; 4C C5 7E | Jump to address
	JMP $7F0B			; 4C 0B 7F | Jump to address
	JMP $7EE8			; 4C E8 7E | Jump to address
	JMP $7F0B			; 4C 0B 7F | Jump to address
	JMP $7F0B			; 4C 0B 7F | Jump to address
	JMP $7F0B			; 4C 0B 7F | Jump to address
	LDA #$24			 ; A9 24 | Audio system operation
	LDX #$29			 ; A2 29 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A96
; Address: $DAFEDF
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A96:
	LDA #$10			 ; A9 10 | Audio system operation
	ORA $4C36,Y		  ; 19 36 4C | Logical OR with accumulator (absolute,Y)
	LDA $3442			; AD 42 34 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7EC8			; 4C C8 7E | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7ECB			; 4C CB 7E | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7ECE			; 4C CE 7E | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7ED1			; 4C D1 7E | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A97
; Address: $DAFF0C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A97:
	JSL $CC9B56		  ; 22 56 9B CC | Jump to subroutine long
	LDA #$01			 ; A9 01 | Audio system operation
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A99
; Address: $DAFF1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A99:
	JSL $CDC5C2		  ; 22 C2 C5 CD | Jump to subroutine long
	LDA #$20			 ; A9 20 | Audio system operation
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $C731,X		  ; 5E 31 C7 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A9A
; Address: $DAFF27
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A9A:
	LDA #$E0			 ; A9 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$AB			 ; A2 AB | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A9B
; Address: $DAFF39
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A9B:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$C0			 ; A9 C0 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Audio system operation
	LDX #$AC			 ; A2 AC | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A9C
; Address: $DAFF4F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A9C:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$E0			 ; A9 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Audio system operation
	LDA #$5A			 ; A9 5A | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$AA			 ; A2 AA | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_A9D
; Address: $DAFF65
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_A9D:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BRA $96			  ; 80 96 | Branch always
	LDA #$5A			 ; A9 5A | Audio system operation
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	LDX #$AA			 ; A2 AA | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank34_AudioFunction_AA0
; Address: $DAFF82
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_AA0:
	LDA $3553			; AD 53 35 | Audio system operation
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7F90			; 4C 90 7F | Jump to address
	JMP $7F95			; 4C 95 7F | Jump to address

;------------------------------------------------------------------------------
; Bank34_AudioFunction_AAC
; Address: $DAFFCB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_AAC:
	JSL $CC7429		  ; 22 29 74 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	STA $3400			; 8D 00 34 | Audio system operation
	LDA $3400			; AD 00 34 | Audio system operation
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	JMP $7FE8			; 4C E8 7F | Jump to address
	JMP $7FD9			; 4C D9 7F | Jump to address
	LDA #$1D			 ; A9 1D | Audio system operation

;------------------------------------------------------------------------------
; Bank34_AudioFunction_AAE
; Address: $DAFFEF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank34_AudioFunction_AAE:
	JSL $CCD59D		  ; 22 9D D5 CC | Jump to subroutine long
	LDA $3400			; AD 00 34 | Audio system operation
	SEC				  ; 38 | Set carry flag
	SBC #$64			 ; E9 64 | Subtract with carry (immediate)
