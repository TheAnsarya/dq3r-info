;==============================================================================
; Dragon Quest III - Bank 37
;==============================================================================
; File: bank_37.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $37 Code
; Ultra-aggressive code extraction


.segment "BANK_37_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	ADC $007F00,X		; 7F 00 7F 00 | Unknown operation
	ORA $001F00,X		; 1F 00 1F 00 | Logical OR with accumulator
	ORA $2A,X			; 15 2A | Logical OR with accumulator
	ROL				  ; 2A | Unknown operation
	ORA $FF			  ; 11 FF | Logical OR with accumulator
	BRK $7F			  ; 00 7F | Software interrupt
	BRK $7F			  ; 00 7F | Software interrupt
	BRK $7F			  ; 00 7F | Software interrupt
	BRK $1F			  ; 00 1F | Software interrupt
	BRK $1F			  ; 00 1F | Software interrupt
	BRK $3F			  ; 00 3F | Software interrupt
	BRK $3B			  ; 00 3B | Software interrupt
	BRK $54			  ; 00 54 | Software interrupt
	BRK $59			  ; 00 59 | Software interrupt
	BIT $E7			  ; 24 E7 | Unknown operation
	BIT $00FF,X		  ; 3C FF 00 | Unknown operation
	SBC $00FF00,X		; FF 00 FF 00 | Unknown operation
	EOR $AA,X			; 55 AA | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	EOR $7E,X			; 55 7E | Unknown operation
	BRK $DB			  ; 00 DB | Software interrupt
	BRK $C3			  ; 00 C3 | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $AA			  ; 00 AA | Software interrupt
	BRK $54			  ; 00 54 | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $54			  ; 00 54 | Software interrupt
	TAY				  ; A8 | Unknown operation
	DEY				  ; 88 | Unknown operation
	MVN $00FF			; 54 FF 00 | Unknown operation
	INC $FE00,X		  ; FE 00 FE | Unknown operation
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $FC			  ; 00 FC | Software interrupt
	BRK $DC			  ; 00 DC | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data

	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ADC $0F00,Y		  ; 79 00 0F
	BRK $7F			  ; 00 7F
	BRK $DE			  ; 00 DE
	BRK $B3			  ; 00 B3
	BRK $33			  ; 00 33
	BRK $16			  ; 00 16
	BMI $80F2			; 30 00
	ADC $0F00,Y		  ; 79 00 0F
	BRK $7F			  ; 00 7F
	BRK $DE			  ; 00 DE
	BRK $B3			  ; 00 B3
	BRK $33			  ; 00 33
	BRK $16			  ; 00 16
	BRK $51			  ; 00 51
	JSL $0051A2		  ; 22 A2 51 00
	SBC $00			  ; E7 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $02			  ; 07 02
	ORA $01			  ; 07 01
	ORA $73			  ; 03 73
	BRK $F3			  ; 00 F3
	BRK $E7			  ; 00 E7
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $03			  ; 00 03
	BRK $55			  ; 00 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $00,X			; 55 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $AAFF00,X		; FF 00 FF AA
	SBC $FFFF55,X		; FF 55 FF FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $44			  ; 00 44
	TXA				  ; 8A
	TXA				  ; 8A
	EOR $00			  ; 45 00
	SBC $00			  ; E7 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPX #$80			 ; E0 80
	CPX #$40			 ; E0 40
	CPY #$CE			 ; C0 CE
	BRK $CF			  ; 00 CF
	BRK $E7			  ; 00 E7
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $C0			  ; 00 C0
	BRK $00			  ; 00 00
	TSB $1E80			; 0C 80 1E
	BRK $F0			  ; 00 F0
	BRK $FE			  ; 00 FE
	BRK $7B			  ; 00 7B
	BRK $CD			  ; 00 CD
	BRK $CC			  ; 00 CC
	BRK $68			  ; 00 68
	TSB $9E00			; 0C 00 9E
	BRK $F0			  ; 00 F0
	BRK $FE			  ; 00 FE
	BRK $7B			  ; 00 7B
	BRK $CD			  ; 00 CD
	BRK $CC			  ; 00 CC
	BRK $68			  ; 00 68
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $07			  ; 03 07
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $07			  ; 00 07
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $55			  ; 00 55
	ROL				  ; 2A
	BRK $00			  ; 00 00
	EOR $2A,X			; 55 2A

;==============================================================================
; GeneralPurpose_02
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02:
	BRA $8182			; 80 80 | Unknown operation
	RTI				  ; 40 | Unknown operation
	CPY #$E0			 ; C0 E0 | Unknown operation
	CPX #$20			 ; E0 20 | Unknown operation
	JSR $0000			; 20 00 00 | Call local function
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRA $8212			; 80 00 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	CPX #$00			 ; E0 00 | Unknown operation
	JSR $0000			; 20 00 00 | Call local function
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $30			  ; 00 30 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	ROL				  ; 2A | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	ORA $00			  ; 05 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	COP $00			  ; 02 00 | Unknown operation
	ASL $7F00			; 0E 00 7F | Arithmetic shift left
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt

	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $E7			  ; 00 E7
	BRK $E7			  ; 00 E7
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $15			  ; 00 15
	BRK $3F			  ; 00 3F
	BRK $3B			  ; 00 3B
	BRK $63			  ; 00 63
	BRK $41			  ; 00 41
	BRK $00			  ; 00 00
	BRK $10			  ; 00 10
	PHP				  ; 08
	ORA $001F00		  ; 0F 00 1F 00
	AND $003B00,X		; 3F 00 3B 00
	ADC $00			  ; 63 00
	EOR $00			  ; 41 00
	BRK $00			  ; 00 00
	CLC				  ; 18
	BRK $AA			  ; 00 AA
	BRK $55			  ; 00 55
	BRK $FF			  ; 00 FF
	BRK $DF			  ; 00 DF
	BRK $9F			  ; 00 9F
	BRK $1F			  ; 00 1F
	BRK $0A			  ; 00 0A
	ORA $15,X			; 15 15
	ROL				  ; 2A
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00DF00,X		; FF 00 DF 00
	STA $001F00,X		; 9F 00 1F 00
	ORA $003F00,X		; 1F 00 3F 00
	TAX				  ; AA
	BRK $55			  ; 00 55
	BRK $FF			  ; 00 FF
	BRK $DB			  ; 00 DB
	BIT $E7			  ; 24 E7
	BIT $00FF,X		  ; 3C FF 00
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00DB00,X		; FF 00 DB 00
	CMP $00			  ; C3 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00AA00,X		; FF 00 AA 00
	EOR $00,X			; 55 00
	SBC $00FB00,X		; FF 00 FB 00
	SBC $F800,Y		  ; F9 00 F8
	BRK $50			  ; 00 50
	TAY				  ; A8
	TAY				  ; A8
	MVN $00FF			; 54 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	XCE				  ; FB
	BRK $F9			  ; 00 F9
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $A0			  ; 00 A0
	BRK $50			  ; 00 50
	BRK $FC			  ; 00 FC
	BRK $DC			  ; 00 DC
	BRK $C6			  ; 00 C6
	BRK $82			  ; 00 82
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	BPL $84C1			; 10 F0
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $DC			  ; 00 DC
	BRK $C6			  ; 00 C6
	BRK $82			  ; 00 82
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	STA $00			  ; 81 00
	CMP $42			  ; C3 42
	SBC $24			  ; E7 24
	BIT $AA			  ; 24 AA
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $7E			  ; 00 7E
	BRK $3C			  ; 00 3C
	BRK $18			  ; 00 18
	BRK $DB			  ; 00 DB
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	TRB $00			  ; 14 00
	ASL $00			  ; 06 00
	AND $006F00,X		; 3F 00 6F 00
	EOR $1900,Y		  ; 59 00 19
	BRK $0B			  ; 00 0B
	BRK $00			  ; 00 00
	BIT $0600,X		  ; 3C 00 06
	BRK $3F			  ; 00 3F
	BRK $6F			  ; 00 6F
	BRK $59			  ; 00 59
	BRK $19			  ; 00 19
	BRK $0B			  ; 00 0B
	BRK $00			  ; 00 00
	BRK $2A			  ; 00 2A
	ORA $51			  ; 11 51
	LDX #$00			 ; A2 00
	SBC $00			  ; F3 00
	SBC $00			  ; E7 00
	STA $00			  ; 87 00
	STA $05			  ; 87 05
	ORA $02			  ; 07 02
	ORA $3B			  ; 07 3B
	BRK $F3			  ; 00 F3
	BRK $F3			  ; 00 F3
	BRK $E7			  ; 00 E7
	BRK $87			  ; 00 87
	BRK $87			  ; 00 87
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $AA			  ; 00 AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	EOR $FF,X			; 55 FF
	TAX				  ; AA
	SBC $FF00FF,X		; FF FF 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $54			  ; 00 54
	DEY				  ; 88
	TXA				  ; 8A
	MVP $CF00			; 44 00 CF
	BRK $E7			  ; 00 E7
	BRK $E1			  ; 00 E1
	BRK $E1			  ; 00 E1
	LDY #$E0			 ; A0 E0
	RTI				  ; 40
	CPX #$DC			 ; E0 DC
	BRK $CE			  ; 00 CE
	BRK $CF			  ; 00 CF
	BRK $E7			  ; 00 E7
	BRK $E1			  ; 00 E1
	BRK $E1			  ; 00 E1
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $14			  ; 00 14
	PLP				  ; 28
	BRK $E0			  ; 00 E0
	BRK $FC			  ; 00 FC
	BRK $F6			  ; 00 F6
	BRK $9A			  ; 00 9A
	BRK $98			  ; 00 98
	BRK $D0			  ; 00 D0
	BRK $00			  ; 00 00
	BIT $E000,X		  ; 3C 00 E0
	BRK $FC			  ; 00 FC
	BRK $F6			  ; 00 F6
	BRK $9A			  ; 00 9A
	BRK $98			  ; 00 98
	BRK $D0			  ; 00 D0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $20			  ; 00 20
	BRK $44			  ; 00 44
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $AA			  ; 00 AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	BIT $00			  ; 24 00
	ROR $00			  ; 66 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $8688			; 80 00
	BRA $868A			; 80 00
	CPY #$00			 ; C0 00
	RTI				  ; 40
	BRA $862F			; 80 A0
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $8698			; 80 00
	BRA $869A			; 80 00
	CPY #$00			 ; C0 00
	CPY #$00			 ; C0 00
	CPX #$00			 ; E0 00
	ORA $00			  ; 01 00
	COP $00			  ; 02 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $050A00		  ; 0F 00 0A 05
	ORA $0A			  ; 05 0A
	ORA $00			  ; 03 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $000F00		  ; 0F 00 0F 00
	ORA $005500		  ; 0F 00 55 00
	TAX				  ; AA
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $2A			  ; 00 2A
	CMP $14,X			; D5 14
	XBA				  ; EB
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	ROR $3C00,X		  ; 7E 00 3C
	BRK $40			  ; 00 40
	BRK $A0			  ; 00 A0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $50			  ; 00 50
	LDY #$A0			 ; A0 A0
	BVC $86B1			; 50 C0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $05			  ; 00 05
	BRK $0A			  ; 00 0A
	BRK $0F			  ; 00 0F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $15			  ; 00 15
	ROL				  ; 2A
	ROL				  ; 2A
	ORA $0F,X			; 15 0F
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $45			  ; 00 45
	BRK $A0			  ; 00 A0
	BRK $A5			  ; 00 A5
	BRK $A5			  ; 00 A5
	BRK $81			  ; 00 81
	BRK $81			  ; 00 81
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $E7			  ; 00 E7
	BRK $A5			  ; 00 A5
	BRK $A5			  ; 00 A5
	BRK $A5			  ; 00 A5
	BRK $81			  ; 00 81
	BRK $81			  ; 00 81
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $50			  ; 00 50
	BRK $A0			  ; 00 A0
	BRK $F0			  ; 00 F0
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	BRK $54			  ; 00 54
	TAY				  ; A8
	TAY				  ; A8
	MVN $00F0			; 54 F0 00
	BEQ $8754			; F0 00
	BEQ $8756			; F0 00
	SED				  ; F8
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	ORA $03			  ; 01 03
	ORA $07			  ; 03 07
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $07			  ; 00 07
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $55			  ; 00 55
	SBC $FFFFAA,X		; FF AA FF FF
	SBC $AAFFFF,X		; FF FF FF AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	BRK $00			  ; 00 00
	EOR $55,X			; 55 55
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	TAX				  ; AA
	EOR $55,X			; 55 55
	ROL				  ; 2A
	BRK $00			  ; 00 00
	EOR $2A,X			; 55 2A
	BRA $8762			; 80 C0
	BRK $80			  ; 00 80
	CPY #$C0			 ; C0 C0
	CPX #$E0			 ; E0 E0
	JSR $0020			; 20 20 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $C0			  ; 00 C0
	BRK $80			  ; 00 80
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ORA $05			  ; 05 05
	COP $00			  ; 02 00
	ORA $003F00		  ; 0F 00 3F 00
	ADC $151F00,X		; 7F 00 1F 15
	AND $073F2A,X		; 3F 2A 3F 07
	BRK $07			  ; 00 07
	BRK $0F			  ; 00 0F
	BRK $3F			  ; 00 3F
	BRK $7F			  ; 00 7F
	BRK $1F			  ; 00 1F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $AA			  ; 00 AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BIT $FF			  ; 24 FF
	EOR $FF,X			; 55 FF
	TAX				  ; AA
	SBC $FF00FF,X		; FF FF 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $DB			  ; 00 DB
	BRK $C3			  ; 00 C3
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $40			  ; 00 40
	LDY #$A0			 ; A0 A0
	RTI				  ; 40
	BRK $F0			  ; 00 F0
	BRK $FC			  ; 00 FC
	BRK $FE			  ; 00 FE
	BRK $F8			  ; 00 F8
	TAY				  ; A8
	JSR ($FC54,X)		; FC 54 FC
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	BEQ $8816			; F0 00
	JSR ($FE00,X)		; FC 00 FE
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $0A			  ; 00 0A
	ORA $05			  ; 05 05
	ASL				  ; 0A
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	ROL				  ; 2A
	AND $0F3F15,X		; 3F 15 3F 0F
	BRK $0F			  ; 00 0F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $4A			  ; 00 4A
	SBC $76			  ; F7 76
	LDA $FF00			; AD 00 FF
	BRK $E7			  ; 00 E7
	BRK $A5			  ; 00 A5
	BRK $A5			  ; 00 A5
	ORA $81			  ; 01 81
	TRB $3C			  ; 14 3C
	CLC				  ; 18
	BRK $DB			  ; 00 DB
	BRK $FF			  ; 00 FF
	BRK $E7			  ; 00 E7
	BRK $A5			  ; 00 A5
	BRK $A5			  ; 00 A5
	BRK $81			  ; 00 81
	BRK $3C			  ; 00 3C
	BRK $50			  ; 00 50
	LDY #$A0			 ; A0 A0
	BVC $8865			; 50 00
	SED				  ; F8
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	MVN $A8FC			; 54 FC A8
	JSR ($00F0,X)		; FC F0 00
	BEQ $8874			; F0 00
	SED				  ; F8
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $15			  ; 00 15
	ROL				  ; 2A
	ROL				  ; 2A
	ORA $00,X			; 15 00
	AND $003F00,X		; 3F 00 3F 00
	AND $2A2F00		  ; 2F 00 2F 2A
	AND $3F0D05		  ; 2F 05 0D 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $2F			  ; 00 2F
	BRK $2F			  ; 00 2F
	BRK $2F			  ; 00 2F
	BRK $0D			  ; 00 0D
	BRK $00			  ; 00 00
	BRK $24			  ; 00 24
	BRK $00			  ; 00 00
	BIT $7E00,X		  ; 3C 00 7E
	BRK $7E			  ; 00 7E
	BRK $FF			  ; 00 FF
	TAX				  ; AA
	SBC $00FF55,X		; FF 55 FF 00
	BRK $24			  ; 00 24
	BRK $3C			  ; 00 3C
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $54			  ; 00 54
	TAY				  ; A8
	TAY				  ; A8
	MVN $FC00			; 54 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	LDY $F4			  ; A4 F4
	BPL $8880			; 10 B0
	JSR ($FC00,X)		; FC 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $B0			  ; 00 B0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	AND $0F3F2A,X		; 3F 2A 3F 0F
	AND $000D0D		  ; 2F 0D 0D 00
	BRK $05			  ; 00 05
	ORA $02			  ; 05 02
	COP $05			  ; 02 05
	ORA $3F			  ; 05 3F
	BRK $3F			  ; 00 3F
	BRK $2F			  ; 00 2F
	BRK $0D			  ; 00 0D
	BRK $00			  ; 00 00
	ORA $05			  ; 05 05
	BRK $02			  ; 00 02
	ORA $05			  ; 01 05
	COP $55			  ; 02 55
	SBC $FFFFAA,X		; FF AA FF FF
	SBC $AAFFFF,X		; FF FF FF AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAY				  ; A8
	JSR ($FC54,X)		; FC 54 FC
	BEQ $893A			; F0 F4
	BCS $88F8			; B0 B0
	LDY #$A0			 ; A0 A0
	BRK $00			  ; 00 00
	BRA $88CE			; 80 80
	RTI				  ; 40
	RTI				  ; 40
	JSR ($FC00,X)		; FC 00 FC
	BRK $F4			  ; 00 F4
	BRK $B0			  ; 00 B0
	BRK $A0			  ; 00 A0
	BRK $00			  ; 00 00
	LDY #$80			 ; A0 80
	RTI				  ; 40
	RTI				  ; 40
	LDY #$2A			 ; A0 2A
	AND $2D2F05,X		; 3F 05 2F 2D
	AND $0D0D			; 2D 0D 0D
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	COP $02			  ; 02 02
	ORA $05			  ; 05 05
	AND $002F00,X		; 3F 00 2F 00
	AND $0D00			; 2D 00 0D
	BRK $00			  ; 00 00
	ORA $01			  ; 05 01
	COP $02			  ; 02 02
	ORA $05			  ; 05 05
	COP $28			  ; 02 28
	BIT $7E54,X		  ; 3C 54 7E
	SBC $FFFFFF,X		; FF FF FF FF
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	BIT $7E00,X		  ; 3C 00 7E
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $AA			  ; 00 AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	MVN $A0FC			; 54 FC A0
	PEA $B4B4			; F4 B4 B4
	BCS $8958			; B0 B0
	LDY #$A0			 ; A0 A0
	RTI				  ; 40
	RTI				  ; 40
	LDY #$A0			 ; A0 A0
	RTI				  ; 40
	RTI				  ; 40
	JSR ($F400,X)		; FC 00 F4
	BRK $B4			  ; 00 B4
	BRK $B0			  ; 00 B0
	BRK $A0			  ; 00 A0
	BRK $40			  ; 00 40
	BRA $895D			; 80 A0
	RTI				  ; 40
	RTI				  ; 40
	LDY #$00			 ; A0 00
	ORA $05			  ; 05 05
	ORA $03			  ; 05 03
	ORA $07			  ; 03 07
	ORA $02			  ; 07 02
	COP $05			  ; 02 05
	ORA $00			  ; 05 00
	BRK $04			  ; 00 04
	TSB $05			  ; 04 05
	BRK $05			  ; 00 05
	BRK $03			  ; 00 03
	BRK $07			  ; 00 07
	BRK $02			  ; 00 02
	ORA $05			  ; 05 05
	COP $00			  ; 02 00
	TSB $04			  ; 04 04
	BRK $AA			  ; 00 AA
	SBC $FFFF55,X		; FF 55 FF FF
	SBC $AAFFFF,X		; FF FF FF AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	ROL				  ; 2A

;==============================================================================
; GeneralPurpose_0A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A:
	LDY #$A0			 ; A0 A0 | Load Y register
	JSR $C0A0			; 20 A0 C0 | Call local function
	CPY #$E0			 ; C0 E0 | Unknown operation
	CPX #$A0			 ; E0 A0 | Unknown operation
	LDY #$40			 ; A0 40 | Load Y register
	RTI				  ; 40 | Unknown operation
	JSR $2020			; 20 20 20 | Call local function
	JSR $00A0			; 20 A0 00 | Call local function
	LDY #$00			 ; A0 00 | Load Y register
	CPY #$00			 ; C0 00 | Unknown operation
	CPX #$00			 ; E0 00 | Unknown operation
	LDY #$40			 ; A0 40 | Load Y register
	RTI				  ; 40 | Unknown operation
	LDY #$20			 ; A0 20 | Load Y register
	BRK $20			  ; 00 20 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	JSR $0000			; 20 00 00 | Call local function
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $7F			  ; 00 7F | Software interrupt
	BRK $7F			  ; 00 7F | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $7E			  ; 00 7E | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $1F			  ; 00 1F | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	LDY #$00			 ; A0 00 | Load Y register
	BRK $00			  ; 00 00 | Software interrupt

	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 03 00
	ORA $005500		  ; 0F 00 55 00
	ROL				  ; 2A
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $55			  ; 00 55
	TAX				  ; AA
	TXA				  ; 8A
	ORA $7F,X			; 15 7F
	BRK $7F			  ; 00 7F
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $9F			  ; 00 9F
	BRK $01			  ; 00 01
	BRK $A2			  ; 00 A2
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $51			  ; 00 51
	LDX $7DA6			; AE A6 7D
	LDA $00			  ; A5 00
	SBC $00			  ; E7 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	STP				  ; DB
	BRK $C3			  ; 00 C3
	BRK $AA			  ; 00 AA
	BRK $54			  ; 00 54
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $AA			  ; 00 AA
	EOR $51,X			; 55 51
	TAY				  ; A8
	INC $FE00,X		  ; FE 00 FE
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $F9			  ; 00 F9
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $3F			  ; 00 3F
	BRK $5F			  ; 00 5F
	LDY #$AA			 ; A0 AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	ORA $000F00		  ; 0F 00 0F 00
	ORA $001F00,X		; 1F 00 1F 00
	AND $00FF00,X		; 3F 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	BRL $D183			; 82 00 45
	BRK $E7			  ; 00 E7
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $AA			  ; 00 AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	CMP $00			  ; C3 00
	SBC $00			  ; E7 00
	SBC $00			  ; E7 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $005000,X		; FF 00 50 00
	LDY #$00			 ; A0 00
	SED				  ; F8
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FA			  ; 00 FA
	ORA $55			  ; 05 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $F0,X			; 55 F0
	BRK $F0			  ; 00 F0
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $02			  ; 00 02
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $25			  ; 00 25
	INC				  ; 1A
	PHY				  ; 5A
	LDA $01			  ; A5 01
	BRK $03			  ; 00 03
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $3F			  ; 00 3F
	BRK $FF			  ; 00 FF
	BRK $45			  ; 00 45
	BRK $A2			  ; 00 A2
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $55			  ; 00 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $E7,X			; 55 E7
	BRK $E7			  ; 00 E7
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $A4			  ; 00 A4
	CLI				  ; 58
	PHY				  ; 5A
	LDA $80			  ; A5 80
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $FC			  ; 00 FC
	BRK $FF			  ; 00 FF
	BRK $15			  ; 00 15
	ASL				  ; 0A
	COP $05			  ; 02 05
	BRK $3F			  ; 00 3F
	BRK $17			  ; 00 17
	BRK $0D			  ; 00 0D
	BRK $19			  ; 00 19
	BRK $13			  ; 00 13
	BRK $00			  ; 00 00
	ORA $000700,X		; 1F 00 07 00
	AND $001700,X		; 3F 00 17 00
	ORA $1900			; 0D 00 19
	BRK $13			  ; 00 13
	BRK $00			  ; 00 00
	BRK $15			  ; 00 15
	ROL				  ; 2A
	TAX				  ; AA
	ORA $00			  ; 11 00
	SBC $00			  ; F3 00
	SBC $00			  ; F7 00
	STA $0A8F00		  ; 8F 00 8F 0A
	ORA $3F0F05		  ; 0F 05 0F 3F
	BRK $BB			  ; 00 BB
	BRK $F3			  ; 00 F3
	BRK $F7			  ; 00 F7
	BRK $8F			  ; 00 8F
	BRK $8F			  ; 00 8F
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $A8			  ; 00 A8
	MVN $8855			; 54 55 88
	BRK $CF			  ; 00 CF
	BRK $EF			  ; 00 EF
	BRK $E1			  ; 00 E1
	BRK $F1			  ; 00 F1
	BVC $8D7E			; 50 F0
	LDY #$F0			 ; A0 F0
	JSR ($DD00,X)		; FC 00 DD
	BRK $CF			  ; 00 CF
	BRK $EF			  ; 00 EF
	BRK $E1			  ; 00 E1
	BRK $F1			  ; 00 F1
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $A8			  ; 00 A8
	BVC $8DE3			; 50 40
	LDY #$00			 ; A0 00
	JSR ($E800,X)		; FC 00 E8
	BRK $B0			  ; 00 B0
	BRK $98			  ; 00 98
	BRK $C8			  ; 00 C8
	BRK $00			  ; 00 00
	SED				  ; F8
	BRK $E0			  ; 00 E0
	BRK $FC			  ; 00 FC
	BRK $E8			  ; 00 E8
	BRK $B0			  ; 00 B0
	BRK $98			  ; 00 98
	BRK $C8			  ; 00 C8
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $05			  ; 01 05
	ASL				  ; 0A
	BRK $05			  ; 00 05
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $000500		  ; 0F 00 05 00
	ORA $00			  ; 03 00
	ORA $00			  ; 03 00
	COP $00			  ; 02 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	BRK $FF			  ; 00 FF
	BRK $7F			  ; 00 7F
	BRK $F7			  ; 00 F7
	BRK $FF			  ; 00 FF
	ORA $2F			  ; 05 2F
	ASL				  ; 0A
	AND $FF00FF		  ; 2F FF 00 FF
	BRK $FF			  ; 00 FF
	BRK $7F			  ; 00 7F
	BRK $F7			  ; 00 F7
	BRK $FF			  ; 00 FF
	BRK $2F			  ; 00 2F
	BRK $2F			  ; 00 2F
	BRK $8A			  ; 00 8A
	ADC $65,X			; 75 65
	LDX $FF00,Y		  ; BE 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	EOR $FF,X			; 55 FF
	TAX				  ; AA
	SBC $C300DB,X		; FF DB 00 C3
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $55			  ; 00 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $00,X			; 55 00
	SBC $00FE00,X		; FF 00 FE 00
	SBC $50FF00		  ; EF 00 FF 50
	PEA $F4A0			; F4 A0 F4
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FE00,X		; FF 00 FE 00
	SBC $00FF00		  ; EF 00 FF 00
	PEA $F400			; F4 00 F4
	BRK $00			  ; 00 00
	BRA $8DE3			; 80 A0
	BVC $8E45			; 50 00
	LDY #$00			 ; A0 00
	CPY #$00			 ; C0 00
	CPY #$00			 ; C0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $8E52			; 80 00
	BEQ $8E54			; F0 00
	LDY #$00			 ; A0 00
	CPY #$00			 ; C0 00
	CPY #$00			 ; C0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $A5			  ; 00 A5
	PHY				  ; 5A
	PHY				  ; 5A
	LDA $00			  ; A5 00
	SBC $00FF00,X		; FF 00 FF 00
	LDA $2AFF00,X		; BF 00 FF 2A
	ADC $FF1F15,X		; 7F 15 1F FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $BF			  ; 00 BF
	BRK $FF			  ; 00 FF
	BRK $7F			  ; 00 7F
	BRK $1F			  ; 00 1F
	BRK $55			  ; 00 55
	TAX				  ; AA
	TAX				  ; AA
	EOR $00,X			; 55 00
	SBC $00FF24,X		; FF 24 FF 00
	SBC $AAFF00,X		; FF 00 FF AA
	SBC $FFFF55,X		; FF 55 FF FF
	BRK $FF			  ; 00 FF
	BRK $DB			  ; 00 DB
	BRK $C3			  ; 00 C3
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $A5			  ; 00 A5
	PHY				  ; 5A
	PHY				  ; 5A
	LDA $00			  ; A5 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $FF00,X		  ; FD 00 FF
	TAX				  ; AA
	INC $F850,X		  ; FE 50 F8
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $FF00,X		  ; FD 00 FF
	BRK $FE			  ; 00 FE
	BRK $F8			  ; 00 F8
	BRK $40			  ; 00 40
	BRA $8EE3			; 80 00
	BRK $00			  ; 00 00
	CPY #$00			 ; C0 00
	BRK $00			  ; 00 00
	BRA $8EEB			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $C0			  ; 00 C0
	BRK $00			  ; 00 00
	BRK $C0			  ; 00 C0
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ORA $01			  ; 07 01
	ORA $01			  ; 03 01
	ORA $03			  ; 01 03
	ORA $05			  ; 03 05
	ORA $00			  ; 05 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $05			  ; 00 05
	COP $00			  ; 02 00
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $AA			  ; 00 AA
	SBC $FFFF55,X		; FF 55 FF FF
	SBC $55FFFF,X		; FF FF FF 55
	EOR $AA,X			; 55 AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	BRK $00			  ; 00 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	EOR $AA,X			; 55 AA
	TAX				  ; AA
	MVN $2A55			; 54 55 2A
	BRK $7F			  ; 00 7F
	RTI				  ; 40
	CPX #$80			 ; E0 80
	CPY #$80			 ; C0 80
	BRA $8F07			; 80 C0
	CPY #$40			 ; C0 40
	RTI				  ; 40
	JSR $0020			; 20 20 00
	BRK $00			  ; 00 00
	BRK $E0			  ; 00 E0
	BRK $C0			  ; 00 C0
	BRK $80			  ; 00 80
	BRK $C0			  ; 00 C0
	BRK $40			  ; 00 40
	LDY #$20			 ; A0 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $05			  ; 00 05
	ORA $030702		  ; 0F 02 07 03
	ORA $01			  ; 03 01
	ORA $02			  ; 01 02
	COP $05			  ; 02 05
	ORA $00			  ; 05 00
	BRK $00			  ; 00 00
	BRK $0F			  ; 00 0F
	BRK $07			  ; 00 07
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	ORA $05			  ; 01 05
	COP $00			  ; 02 00
	TSB $00			  ; 04 00
	BRK $55			  ; 00 55
	SBC $FFFFAA,X		; FF AA FF FF
	SBC $AAFFFF,X		; FF FF FF AA
	TAX				  ; AA
	EOR $55,X			; 55 55
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	TAX				  ; AA
	EOR $55,X			; 55 55
	TAX				  ; AA
	BRK $FE			  ; 00 FE
	BRK $7F			  ; 00 7F
	BVC $8F92			; 50 F0
	LDY #$E0			 ; A0 E0
	CPY #$C0			 ; C0 C0
	BRA $8F28			; 80 80
	BRA $8F2A			; 80 80
	RTI				  ; 40
	RTI				  ; 40
	JSR $0020			; 20 20 00
	BRK $F0			  ; 00 F0
	BRK $E0			  ; 00 E0
	BRK $C0			  ; 00 C0
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	RTI				  ; 40
	RTI				  ; 40
	LDY #$20			 ; A0 20
	BRK $00			  ; 00 00
	BRK $0A			  ; 00 0A
	ORA $0B1F15,X		; 1F 15 1F 0B
	PHD				  ; 0B
	ORA $03			  ; 03 03
	ORA $01			  ; 01 01
	COP $02			  ; 02 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $001F00,X		; 1F 00 1F 00
	PHD				  ; 0B
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	ORA $00			  ; 01 00
	ORA $00			  ; 07 00
	TSB $AA			  ; 04 AA
	SBC $FFFF55,X		; FF 55 FF FF
	SBC $55FFFF,X		; FF FF FF 55
	EOR $AA,X			; 55 AA
	TAX				  ; AA
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	EOR $AA,X			; 55 AA
	TAX				  ; AA
	EOR $00,X			; 55 00
	SBC $A8FE00,X		; FF 00 FE A8
	SED				  ; F8
	BVC $8FFC			; 50 F8
	BCS $8FB6			; B0 B0
	LDY #$A0			 ; A0 A0
	BRK $00			  ; 00 00
	BRA $8F8C			; 80 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	SED				  ; F8
	BRK $F8			  ; 00 F8
	BRK $B0			  ; 00 B0
	BRK $A0			  ; 00 A0
	BRK $00			  ; 00 00
	BRA $8F9B			; 80 80
	RTI				  ; 40
	BRK $E0			  ; 00 E0
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $7F			  ; 00 7F
	BRK $00			  ; 00 00
	BRK $FE			  ; 00 FE
	BRK $00			  ; 00 00
	BRK $7F			  ; 00 7F
	BRK $00			  ; 00 00
	BRK $1F			  ; 00 1F
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data

;==============================================================================
; GeneralPurpose_11
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_11:
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	SBC $00			  ; E7 00 | Unknown operation
	SBC $00			  ; E7 00 | Unknown operation
	SBC $00			  ; E7 00 | Unknown operation
	SBC $00			  ; E7 00 | Unknown operation
	SBC $00			  ; E7 00 | Unknown operation
	SBC $00			  ; E7 00 | Unknown operation
	SBC $00			  ; E7 00 | Unknown operation
	SBC $000000,X		; FF 00 00 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	ORA $00			  ; 01 00 | Logical OR with accumulator
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 07 00 | Logical OR with accumulator
	ORA $00			  ; 07 00 | Logical OR with accumulator
	ORA $00			  ; 07 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $81			  ; 00 81 | Software interrupt

	BRK $81			  ; 00 81
	BRK $81			  ; 00 81
	STA $C3			  ; 81 C3
	SBC $00			  ; E7 00
	SBC $00			  ; E7 00
	SBC $00			  ; E7 00
	SBC $00FF00,X		; FF 00 FF 00
	ROR $7E00,X		  ; 7E 00 7E
	BRK $3C			  ; 00 3C
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	STA $00			  ; 81 00
	STA $81			  ; 81 81
	CMP $C3			  ; C3 C3
	CMP $42			  ; C3 42
	SBC $24			  ; E7 24
	BIT $00			  ; 24 00
	BRK $E7			  ; 00 E7
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $3C			  ; 00 3C
	BRK $3C			  ; 00 3C
	BRK $18			  ; 00 18
	BRK $DB			  ; 00 DB
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $3C			  ; 00 3C
	BRK $18			  ; 00 18
	BRK $DB			  ; 00 DB
	BRK $FF			  ; 00 FF
	BRK $E7			  ; 00 E7
	BRK $E7			  ; 00 E7
	BRK $A5			  ; 00 A5
	BRK $A5			  ; 00 A5
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $0A			  ; 00 0A
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $3F			  ; 00 3F
	BRK $15			  ; 00 15
	ROL				  ; 2A
	ROL				  ; 2A
	ORA $3F			  ; 05 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $2F			  ; 00 2F
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $A8			  ; 00 A8
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $54			  ; 00 54
	TAY				  ; A8
	LDY #$54			 ; A0 54
	JSR ($FC00,X)		; FC 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $000500		  ; 0F 00 05 00
	ORA $05			  ; 05 05
	ORA $02			  ; 05 02
	ORA $2F			  ; 03 2F
	BRK $2F			  ; 00 2F
	BRK $2F			  ; 00 2F
	BRK $0F			  ; 00 0F
	BRK $05			  ; 00 05
	BRK $05			  ; 00 05
	BRK $05			  ; 00 05
	BRK $03			  ; 00 03
	BRK $28			  ; 00 28
	TRB $54			  ; 14 54
	ROL				  ; 2A
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	EOR $FF,X			; 55 FF
	TAX				  ; AA
	SBC $7E003C,X		; FF 3C 00 7E
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $54			  ; 00 54
	LDY #$A0			 ; A0 A0
	MVN $F400			; 54 00 F4
	BRK $F0			  ; 00 F0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	JSR $80A0			; 20 A0 80
	CPY #$F4			 ; C0 F4
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $F0			  ; 00 F0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $C0			  ; 00 C0
	BRK $2A			  ; 00 2A
	BRK $15			  ; 00 15
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $2F			  ; 00 2F
	BRK $2A			  ; 00 2A
	ORA $05			  ; 05 05
	ROL				  ; 2A
	AND $003F00,X		; 3F 00 3F 00
	AND $003F00,X		; 3F 00 3F 00
	AND $002F00,X		; 3F 00 2F 00
	AND $002F00		  ; 2F 00 2F 00
	TAY				  ; A8
	BRK $54			  ; 00 54
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $A0			  ; 00 A0
	MVN $A054			; 54 54 A0
	JSR ($FC00,X)		; FC 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $2A			  ; 00 2A
	BRK $15			  ; 00 15
	BRK $3F			  ; 00 3F
	BRK $3F			  ; 00 3F
	BRK $2F			  ; 00 2F
	BRK $2F			  ; 00 2F
	BRK $0A			  ; 00 0A
	AND $25			  ; 25 25
	ASL				  ; 0A
	AND $003F00,X		; 3F 00 3F 00
	AND $003F00,X		; 3F 00 3F 00
	AND $002F00		  ; 2F 00 2F 00
	AND $002F00		  ; 2F 00 2F 00
	TAY				  ; A8
	BRK $54			  ; 00 54
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $A0			  ; 00 A0
	MVN $A450			; 54 50 A4
	JSR ($FC00,X)		; FC 00 FC
	BRK $FC			  ; 00 FC
	BRK $FC			  ; 00 FC
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $F4			  ; 00 F4
	BRK $05			  ; 00 05
	ORA $02			  ; 07 02
	ORA $07			  ; 07 07
	ORA $07			  ; 07 07
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $00			  ; 00 00
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $55			  ; 00 55
	SBC $FFFFAA,X		; FF AA FF FF
	SBC $55FFFF,X		; FF FF FF 55
	EOR $2A,X			; 55 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	ROL				  ; 2A
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	EOR $AA,X			; 55 AA
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	ROL				  ; 2A
	EOR $40,X			; 55 40
	CPX #$A0			 ; E0 A0
	CPX #$E0			 ; E0 E0
	CPX #$E0			 ; E0 E0
	CPX #$20			 ; E0 20
	JSR $2020			; 20 20 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	JSR $2000			; 20 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $2A			  ; 00 2A
	ORA $05			  ; 05 05
	ROL				  ; 2A
	BRK $0F			  ; 00 0F
	BRK $07			  ; 00 07
	BRK $05			  ; 00 05
	BRK $05			  ; 00 05
	COP $03			  ; 02 03
	ORA $07			  ; 05 07
	AND $002F00		  ; 2F 00 2F 00
	ORA $000700		  ; 0F 00 07 00
	ORA $00			  ; 05 00
	ORA $00			  ; 05 00
	ORA $00			  ; 03 00
	ORA $00			  ; 07 00
	BRK $00			  ; 00 00
	BIT $00			  ; 24 00
	BRK $3C			  ; 00 3C
	BRK $3C			  ; 00 3C
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	ROL				  ; 2A
	ROR $FF55,X		  ; 7E 55 FF
	BRK $00			  ; 00 00
	BIT $00			  ; 24 00
	BIT $3C00,X		  ; 3C 00 3C
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $FF			  ; 00 FF
	BRK $A0			  ; 00 A0
	MVN $A054			; 54 54 A0
	BRK $F0			  ; 00 F0
	BRK $E0			  ; 00 E0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRA $976E			; 80 C0
	RTI				  ; 40
	CPX #$F4			 ; E0 F4
	BRK $F4			  ; 00 F4
	BRK $F0			  ; 00 F0
	BRK $E0			  ; 00 E0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $0A			  ; 00 0A
	AND $05			  ; 25 05
	ASL				  ; 0A
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $05			  ; 00 05
	BRK $05			  ; 00 05
	COP $03			  ; 02 03
	ORA $07			  ; 05 07
	AND $000F00		  ; 2F 00 0F 00
	ORA $00			  ; 07 00
	ORA $00			  ; 07 00
	ORA $00			  ; 05 00
	ORA $00			  ; 05 00
	ORA $00			  ; 03 00
	ORA $00			  ; 07 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $24			  ; 00 24
	BRK $3C			  ; 00 3C
	BRK $3C			  ; 00 3C
	ROL				  ; 2A
	ROR $7E54,X		  ; 7E 54 7E
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BIT $00			  ; 24 00
	BIT $3C00,X		  ; 3C 00 3C
	BRK $7E			  ; 00 7E
	BRK $7E			  ; 00 7E
	BRK $A0			  ; 00 A0
	MVN $E010			; 54 10 E0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRA $97CE			; 80 C0
	RTI				  ; 40
	CPX #$F4			 ; E0 F4
	BRK $F0			  ; 00 F0
	BRK $E0			  ; 00 E0
	BRK $E0			  ; 00 E0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $05			  ; 07 05
	ORA $07			  ; 07 07
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $AA			  ; 00 AA
	SBC $FFFF55,X		; FF 55 FF FF
	SBC $2AFFFF,X		; FF FF FF 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	SBC $00FF00,X		; FF 00 FF 00
	SBC $00FF00,X		; FF 00 FF 00
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	LDY #$E0			 ; A0 E0
	RTI				  ; 40
	CPX #$E0			 ; E0 E0
	CPX #$20			 ; E0 20
	JSR $2020			; 20 20 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	JSR $2000			; 20 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ORA $05			  ; 07 05
	ORA $07			  ; 07 07
	ORA $04			  ; 07 04
	TSB $04			  ; 04 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $04			  ; 00 04
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $2A			  ; 00 2A
	ROR $7E54,X		  ; 7E 54 7E
	SBC $FFFFFF,X		; FF FF FF FF
	ROL				  ; 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROR $7E00,X		  ; 7E 00 7E
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $2A			  ; 00 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	ROL				  ; 2A
	EOR $55,X			; 55 55
	ROL				  ; 2A
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $000700		  ; 0F 00 07 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ADC $00			  ; 63 00
	SBC $00			  ; E7 00
	AND $000F00,X		; 3F 00 0F 00
	ORA $00			  ; 07 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BVC $9962			; 50 00
	TAY				  ; A8
	BRK $F0			  ; 00 F0
	BRK $E0			  ; 00 E0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $0C			  ; 00 0C
	BRK $0C			  ; 00 0C
	BRK $0C			  ; 00 0C
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	BRK $18			  ; 00 18
	BRK $18			  ; 00 18
	BRK $0C			  ; 00 0C
	BRK $0C			  ; 00 0C
	BRK $0C			  ; 00 0C
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 11 00
	ORA $1D00,Y		  ; 19 00 1D
	BRK $0C			  ; 00 0C
	BRK $06			  ; 00 06
	JSL $000036		  ; 22 36 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 11 00
	ORA $1D00,Y		  ; 19 00 1D
	BRK $0C			  ; 00 0C
	BRK $06			  ; 00 06
	BRK $36			  ; 00 36
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $99C5			; 80 00
	BRA $99C7			; 80 00
	CPY #$00			 ; C0 00
	DEC $00			  ; C6 00
	CMP $88C600,X		; DF 00 C6 88
	CPY $0000			; CC 00 00
	BRA $99D4			; 80 00
	BRA $99D6			; 80 00
	CPY #$00			 ; C0 00
	DEC $00			  ; C6 00
	CMP $00C600,X		; DF 00 C6 00
	CPY $0000			; CC 00 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $000000		  ; 0F 00 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $0C			  ; 00 0C
	BRK $1E			  ; 00 1E
	BRK $1F			  ; 00 1F
	BRK $0F			  ; 00 0F
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $41			  ; 00 41
	ADC $A2			  ; 63 A2
	SBC $3F			  ; E7 3F
	AND $070F0F,X		; 3F 0F 0F 07
	ORA $00			  ; 07 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $63			  ; 00 63
	BRK $E7			  ; 00 E7
	BRK $3F			  ; 00 3F
	BRK $0F			  ; 00 0F
	BRK $07			  ; 00 07
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $50			  ; 00 50
	SED				  ; F8
	TAY				  ; A8
	SED				  ; F8
	BEQ $9A96			; F0 F0
	CPX #$E0			 ; E0 E0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	EOR $22			  ; 41 22
	LDX #$45			 ; A2 45
	AND $000F00,X		; 3F 00 0F 00
	ORA $00			  ; 07 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BVC $9B32			; 50 50
	TAY				  ; A8
	TAY				  ; A8
	BEQ $9AD6			; F0 F0
	CPX #$E0			 ; E0 E0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPY #$00			 ; C0 00
	CPY #$00			 ; C0 00
	CPX #$00			 ; E0 00
	RTS				  ; 60
	BRK $70			  ; 00 70
	BRK $38			  ; 00 38
	BRK $38			  ; 00 38
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $8C			  ; 00 8C
	BRK $8F			  ; 00 8F
	BRK $87			  ; 00 87
	BRK $CF			  ; 00 CF
	BRK $FF			  ; 00 FF
	BRK $66			  ; 00 66
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	CPY #$10			 ; C0 10
	CPX #$00			 ; E0 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $E0			  ; 00 E0
	CPX #$80			 ; E0 80
	BRA $9C2F			; 80 C0
	RTI				  ; 40
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	BMI $9C98			; 30 00
	AND $00			  ; 23 00
	ADC $23			  ; 67 23
	JMP ($4D27,X)		; 7C 27 4D
	AND $00			  ; 37 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $0C			  ; 00 0C
	PHP				  ; 08
	COP $00			  ; 02 00
	BRL $A131			; 82 82 04
	TSB $38			  ; 04 38
	BRK $64			  ; 00 64
	BRK $41			  ; 00 41
	BRK $0C			  ; 00 0C
	BRK $9A			  ; 00 9A
	TSB $02C5			; 0C C5 02
	CMP $82			  ; C7 82
	STZ $2004,X		  ; 9E 04 20
	JSR $6070			; 20 70 60
	CLC				  ; 18
	BPL $9CCF			; 10 08
	PHP				  ; 08
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	EOR $0E7B0D,X		; 5F 0D 7B 0E
	PLP				  ; 28
	ORA $0C			  ; 07 0C
	ORA $07			  ; 07 07
	ORA $07			  ; 01 07
	ORA $03			  ; 01 03
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BVS $9D21			; 70 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $20			  ; 00 20
	BRK $60			  ; 00 60
	BPL $9D0B			; 10 E0
	BMI $9CED			; 30 C0
	RTS				  ; 60
	CPY #$60			 ; C0 60
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	JSR $4000			; 20 00 40
	BMI $9CBB			; 30 80
	BVS $9D3D			; 70 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	ORA $06			  ; 03 06
	ASL $06			  ; 06 06
	COP $0C			  ; 02 0C
	PHP				  ; 08
	TSB $0000			; 0C 00 00
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	BRK $07			  ; 00 07
	ORA $0F			  ; 03 0F
	ASL $1A			  ; 06 1A
	ASL $1A			  ; 06 1A
	TSB $0C12			; 0C 12 0C
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	SEC				  ; 38
	ADC $0F			  ; 61 0F
	BMI $9DC6			; 30 1D
	AND $1C			  ; 32 1C
	AND $10			  ; 33 10
	AND $30AF09,X		; 3F 09 AF 30
	RTS				  ; 60
	ORA #$70			 ; 09 70
	PHP				  ; 08
	ADC $16			  ; 71 16
	AND $3B04,Y		  ; 39 04 3B
	ORA $3B			  ; 05 3B
	ORA #$3F			 ; 09 3F
	BPL $9D40			; 10 80
	BRA $9E22			; 80 60
	CPY #$60			 ; C0 60
	CPY #$60			 ; C0 60
	BRK $C0			  ; 00 C0
	BRA $9D8A			; 80 C0
	BRA $9D8C			; 80 C0
	BRA $9D9C			; 80 CE
	PHP				  ; 08
	EOR $0060C0,X		; 5F C0 60 00
	CPX #$00			 ; E0 00
	CPX #$80			 ; E0 80
	CPY #$00			 ; C0 00
	CPY #$00			 ; C0 00
	CPY #$00			 ; C0 00
	DEC $1F86			; CE 86 1F
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $05			  ; 00 05
	ORA $1F			  ; 01 1F
	ORA $3F			  ; 03 3F
	ORA $BE			  ; 17 BE
	ASL $00FD,X		  ; 1E FD 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $04			  ; 05 04
	ORA $3010,X		  ; 1D 10 30
	PHP				  ; 08
	LDA $C380,Y		  ; B9 80 C3

;==============================================================================
; GeneralPurpose_1E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1E:
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	ORA $06			  ; 07 06 | Logical OR with accumulator
	ORA $01			  ; 01 01 | Logical OR with accumulator
	ORA $01			  ; 01 01 | Logical OR with accumulator
	COP $02			  ; 02 02 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	CLC				  ; 18 | Clear carry flag
	ORA $07070E		  ; 0F 0E 07 07 | Logical OR with accumulator
	ORA $0B			  ; 01 0B | Logical OR with accumulator
	ORA $07			  ; 01 07 | Logical OR with accumulator
	COP $00			  ; 02 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $E0			  ; 00 E0 | Software interrupt
	JSR $20E0			; 20 E0 20 | Call local function
	CPY #$40			 ; C0 40 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	ORA $3E04,X		  ; 1D 04 3E | Logical OR with accumulator
	AND $1C			  ; 32 1C | Logical AND with accumulator
	TRB $0000			; 1C 00 00 | Unknown operation
	ADC $3F			  ; 61 3F | Unknown operation
	JSR $1C1F			; 20 1F 1C | Call local function
	ORA $50			  ; 07 50 | Logical OR with accumulator
	ORA $331D66		  ; 0F 66 1D 33 | Logical OR with accumulator
	ROL $1C3F,X		  ; 3E 3F 1C | Unknown operation
	TRB $1000			; 1C 00 10 | Unknown operation
	BPL $9E53			; 10 D0 | Unknown operation
	BNE $9E7D			; D0 F8 | Branch if not equal (zero flag clear)
	CLC				  ; 18 | Clear carry flag
	JSR ($EC1C,X)		; FC 1C EC | Call local function
	BIT $18			  ; 24 18 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	BMI $9EBE			; 30 30 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	SED				  ; F8 | Unknown operation
	BPL $9E8C			; 10 F9 | Unknown operation
	BNE $9EB1			; D0 1C | Branch if not equal (zero flag clear)
	SED				  ; F8 | Unknown operation
	ASL $36FC,X		  ; 1E FC 36 | Arithmetic shift left
	CPX $18EC			; EC EC 18 | Unknown operation
	PLY				  ; 7A | Pull Y register from stack
	BMI $9E8F			; 30 F0 | Unknown operation
	BRK $20			  ; 00 20 | Software interrupt
	JSR $7070			; 20 70 70 | Call local function
	SEI				  ; 78 | Unknown operation

	SEI				  ; 78
	RTI				  ; 40
	CLD				  ; D8
	BRA $9EC5			; 80 1C
	TRB $DC			  ; 14 DC
	MVN $0088			; 54 88 00
	DEY				  ; 88
	DEY				  ; 88
	BVS $9ED2			; 70 20
	JSR ($C470,X)		; FC 70 C4
	SEI				  ; 78
	LDY $D8			  ; A4 D8
	INC $1C,X			; F6 1C
	ROR $DC,X			; 76 DC
	MVN $DC88			; 54 88 DC
	DEY				  ; 88
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 07 00
	ORA #$07			 ; 09 07
	ORA $06			  ; 01 06
	ORA $03			  ; 01 03
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 07 00
	ASL $0107			; 0E 07 01
	ASL $00			  ; 06 00
	ORA $00			  ; 03 00
	ORA $00			  ; 01 00
	ORA $0F			  ; 01 0F
	BMI $9F02			; 30 1F
	BMI $9EEE			; 30 09
	AND $F6E620		  ; 2F 20 E6 F6
	DEC $FF			  ; C6 FF
	STX $DF			  ; 86 DF
	BMI $9F2E			; 30 3F
	SBC $3916,Y		  ; F9 16 39
	ASL $39			  ; 06 39
	BPL $9EF6			; 10 00
	ORA $09C0,Y		  ; 19 C0 09
	CPY #$40			 ; C0 40
	BRA $9E8D			; 80 90
	BPL $9F18			; 10 19
	STA $C000,Y		  ; 99 00 C0
	BRA $9EC4			; 80 C0
	ASL $4940			; 0E 40 49
	ROR $36F8,X		  ; 7E F8 36
	SED				  ; F8
	TRB $C8B0			; 1C B0 C8
	CPY #$F8			 ; C0 F8
	BRA $9ED2			; 80 C0
	BRK $C0			  ; 00 C0
	STX $8700			; 8E 00 87
	ROL $3608,X		  ; 3E 08 36
	JSR $901C			; 20 1C 90
	DEY				  ; 88
	BRA $9EB8			; 80 98
	ASL $0F02			; 0E 02 0F
	ORA #$07			 ; 09 07
	BRK $03			  ; 00 03
	COP $00			  ; 02 00
	BRK $23			  ; 00 23
	ORA $37			  ; 03 37
	BIT $0F,X			; 34 0F
	PHP				  ; 08
	ORA $0E			  ; 13 0E
	AND #$0F			 ; 29 0F
	PHA				  ; 48
	ORA $46			  ; 07 46
	ORA $67			  ; 03 67
	BRK $D7			  ; 00 D7
	AND $7C			  ; 23 7C
	AND $18			  ; 37 18
	ORA $E008F8		  ; 0F F8 08 E0
	JSR $31F1			; 20 F1 31
	SBC $FF18,Y		  ; F9 18 FF
	STZ $00FF,X		  ; 9E FF 00
	SBC $22E360,X		; FF 60 E3 22
	TSB $39F8			; 0C F8 39
	CPX #$3F			 ; E0 3F
	SBC $1E			  ; F1 1E
	SBC $FF9E,Y		  ; F9 9E FF
	BRK $FF			  ; 00 FF
	RTS				  ; 60
	SBC $01E33E,X		; FF 3E E3 01
	ASL $01			  ; 06 01
	ORA $00			  ; 03 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ASL $00			  ; 06 00
	ORA $00			  ; 03 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $A0			  ; 00 A0
	INC $F6			  ; E6 F6
	DEC $FF			  ; C6 FF
	ASL $5F			  ; 06 5F
	BCS $9FC8			; B0 3F
	ADC $5FC6,Y		  ; 79 C6 5F
	SBC $707F,Y		  ; F9 7F 70
	ORA $C019,Y		  ; 19 19 C0
	ORA #$C0			 ; 09 C0
	CPY #$00			 ; C0 00
	BPL $9F28			; 10 90
	ORA $2019,Y		  ; 19 19 20
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	BRK $58			  ; 00 58
	ROR $F8,X			; 76 F8
	AND $0FF0,X		  ; 3D F0 0F
	LDX #$DB			 ; A2 DB
	JMP $3FFC			; DC FC 3F
	LDA $EDEFF3		  ; AF F3 EF ED
	STA $003688,X		; 9F 88 36 00
	AND $0B31,X		  ; 3D 31 0B
	STY $98			  ; 84 98
	STA $80			  ; 83 80
	RTI				  ; 40
	PHP				  ; 08
	TSB $020E			; 0C 0E 02
	ORA $000100,X		; 1F 00 01 00
	ORA $01			  ; 03 01
	STX $82			  ; 86 82
	EOR $01			  ; 47 01
	SBC $03			  ; E7 03
	EOR $FF82			; 4D 82 FF
	LDY $87			  ; A4 87
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	ORA $86			  ; 03 86
	STA $47			  ; 81 47
	RTI				  ; 40
	STZ $A6			  ; 64 A6
	BIT $3628			; 2C 28 36
	EOR $18			  ; 57 18
	BIT $78FA,X		  ; 3C FA 78
	PEA $E8F0			; F4 F0 E8
	CPY #$F8			 ; C0 F8
	BRA $9FDA			; 80 F0
	BRK $F0			  ; 00 F0
	JSR $40F0			; 20 F0 40
	CPX #$C0			 ; E0 C0
	DEC $00			  ; C6 00
	TSB $1800			; 0C 00 18
	BPL $A010			; 10 18
	JSR $2030			; 20 30 20
	BMI $A03D			; 30 40
	BVS $9FFF			; 70 00
	RTS				  ; 60

;==============================================================================
; GeneralPurpose_20
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_20:
	JSR $1078			; 20 78 10 | Call local function
	ROL $1E05,X		  ; 3E 05 1E | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	TSB $04			  ; 04 04 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	STA $930F,Y		  ; 99 0F 93 | Store accumulator to memory
	ORA $7E1E17		  ; 0F 17 1E 7E | Logical OR with accumulator
	TRB $307C			; 1C 7C 30 | Unknown operation
	CPX $00			  ; E4 00 | Unknown operation
	BRA $A060			; 80 00 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	INC $FEF8,X		  ; FE F8 FE | Unknown operation
	BVS $A083			; 70 FA | Unknown operation
	COP $F0			  ; 02 F0 | Unknown operation
	BPL $A04D			; 10 C0 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	BRK $F1			  ; 00 F1 | Software interrupt
	SBC $F93FC1,X		; FF C1 3F F9 | Unknown operation
	INC $FE71,X		  ; FE 71 FE | Unknown operation
	ORA $FA			  ; 07 FA | Logical OR with accumulator
	ORA $C0F8F0,X		; 1F F0 F8 C0 | Logical OR with accumulator
	INC $00			  ; E6 00 | Unknown operation
	AND #$B6			 ; 29 B6 | Logical AND with accumulator
	BVC $A07D			; 50 D9 | Unknown operation
	ADC $26D9,Y		  ; 79 D9 26 | Unknown operation
	LSR $29			  ; 46 29 | Unknown operation
	ORA $091F00,X		; 1F 00 1F 09 | Logical OR with accumulator
	ASL $0F,X			; 16 0F | Arithmetic shift left
	ORA $260040,X		; 1F 40 00 26 | Logical OR with accumulator
	BRK $06			  ; 00 06 | Software interrupt
	BRK $19			  ; 00 19 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	ASL $00,X			; 16 00 | Arithmetic shift left
	ORA $401F00,X		; 1F 00 1F 40 | Logical OR with accumulator
	BNE $A063			; D0 A0 | Branch if not equal (zero flag clear)
	BCS $A0A5			; B0 E0 | Branch if carry set
	BCS $A107			; B0 40 | Branch if carry set
	JSR $8040			; 20 40 80 | Call local function
	BRK $80			  ; 00 80 | Software interrupt

	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	JSR $4000			; 20 00 40
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $A0DD			; 80 00
	BRA $A0DF			; 80 00
	BRA $A0EA			; 80 09
	ORA #$10			 ; 09 10
	BPL $A0E5			; 10 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	COP $1C			  ; 02 1C
	TRB $3030			; 1C 30 30
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	STZ $C3,X			; 74 C3
	CMP $1903			; CD 03 19
	ASL $0E93			; 0E 93 0E
	SBC $30FC1C,X		; FF 1C FC 30
	TSC				  ; 3B
	BRK $02			  ; 00 02
	BRK $29			  ; 00 29
	ORA #$20			 ; 09 20
	ASL $06,X			; 16 06
	ORA $1609,Y		  ; 19 09 16
	ORA #$1F			 ; 09 1F
	ORA #$1F			 ; 09 1F
	ORA $360F19		  ; 0F 19 0F 36
	ASL $00,X			; 16 00
	ORA #$00			 ; 09 00
	BRK $16			  ; 00 16
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	BRK $1F			  ; 00 1F
	JSR $471F			; 20 1F 47
	ORA $63B773		  ; 0F 73 B7 63
	SBC $33			  ; E7 33
	LDA $4F			  ; B7 4F
	CMP #$5F			 ; C9 5F
	CLD				  ; D8
	RTL				  ; 6B
	CPX $1F			  ; E4 1F
	BCC $A0D1			; 90 80
	AND $600F30,X		; 3F 30 0F 60
	STA $7CCF70,X		; 9F 70 CF 7C
	LDA $5C			  ; B3 5C
	LDA $7C			  ; A3 7C
	STA $58			  ; 97 58
	SBC $F1			  ; E7 F1
	CMP $DC			  ; D1 DC
	JSR ($E6F6,X)		; FC F6 E6
	JSR ($A3EC,X)		; FC EC A3
	SBC $22			  ; F3 22
	SBC $FE			  ; F2 FE
	AND $D8			  ; 37 D8
	AND $11			  ; 31 11
	STX $831C			; 8E 1C 83
	ORA $89			  ; 07 89
	ASL $4FC3			; 0E C3 4F
	CPY $CDCB			; CC CB CD
	ORA $C0			  ; 07 C0
	AND $E6			  ; 23 E6
	RTI				  ; 40
	CPX #$80			 ; E0 80
	CPX #$C0			 ; E0 C0
	CPX #$20			 ; E0 20
	BMI $A1C9			; 30 40
	BVC $A11B			; 50 90
	TYA				  ; 98
	JSR $6068			; 20 68 60
	STZ $80,X			; 74 80
	RTS				  ; 60
	CPY #$20			 ; C0 20
	CPX #$00			 ; E0 00
	BVS $A158			; 70 C0
	BVS $A13A			; 70 A0
	SED				  ; F8
	RTS				  ; 60
	SED				  ; F8
	BCC $A19B			; 90 FC
	DEY				  ; 88
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $07			  ; 03 07
	TSB $0C			  ; 04 0C
	COP $0A			  ; 02 0A
	ORA #$19			 ; 09 19
	TSB $16			  ; 04 16
	ASL $2E			  ; 06 2E
	ORA $01			  ; 01 01
	ORA $02			  ; 03 02
	ORA $00			  ; 07 00
	ASL $0E03			; 0E 03 0E
	ORA $1F			  ; 05 1F
	ASL $1F			  ; 06 1F
	ORA #$3F			 ; 09 3F
	ORA $8F			  ; 11 8F
	STA $603030		  ; 8F 30 30 60
	RTS				  ; 60
	AND $37			  ; 37 37
	CMP $5858CF		  ; CF CF 58 58
	RTS				  ; 60
	CPX #$14			 ; E0 14
	STY $8F,X			; 94 8F
	BVS $A203			; 70 30
	CMP $779FE0		  ; CF E0 9F 77
	INY				  ; C8
	SBC $A7D830,X		; FF 30 D8 A7
	BEQ $A1FD			; F0 1F
	CMP $00006B,X		; DF 6B 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 07 00
	PHP				  ; 08
	ORA $03			  ; 07 03
	TSB $01			  ; 04 01
	ORA $00			  ; 03 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BRK $0F			  ; 00 0F
	ORA $03			  ; 07 03
	TSB $00			  ; 04 00
	ORA $00			  ; 03 00
	BRK $20			  ; 00 20
	BRK $30			  ; 00 30
	RTI				  ; 40
	AND $00F079		  ; 2F 79 F0 00
	ADC $BFC0,Y		  ; 79 C0 BF
	BEQ $A1CE			; F0 BF
	SBC $0000,Y		  ; F9 00 00
	JSR $1000			; 20 00 10
	RTS				  ; 60
	ASL $79,X			; 16 79
	CMP $C08600		  ; CF 00 86 C0
	BPL $A1AE			; 10 90
	ORA $0099,Y		  ; 19 99 00
	BRK $40			  ; 00 40
	BRK $C0			  ; 00 C0
	JSR $E040			; 20 40 E0
	INC $E100,X		  ; FE 00 E1
	ROL $F2DC,X		  ; 3E DC F2
	CLD				  ; D8
	JSR ($0000,X)		; FC 00 00
	RTI				  ; 40
	BRK $80			  ; 00 80
	RTS				  ; 60
	BRA $A218			; 80 E0
	ROL $1F00,X		  ; 3E 00 1F
	ROL $928C,X		  ; 3E 8C 92
	BRA $A1DC			; 80 9C
	ASL $09			  ; 06 09
	BRK $06			  ; 00 06
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ASL $060A			; 0E 0A 06
	BRK $07			  ; 00 07
	ORA $83			  ; 05 83
	BRA $A1F2			; 80 83
	BRK $F8			  ; 00 F8
	RTS				  ; 60
	INC $9A18,X		  ; FE 18 9A
	TSB $0E0B			; 0C 0B 0E
	LDA #$06			 ; A9 06
	CMP $C407			; CD 07 C4
	STA $4C			  ; 83 4C
	STA $00			  ; 83 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $07			  ; 07 07
	ORA $273D1D,X		; 1F 1D 3D 27
	ROR $00			  ; 66 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	BRK $18			  ; 00 18
	ORA $06			  ; 01 06
	AND #$10			 ; 29 10
	ASL $E9E9,X		  ; 1E E9 E9
	ASL $C1DF,X		  ; 1E DF C1
	SBC $D9E7DE,X		; FF DE E7 D9
	AND $307E86		  ; 2F 86 7E 30
	ORA $E9E7D9,X		; 1F D9 E7 E9
	ASL $FF,X			; 16 FF
	JSR $013E			; 20 3E 01
	AND $3726,Y		  ; 39 26 37
	INX				  ; E8
	ROR $9FE1,X		  ; 7E E1 9F
	BCC $A32E			; 90 4B
	STZ $3B,X			; 74 3B
	PEI $F8			  ; D4 F8
	ADC $1DC73C		  ; 6F 3C C7 1D
	LDA $C7			  ; A3 C7
	INY				  ; C8
	AND $36			  ; 31 36
	TYA				  ; 98
	ADC $7C			  ; 67 7C
	STA $EC			  ; 87 EC
	ORA $87			  ; 17 87
	ADC $E2FFC3,X		; 7F C3 FF E2
	ADC $3F3FF8,X		; 7F F8 3F 3F
	INY				  ; C8

;==============================================================================
; GeneralPurpose_23
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_23:
	CMP $39			  ; D1 39 | Compare with accumulator
	STA $7E			  ; 92 7E | Store accumulator to memory
	TRB $FB			  ; 14 FB | Unknown operation
	AND $E57EF2,X		; 3F F2 7E E5 | Logical AND with accumulator
	JSR ($F3CD,X)		; FC CD F3 | Call local function
	SBC $8C			  ; F3 8C | Unknown operation
	JMP ($E621)		  ; 6C 21 E6 | Unknown operation
	ROR $F9			  ; 66 F9 | Unknown operation
	SBC $F8			  ; E7 F8 | Unknown operation
	CMP #$F6			 ; C9 F6 | Compare with accumulator
	STA $33E7,Y		  ; 99 E7 33 | Store accumulator to memory
	DEC $FC0F			; CE 0F FC | Unknown operation
	JSR ($0013,X)		; FC 13 00 | Call local function
	STY $7B08			; 8C 08 7B | Store Y register
	STA $97			  ; 97 97 | Store accumulator to memory
	SEI				  ; 78 | Unknown operation
	XCE				  ; FB | Unknown operation
	STA $7F			  ; 83 7F | Store accumulator to memory
	TDC				  ; 7B | Unknown operation
	STA $61EC93		  ; 8F 93 EC 61 | Store accumulator to memory
	ROR $70FC,X		  ; 7E FC 70 | Unknown operation
	XCE				  ; FB | Unknown operation
	STY $97			  ; 84 97 | Store Y register
	PLA				  ; 68 | Pull accumulator from stack
	SBC $00FC04,X		; FF 04 FC 00 | Unknown operation
	PEA $F40C			; F4 0C F4 | Push effective address
	ORA $00877E		  ; 0F 7E 87 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRA $A347			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	CPX #$E0			 ; E0 E0 | Unknown operation
	SED				  ; F8 | Unknown operation
	CLV				  ; B8 | Unknown operation
	LDY $66E4,X		  ; BC E4 66 | Load Y register
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRA $A356			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	RTI				  ; 40 | Unknown operation
	BRK $18			  ; 00 18 | Software interrupt
	BRA $A361			; 80 00 | Unknown operation
	AND $10			  ; 31 10 | Logical AND with accumulator
	DEC $E9E9,X		  ; DE E9 E9 | Unknown operation
	ASL $C1DF,X		  ; 1E DF C1 | Arithmetic shift left
	INC $F1DE,X		  ; FE DE F1 | Unknown operation
	CMP #$37			 ; C9 37 | Compare with accumulator

	CMP #$37			 ; C9 37
	STX $7E			  ; 86 7E
	AND $21DF0E,X		; 3F 0E DF 21
	SBC #$16			 ; E9 16
	SBC $003F20,X		; FF 20 3F 00
	AND $F02F30		  ; 2F 30 2F F0
	ROR $93E1,X		  ; 7E E1 93
	STA $4F			  ; 97 4F
	EOR $7F7F3F,X		; 5F 3F 7F 7F
	SBC $1F877F		  ; EF 7F 87 1F
	LDA $C7			  ; A3 C7
	INY				  ; C8
	AND $36			  ; 31 36
	STZ $706B			; 9C 6B 70
	LDA $80BFC0		  ; AF C0 BF 80
	ADC $E0FF80,X		; 7F 80 FF E0
	ADC $3F3FF8,X		; 7F F8 3F 3F
	INY				  ; C8
	COP $07			  ; 02 07
	ORA $03			  ; 01 03
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $1066,Y		  ; 19 66 10
	AND $093F10,X		; 3F 10 3F 09
	ROL $66,X			; 36 66
	BRK $56			  ; 00 56
	BRK $19			  ; 00 19
	BRK $00			  ; 00 00
	ASL $00			  ; 06 00
	AND $003F00		  ; 2F 00 3F 00
	AND $843F10,X		; 3F 10 3F 84
	STZ $5C48,X		  ; 9E 48 5C
	JSR $6078			; 20 78 60
	BCS $A369			; B0 80
	RTS				  ; 60
	BRA $A3AC			; 80 C0
	BRA $A3AE			; 80 C0
	BRK $C0			  ; 00 C0
	PLA				  ; 68
	ASL $0CA0			; 0E A0 0C
	BRA $A3FE			; 80 08
	BRK $00			  ; 00 00
	BRK $40			  ; 00 40
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRA $A3C0			; 80 C0

;==============================================================================
; GeneralPurpose_24
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_24:
	BRK $00			  ; 00 00 | Software interrupt
	ORA $03			  ; 03 03 | Logical OR with accumulator
	ORA $04			  ; 07 04 | Logical OR with accumulator
	ORA $04			  ; 07 04 | Logical OR with accumulator
	ASL $1C0C			; 0E 0C 1C | Arithmetic shift left
	TRB $1818			; 1C 18 18 | Unknown operation
	TSB $0004			; 0C 04 00 | Unknown operation
	BRK $07			  ; 00 07 | Software interrupt
	ORA $0C			  ; 03 0C | Logical OR with accumulator
	ORA $0C			  ; 07 0C | Logical OR with accumulator
	ORA $1D			  ; 07 1D | Logical OR with accumulator
	ASL $1C1E			; 0E 1E 1C | Arithmetic shift left
	ASL $3618,X		  ; 1E 18 36 | Arithmetic shift left
	TSB $0000			; 0C 00 00 | Unknown operation
	BEQ $A414			; F0 F0 | Branch if equal (zero flag set)
	SED				  ; F8 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Unknown operation
	TYA				  ; 98 | Unknown operation
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left
	ORA $7F			  ; 13 7F | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	ADC $007000,X		; 7F 00 70 00 | Unknown operation
	SBC $18F0,X		  ; FD F0 18 | Unknown operation
	SED				  ; F8 | Unknown operation
	INC $1F98,X		  ; FE 98 1F | Unknown operation
	ASL $1F73			; 0E 73 1F | Arithmetic shift left
	CPY #$7F			 ; C0 7F | Unknown operation
	BRA $A4BF			; 80 7F | Unknown operation
	CMP $05			  ; C7 05 | Compare with accumulator
	INC $B83E,X		  ; FE 3E B8 | Unknown operation
	CLV				  ; B8 | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CPY $C4			  ; C4 C4 | Unknown operation
	STY $00			  ; 84 00 | Store Y register
	STX $0688			; 8E 88 06 | Store X register
	BRK $3D			  ; 00 3D | Software interrupt
	CMP $3F			  ; C7 3F | Compare with accumulator
	INC $B8FE,X		  ; FE FE B8 | Unknown operation
	JSR ($FE48,X)		; FC 48 FE | Call local function
	CPY $7A			  ; C4 7A | Unknown operation
	STY $D9			  ; 84 D9 | Store Y register
	STX $06D9			; 8E D9 06 | Store X register
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	CLI				  ; 58 | Unknown operation
	AND $233C47,X		; 3F 47 3C 23 | Logical AND with accumulator
	ORA $6F0719,X		; 1F 19 07 6F | Logical OR with accumulator

	ORA $6F0719,X		; 1F 19 07 6F
	ORA $7F1224		  ; 0F 24 12 7F
	BRK $18			  ; 00 18
	ORA $07			  ; 03 07
	ORA $03			  ; 07 03
	TSB $00			  ; 04 00
	ORA $00			  ; 03 00
	ORA $10			  ; 01 10
	BRK $09			  ; 00 09
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPX $CB94			; EC 94 CB
	ORA $8C			  ; 13 8C
	BIT #$C6			 ; 89 C6
	STA $CD			  ; 97 CD
	CMP $C080E0		  ; CF E0 80 C0
	BRK $80			  ; 00 80
	CMP $C003E3		  ; CF E3 03 C0
	BRK $80			  ; 00 80
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $40			  ; 00 40
	BRK $80			  ; 00 80
	BRA $A45B			; 80 99
	BRK $E7			  ; 00 E7
	BRA $A544			; 80 7E
	CPY #$00			 ; C0 00
	JSR $C0C0			; 20 C0 C0
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $FF			  ; 00 FF
	ROR $FF			  ; 66 FF
	CLC				  ; 18
	ROR $0000,X		  ; 7E 00 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	AND $29			  ; 37 29
	CMP $C8			  ; D3 C8
	AND $91			  ; 31 91
	ADC $E9			  ; 63 E9
	LDA $F3			  ; B3 F3
	ORA $01			  ; 07 01
	ORA $00			  ; 03 00
	ORA $F1			  ; 01 F1
	CMP $C0			  ; C7 C0
	ORA $00			  ; 03 00
	ORA $00			  ; 01 00
	ORA $00			  ; 03 00
	ORA $00			  ; 03 00
	ORA $00			  ; 07 00
	COP $00			  ; 02 00
	ORA $E4			  ; 01 E4
	ROL $1A			  ; 26 1A
	JSR ($3CE2,X)		; FC E2 3C
	CPY $F8			  ; C4 F8
	TYA				  ; 98
	CPX #$F6			 ; E0 F6
	BEQ $A551			; F0 24
	PHA				  ; 48
	INC $1800,X		  ; FE 00 18
	CPY #$E0			 ; C0 E0
	CPX #$C0			 ; E0 C0
	JSR $C000			; 20 00 C0
	BRK $80			  ; 00 80
	PHP				  ; 08
	BRK $90			  ; 00 90
	BRK $00			  ; 00 00
	BRK $40			  ; 00 40
	CPX $CB94			; EC 94 CB
	ORA $8C			  ; 13 8C
	BIT #$C6			 ; 89 C6
	STA $CD			  ; 97 CD
	CMP $C080E0		  ; CF E0 80 C0
	BRK $80			  ; 00 80
	STA $C003E3		  ; 8F E3 03 C0
	BRK $80			  ; 00 80
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $40			  ; 00 40
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $091606,X		; 1F 06 16 09
	ORA #$06			 ; 09 06
	ASL $00			  ; 06 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $A5D1			; 10 3F
	BPL $A5A3			; 10 0F
	ORA $0F0F,Y		  ; 19 0F 0F
	ASL $06			  ; 06 06
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $2E			  ; 00 2E
	JSL $470067		  ; 22 67 00 47
	BRK $C1			  ; 00 C1
	CPY #$C4			 ; C0 C4
	CPY $07			  ; C4 07
	ORA $03			  ; 01 03
	BRK $03			  ; 00 03
	COP $73			  ; 02 73
	ROL $6788			; 2E 88 67
	TAY				  ; A8
	EOR $EE			  ; 47 EE
	CMP $CF			  ; C1 CF
	CPY $C9			  ; C4 C9
	ORA $64			  ; 07 64
	ORA $1E			  ; 03 1E
	ORA $FF			  ; 03 FF
	BRK $FF			  ; 00 FF
	CLC				  ; 18
	SBC $12			  ; F3 12
	SBC $11			  ; F1 11
	BEQ $A57A			; F0 90
	SBC $FED9,Y		  ; F9 D9 FE
	ASL $04FC			; 0E FC 04
	BRK $FF			  ; 00 FF
	CLC				  ; 18
	SBC $1FF31E,X		; FF 1E F3 1F
	SBC $9F			  ; F1 9F
	BEQ $A5DA			; F0 DF
	SBC $FE0F,Y		  ; F9 0F FE
	ORA $FC			  ; 07 FC

;==============================================================================
; GeneralPurpose_26
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_26:
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BPL $A6C8			; 10 60 | Unknown operation
	AND $3960,Y		  ; 39 60 39 | Logical AND with accumulator
	RTS				  ; 60 | Return from local function
	ORA $301F30		  ; 0F 30 1F 30 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	BRK $20			  ; 00 20 | Software interrupt
	CPY #$10			 ; C0 10 | Unknown operation
	CPX #$30			 ; E0 30 | Unknown operation
	RTS				  ; 60 | Return from local function
	ORA #$70			 ; 09 70 | Logical OR with accumulator
	ORA #$70			 ; 09 70 | Logical OR with accumulator
	ASL $39,X			; 16 39 | Arithmetic shift left
	ASL $39			  ; 06 39 | Arithmetic shift left
	JSR $6000			; 20 00 60 | Call local function
	BPL $A665			; 10 E0 | Unknown operation
	BMI $A607			; 30 80 | Unknown operation
	RTS				  ; 60 | Return from local function
	CPY #$60			 ; C0 60 | Unknown operation
	CPY #$60			 ; C0 60 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	BRA $A650			; 80 C0 | Unknown operation
	JSR $4000			; 20 00 40 | Call local function
	BMI $A615			; 30 80 | Unknown operation
	BVS $A657			; 70 C0 | Unknown operation
	RTS				  ; 60 | Return from local function
	BRK $E0			  ; 00 E0 | Software interrupt
	BRK $E0			  ; 00 E0 | Software interrupt
	BRA $A65E			; 80 C0 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	ORA $07			  ; 01 07 | Logical OR with accumulator
	ORA $05			  ; 03 05 | Logical OR with accumulator
	ORA $0F			  ; 03 0F | Logical OR with accumulator
	ORA $1F			  ; 07 1F | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	COP $07			  ; 02 07 | Unknown operation
	COP $04			  ; 02 04 | Unknown operation

	COP $04			  ; 02 04
	BRK $0C			  ; 00 0C
	PHP				  ; 08
	TRB $1000			; 1C 00 10
	BRK $BE			  ; 00 BE
	ASL $FDFF,X		  ; 1E FF FD
	TDC				  ; 7B
	BEQ $A6B9			; F0 EF
	BEQ $A6A5			; F0 D9
	CPX #$B0			 ; E0 B0
	LDY #$F0			 ; A0 F0
	BRK $10			  ; 00 10
	BPL $A684			; 10 B0
	BRA $A696			; 80 C0
	BRL $AFDF			; 82 06 09
	ORA $003900,X		; 1F 00 39 00
	BVS $A71F			; 70 40
	BVS $A6E1			; 70 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $A669			; 80 80
	CPY #$40			 ; C0 40
	CPX #$00			 ; E0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	COP $07			  ; 02 07
	COP $04			  ; 02 04
	BRK $28			  ; 00 28
	PHP				  ; 08
	JMP ($FE3C,X)		; 7C 3C FE
	ROR $FFFF,X		  ; 7E FF FF
	TDC				  ; 7B
	SBC $FAF7,X		  ; FD F7 FA
	SBC $00FBD1		  ; EF D1 FB 00
	PLP				  ; 28
	JSR $0078			; 20 78 00
	CPX #$80			 ; E0 80
	CPY #$80			 ; C0 80
	TSB $02			  ; 04 02
	ASL $1F01			; 0E 01 1F
	JSR $003B			; 20 3B 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	AND $3F6F17,X		; 3F 17 6F 3F
	SBC $BCBB7C,X		; FF 7C BB BC
	SBC $E8			  ; F7 E8
	JMP ($0000,X)		; 7C 00 00
	BRK $05			  ; 00 05
	TSB $3D			  ; 04 3D
	BMI $A7F8			; 30 60
	BRK $E0			  ; 00 E0
	CMP $87			  ; C3 87
	BRK $8F			  ; 00 8F
	BCC $A7BC			; 90 1C
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $A768			; 80 C0
	CPY #$E0			 ; C0 E0
	CPY #$E0			 ; C0 E0
	RTS				  ; 60
	BEQ $A7CF			; F0 20
	BEQ $A7B1			; F0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $A73E			; 80 80
	RTI				  ; 40
	CPY #$00			 ; C0 00
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	PHP				  ; 08
	TSB $0C04			; 0C 04 0C
	PHP				  ; 08
	TSB $00			  ; 04 00
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BPL $A7D2			; 10 00
	CLC				  ; 18
	BRK $9C			  ; 00 9C
	PHP				  ; 08
	TSB $0C			  ; 04 0C
	ORA #$0C			 ; 09 0C
	ORA #$04			 ; 09 04
	ORA $0404			; 0D 04 04
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $40			  ; 00 40
	RTI				  ; 40
	BRA $A76A			; 80 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	JSR $6000			; 20 00 60
	BRK $60			  ; 00 60
	BRK $E0			  ; 00 E0
	RTI				  ; 40
	CPY #$80			 ; C0 80
	CPY #$00			 ; C0 00
	BRA $A7FE			; 80 00
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_28
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_28:
	TSB $18			  ; 04 18 | Unknown operation
	BRK $7D			  ; 00 7D | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA $7C7372		  ; 0F 72 73 7C | Logical OR with accumulator
	JMP ($7F7F,X)		; 7C 7F 7F | Unknown operation
	ORA $7F			  ; 13 7F | Logical OR with accumulator
	ORA $0C1F			; 0D 1F 0C | Logical OR with accumulator
	CLC				  ; 18 | Clear carry flag
	BRK $05			  ; 00 05 | Software interrupt
	ADC $03			  ; 71 03 | Unknown operation
	TSB $0300			; 0C 00 03 | Unknown operation
	RTS				  ; 60 | Return from local function
	BRK $78			  ; 00 78 | Software interrupt
	TSB $027E			; 0C 7E 02 | Unknown operation
	ORA $000000,X		; 1F 00 00 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRA $A7A7			; 80 80 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRK $E0			  ; 00 E0 | Software interrupt
	BRK $60			  ; 00 60 | Software interrupt
	BRA $A81E			; 80 F0 | Unknown operation
	LDY #$80			 ; A0 80 | Load Y register
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $80			  ; 00 80 | Software interrupt
	BRA $A878			; 80 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTS				  ; 60 | Return from local function
	BRA $A85C			; 80 20 | Unknown operation
	JSR $4030			; 20 30 40 | Call local function
	BRK $00			  ; 00 00 | Software interrupt
	BRK $07			  ; 00 07 | Software interrupt
	BRK $09			  ; 00 09 | Software interrupt
	ORA $01			  ; 07 01 | Logical OR with accumulator
	ASL $01			  ; 06 01 | Arithmetic shift left
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $07			  ; 00 07 | Software interrupt
	BRK $0E			  ; 00 0E | Software interrupt
	ORA $01			  ; 07 01 | Logical OR with accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	BRK $1E			  ; 00 1E | Software interrupt
	AND $16			  ; 31 16 | Logical AND with accumulator
	AND $AF09,Y		  ; 39 09 AF | Logical AND with accumulator

	AND $AF09,Y		  ; 39 09 AF
	LDY #$E6			 ; A0 E6
	INC $C6,X			; F6 C6
	SBC $B05F06,X		; FF 06 5F B0
	AND $390779,X		; 3F 79 07 39
	ORA $801039		  ; 0F 39 10 80
	ORA $09C0,Y		  ; 19 C0 09
	CPY #$C0			 ; C0 C0
	BRK $10			  ; 00 10
	BCC $A898			; 90 19
	ORA $C080,Y		  ; 19 80 C0
	STX $09C0			; 8E C0 09
	LSR $7658,X		  ; 5E 58 76
	SED				  ; F8
	BIT $08F0,X		  ; 3C F0 08
	LDY #$D8			 ; A0 D8
	CPY #$E0			 ; C0 E0
	BRK $C0			  ; 00 C0
	ASL $87C0			; 0E C0 87
	ASL $3688,X		  ; 1E 88 36
	BRK $3C			  ; 00 3C
	BMI $A8A4			; 30 08
	BRA $A836			; 80 98
;==============================================================================
; Function Index (10 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_02
; GeneralPurpose_0A
; GeneralPurpose_11
; GeneralPurpose_1E
; GeneralPurpose_20
; GeneralPurpose_23
; GeneralPurpose_24
; GeneralPurpose_26
; GeneralPurpose_28
;==============================================================================