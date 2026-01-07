;==============================================================================
; Dragon Quest III - Bank 36
;==============================================================================
; File: bank_36.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $36 Code
; Ultra-aggressive code extraction


.segment "BANK_36_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
	ADC $88			  ; 77 88 | Unknown operation
	EOR $B8			  ; 47 B8 | Unknown operation
	TSB $73			  ; 04 73 | Unknown operation
	BRK $27			  ; 00 27 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $77			  ; 00 77 | Software interrupt
	BRK $27			  ; 00 27 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	TSB $FB			  ; 04 FB | Unknown operation
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $F8			  ; 00 F8 | Software interrupt
	TSB $EA			  ; 04 EA | Unknown operation
	BRK $8E			  ; 00 8E | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $EE			  ; 00 EE | Software interrupt
	BRK $8E			  ; 00 8E | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $67			  ; 00 67 | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $04			  ; 00 04 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $E4			  ; 00 E4 | Software interrupt
	BRK $E0			  ; 00 E0 | Software interrupt
	BRK $CC			  ; 00 CC | Software interrupt
	BRK $1C			  ; 00 1C | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt

	BRK $00			  ; 00 00
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	ORA $FF			  ; 01 FF
	ASL $FF			  ; 06 FF
	ORA $0000FF,X		; 1F FF 00 00
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
	SBC $FDFCFF,X		; FF FF FC FD
	JSR ($FFFD,X)		; FC FD FF
	INC $FEFD,X		  ; FE FD FE
	SBC $FAFA,Y		  ; F9 FA FA
	XCE				  ; FB
	BEQ $0141			; F0 F1
	BRK $00			  ; 00 00
	COP $00			  ; 02 00
	COP $00			  ; 02 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TSB $00			  ; 04 00
	TSB $00			  ; 04 00
	ASL $6C01			; 0E 01 6C
	STZ $0CFC			; 9C FC 0C
	PEA $E40C			; F4 0C E4
	TRB $14EC			; 1C EC 14
	CPY $C83C			; CC 3C C8
	PLP				  ; 28
	PHP				  ; 08
	INX				  ; E8
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 07 01
	ORA $01			  ; 07 01
	ORA $0CF401		  ; 0F 01 F4 0C
	PEA $EC0C			; F4 0C EC
	TRB $2CCC			; 1C CC 2C
	CPY $CC2C			; CC 2C CC
	BIT $28C8			; 2C C8 28
	CPX #$00			 ; E0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $0198			; 10 E0
	BPL $019A			; 10 E0
	BPL $019C			; 10 E0
	PEI $E0			  ; D4 E0
	JSR ($08E0,X)		; FC E0 08
	SBC $C0			  ; F7 C0
	SBC $10FF20,X		; FF 20 FF 10
	SBC $06FF08,X		; FF 08 FF 06
	SBC $00FF01,X		; FF 01 FF 00
	SBC $C00000,X		; FF 00 00 C0
	CPY #$E0			 ; C0 E0
	CPX #$F0			 ; E0 F0
	BEQ $01D1			; F0 F8
	SED				  ; F8
	INC $FFFE,X		  ; FE FE FF
	SBC $98FFFF,X		; FF FF FF 98
	ADC $4C			  ; 67 4C
	LDA $06			  ; B3 06
	SBC $FE01,Y		  ; F9 01 FE
	BRK $FF			  ; 00 FF
	BRK $FF			  ; 00 FF
	BRA $01ED			; 80 FF
	RTI				  ; 40
	SBC $000000,X		; FF 00 00 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $97			  ; 01 97
	BRK $57			  ; 00 57
	BRK $AB			  ; 00 AB
	BRK $BF			  ; 00 BF
	BRK $C8			  ; 00 C8
	PLP				  ; 28
	CPY #$20			 ; C0 20
	CPY #$20			 ; C0 20
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	LDY #$00			 ; A0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TRB $E0			  ; 14 E0
	TRB $DCE0			; 1C E0 DC
	CPX #$F8			 ; E0 F8
	CPX #$F8			 ; E0 F8
	CPX #$F8			 ; E0 F8
	LDY #$F8			 ; A0 F8
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	SED				  ; F8
	CLI				  ; 58
	CLI				  ; 58
	BNE $0236			; D0 D0
	JMP $684C			; 4C 4C 68
	PLA				  ; 68
	TAY				  ; A8
	TAY				  ; A8
	MVN $4054			; 54 54 40
	RTI				  ; 40
	ORA $00			  ; 07 00
	LDA $00			  ; A7 00
	AND $00B300		  ; 2F 00 B3 00
	STA $00			  ; 97 00
	EOR $00			  ; 57 00
	PLB				  ; AB
	BRK $BF			  ; 00 BF
	BRK $E0			  ; 00 E0
	BRK $A0			  ; 00 A0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	SBC $FEFFF8,X		; FF F8 FF FE
	SBC $FFFFFF,X		; FF FF FF FF
	; Skipped 32 bytes of data
	SBC $C0FFE1,X		; FF E1 FF C0
	CPY #$E0			 ; C0 E0
	CPX #$F0			 ; E0 F0
	BEQ $02D3			; F0 FC
	JSR ($FEFE,X)		; FC FE FE
	INC $FFFE,X		  ; FE FE FF
	SBC $05FFFF,X		; FF FF FF 05
	XCE				  ; FB
	COP $FD			  ; 02 FD
	BRA $02E5			; 80 FF
	CMP $FE			  ; C1 FE
	BIT $FB,X			; 34 FB
	PHK				  ; 4B
	JSR ($FE21,X)		; FC 21 FE
	STY $FB,X			; 94 FB
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	INC $FEFF,X		  ; FE FF FE
	SBC $ECFEFF,X		; FF FF FE EC
	INC $FCEE,X		  ; FE EE FC
	CLV				  ; B8
	CPX $FDCA			; EC CA FD
	CMP $FE			  ; C1 FE
	ADC $FF			  ; 72 FF
	AND $FF			  ; 31 FF
	TXS				  ; 9A
	SBC $CDFDC8,X		; FF C8 FD CD
	SBC $FCEC,X		  ; FD EC FC
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	JSR $0000			; 20 00 00
	BRK $40			  ; 00 40
	BRK $C0			  ; 00 C0
	BRK $00			  ; 00 00
	BRK $FF			  ; 00 FF
	SBC $FFFFFF,X		; FF FF FF FF
	SBC $D6F6F6,X		; FF F6 F6 D6
	DEC $0C,X			; D6 0C
	TSB $0000			; 0C 00 00
	BRK $00			  ; 00 00
	SBC $FFEBFF,X		; FF FF EB FF
	XBA				  ; EB
	SBC $29F6DB,X		; FF DB F6 29
	DEC $F3,X			; D6 F3
	BRK $FF			  ; 00 FF
	BRK $F2			  ; 00 F2
	BRK $FA			  ; 00 FA
	XCE				  ; FB
	LDA $B3			  ; B2 B3
	LDA $A5			  ; A5 A5
	ORA $15			  ; 05 15
	COP $F2			  ; 02 F2
	CLC				  ; 18
	RTS				  ; 60
	JSR ($7E00,X)		; FC 00 7E
	BRK $84			  ; 00 84
	INX				  ; E8
	JMP $5AA0			; 4C A0 5A
	BRA $03A1			; 80 EA
	BPL $03C6			; 10 0D
	BEQ $035A			; F0 9F
	SEI				  ; 78
	JSR ($7EFC,X)		; FC FC 7E
	ROR $BCAC,X		  ; 7E AC BC
	LDY $B4,X			; B4 B4
	JSR $4020			; 20 20 40
	RTI				  ; 40
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $01			  ; 07 01
	ORA $061900		  ; 0F 00 19 06
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPX #$E0			 ; E0 E0
	SED				  ; F8
	CLC				  ; 18
	JSR ($0604,X)		; FC 04 06
	COP $00			  ; 02 00
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	BRK $1E			  ; 00 1E
	BRK $0B			  ; 00 0B
	TSB $05			  ; 04 05
	COP $06			  ; 02 06
	ORA $1B			  ; 01 1B
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	CLC				  ; 18
	ASL $0B16,X		  ; 1E 16 0B
	ORA #$05			 ; 09 05
	TSB $06			  ; 04 06
	TSB $1B			  ; 04 1B
	INC				  ; 1A
	TSB $00			  ; 04 00
	ASL $0A00			; 0E 00 0A
	TSB $1F			  ; 04 1F
	BRK $9F			  ; 00 9F
	ASL				  ; 0A
	SBC $4ACE1A,X		; FF 1A CE 4A
	ROR $96,X			; 76 96
	TSB $04			  ; 04 04
	ASL $0A0A			; 0E 0A 0A
	ASL				  ; 0A
	ORA $919511,X		; 1F 11 95 91
	SBC $61			  ; E5 61
	LDA $00,X			; B5 00
	ADC #$00			 ; 69 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $0466			; 10 00
	SEC				  ; 38
	BRK $70			  ; 00 70
	BMI $0442			; 30 D7
	RTI				  ; 40
	TYX				  ; BB
	STY $36			  ; 84 36
	PLP				  ; 28
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $0486			; 10 10
	SEC				  ; 38
	PLP				  ; 28
	RTI				  ; 40
	RTI				  ; 40
	LDA $97			  ; B7 97
	TDC				  ; 7B
	AND $02D6,Y		  ; 39 D6 02
	SBC $0A1E0D		  ; EF 0D 1E 0A
	ORA $102C00,X		; 1F 00 2C 10
	BMI $048A			; 30 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	SBC $E0			  ; F2 E0
	ORA $10,X			; 15 10
	ORA $2C2C13,X		; 1F 13 2C 2C
	BMI $04CA			; 30 30
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TCS				  ; 1B
	TRB $FD			  ; 14 FD
	ASL $07			  ; 06 07
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	TRB $7F41			; 1C 41 7F
	TRB $1C			  ; 14 1C
	BRK $08			  ; 00 08
	PHP				  ; 08
	PHP				  ; 08
	CPX $E4			  ; E4 E4
	LSR $0C4E			; 4E 4E 0C
	TSB $1C1C			; 0C 1C 1C
	ADC $1C1C7F,X		; 7F 7F 1C 1C
	PHP				  ; 08
	PHP				  ; 08
	PHP				  ; 08
	PHP				  ; 08
	ORA $3F06,Y		  ; 19 06 3F
	BRK $2F			  ; 00 2F
	ORA $78			  ; 17 78
	ORA #$F5			 ; 09 F5
	ORA $E8			  ; 12 E8
	AND $E2			  ; 21 E2
	JSR $1071			; 20 71 10
	ORA $3F10,Y		  ; 19 10 3F
	JSR $2028			; 20 28 20
	ADC $40			  ; 77 40
	INC $DF84			; EE 84 DF
	DEY				  ; 88
	CMP $6E80,X		  ; DD 80 6E
	RTI				  ; 40

;==============================================================================
; GeneralPurpose_05
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05:
	STX $8788			; 8E 88 87 | Store X register
	STY $0B			  ; 84 0B | Store Y register
	BRK $05			  ; 00 05 | Software interrupt
	JSR $D026			; 20 26 D0 | Call local function
	ASL $20			  ; 06 20 | Arithmetic shift left
	ORA $01			  ; 17 01 | Logical OR with accumulator
	SBC $027600		  ; EF 00 76 02 | Unknown operation
	TDC				  ; 7B | Unknown operation
	ORA $FF			  ; 01 FF | Logical OR with accumulator
	ORA #$FF			 ; 09 FF | Logical OR with accumulator
	TSB $DF			  ; 04 DF | Unknown operation
	ASL $FF			  ; 06 FF | Arithmetic shift left
	ASL $EE			  ; 06 EE | Arithmetic shift left
	ASL $1F			  ; 06 1F | Arithmetic shift left
	TSB $0000			; 0C 00 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRA $0528			; 80 00 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	CPY #$80			 ; C0 80 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	BRA $0530			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRA $04B8			; 80 80 | Unknown operation
	CPY #$40			 ; C0 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	CPY #$40			 ; C0 40 | Unknown operation
	BRA $04C0			; 80 80 | Unknown operation
	AND $021E00,X		; 3F 00 1E 02 | Logical AND with accumulator
	ORA $010505		  ; 0F 05 05 01 | Logical OR with accumulator
	TRB $7F04			; 1C 04 7F | Unknown operation
	ORA $CF			  ; 13 CF | Logical OR with accumulator
	BMI $05CD			; 30 7E | Unknown operation
	ASL $3F			  ; 06 3F | Arithmetic shift left
	AND $1D			  ; 27 1D | Logical AND with accumulator
	BPL $055F			; 10 0A | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	ASL $04			  ; 06 04 | Arithmetic shift left
	TCS				  ; 1B | Unknown operation
	CLC				  ; 18 | Clear carry flag
	JMP ($CF60)		  ; 6C 60 CF | Unknown operation
	BRA $05D8			; 80 79 | Unknown operation
	SEI				  ; 78 | Unknown operation
	SED				  ; F8 | Unknown operation
	TYA				  ; 98 | Unknown operation
	SEI				  ; 78 | Unknown operation

	SEI				  ; 78
	PLA				  ; 68
	JSR $2020			; 20 20 20
	AND $52			  ; 32 52
	AND $9280			; 2D 80 92
	SBC $C0			  ; E1 C0
	ORA $006701,X		; 1F 01 67 00
	STA $00			  ; 97 00
	CMP $00DF00,X		; DF 00 DF 00
	SBC $7F40			; ED 40 7F
	BRK $1E			  ; 00 1E
	BRK $E0			  ; 00 E0
	BRK $7C			  ; 00 7C
	RTI				  ; 40
	JSR ($C8B8,X)		; FC B8 C8
	CPY #$0E			 ; C0 0E
	BRK $6F			  ; 00 6F
	TSB $C8EF			; 0C EF C8
	SBC $22			  ; E3 22
	LDX $BCC0,Y		  ; BE C0 BC
	TSB $44			  ; 04 44
	TSB $38			  ; 04 38
	PHP				  ; 08
	INC $F30E,X		  ; FE 0E F3
	ADC $37			  ; 61 37
	JSR $01DD			; 20 DD 01
	ROL $001E,X		  ; 3E 1E 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRK $C0			  ; 00 C0
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $44			  ; 00 44
	MVP $0E0E			; 44 0E 0E
	TSB $04			  ; 04 04
	TRB $3E1C			; 1C 1C 3E
	ROL $1C1C,X		  ; 3E 1C 1C
	PHP				  ; 08
	PHP				  ; 08
	BRK $00			  ; 00 00
	BVS $05F2			; 70 10
	ASL $1600,X		  ; 1E 00 16
	AND #$2D			 ; 29 2D
	EOR $29			  ; 57 29
	EOR $04BA54,X		; 5F 54 BA 04
	ROR				  ; 6A
	ORA #$54			 ; 09 54
	ADC $1E1F60		  ; 6F 60 1F 1E
	BRK $3F			  ; 00 3F
	ORA $7A			  ; 05 7A
	ORA #$76			 ; 09 76
	BPL $05EB			; 10 EF
	BRK $7F			  ; 00 7F
	BRK $7F			  ; 00 7F

;==============================================================================
; GeneralPurpose_06
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06:
	ROL $F808			; 2E 08 F8 | Unknown operation
	BRK $A8			  ; 00 A8 | Software interrupt
	MVN $EA54			; 54 54 EA | Unknown operation
	TRB $BA			  ; 14 BA | Unknown operation
	TRB $BE			  ; 14 BE | Unknown operation
	COP $AF			  ; 02 AF | Unknown operation
	JSR $F296			; 20 96 F2 | Call local function
	JSL $00C0C0		  ; 22 C0 C0 00 | Call external function
	JSR ($BE40,X)		; FC 40 BE | Call local function
	BPL $0608			; 10 EE | Unknown operation
	MVN $42EA			; 54 EA 42 | Unknown operation
	SBC $FE00,X		  ; FD 00 FE | Unknown operation
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $110E00		  ; 0F 00 0E 11 | Logical OR with accumulator
	ORA #$1F			 ; 09 1F | Logical OR with accumulator
	ORA $3B,X			; 15 3B | Logical OR with accumulator
	TRB $3A			  ; 14 3A | Unknown operation
	TSB $29			  ; 04 29 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CMP $37,X			; D5 37 | Compare with accumulator
	BMI $0642			; 30 0F | Unknown operation
	ORA $091F00		  ; 0F 00 1F 09 | Logical OR with accumulator
	ASL $11,X			; 16 11 | Arithmetic shift left
	ROL $2F10			; 2E 10 2F | Unknown operation
	BRK $3F			  ; 00 3F | Software interrupt
	COP $FF			  ; 02 FF | Unknown operation
	AND $04			  ; 37 04 | Logical AND with accumulator
	JMP ($A800,X)		; 7C 00 A8 | Unknown operation
	MVN $EA54			; 54 54 EA | Unknown operation
	TRB $BA			  ; 14 BA | Unknown operation
	TRB $BE			  ; 14 BE | Unknown operation
	STY $2E			  ; 84 2E | Store Y register
	COP $AF			  ; 02 AF | Unknown operation
	SBC $E001,Y		  ; F9 01 E0 | Unknown operation
	RTS				  ; 60 | Return from local function
	BRK $FC			  ; 00 FC | Software interrupt
	RTI				  ; 40 | Unknown operation
	LDX $EE10,Y		  ; BE 10 EE | Load X register
	MVN $44EA			; 54 EA 44 | Unknown operation
	PLX				  ; FA | Pull X register from stack
	WDM $FD			  ; 42 FD | Unknown operation
	BVS $0672			; 70 10 | Unknown operation
	ASL $0A00,X		  ; 1E 00 0A | Arithmetic shift left
	ORA $15,X			; 15 15 | Logical OR with accumulator
	AND $213F0D		  ; 2F 0D 3F 21 | Logical AND with accumulator
	ADC $23			  ; 77 23 | Unknown operation
	LSR $00,X			; 56 00 | Unknown operation
	SBC $606F			; ED 6F 60 | Unknown operation

	SBC $606F			; ED 6F 60
	ORA $1F001E,X		; 1F 1E 00 1F
	ORA $3A			  ; 05 3A
	ORA $2132			; 0D 32 21
	LSR $7D02,X		  ; 5E 02 7D
	BRK $FF			  ; 00 FF
	ROL $F808			; 2E 08 F8
	BRK $A0			  ; 00 A0
	CLI				  ; 58
	BVC $0634			; 50 AC
	MVN $54EA			; 54 EA 54
	PLX				  ; FA
	ORA $BD			  ; 12 BD
	PHP				  ; 08
	LDX $22F2,Y		  ; BE F2 22
	CPY #$C0			 ; C0 C0
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	RTI				  ; 40
	LDX $AE50,Y		  ; BE 50 AE
	BPL $068D			; 10 EF
	PHP				  ; 08
	INC $00,X			; F6 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $02			  ; 00 02
	ORA $05			  ; 05 05
	ORA $031F0D		  ; 0F 0D 1F 03
	INC $02,X			; F6 02
	ORA $37F902		  ; 0F 02 F9 37
	BMI $06E2			; 30 0F
	ORA $050700		  ; 0F 00 07 05
	ASL				  ; 0A
	ORA $0212			; 0D 12 02
	SBC $FD82,X		  ; FD 82 FD
	BRK $FF			  ; 00 FF
	ORA $04			  ; 17 04
	JMP ($A000,X)		; 7C 00 A0
	CLI				  ; 58
	CLI				  ; 58
	LDY $54			  ; A4 54
	NOP				  ; EA
	MVN $06FA			; 54 FA 06
	LDA #$02			 ; A9 02
	ADC $E011F9		  ; 6F F9 11 E0
	RTS				  ; 60
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	RTI				  ; 40
	LDX $AE50,Y		  ; BE 50 AE
	BRK $FF			  ; 00 FF
	COP $FD			  ; 02 FD

;==============================================================================
; GeneralPurpose_07
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07:
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	TSB $04			  ; 04 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TRB $1C			  ; 14 1C | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	TSB $04			  ; 04 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TRB $081C			; 1C 1C 08 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	LDA $D904,X		  ; BD 04 D9 | Load value into accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $05			  ; 00 05 | Software interrupt
	ORA $03			  ; 01 03 | Logical OR with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	ASL				  ; 0A | Arithmetic shift left
	SBC $02			  ; F7 02 | Unknown operation
	CMP $000E04,X		; DF 04 0E 00 | Compare with accumulator
	ASL $0700			; 0E 00 07 | Arithmetic shift left
	ORA $02			  ; 01 02 | Logical OR with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $54			  ; 00 54 | Software interrupt
	TSB $5E			  ; 04 5E | Unknown operation
	JSR $4076			; 20 76 40 | Call local function
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$00			 ; E0 00 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $08			  ; 00 08 | Software interrupt
	JMP ($7A04,X)		; 7C 04 7A | Unknown operation
	JSR $4056			; 20 56 40 | Call local function
	LDY #$40			 ; A0 40 | Load Y register
	LDY #$00			 ; A0 00 | Load Y register
	CPY #$00			 ; C0 00 | Unknown operation

	CPY #$00			 ; C0 00
	BRK $00			  ; 00 00
	BRK $81			  ; 00 81
	TSX				  ; BA
	BRK $DB			  ; 00 DB
	ORA $16			  ; 01 16
	BRK $2A			  ; 00 2A
	BRK $2A			  ; 00 2A
	ORA $3B			  ; 11 3B
	BRK $11			  ; 00 11
	BRK $00			  ; 00 00
	BRA $07F1			; 80 7F
	TSB $DF			  ; 04 DF
	PHP				  ; 08
	ORA $003B00,X		; 1F 00 3B 00
	TSC				  ; 3B
	ORA $2A			  ; 11 2A
	BRK $11			  ; 00 11
	BRK $00			  ; 00 00
	BRK $B6			  ; 00 B6
	TSB $72			  ; 04 72
	ROL				  ; 2A
	EOR $DB20,X		  ; 5D 20 DB
	BRK $A0			  ; 00 A0
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $FE			  ; 00 FE
	BRA $0792			; 80 FE
	PHP				  ; 08
	SBC $00			  ; F7 00
	XCE				  ; FB
	BRK $A0			  ; 00 A0
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $05			  ; 00 05
	BRK $05			  ; 00 05
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TSB $19			  ; 04 19
	BRA $082F			; 80 6B
	TSB $93			  ; 04 93
	BRK $14			  ; 00 14
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BPL $0806			; 10 38
	BRK $10			  ; 00 10
	RTS				  ; 60
	SBC $08EF04,X		; FF 04 EF 08
	STA $001C00,X		; 9F 00 1C 00
	SEC				  ; 38
	BRK $38			  ; 00 38
	BPL $0806			; 10 28
	BRK $10			  ; 00 10
	BRA $081A			; 80 38
	BCC $082C			; 90 48
	TAY				  ; A8
	STZ $40,X			; 74 40
	LDY $5020,X		  ; BC 20 50
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $F8			  ; 00 F8
	BRK $F8			  ; 00 F8
	JSR $00DC			; 20 DC 00
	JSR ($7000,X)		; FC 00 70
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_08
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08:
	PHP				  ; 08 | Push processor status to stack
	ASL $0900,X		  ; 1E 00 09 | Arithmetic shift left
	BRK $02			  ; 00 02 | Software interrupt
	BRK $05			  ; 00 05 | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $00,X			; 16 00 | Arithmetic shift left
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 07 00 | Logical OR with accumulator
	ASL $0400			; 0E 00 04 | Arithmetic shift left
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	TSB $73			  ; 04 73 | Unknown operation
	BRK $8F			  ; 00 8F | Software interrupt
	BRK $73			  ; 00 73 | Software interrupt
	BRK $81			  ; 00 81 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $10			  ; 00 10 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	ORA $ED			  ; 12 ED | Logical OR with accumulator
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator
	TSB $FB			  ; 04 FB | Unknown operation
	BRA $08D4			; 80 7C | Unknown operation
	BRK $B8			  ; 00 B8 | Software interrupt
	BRK $10			  ; 00 10 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $80			  ; 00 80 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack

	PHP				  ; 08
	PHP				  ; 08
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $04			  ; 07 04
	ORA $0018,X		  ; 1D 18 00
	BRK $00			  ; 00 00
	BRK $3C			  ; 00 3C
	BRK $FF			  ; 00 FF
	JSR $00FF			; 20 FF 00
	AND $C838CF,X		; 3F CF 38 C8
	XCE				  ; FB
	CLC				  ; 18
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BIT $DF3C,X		  ; 3C 3C DF
	CMP $FF			  ; C3 FF
	BRK $30			  ; 00 30
	BRK $37			  ; 00 37
	BRK $E7			  ; 00 E7
	ORA $00			  ; 03 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	BRA $0967			; 80 78
	RTI				  ; 40
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TRB $171C			; 1C 1C 17
	ORA $0A			  ; 13 0A
	PHP				  ; 08
	ORA $000008		  ; 0F 08 00 00
	BPL $0924			; 10 00
	SEC				  ; 38
	BRK $38			  ; 00 38
	BRK $7D			  ; 00 7D
	PHP				  ; 08
	SBC $293B68,X		; FF 68 3B 29
	DEC				  ; 3A
	DEC				  ; 3A
	BRK $00			  ; 00 00
	BPL $0944			; 10 10
	SEC				  ; 38
	PLP				  ; 28
	SEC				  ; 38
	PLP				  ; 28
	ADC $45,X			; 75 45
	STA $86			  ; 97 86
	DEC $00,X			; D6 00
	CMP $00			  ; C5 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $43			  ; 00 43
	BRK $BC			  ; 00 BC
	BRK $43			  ; 00 43
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $06			  ; 00 06
	BRK $19			  ; 00 19
	BRK $3C			  ; 00 3C
	CLC				  ; 18
	ADC $00FF00,X		; 7F 00 FF 00
	EOR $00			  ; 43 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $06			  ; 07 06
	ORA $0F0838,X		; 1F 38 08 0F
	BRK $06			  ; 00 06
	STA $7B0D			; 8D 0D 7B
	ORA $9E			  ; 13 9E
	ASL $08FD			; 0E FD 08
	ORA $02			  ; 07 02
	SBC $3037,X		  ; FD 37 30
	ORA $8B040F		  ; 0F 0F 04 8B
	ORA #$F6			 ; 09 F6
	ORA $ED			  ; 12 ED
	TSB $80F3			; 0C F3 80
	SBC $17FF00,X		; FF 00 FF 17
	TSB $7C			  ; 04 7C
	BRK $A0			  ; 00 A0
	CLI				  ; 58
	CLI				  ; 58
	LDY $54			  ; A4 54
	NOP				  ; EA
	MVN $06FA			; 54 FA 06
	EOR $570A,Y		  ; 59 0A 57
	SBC $E011,Y		  ; F9 11 E0
	RTS				  ; 60
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	RTI				  ; 40
	LDX $AE50,Y		  ; BE 50 AE
	BRK $FF			  ; 00 FF
	COP $FD			  ; 02 FD
	AND $7F12,X		  ; 3D 12 7F
	BIT $1273			; 2C 73 12
	ADC $11			  ; 71 11
	SEC				  ; 38
	CLC				  ; 18
	TRB $0704			; 1C 04 07
	BRK $00			  ; 00 00
	BRK $2D			  ; 00 2D
	JSR $4053			; 20 53 40
	ADC $6E40			; 6D 40 6E
	RTI				  ; 40
	AND $20			  ; 27 20
	TCS				  ; 1B
	CLC				  ; 18
	ORA $07			  ; 07 07
	BRK $00			  ; 00 00
	CMP $C0			  ; C7 C0
	TXA				  ; 8A
	LDY $A4			  ; A4 A4
	PHX				  ; DA
	CPY #$E4			 ; C0 E4
	EOR $00			  ; 43 00
	AND $00FF00,X		; 3F 00 FF 00
	BRK $00			  ; 00 00
	AND $0A7F07,X		; 3F 07 7F 0A
	TCD				  ; 5B
	BRK $3F			  ; 00 3F
	BRK $BD			  ; 00 BD
	ORA $C3			  ; 01 C3
	ORA $FC			  ; 03 FC
	JSR ($0000,X)		; FC 00 00

;==============================================================================
; GeneralPurpose_0A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A:
	JMP ($DE20,X)		; 7C 20 DE | Unknown operation
	CLD				  ; D8 | Unknown operation
	ROL $7608			; 2E 08 76 | Unknown operation
	TSB $EC			  ; 04 EC | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Unknown operation
	BRK $E0			  ; 00 E0 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $DC			  ; 00 DC | Software interrupt
	TSB $26			  ; 04 26 | Unknown operation
	COP $F6			  ; 02 F6 | Unknown operation
	JSL $F472FA		  ; 22 FA 72 F4 | Call external function
	CPX $F8			  ; E4 F8 | Unknown operation
	CLD				  ; D8 | Unknown operation
	JSR $0020			; 20 20 00 | Call local function
	BRK $01			  ; 00 01 | Software interrupt
	BRK $07			  ; 00 07 | Software interrupt
	BRK $0F			  ; 00 0F | Software interrupt
	BRK $1B			  ; 00 1B | Software interrupt
	TSB $34			  ; 04 34 | Unknown operation
	PHD				  ; 0B | Unknown operation
	JMP ($F613)		  ; 6C 13 F6 | Unknown operation
	AND $36E7			; 2D E7 36 | Logical AND with accumulator
	ORA $01			  ; 01 01 | Logical OR with accumulator
	ORA $06			  ; 07 06 | Logical OR with accumulator
	ORA $101B08		  ; 0F 08 1B 10 | Logical OR with accumulator
	BIT $7C20			; 2C 20 7C | Unknown operation
	RTI				  ; 40 | Unknown operation
	TXA				  ; 8A | Transfer X to accumulator
	BRA $09D8			; 80 99 | Unknown operation
	BRA $0A21			; 80 E0 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	JSR $00FC			; 20 FC 00 | Call local function
	INC $FE38,X		  ; FE 38 FE | Unknown operation
	CLC				  ; 18 | Clear carry flag
	ADC $94			  ; 77 94 | Unknown operation
	ADC $B0			  ; 73 B0 | Unknown operation
	SBC $60			  ; E5 60 | Unknown operation
	CPX #$E0			 ; E0 E0 | Unknown operation
	CLD				  ; D8 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	JSR ($C604,X)		; FC 04 C6 | Call local function
	COP $E6			  ; 02 E6 | Unknown operation
	COP $6B			  ; 02 6B | Unknown operation
	ORA $4F			  ; 01 4F | Logical OR with accumulator
	BRK $9F			  ; 00 9F | Software interrupt
	TSB $1F			  ; 04 1F | Unknown operation
	COP $39			  ; 02 39 | Unknown operation
	ORA #$3C			 ; 09 3C | Logical OR with accumulator

	ORA #$3C			 ; 09 3C
	TRB $1E			  ; 14 1E
	ASL				  ; 0A
	AND $7E18,Y		  ; 39 18 7E
	ROL $33CF			; 2E CF 33
	ROR $1D1E,X		  ; 7E 1E 1D
	TRB $2036			; 1C 36 20
	PLD				  ; 2B
	JSR $1015			; 20 15 10
	AND $21			  ; 27 21
	EOR $40			  ; 51 40
	CPY $6180			; CC 80 61
	RTS				  ; 60
	PEA $D374			; F4 74 D3
	EOR $D7			  ; 52 D7
	CMP $02,X			; D5 02
	LSR				  ; 4A
	EOR #$B4			 ; 49 B4
	BRK $48			  ; 00 48
	STA $03			  ; 87 03
	ADC $008B04,X		; 7F 04 8B 00
	LDA $2A00			; AD 00 2A
	BRK $FD			  ; 00 FD
	BRK $B7			  ; 00 B7
	ORA $FF			  ; 01 FF
	BRK $78			  ; 00 78
	BRK $C3			  ; 00 C3
	RTI				  ; 40
	CPX #$00			 ; E0 00
	CPX #$40			 ; E0 40
	CPY #$80			 ; C0 80
	BVS $0AA8			; 70 00
	LDY $BE10,X		  ; BC 10 BE
	JSR $909C			; 20 9C 90
	BEQ $0AF0			; F0 40
	CPX #$20			 ; E0 20
	LDY #$20			 ; A0 20
	RTI				  ; 40
	RTI				  ; 40
	BEQ $0AE8			; F0 30
	CPX $DE8C			; EC 8C DE
	BRL $172A			; 82 6C 0C
	BCS $0AF0			; B0 30
	BRK $26			  ; 00 26
	BRK $58			  ; 00 58
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $07			  ; 00 07
	ORA $02			  ; 01 02
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_0B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0B:
	LDA #$77			 ; A9 77 | Load value into accumulator
	TRB $BB			  ; 14 BB | Unknown operation
	ORA $BD			  ; 12 BD | Logical OR with accumulator
	PHP				  ; 08 | Push processor status to stack
	STZ $0800,X		  ; 9E 00 08 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	AND $DE			  ; 21 DE | Logical AND with accumulator
	BPL $0AC3			; 10 AF | Unknown operation
	BPL $0AC5			; 10 AF | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	STX $00,Y			; 96 00 | Store X register
	PHP				  ; 08 | Push processor status to stack
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $80			  ; 00 80 | Software interrupt
	BRA $0AE4			; 80 C0 | Unknown operation
	BRK $80			  ; 00 80 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $000002		  ; 0F 02 00 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BIT $DF3C,X		  ; 3C 3C DF | Unknown operation
	CMP $9F			  ; C3 9F | Compare with accumulator
	BRK $10			  ; 00 10 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	ORA $D0			  ; 03 D0 | Logical OR with accumulator
	BRK $CE			  ; 00 CE | Software interrupt
	RTI				  ; 40 | Unknown operation
	ADC $20			  ; 67 20 | Unknown operation
	AND $10			  ; 31 10 | Logical AND with accumulator
	CLC				  ; 18 | Clear carry flag
	BRK $07			  ; 00 07 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $DC			  ; 00 DC | Software interrupt
	BRA $0BB2			; 80 FF | Unknown operation
	BCC $0B74			; 90 BF | Branch if carry clear
	STX $475F			; 8E 5F 47 | Store X register
	AND $181F21		  ; 2F 21 1F 18 | Logical AND with accumulator
	ORA $07			  ; 07 07 | Logical OR with accumulator

	ORA $07			  ; 07 07
	BRK $00			  ; 00 00
	DEC $3EC0			; CE C0 3E
	BRK $FD			  ; 00 FD
	ORA $FB			  ; 01 FB
	COP $EF			  ; 02 EF
	ASL				  ; 0A
	ROR $F878,X		  ; 7E 78 F8
	BRK $00			  ; 00 00
	BRK $3F			  ; 00 3F
	ASL $3EFF			; 0E FF 3E
	INC $FDFC,X		  ; FE FC FD
	SED				  ; F8
	SBC $E1,X			; F5 E1
	STY $04			  ; 84 04
	BRA $0B5E			; 80 80
	BRK $00			  ; 00 00
	BRA $0BE2			; 80 00
	CPY #$80			 ; C0 80
	CPY #$80			 ; C0 80
	CPY #$80			 ; C0 80
	CPY #$80			 ; C0 80
	BRA $0BEC			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $0B72			; 80 80
	RTI				  ; 40
	; Skipped 32 bytes of data
	COP $02			  ; 02 02
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $C7			  ; 00 C7
	DEC $FF			  ; C6 FF
	EOR $C1			  ; 41 C1
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $1C			  ; 00 1C
	ORA $38			  ; 03 38
	ORA $7C			  ; 17 7C
	ORA $00			  ; 03 00
	BRK $03			  ; 00 03
	ORA $05			  ; 03 05
	TSB $0A			  ; 04 0A
	PHP				  ; 08
	ORA $101C08		  ; 0F 08 1C 10
	PLP				  ; 28
	JSR $407C			; 20 7C 40
	BEQ $0C82			; F0 00
	JSR ($FE80,X)		; FC 80 FE
	BRK $FF			  ; 00 FF
	BIT $7CFF,X		  ; 3C FF 7C
	SBC $26			  ; E7 26
	ADC $A6			  ; 67 A6
	SBC $F0F01C,X		; FF 1C F0 F0
	JMP ($FE0C,X)		; 7C 0C FE
	COP $C3			  ; 02 C3
	ORA $83			  ; 01 83
	ORA $D9			  ; 01 D9
	BRK $59			  ; 00 59
	BRK $E3			  ; 00 E3
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	PHP				  ; 08
	ADC $FE22,X		  ; 7D 22 FE
	EOR $63E3,X		  ; 5D E3 63
	BVS $0CFA			; 70 30
	SEC				  ; 38
	PHP				  ; 08
	ORA $000000		  ; 0F 00 00 00
	AND $30			  ; 37 30
	EOR $A240,X		  ; 5D 40 A2
	BRA $0C73			; 80 9C
	BRA $0D28			; 80 4F
	RTI				  ; 40
	AND $30			  ; 37 30
	ORA $00000F		  ; 0F 0F 00 00
	JSR ($FD0C,X)		; FC 0C FD
	AND $35D1,X		  ; 3D D1 35
	LDA $DB			  ; A5 DB
	CMP $E5			  ; C1 E5
	WDM $00			  ; 42 00
	AND $FF00,X		  ; 3D 00 FF
	BRK $F3			  ; 00 F3
	BRK $C2			  ; 00 C2
	BRK $EE			  ; 00 EE
	BRK $5A			  ; 00 5A
	BRK $3E			  ; 00 3E
	BRK $BD			  ; 00 BD
	BRK $C3			  ; 00 C3
	ORA $FC			  ; 01 FC
	JSR ($A0FC,X)		; FC FC A0
	INC $D728			; EE 28 D7
	REP #$3B			 ; C2 3B
	COP $F6			  ; 02 F6
	TSB $CC			  ; 04 CC
	BRK $F0			  ; 00 F0
	BRK $00			  ; 00 00
	BRK $5C			  ; 00 5C
	TSB $02D6			; 0C D6 02
	AND $FD11,X		  ; 3D 11 FD
	AND $F2FA,Y		  ; 39 FA F2
	JSR ($30CC,X)		; FC CC 30
	BMI $0D1F			; 30 00
	BRK $01			  ; 00 01
	BRK $07			  ; 00 07
	BRK $0F			  ; 00 0F
	BRK $1D			  ; 00 1D
	COP $18			  ; 02 18
	ORA $2C			  ; 07 2C
	ORA $57			  ; 13 57
	BIT $37E3			; 2C E3 37
	ORA $01			  ; 01 01
	ORA $06			  ; 07 06
	ORA $101D08		  ; 0F 08 1D 10
	CLC				  ; 18
	BPL $0D77			; 10 3C
	JSR $406B			; 20 6B 40
	JMP $E080			; DC 80 E0
	BRK $F8			  ; 00 F8
	JSR $00FC			; 20 FC 00
	INC $EE78,X		  ; FE 78 EE
	PLA				  ; 68
	SBC $24			  ; E7 24
	SBC $60			  ; E3 60
	CMP $C0			  ; C5 C0
	CPX #$E0			 ; E0 E0
	CLD				  ; D8
	CLC				  ; 18
	JSR ($8604,X)		; FC 04 86
	COP $96			  ; 02 96
	COP $DB			  ; 02 DB
	ORA $9F			  ; 01 9F
	BRK $3F			  ; 00 3F
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	EOR $E6,X			; 55 E6
	ADC $C0			  ; 67 C0
	RTI				  ; 40
	EOR $3600			; 4D 00 36
	BRK $0C			  ; 00 0C
	BRK $03			  ; 00 03
	BRK $B7			  ; 00 B7
	BRA $0D3D			; 80 AA
	BRA $0D2E			; 80 99
	BRA $0D56			; 80 BF
	BRA $0E17			; 80 7E
	JMP $363F			; 4C 3F 36
	ORA $03030C		  ; 0F 0C 03 03
	SBC $FF6F19,X		; FF 19 6F FF
	STA $68			  ; 93 68
	ORA $90			  ; 07 90
	ORA $00FC00		  ; 0F 00 FC 00
	TSC				  ; 3B
	BRK $FC			  ; 00 FC
	BRK $E6			  ; 00 E6
	BRK $90			  ; 00 90
	BRK $6F			  ; 00 6F
	ORA $FF			  ; 03 FF
	ORA $F7			  ; 07 F7
	ORA $0F			  ; 07 0F
	TSB $38FC			; 0C FC 38
	CPY #$C0			 ; C0 C0
	BVS $0DE2			; 70 20
	BVS $0E04			; 70 40
	BMI $0DC6			; 30 00
	BMI $0DE8			; 30 20
	RTS				  ; 60
	RTI				  ; 40
	CPY #$00			 ; C0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BNE $0DE2			; D0 10
	BCS $0DE4			; B0 10
	BEQ $0DE6			; F0 10
	BNE $0DE8			; D0 10
	LDY #$20			 ; A0 20
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	ORA $07			  ; 07 07

;==============================================================================
; GeneralPurpose_0E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0E:
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	JMP $7740			; DC 40 77 | Unknown operation
	BMI $0E82			; 30 39 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRK $07			  ; 00 07 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $DB			  ; 00 DB | Software interrupt
	BRA $0E32			; 80 DF | Unknown operation
	BRA $0DFC			; 80 A7 | Unknown operation
	STY $4F			  ; 84 4F | Store Y register
	EOR $27			  ; 47 27 | Unknown operation
	AND $1F			  ; 21 1F | Logical AND with accumulator
	CLC				  ; 18 | Clear carry flag
	ORA $07			  ; 07 07 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	ASL $1E00			; 0E 00 1E | Arithmetic shift left
	BRK $7D			  ; 00 7D | Software interrupt
	ORA $FB			  ; 01 FB | Logical OR with accumulator
	COP $EF			  ; 02 EF | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	ROL $F830,X		  ; 3E 30 F8 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	ASL $1EFF			; 0E FF 1E | Arithmetic shift left
	INC $FD7C,X		  ; FE 7C FD | Unknown operation
	SED				  ; F8 | Unknown operation
	SBC $E3			  ; F7 E3 | Unknown operation
	INY				  ; C8 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	BRA $0DFE			; 80 80 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $7C			  ; 00 7C | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $0F			  ; 00 0F | Software interrupt
	BRK $30			  ; 00 30 | Software interrupt
	BRK $4F			  ; 00 4F | Software interrupt
	BRK $B0			  ; 00 B0 | Software interrupt
	BRK $40			  ; 00 40 | Software interrupt
	ORA $7F			  ; 01 7F | Logical OR with accumulator
	BRK $03			  ; 00 03 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $0F			  ; 00 0F | Software interrupt
	ASL $3F			  ; 06 3F | Arithmetic shift left
	JSR $007F			; 20 7F 00 | Call local function

	JSR $007F			; 20 7F 00
	BEQ $0E9F			; F0 00
	RTI				  ; 40
	SEC				  ; 38
	DEY				  ; 88
	ORA $3D8640		  ; 0F 40 86 3D
	EOR $039B,X		  ; 5D 9B 03
	ROR $9D1E,X		  ; 7E 1E 9D
	BRK $7F			  ; 00 7F
	COP $04			  ; 02 04
	AND $B0			  ; 37 B0
	ORA $FB04CF		  ; 0F CF 04 FB
	ORA $02E6,Y		  ; 19 E6 02
	SBC $E31C,X		  ; FD 1C E3
	BRK $7F			  ; 00 7F
	BRK $07			  ; 00 07
	ORA $04			  ; 17 04
	JMP ($A000,X)		; 7C 00 A0
	CLI				  ; 58
	CLI				  ; 58
	LDY $54			  ; A4 54
	NOP				  ; EA
	TRB $7A			  ; 14 7A
	STX $D9			  ; 86 D9
	TXA				  ; 8A
	EOR $F9			  ; 57 F9
	ORA $E0			  ; 11 E0
	RTS				  ; 60
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	RTI				  ; 40
	LDX $EE10,Y		  ; BE 10 EE
	BRA $0F5D			; 80 7F
	COP $FD			  ; 02 FD
	AND $247B04,X		; 3F 04 7B 24
	SBC $FF12,X		  ; FD 12 FF
	SEC				  ; 38
	SBC $10706F		  ; EF 6F 70 10
	ASL $0302,X		  ; 1E 02 03
	BRK $3B			  ; 00 3B
	SEC				  ; 38
	TCD				  ; 5B
	RTI				  ; 40
	SBC $C780			; ED 80 C7
	BRA $0E89			; 80 90
	BRA $0F6A			; 80 6F
	RTS				  ; 60
	ORA $031C,X		  ; 1D 1C 03
	ORA $0F			  ; 03 0F
	SBC $9E			  ; F3 9E
	ROR $F9			  ; 66 F9
	ORA $F5D1,Y		  ; 19 D1 F5
	LDY $DA			  ; A4 DA
	CMP $E4			  ; C1 E4
	EOR $00FF00,X		; 5F 00 FF 00
	TSB $9900			; 0C 00 99
	BRK $E6			  ; 00 E6
	BRK $2E			  ; 00 2E
	BRK $5B			  ; 00 5B
	BRK $3F			  ; 00 3F
	ORA $BF			  ; 01 BF
	ORA $FCC2C2,X		; 1F C2 C2 FC
	JSR $C8FE			; 20 FE C8
	SBC $94			  ; F7 94
	XBA				  ; EB
	SEP #$35			 ; E2 35
	TSB $C6			  ; 04 C6
	BRK $F8			  ; 00 F8
	BRK $C0			  ; 00 C0
	BRK $DC			  ; 00 DC
	TRB $0236			; 1C 36 02
	RTL				  ; 6B
	ORA $1D			  ; 01 1D
	ORA #$FB			 ; 09 FB
	AND $FE			  ; 31 FE
	DEC $F8			  ; C6 F8
	SED				  ; F8
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 07 00
	ORA $061900		  ; 0F 00 19 06
	CLC				  ; 18
	ORA $3C			  ; 07 3C
	ORA $6F			  ; 03 6F
	TRB $F3			  ; 14 F3
	PLD				  ; 2B
	ORA $01			  ; 01 01
	ORA $06			  ; 07 06
	ORA $101908		  ; 0F 08 19 10
	CLC				  ; 18
	BPL $0F97			; 10 3C
	JSR $406B			; 20 6B 40
	JMP $E080			; DC 80 E0
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FE			  ; 00 FE
	SEI				  ; 78
	DEC $C748			; CE 48 C7
	MVP $C0CB			; 44 CB C0
	STA $80			  ; 85 80
	CPX #$E0			 ; E0 E0
	SED				  ; F8
	CLC				  ; 18
	JSR ($8604,X)		; FC 04 86
	COP $B6			  ; 02 B6
	COP $BB			  ; 02 BB
	ORA $3F			  ; 01 3F
	PHP				  ; 08
	ADC $0A0404,X		; 7F 04 04 0A
	TSB $09			  ; 04 09
	BRK $05			  ; 00 05
	COP $07			  ; 02 07
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $07			  ; 00 07
	COP $05			  ; 02 05
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	AND #$F7			 ; 29 F7
	BIT $7B			  ; 24 7B
	ORA $3D			  ; 12 3D
	BPL $0FE2			; 10 3A
	BRK $10			  ; 00 10
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	AND $DE			  ; 21 DE
	JSR $105F			; 20 5F 10
	AND $002A10		  ; 2F 10 2A 00
	BPL $0FBB			; 10 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	TSB $0D			  ; 04 0D
	PHP				  ; 08
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $00			  ; 03 00
	ORA $02			  ; 07 02
	ASL $01			  ; 06 01
	TSB $0D07			; 0C 07 0D
	COP $00			  ; 02 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	ORA $05			  ; 03 05
	TSB $06			  ; 04 06
	TSB $08			  ; 04 08
	PHP				  ; 08
	ORA $0008			; 0D 08 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	RTI				  ; 40
	CPX #$00			 ; E0 00
	BEQ $104E			; F0 20
	BEQ $1030			; F0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPY #$C0			 ; C0 C0
	LDY #$20			 ; A0 20
	CPX #$20			 ; E0 20
	BNE $104E			; D0 10
	BEQ $1050			; F0 10
	INX				  ; E8
	AND $C1,X			; 35 C1
	ASL				  ; 0A
	BNE $1087			; D0 41
	ROR $3B20			; 6E 20 3B
	CLC				  ; 18
	CLC				  ; 18
	BRK $07			  ; 00 07
	BRK $00			  ; 00 00
	BRK $D7			  ; 00 D7
	BRA $1051			; 80 FE
	BRA $1004			; 80 AF
	BRA $10A8			; 80 51
	RTI				  ; 40
	AND $23			  ; 27 23
	ORA $070718,X		; 1F 18 07 07
	BRK $00			  ; 00 00
	ASL $0E00			; 0E 00 0E
	BRA $10A4			; 80 3F
	ORA $FF			  ; 01 FF
	COP $FF			  ; 02 FF
	TSB $303C			; 0C 3C 30
	BEQ $106E			; F0 00
	BRK $00			  ; 00 00
	SBC $0EFF0E,X		; FF 0E FF 0E
	INC $FD3E,X		  ; FE 3E FD
	JSR ($F1F1,X)		; FC F1 F1
	CPY #$00			 ; C0 00
	BRA $0FFE			; 80 80
	BRK $00			  ; 00 00
	BRA $1082			; 80 00
	CPY #$80			 ; C0 80
	CPY #$80			 ; C0 80
	CPY #$80			 ; C0 80
	CPY #$00			 ; C0 00
	BRA $108C			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $1012			; 80 80
	RTI				  ; 40
	RTI				  ; 40
	RTI				  ; 40
	RTI				  ; 40
	RTI				  ; 40
	RTI				  ; 40
	CPY #$40			 ; C0 40
	BRA $101C			; 80 80
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $07			  ; 00 07
	ORA #$06			 ; 09 06
	TCS				  ; 1B
	TSB $1F			  ; 04 1F
	ORA $1D			  ; 01 1D
	COP $3F			  ; 02 3F
	TSB $2F			  ; 04 2F
	ORA $78			  ; 17 78
	ASL				  ; 0A
	PLY				  ; 7A
	ORA $0809			; 0D 09 08
	TCS				  ; 1B
	BPL $10F3			; 10 1E
	BPL $10F4			; 10 1D
	BPL $1114			; 10 3B
	JSR $2028			; 20 28 20
	ADC $40			  ; 77 40
	ADC $40,X			; 75 40
	BEQ $10E2			; F0 00
	SED				  ; F8
	CPX #$B8			 ; E0 B8
	LDY #$98			 ; A0 98
	BCC $1085			; 90 9C
	BCC $1077			; 90 8C
	BRA $1103			; 80 16
	RTI				  ; 40
	LSR $A0,X			; 56 A0
	BEQ $1102			; F0 10
	CLC				  ; 18
	PHP				  ; 08
	CLI				  ; 58
	PHP				  ; 08
	PLA				  ; 68
	PHP				  ; 08
	JMP ($7C04)		  ; 6C 04 7C
	TSB $FE			  ; 04 FE
	ORA $BE			  ; 12 BE
	ORA $0F			  ; 12 0F
	BRK $1D			  ; 00 1D
	ASL $1A			  ; 06 1A
	ORA $1D			  ; 05 1D
	ORA $3F			  ; 07 3F
	ORA $3F			  ; 03 3F
	BRK $3F			  ; 00 3F
	ORA $7F			  ; 03 7F
	ORA #$0F			 ; 09 0F
	PHP				  ; 08
	TCS				  ; 1B
	BPL $1132			; 10 1D
	BPL $1131			; 10 1A
	BPL $1151			; 10 38
	JSR $203C			; 20 3C 20
	BIT $7620,X		  ; 3C 20 76
	RTI				  ; 40
	SED				  ; F8
	BNE $10DB			; D0 B8
	CPX #$58			 ; E0 58
	LDY #$98			 ; A0 98
	BNE $10D5			; D0 AC
	BRA $10F7			; 80 CC
	BRK $1C			  ; 00 1C
	CLC				  ; 18
	ASL $00			  ; 06 00
	PLP				  ; 28
	PHP				  ; 08
	CLI				  ; 58
	PHP				  ; 08
	CLV				  ; B8
	PHP				  ; 08
	PLA				  ; 68
	PHP				  ; 08
	JMP $043C04		  ; 5C 04 3C 04
	CPX $04			  ; E4 04
	INC $0102,X		  ; FE 02 01
	BRK $07			  ; 00 07
	ORA $0F			  ; 01 0F
	BRK $19			  ; 00 19
	ASL $19			  ; 06 19
	ASL $3F			  ; 06 3F
	BRK $2F			  ; 00 2F
	ORA $78			  ; 17 78
	ORA #$01			 ; 09 01
	ORA $06			  ; 01 06
	ASL $0F			  ; 06 0F
	PHP				  ; 08
	ORA $1910,Y		  ; 19 10 19
	BPL $119A			; 10 3F
	JSR $2028			; 20 28 20
	ADC $40			  ; 77 40
	CPX #$00			 ; E0 00
	SED				  ; F8
	BRK $FC			  ; 00 FC
	BRK $FE			  ; 00 FE
	SED				  ; F8
	STX $8788			; 8E 88 87
	STY $0B			  ; 84 0B
	BRK $05			  ; 00 05
	JSR $E0E0			; 20 E0 E0
	SED				  ; F8
	CLC				  ; 18
	JSR ($0604,X)		; FC 04 06
	COP $76			  ; 02 76
	COP $7B			  ; 02 7B
	ORA $FF			  ; 01 FF
	ORA #$FF			 ; 09 FF
	TSB $01			  ; 04 01
	BRK $07			  ; 00 07
	ORA $0F			  ; 01 0F
	BRK $19			  ; 00 19
	ASL $1B			  ; 06 1B
	ORA $3F			  ; 05 3F
	ORA $6E			  ; 03 6E
	ASL $FF,X			; 16 FF
	AND $01			  ; 21 01
	ORA $06			  ; 01 06
	ASL $0F			  ; 06 0F
	PHP				  ; 08
	ORA $1A10,Y		  ; 19 10 1A
	BPL $11D7			; 10 3C
	JSR $4069			; 20 69 40
	DEC $E080,X		  ; DE 80 E0
	BRK $F8			  ; 00 F8
	BRK $FC			  ; 00 FC
	BRK $FE			  ; 00 FE
	SED				  ; F8
	PHD				  ; 0B
	TSB $0705			; 0C 05 07
	PHD				  ; 0B
	TSB $8D			  ; 04 8D
	BRL $F292			; 82 E0 E0
	SED				  ; F8
	CLC				  ; 18
	JSR ($0604,X)		; FC 04 06
	COP $F5			  ; 02 F5
	ORA $FA			  ; 01 FA
	BRK $FD			  ; 00 FD
	PHP				  ; 08
	ADC $01000C,X		; 7F 0C 00 01
	BRK $1F			  ; 00 1F
	BRK $60			  ; 00 60
	BRK $9F			  ; 00 9F
	BRK $60			  ; 00 60
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $1F			  ; 00 1F
	TSB $207F			; 0C 7F 20
	SBC $006000,X		; FF 00 60 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $38			  ; 00 38
	PHA				  ; 48
	ORA $DD16B0		  ; 0F B0 16 DD
	ORA #$3F			 ; 09 3F
	EOR $9E			  ; 47 9E
	TRB $017B			; 1C 7B 01
	ORA $370402,X		; 1F 02 04 37
	BEQ $1202			; F0 0F
	SBC $09EB14,X		; FF 14 EB 09
	INC $06,X			; F6 06
	SBC $6718,Y		  ; F9 18 67
	ORA $1E			  ; 01 1E
	BRK $07			  ; 00 07

;==============================================================================
; GeneralPurpose_12
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_12:
	ORA $04			  ; 17 04 | Logical OR with accumulator
	JMP ($A000,X)		; 7C 00 A0 | Unknown operation
	CLI				  ; 58 | Unknown operation
	CLI				  ; 58 | Unknown operation
	LDY $54			  ; A4 54 | Load Y register
	NOP				  ; EA | Unknown operation
	PEI $BA			  ; D4 BA | Unknown operation
	STX $59			  ; 86 59 | Store X register
	ASL				  ; 0A | Arithmetic shift left
	CMP $F9			  ; D7 F9 | Compare with accumulator
	ORA $E0			  ; 11 E0 | Logical OR with accumulator
	RTS				  ; 60 | Return from local function
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $FC			  ; 00 FC | Software interrupt
	RTI				  ; 40 | Unknown operation
	LDX $6E90,Y		  ; BE 90 6E | Load X register
	BRK $FF			  ; 00 FF | Software interrupt
	COP $FD			  ; 02 FD | Unknown operation
	BEQ $1234			; F0 12 | Branch if equal (zero flag set)
	CPX $20			  ; E4 20 | Unknown operation
	SBC $20			  ; E3 20 | Unknown operation
	INX				  ; E8 | Unknown operation
	JSR $2060			; 20 60 20 | Call local function
	ADC $083B18,X		; 7F 18 3B 08 | Unknown operation
	ORA $80EF00		  ; 0F 00 EF 80 | Logical OR with accumulator
	STP				  ; DB | Unknown operation
	BRA $1211			; 80 DC | Unknown operation
	BRA $1216			; 80 DF | Unknown operation
	DEY				  ; 88 | Unknown operation
	EOR $476740,X		; 5F 40 67 47 | Unknown operation
	AND $33			  ; 37 33 | Logical AND with accumulator
	ORA $401B0F		  ; 0F 0F 1B 40 | Logical OR with accumulator
	TSC				  ; 3B | Unknown operation
	COP $DF			  ; 02 DF | Unknown operation
	TSB $1F			  ; 04 1F | Unknown operation
	TSB $F6			  ; 04 F6 | Unknown operation
	TSB $EE			  ; 04 EE | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	JMP $F010			; DC 10 F0 | Unknown operation
	BRK $FF			  ; 00 FF | Software interrupt
	ORA $19DD,Y		  ; 19 DD 19 | Logical OR with accumulator
	TSC				  ; 3B | Unknown operation
	ORA $19FB,Y		  ; 19 FB 19 | Logical OR with accumulator
	PLX				  ; FA | Pull X register from stack
	SBC $F6			  ; F2 F6 | Unknown operation
	SEP #$E4			 ; E2 E4 | Set processor status bits
	CPY $00			  ; C4 00 | Unknown operation
	BRK $76			  ; 00 76 | Software interrupt
	ASL $72,X			; 16 72 | Arithmetic shift left

	ASL $72,X			; 16 72
	ORA $78			  ; 12 78
	BPL $12DF			; 10 78
	BPL $129D			; 10 34
	BPL $12AA			; 10 3F
	CLC				  ; 18
	TCS				  ; 1B
	PHP				  ; 08
	ORA $406900		  ; 0F 00 69 40
	ADC $6F40			; 6D 40 6F
	PHA				  ; 48
	ADC $242F48		  ; 6F 48 2F 24
	AND $27			  ; 27 27
	ORA $13			  ; 17 13
	ORA $04060F		  ; 0F 0F 06 04
	ASL $04			  ; 06 04
	ASL $00			  ; 06 00
	ASL $00,X			; 16 00
	JSR ($EC08,X)		; FC 08 EC
	PHP				  ; 08
	CLD				  ; D8
	BPL $127F			; 10 F0
	BRK $FA			  ; 00 FA
	COP $FA			  ; 02 FA
	COP $FE			  ; 02 FE
	COP $FE			  ; 02 FE
	ORA $F4			  ; 12 F4
	PEA $E4F4			; F4 F4 E4
	INX				  ; E8
	INY				  ; C8
	BRK $00			  ; 00 00
	SBC $12,X			; F5 12
	INX				  ; E8
	AND $E2			  ; 21 E2
	JSR $1071			; 20 71 10
	SEC				  ; 38
	PHP				  ; 08
	ORA $000303		  ; 0F 03 03 00
	BRK $00			  ; 00 00
	INC $DF84			; EE 84 DF
	DEY				  ; 88
	CMP $6E80,X		  ; DD 80 6E
	RTI				  ; 40
	AND $30			  ; 37 30
	TSB $030C			; 0C 0C 03
	ORA $00			  ; 03 00
	BRK $26			  ; 00 26
	BNE $12C9			; D0 06
	JSR $0117			; 20 17 01
	SBC $047700		  ; EF 00 77 04
	TSB $F000			; 0C 00 F0
	BRK $00			  ; 00 00
	BRK $DF			  ; 00 DF
	ASL $FF			  ; 06 FF
	ASL $EE			  ; 06 EE
	ASL $1F			  ; 06 1F
	TSB $71F9			; 0C F9 71
	BEQ $12DC			; F0 00
	BRA $125E			; 80 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $12E4			; 80 00
	CPY #$00			 ; C0 00
	CPY #$80			 ; C0 80
	CPY #$00			 ; C0 00
	BRA $12EC			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $1274			; 80 80
	CPY #$40			 ; C0 40
	RTI				  ; 40
	RTI				  ; 40
	CPY #$40			 ; C0 40
	BRA $127C			; 80 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_13
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_13:
	SBC $CF36,Y		  ; F9 36 CF | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CMP $43			  ; D3 43 | Compare with accumulator
	JMP ($3B20)		  ; 6C 20 3B | Unknown operation
	CLC				  ; 18 | Clear carry flag
	TCS				  ; 1B | Unknown operation
	ORA $07			  ; 03 07 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $C9			  ; 00 C9 | Software interrupt
	BRA $130A			; 80 F7 | Unknown operation
	BRA $12D1			; 80 BC | Unknown operation
	BCC $1376			; 90 5F | Branch if carry clear
	JMP $2327			; 4C 27 23 | Unknown operation
	TRB $0718			; 1C 18 07 | Unknown operation
	ORA $00			  ; 07 00 | Logical OR with accumulator
	BRK $DF			  ; 00 DF | Software interrupt
	CPY #$DD			 ; C0 DD | Unknown operation
	CMP $3D			  ; C1 3D | Compare with accumulator
	ORA $FB			  ; 01 FB | Logical OR with accumulator
	COP $EF			  ; 02 EF | Unknown operation
	TSB $303E			; 0C 3E 30 | Unknown operation
	SED				  ; F8 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $3E			  ; 00 3E | Software interrupt
	ASL $1C3E,X		  ; 1E 3E 1C | Arithmetic shift left
	INC $FD3C,X		  ; FE 3C FD | Unknown operation
	SED				  ; F8 | Unknown operation
	SBC $E3			  ; F3 E3 | Unknown operation
	INY				  ; C8 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	BRA $12BE			; 80 80 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	CPY #$00			 ; C0 00 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	CPY #$80			 ; C0 80 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	BRA $134C			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	CPY #$40			 ; C0 40 | Unknown operation
	CPY #$40			 ; C0 40 | Unknown operation
	BRA $12DC			; 80 80 | Unknown operation

	BRA $12DC			; 80 80
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $03			  ; 00 03
	TSB $09			  ; 04 09
	TSB $09			  ; 04 09
	BRK $05			  ; 00 05
	COP $07			  ; 02 07
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $0F			  ; 00 0F
	BRK $0F			  ; 00 0F
	BRK $07			  ; 00 07
	COP $05			  ; 02 05
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA #$57			 ; 09 57
	BIT $7B			  ; 24 7B
	JSL $3E107D		  ; 22 7D 10 3E
	BRK $18			  ; 00 18
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $7E			  ; 01 7E
	JSR $205F			; 20 5F 20
	EOR $002E10,X		; 5F 10 2E 00
	CLC				  ; 18
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	ORA $101508		  ; 0F 08 15 10
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $13E6			; 80 00
	CPY #$00			 ; C0 00
	CPX #$00			 ; E0 00
	BEQ $140C			; F0 20
	BCS $13CE			; B0 E0
	CLI				  ; 58
	BCS $13F1			; B0 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $13B7			; 80 C0
	RTI				  ; 40
	CPX #$20			 ; E0 20
	BNE $140C			; D0 10
	BVC $140E			; 50 10
	TAY				  ; A8
	PHP				  ; 08

;==============================================================================
; GeneralPurpose_14
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_14:
	ORA $00			  ; 01 00 | Logical OR with accumulator
	ORA $01			  ; 07 01 | Logical OR with accumulator
	ORA $061900		  ; 0F 00 19 06 | Logical OR with accumulator
	ORA $3F06,Y		  ; 19 06 3F | Logical OR with accumulator
	BRK $6F			  ; 00 6F | Software interrupt
	ORA $FC			  ; 17 FC | Logical OR with accumulator
	TSB $01			  ; 04 01 | Unknown operation
	ORA $06			  ; 01 06 | Logical OR with accumulator
	ASL $0F			  ; 06 0F | Arithmetic shift left
	PHP				  ; 08 | Push processor status to stack
	ORA $1910,Y		  ; 19 10 19 | Logical OR with accumulator
	BPL $145A			; 10 3F | Unknown operation
	JSR $4068			; 20 68 40 | Call local function
	XCE				  ; FB | Unknown operation
	BRA $1401			; 80 E0 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $FC			  ; 00 FC | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SED				  ; F8 | Unknown operation
	STX $8788			; 8E 88 87 | Store X register
	STY $8B			  ; 84 8B | Store Y register
	BRA $1438			; 80 09 | Unknown operation
	TSB $E0			  ; 04 E0 | Unknown operation
	CPX #$F8			 ; E0 F8 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	JSR ($0604,X)		; FC 04 06 | Call local function
	COP $76			  ; 02 76 | Unknown operation
	COP $7B			  ; 02 7B | Unknown operation
	ORA $7F			  ; 01 7F | Logical OR with accumulator
	PHP				  ; 08 | Push processor status to stack
	SBC $000108,X		; FF 08 01 00 | Unknown operation
	ORA $01			  ; 07 01 | Logical OR with accumulator
	ORA $061900		  ; 0F 00 19 06 | Logical OR with accumulator
	TCS				  ; 1B | Unknown operation
	ORA $3F			  ; 05 3F | Logical OR with accumulator
	ORA $6F			  ; 01 6F | Logical OR with accumulator
	ORA $FF			  ; 17 FF | Logical OR with accumulator
	AND $01			  ; 21 01 | Logical AND with accumulator
	ORA $06			  ; 01 06 | Logical OR with accumulator
	ASL $0F			  ; 06 0F | Arithmetic shift left
	PHP				  ; 08 | Push processor status to stack
	ORA $1A10,Y		  ; 19 10 1A | Logical OR with accumulator
	BPL $1499			; 10 3E | Unknown operation
	JSR $4068			; 20 68 40 | Call local function
	DEC $E080,X		  ; DE 80 E0 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	BRK $FC			  ; 00 FC | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SED				  ; F8 | Unknown operation

	SED				  ; F8
	STX $0588			; 8E 88 05
	ASL $0A			  ; 06 0A
	ORA $85			  ; 05 85
	TXA				  ; 8A
	CPX #$E0			 ; E0 E0
	SED				  ; F8
	CLC				  ; 18
	JSR ($0604,X)		; FC 04 06
	COP $76			  ; 02 76
	COP $FB			  ; 02 FB
	ORA $FD			  ; 01 FD
	PHP				  ; 08
	ADC $3D0004,X		; 7F 04 00 3D
	BRK $43			  ; 00 43
	BRK $BC			  ; 00 BC
	BRK $43			  ; 00 43
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	AND $033F01,X		; 3F 01 3F 03
	AND $101A07,X		; 3F 07 1A 10
	CLC				  ; 18
	BPL $14CD			; 10 18
	BPL $14CB			; 10 14
	BPL $14CD			; 10 14
	BPL $14F9			; 10 3E
	JSR $203C			; 20 3C 20
	SEC				  ; 38
	JSR $C098			; 20 98 C0
	CLV				  ; B8
	BRA $149D			; 80 D8
	BRK $18			  ; 00 18
	BPL $14D5			; 10 0C
	BRK $8C			  ; 00 8C
	BRA $1459			; 80 8C
	DEY				  ; 88
	STY $7888			; 8C 88 78
	PHP				  ; 08
	CLI				  ; 58
	PHP				  ; 08
	SEC				  ; 38
	PHP				  ; 08
	INX				  ; E8
	PHP				  ; 08
	JSR ($7C04,X)		; FC 04 7C
	TSB $74			  ; 04 74
	TSB $74			  ; 04 74
	TSB $FF			  ; 04 FF
	AND $CE			  ; 33 CE
	ASL $40D0			; 0E D0 40
	JMP ($3B20)		  ; 6C 20 3B
	CLC				  ; 18
	ASL $0706,X		  ; 1E 06 07
	BRK $00			  ; 00 00
	BRK $CC			  ; 00 CC
	BRA $14E4			; 80 F1
	BRA $14B4			; 80 BF
	BCC $1556			; 90 5F
	JMP $2327			; 4C 27 23
	ORA $0718,Y		  ; 19 18 07
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ROL				  ; 2A
	ROL				  ; 2A
	MVN $211F			; 54 1F 21
	SBC $0CEF02,X		; FF 02 EF 0C
	BIT $F030,X		  ; 3C 30 F0
	BRK $00			  ; 00 00
	BRK $FB			  ; 00 FB
	BRK $DF			  ; 00 DF
	ASL				  ; 0A
	JSR ($E11C,X)		; FC 1C E1
	CPX #$F1			 ; E0 F1
	SBC $C0			  ; E1 C0
	BRK $80			  ; 00 80
	BRA $151F			; 80 00
	BRK $FF			  ; 00 FF
	BMI $14F2			; 30 CF
	ORA $43D3			; 0D D3 43
	JMP ($3B20)		  ; 6C 20 3B
	CLC				  ; 18
	TCS				  ; 1B
	ORA $07			  ; 03 07
	BRK $00			  ; 00 00
	BRK $CF			  ; 00 CF
	BRA $1525			; 80 F2
	BRA $14F1			; 80 BC
	BCC $1596			; 90 5F
	JMP $2327			; 4C 27 23
	TRB $0718			; 1C 18 07
	ORA $00			  ; 07 00
	BRK $CB			  ; 00 CB
	PEI $97			  ; D4 97
	DEY				  ; 88
	AND $02FB01,X		; 3F 01 FB 02
	SBC $360C			; ED 0C 36
	BMI $1545			; 30 F8
	BRK $00			  ; 00 00
	BRK $36			  ; 00 36
	COP $7E			  ; 02 7E
	ASL $F8,X			; 16 F8
	SEC				  ; 38
	SBC $F3F8,X		  ; FD F8 F3
	SBC $C8			  ; E1 C8
	BRK $80			  ; 00 80
	BRA $155F			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CLC				  ; 18
	BRK $24			  ; 00 24
	PHP				  ; 08
	ORA $00			  ; 12 00
	ASL				  ; 0A
	BRK $05			  ; 00 05
	BRK $1E			  ; 00 1E
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	BRK $3C			  ; 00 3C
	TSB $1E			  ; 04 1E
	BRK $0E			  ; 00 0E
	COP $07			  ; 02 07
	BRK $1F			  ; 00 1F
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	BRK $14			  ; 00 14
	BRK $14			  ; 00 14
	BRK $14			  ; 00 14
	BRK $2A			  ; 00 2A
	BRK $2D			  ; 00 2D
	BPL $15BA			; 10 2A
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	BRK $1C			  ; 00 1C
	BRK $1C			  ; 00 1C
	PHP				  ; 08
	TRB $3E00			; 1C 00 3E
	ORA $3F			  ; 12 3F
	BRK $3B			  ; 00 3B
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $10			  ; 00 10
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	PHP				  ; 08
	BIT $00			  ; 24 00
	AND $00			  ; 33 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $15B9			; 10 00
	SEC				  ; 38
	BPL $15F4			; 10 38
	BRK $3C			  ; 00 3C
	PHP				  ; 08
	AND $380A3A,X		; 3F 3A 0A 38
	PHP				  ; 08
	SEC				  ; 38
	PHP				  ; 08
	BIT $1B08,X		  ; 3C 08 1B
	BRK $1B			  ; 00 1B
	PHP				  ; 08
	ORA $0704			; 0D 04 07
	BRK $35			  ; 00 35
	JSR $2037			; 20 37 20
	AND $20			  ; 37 20
	AND $24			  ; 37 24
	ORA $131713,X		; 1F 13 17 13
	PHD				  ; 0B
	ORA #$07			 ; 09 07
	ORA $0C			  ; 07 0C
	PHP				  ; 08
	TRB $3C08			; 1C 08 3C
	PHP				  ; 08
	JSR ($E808,X)		; FC 08 E8
	BRK $E8			  ; 00 E8
	BRK $D0			  ; 00 D0
	BRK $E0			  ; 00 E0
	BRK $F4			  ; 00 F4
	TSB $F4			  ; 04 F4
	TRB $F4			  ; 14 F4
	BIT $F4,X			; 34 F4
	PEA $E8F8			; F4 F8 E8
	SED				  ; F8
	INX				  ; E8
	BEQ $15CE			; F0 D0
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_16
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_16:
	COP $21			  ; 02 21 | Unknown operation
	BRK $5D			  ; 00 5D | Software interrupt
	BRK $22			  ; 00 22 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA $000F00,X		; 1F 00 0F 00 | Logical OR with accumulator
	ORA $00			  ; 03 00 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	ORA $00			  ; 03 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $1E			  ; 00 1E | Software interrupt
	BRK $0E			  ; 00 0E | Software interrupt
	AND $7719,Y		  ; 39 19 77 | Logical AND with accumulator
	EOR $BB,X			; 55 BB | Unknown operation
	MVP $08AA			; 44 AA 08 | Unknown operation
	EOR $02,X			; 55 02 | Unknown operation
	TCD				  ; 5B | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $37081E,X		; 1F 1E 08 37 | Logical OR with accumulator
	ORA $6E			  ; 11 6E | Logical OR with accumulator
	ORA $EE			  ; 11 EE | Logical OR with accumulator
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $7F			  ; 00 7F | Software interrupt
	COP $7D			  ; 02 7D | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	SED				  ; F8 | Unknown operation
	BRK $B0			  ; 00 B0 | Software interrupt
	JMP $EA5C			; 4C 5C EA | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	LDA $BD0A,X		  ; BD 0A BD | Load value into accumulator
	BRL $96E6			; 82 57 80 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	BRK $00			  ; 00 00 | Software interrupt
	CPY #$C0			 ; C0 C0 | Unknown operation
	BRK $FC			  ; 00 FC | Software interrupt
	PHA				  ; 48 | Push accumulator to stack
	LDX $08,Y			; B6 08 | Load X register
	SBC $48			  ; F7 48 | Unknown operation
	SBC $02			  ; F7 02 | Unknown operation
	SBC $FE20,X		  ; FD 20 FE | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt

	BRK $00			  ; 00 00
	ORA $00			  ; 07 00
	ORA $0E			  ; 07 0E
	TSB $121B			; 0C 1B 12
	ADC $FB54,X		  ; 7D 54 FB
	TSB $2A			  ; 04 2A
	BRK $59			  ; 00 59
	BRK $00			  ; 00 00
	ORA $07			  ; 07 07
	ASL $09			  ; 06 09
	PHP				  ; 08
	ORA $10			  ; 17 10
	ADC $00AF50		  ; 6F 50 AF 00
	AND $007F04,X		; 3F 04 7F 00
	BRK $BE			  ; 00 BE
	BRK $AC			  ; 00 AC
	EOR $56			  ; 53 56
	XCE				  ; FB
	STA $EF			  ; 81 EF
	LDY $D3			  ; A4 D3
	BPL $1677			; 10 A9
	PHP				  ; 08
	ASL $0000,X		  ; 1E 00 00
	BEQ $1684			; F0 B0
	BRK $FF			  ; 00 FF
	EOR $AD			  ; 52 AD
	STA $7E			  ; 81 7E
	BRA $175B			; 80 7F
	COP $BF			  ; 02 BF
	ORA #$17			 ; 09 17
	BRA $16E2			; 80 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1728			; 80 40
	RTI				  ; 40
	LDY #$C0			 ; A0 C0
	LDY #$A0			 ; A0 A0
	BVS $16EF			; 70 00
	BVS $1671			; 70 80
	BRA $16F3			; 80 00
	BRK $00			  ; 00 00
	BRA $16F7			; 80 00
	CPY #$00			 ; C0 00
	CPX #$80			 ; E0 80
	RTS				  ; 60
	JSR $80D0			; 20 D0 80
	BEQ $1701			; F0 00
	BRK $07			  ; 00 07
	BRK $07			  ; 00 07
	ASL $3B1C,X		  ; 1E 1C 3B
	JSL $7B257D		  ; 22 7D 25 7B
	COP $53			  ; 02 53
	ORA $2E			  ; 01 2E
	BRK $00			  ; 00 00
	ORA $07			  ; 07 07
	ASL $19			  ; 06 19
	CLC				  ; 18
	AND $20			  ; 27 20
	EOR $025E21,X		; 5F 21 5E 02
	ADC $3F10,X		  ; 7D 10 3F
	BRK $00			  ; 00 00
	LDX $AD01,Y		  ; BE 01 AD
	EOR $D2			  ; 52 D2
	SBC $F681,X		  ; FD 81 F6
	JSR $18D8			; 20 D8 18
	LDA $06			  ; A7 06
	TXY				  ; 9B
	BRK $00			  ; 00 00
	BEQ $16E5			; F0 B1
	BRK $FF			  ; 00 FF
	BNE $1767			; D0 2F
	BRA $17B9			; 80 7F
	ORA $FF			  ; 01 FF
	BRK $BF			  ; 00 BF
	COP $9D			  ; 02 9D
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $E0			  ; 00 E0
	CPX #$10			 ; E0 10
	BPL $16F2			; 10 A8
	BCC $1734			; 90 E8
	JSR $00B0			; 20 B0 00
	BNE $1751			; D0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPX #$00			 ; E0 00
	BEQ $1759			; F0 00
	CLV				  ; B8
	BRA $17D4			; 80 78
	RTS				  ; 60
	BNE $177F			; D0 20
	BEQ $1761			; F0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $03			  ; 03 03
	ORA $04			  ; 07 04
	ORA $000E00		  ; 0F 00 0E 00
	ORA $01			  ; 11 01
	AND $000000		  ; 2F 00 00 00
	BRK $00			  ; 00 00
	ORA $03			  ; 03 03
	TSB $04			  ; 04 04
	PHD				  ; 0B
	BRK $0F			  ; 00 0F
	TSB $111F			; 0C 1F 11
	ROL $0000,X		  ; 3E 00 00
	TDC				  ; 7B
	BRA $177F			; 80 FA
	SBC $0D			  ; E5 0D
	SBC $01ED2A,X		; FF 2A ED 01
	DEC				  ; 3A
	LDY #$51			 ; A0 51
	BRK $A0			  ; 00 A0
	BRK $00			  ; 00 00
	ADC $1FE0FB,X		; 7F FB E0 1F
	ORA $28F2			; 0D F2 28
	CMP $00			  ; D7 00
	XCE				  ; FB
	BRK $F1			  ; 00 F1
	BRK $A0			  ; 00 A0
	BRK $00			  ; 00 00
	CPX #$1E			 ; E0 1E
	DEC $C123,X		  ; DE 23 C1
	SBC $80E360,X		; FF 60 E3 80
	JMP ($9F7C,X)		; 7C 7C 9F
	ORA $6F			  ; 12 6F
	BRK $00			  ; 00 00
	BRK $1E			  ; 00 1E
	COP $FD			  ; 02 FD
	CMP $3E			  ; C1 3E
	RTS				  ; 60
	STA $1CFF01,X		; 9F 01 FF 1C
	SBC $02			  ; E3 02
	ADC $0000,X		  ; 7D 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1788			; 80 C0
	BRA $178A			; 80 C0
	BRK $C0			  ; 00 C0
	BRK $20			  ; 00 20
	RTI				  ; 40
	BNE $17D1			; D0 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRA $1757			; 80 80
	RTI				  ; 40
	BRA $181A			; 80 40
	BRK $C0			  ; 00 C0
	CPY #$E0			 ; C0 E0
	RTS				  ; 60
	BCS $17E1			; B0 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $02			  ; 03 02
	ORA $022000,X		; 1F 00 20 02
	EOR $AE04,X		  ; 5D 04 AE
	TSB $AE			  ; 04 AE
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $02			  ; 01 02
	COP $1D			  ; 02 1D
	TSB $203F			; 0C 3F 20
	ADC $04EA04,X		; 7F 04 EA 04
	NOP				  ; EA

;==============================================================================
; GeneralPurpose_18
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_18:
	BRK $00			  ; 00 00 | Software interrupt
	TDC				  ; 7B | Unknown operation
	BRA $17FF			; 80 FA | Unknown operation
	CMP $0D			  ; C5 0D | Compare with accumulator
	SBC $207D70,X		; FF 70 7D 20 | Unknown operation
	BNE $184D			; D0 40 | Branch if not equal (zero flag clear)
	LDY #$00			 ; A0 00 | Load Y register
	RTI				  ; 40 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ADC $3FC0FB,X		; 7F FB C0 3F | Unknown operation
	ORA $70F2			; 0D F2 70 | Logical OR with accumulator
	STA $F000			; 8D 00 F0 | Store accumulator to memory
	BRK $E0			  ; 00 E0 | Software interrupt
	BRK $40			  ; 00 40 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	CPX #$1F			 ; E0 1F | Unknown operation
	CMP $FFE023,X		; DF 23 E0 FF | Compare with accumulator
	LDY #$60			 ; A0 60 | Load Y register
	RTS				  ; 60 | Return from local function
	STA $096F1F,X		; 9F 1F 6F 09 | Store accumulator to memory
	ORA $00			  ; 17 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	ORA $E0FC03,X		; 1F 03 FC E0 | Logical OR with accumulator
	ORA $00DF22,X		; 1F 22 DF 00 | Logical OR with accumulator
	SBC $01700F,X		; FF 0F 70 01 | Unknown operation
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left
	BRK $00			  ; 00 00 | Software interrupt
	BRK $80			  ; 00 80 | Software interrupt
	BRK $E0			  ; 00 E0 | Software interrupt
	BRK $18			  ; 00 18 | Software interrupt
	BRK $E4			  ; 00 E4 | Software interrupt
	BRK $9A			  ; 00 9A | Software interrupt
	BRA $1814			; 80 C4 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $80			  ; 00 80 | Software interrupt
	BRK $E0			  ; 00 E0 | Software interrupt
	CPY #$F8			 ; C0 F8 | Unknown operation
	BRK $FC			  ; 00 FC | Software interrupt
	BRK $9E			  ; 00 9E | Software interrupt
	BRA $18A4			; 80 44 | Unknown operation
	TSB $B6			  ; 04 B6 | Unknown operation
	BRK $D4			  ; 00 D4 | Software interrupt
	BRK $28			  ; 00 28 | Software interrupt
	BRK $28			  ; 00 28 | Software interrupt
	BRK $28			  ; 00 28 | Software interrupt
	BRK $14			  ; 00 14 | Software interrupt
	BRK $0C			  ; 00 0C | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt

	BRK $00			  ; 00 00
	TSB $FA			  ; 04 FA
	PHP				  ; 08
	JMP $3810			; DC 10 38
	BPL $18B0			; 10 38
	BRK $38			  ; 00 38
	BRK $1C			  ; 00 1C
	BRK $0C			  ; 00 0C
	BRK $00			  ; 00 00
	MVP $50AD			; 44 AD 50
	INC $00			  ; E6 00
	MVN $1400			; 54 00 14
	BRK $14			  ; 00 14
	BRK $14			  ; 00 14
	BRK $28			  ; 00 28
	BRK $10			  ; 00 10
	TRB $FB			  ; 14 FB
	PHA				  ; 48
	LDX $5C08,Y		  ; BE 08 5C
	PHP				  ; 08
	TRB $1C00			; 1C 00 1C
	BRK $1C			  ; 00 1C
	BRK $38			  ; 00 38
	BRK $10			  ; 00 10
	BRK $76			  ; 00 76
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BRK $14			  ; 00 14
	BRK $08			  ; 00 08
	BRK $00			  ; 00 00
	PHP				  ; 08
	ROR $3810,X		  ; 7E 10 38
	BPL $18EE			; 10 38
	BRK $38			  ; 00 38
	BRK $38			  ; 00 38
	BRK $1C			  ; 00 1C
	BRK $08			  ; 00 08
	BRK $00			  ; 00 00
	TSB $0F			  ; 04 0F
	TSB $0E			  ; 04 0E
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	TSB $0B			  ; 04 0B
	TSB $0A			  ; 04 0A
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $A0			  ; 00 A0
	BRK $40			  ; 00 40
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	RTI				  ; 40
	CPX #$40			 ; E0 40
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPX #$00			 ; E0 00
	CPY #$00			 ; C0 00
	BRA $18FF			; 80 00
	BRK $08			  ; 00 08
	EOR $08,X			; 55 08
	LDY $A800,X		  ; BC 00 A8
	BRK $A0			  ; 00 A0
	BRK $50			  ; 00 50
	BRK $30			  ; 00 30
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	JSR $487D			; 20 7D 48
	PEA $E840			; F4 40 E8
	BRK $E0			  ; 00 E0
	BRK $70			  ; 00 70
	BRK $30			  ; 00 30
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $07			  ; 01 07
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $50			  ; 00 50
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $190A			; 10 B8
	BPL $198C			; 10 38
	BRK $38			  ; 00 38
	BRK $70			  ; 00 70
	BRK $20			  ; 00 20
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $53			  ; 01 53
	BRK $51			  ; 00 51
	BRK $50			  ; 00 50
	BRK $28			  ; 00 28
	BRK $10			  ; 00 10
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	AND $72			  ; 21 72
	BRK $71			  ; 00 71
	BRK $70			  ; 00 70
	BRK $38			  ; 00 38
	BRK $10			  ; 00 10
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA #$1F			 ; 09 1F
	BRK $09			  ; 00 09
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	ORA $00,X			; 15 00
	PHP				  ; 08
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	TSB $0B			  ; 04 0B
	TSB $0B			  ; 04 0B
	BRK $0F			  ; 00 0F
	TSB $0A			  ; 04 0A
	BRK $00			  ; 00 00
	TDC				  ; 7B
	BRA $19C7			; 80 82
	SBC $1F1D,X		  ; FD 1D 1F
	RTI				  ; 40
	LDA $4180,X		  ; BD 80 41
	BRA $1A8E			; 80 40
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	ADC $7F80FB,X		; 7F FB 80 7F
	ORA $00E2,X		  ; 1D E2 00
	SBC $C100,X		  ; FD 00 C1
	BRK $C0			  ; 00 C0
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	CPX #$1F			 ; E0 1F
	CLD				  ; D8
	PLP				  ; 28
	BEQ $1A67			; F0 FF
	CPY #$3F			 ; C0 3F
	AND $3B04C3,X		; 3F C3 04 3B
	TSB $0E			  ; 04 0E
	BRK $00			  ; 00 00
	BRK $1F			  ; 00 1F
	PHP				  ; 08
	SBC $F0			  ; F7 F0
	ORA $03FF00		  ; 0F 00 FF 03
	JSR ($3F00,X)		; FC 00 3F
	TSB $0A			  ; 04 0A
	BRK $FC			  ; 00 FC
	BRK $02			  ; 00 02
	BRA $1A83			; 80 FD
	BRK $83			  ; 00 83
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1A4E			; 80 C0
	RTI				  ; 40
	CPX #$00			 ; E0 00
	JSR ($FE38,X)		; FC 38 FE
	BRA $1B15			; 80 7F
	BRK $83			  ; 00 83
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1ADE			; 80 40
	RTI				  ; 40
	LDY #$00			 ; A0 00
	BRK $00			  ; 00 00
	BIT $4220,X		  ; 3C 20 42
	MVP $0099			; 44 99 00
	LDA $00			  ; A5 00
	LDX #$00			 ; A2 00
	WDM $00			  ; 42 00
	ORA $00			  ; 03 00
	BRK $00			  ; 00 00
	BIT $7E1C,X		  ; 3C 1C 7E
	JSL $E700FF		  ; 22 FF 00 E7
	BRK $E3			  ; 00 E3
	BRK $43			  ; 00 43
	BRK $03			  ; 00 03
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $0D			  ; 00 0D
	CPX #$12			 ; E0 12
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $0F			  ; 00 0F
	BRK $1E			  ; 00 1E

;==============================================================================
; GeneralPurpose_1B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1B:
	BRK $00			  ; 00 00 | Software interrupt
	BRK $78			  ; 00 78 | Software interrupt
	BRK $84			  ; 00 84 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	ADC $80			  ; 72 80 | Unknown operation
	LSR				  ; 4A | Unknown operation
	BRK $84			  ; 00 84 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $78			  ; 00 78 | Software interrupt
	SEC				  ; 38 | Set carry flag
	JSR ($FE84,X)		; FC 84 FE | Call local function
	BRK $CE			  ; 00 CE | Software interrupt
	BRK $84			  ; 00 84 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	TRB $007E			; 1C 7E 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BPL $1B65			; 10 00 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BRK $28			  ; 00 28 | Software interrupt
	BRK $14			  ; 00 14 | Software interrupt
	BRK $14			  ; 00 14 | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $10			  ; 00 10 | Software interrupt
	BPL $1BAE			; 10 38 | Unknown operation
	BPL $1BB0			; 10 38 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	TRB $1C08			; 1C 08 1C | Unknown operation
	TSB $0E			  ; 04 0E | Unknown operation
	TSB $0E			  ; 04 0E | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $18			  ; 00 18 | Software interrupt
	BRK $14			  ; 00 14 | Software interrupt
	BRK $14			  ; 00 14 | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $0A			  ; 00 0A | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $18			  ; 00 18 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	TRB $1C08			; 1C 08 1C | Unknown operation
	TSB $0E			  ; 04 0E | Unknown operation
	TSB $0E			  ; 04 0E | Unknown operation

	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	BPL $1BEE			; 10 38
	BPL $1BF0			; 10 38
	JSR $2070			; 20 70 20
	BVS $1BDD			; 70 20
	BVS $1BDF			; 70 20
	BVS $1BC1			; 70 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	BRK $14			  ; 00 14
	BRK $14			  ; 00 14
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BRK $28			  ; 00 28
	BRK $50			  ; 00 50
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	PHP				  ; 08
	TRB $1C08			; 1C 08 1C
	BPL $1C12			; 10 38
	BPL $1C14			; 10 38
	BPL $1C16			; 10 38
	JSR $0270			; 20 70 02
	ORA $00			  ; 07 00
	ORA $00			  ; 03 00
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $40			  ; 00 40
	LDY #$00			 ; A0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	; Skipped 32 bytes of data
	PHP				  ; 08
	ORA $08,X			; 15 08
	ORA $08,X			; 15 08
	TRB $04			  ; 14 04
	ASL				  ; 0A
	BRK $06			  ; 00 06
	JSL $8B4D9D		  ; 22 9D 4D 8B
	BRA $1CE3			; 80 7D
	BRA $1C28			; 80 C0
	BRA $1CAA			; 80 40
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $FF			  ; 00 FF
	ORA #$F6			 ; 09 F6
	BRK $FD			  ; 00 FD
	BRA $1CB8			; 80 40
	BRK $C0			  ; 00 C0
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BEQ $1CBE			; F0 3C
	CPY #$FF			 ; C0 FF
	ADC $790687,X		; 7F 87 06 79
	COP $05			  ; 02 05
	COP $07			  ; 02 07
	COP $07			  ; 02 07
	BRK $02			  ; 00 02
	BMI $1C5E			; 30 CC
	CPY #$3F			 ; C0 3F
	ORA $F8			  ; 07 F8
	BRK $7F			  ; 00 7F
	BRK $07			  ; 00 07
	COP $05			  ; 02 05
	COP $05			  ; 02 05
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1C68			; 80 C0
	RTI				  ; 40
	CPX #$40			 ; E0 40
	CPX #$40			 ; E0 40
	CPX #$00			 ; E0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1CF8			; 80 40
	RTI				  ; 40
	LDY #$40			 ; A0 40
	LDY #$40			 ; A0 40
	LDY #$00			 ; A0 00
	RTI				  ; 40
	BRK $3D			  ; 00 3D
	BRK $05			  ; 00 05
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $01			  ; 00 01
	BRK $07			  ; 00 07
	COP $3F			  ; 02 3F
	BRK $07			  ; 00 07
	ORA $03			  ; 01 03
	ORA $03			  ; 01 03
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $07			  ; 00 07
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $40			  ; 00 40
	TSC				  ; 3B
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $C0			  ; 00 C0
	AND $0100FB,X		; 3F FB 00 01
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $05			  ; 00 05
	TSB $09			  ; 04 09
	CPX #$12			 ; E0 12
	BRK $01			  ; 00 01
	ORA $03			  ; 01 03
	ORA $03			  ; 01 03
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $07			  ; 00 07
	BRK $0F			  ; 00 0F
	BRK $1E			  ; 00 1E
	BRK $70			  ; 00 70
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $F0			  ; 00 F0
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $07			  ; 00 07
	ORA $0E			  ; 07 0E
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $07			  ; 00 07
	ASL $09			  ; 06 09
	BRK $40			  ; 00 40
	BRK $40			  ; 00 40
	BRK $40			  ; 00 40
	BRK $40			  ; 00 40
	BRK $40			  ; 00 40
	BRK $40			  ; 00 40
	BRK $A0			  ; 00 A0
	TXY				  ; 9B
	JSR $C080			; 20 80 C0
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRK $C0			  ; 00 C0
	BRK $E0			  ; 00 E0
	ORA $0A00FB,X		; 1F FB 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BPL $1D92			; 10 04
	INX				  ; E8
	ORA $04			  ; 07 04
	ASL $0E04			; 0E 04 0E
	BRK $0E			  ; 00 0E
	BRK $0E			  ; 00 0E
	BRK $0E			  ; 00 0E
	BRK $0E			  ; 00 0E
	BRK $0C			  ; 00 0C
	BRK $1F			  ; 00 1F
	BRK $00			  ; 00 00
	BRK $0C			  ; 00 0C
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $0A			  ; 00 0A
	BRK $00			  ; 00 00
	BRK $0C			  ; 00 0C
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E
	BRK $00			  ; 00 00
	BRK $30			  ; 00 30
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $50			  ; 00 50
	BRK $00			  ; 00 00
	BRK $30			  ; 00 30
	JSR $2070			; 20 70 20
	BVS $1DF9			; 70 20
	BVS $1DFB			; 70 20
	BVS $1DFD			; 70 20
	BVS $1DFF			; 70 20
	BVS $1DE1			; 70 00
	BRK $00			  ; 00 00
	ASL $00			  ; 06 00
	ORA $00			  ; 05 00
	ORA $00			  ; 05 00
	ORA $00			  ; 05 00
	ORA $00			  ; 05 00
	ASL				  ; 0A
	BRK $0A			  ; 00 0A
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	COP $07			  ; 02 07
	COP $07			  ; 02 07
	COP $07			  ; 02 07
	COP $07			  ; 02 07
	TSB $0E			  ; 04 0E
	TSB $0E			  ; 04 0E

;==============================================================================
; GeneralPurpose_1E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1E:
	BRK $00			  ; 00 00 | Software interrupt
	BRK $60			  ; 00 60 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $50			  ; 00 50 | Software interrupt
	BRK $50			  ; 00 50 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $60			  ; 00 60 | Software interrupt
	RTI				  ; 40 | Unknown operation
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$20			 ; E0 20 | Unknown operation
	BVS $1E3F			; 70 20 | Unknown operation
	BVS $1E21			; 70 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left
	ORA $00			  ; 05 00 | Logical OR with accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator
	ASL				  ; 0A | Arithmetic shift left
	BRK $14			  ; 00 14 | Software interrupt
	BRK $14			  ; 00 14 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $06			  ; 00 06 | Software interrupt
	COP $07			  ; 02 07 | Unknown operation
	COP $07			  ; 02 07 | Unknown operation
	COP $07			  ; 02 07 | Unknown operation
	TSB $0E			  ; 04 0E | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	TRB $1C08			; 1C 08 1C | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $60			  ; 00 60 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $A0			  ; 00 A0 | Software interrupt
	BRK $50			  ; 00 50 | Software interrupt
	BRK $28			  ; 00 28 | Software interrupt
	BRK $28			  ; 00 28 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $60			  ; 00 60 | Software interrupt
	RTI				  ; 40 | Unknown operation
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$20			 ; E0 20 | Unknown operation
	BVS $1E6D			; 70 10 | Unknown operation
	SEC				  ; 38 | Set carry flag

	SEC				  ; 38
	BPL $1E98			; 10 38
	ASL $09			  ; 06 09
	PHP				  ; 08
	ORA $081D08,X		; 1F 08 1D 08
	ORA $1C08,X		  ; 1D 08 1C
	TSB $0E			  ; 04 0E
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $0F			  ; 00 0F
	PHP				  ; 08
	ORA $08			  ; 17 08
	ORA $08,X			; 15 08
	ORA $08,X			; 15 08
	TRB $04			  ; 14 04
	ASL				  ; 0A
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	JSL $8B4D9D		  ; 22 9D 4D 8B
	BRA $1F03			; 80 7D
	BRA $1E48			; 80 C0
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $FF			  ; 00 FF
	ORA #$F6			 ; 09 F6
	BRK $FD			  ; 00 FD
	BRA $1ED8			; 80 40
	BRK $80			  ; 00 80
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BEQ $1EDE			; F0 3C
	CMP $837CFF		  ; CF FF 7C 83
	COP $7D			  ; 02 7D
	COP $07			  ; 02 07
	COP $07			  ; 02 07
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BMI $1E7E			; 30 CC
	CMP $FF0030		  ; CF 30 00 FF
	BRK $7F			  ; 00 7F
	COP $05			  ; 02 05
	COP $05			  ; 02 05
	BRK $02			  ; 00 02
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1E86			; 80 C0
	RTI				  ; 40
	CPX #$40			 ; E0 40
	CPX #$00			 ; E0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $80			  ; 00 80
	BRA $1F16			; 80 40
	RTI				  ; 40
	LDY #$40			 ; A0 40
	LDY #$00			 ; A0 00
	RTI				  ; 40
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	ORA $112910,X		; 1F 10 29 11
	DEC				  ; 3A
	ORA $3B			  ; 11 3B
	BRK $11			  ; 00 11
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	ORA $00			  ; 17 00
	AND $2B10,Y		  ; 39 10 2B
	ORA $2A			  ; 11 2A
	BRK $11			  ; 00 11
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_1F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1F:
	COP $DD			  ; 02 DD | Unknown operation
	CMP $002F			; CD 2F 00 | Compare with accumulator
	CMP $8000,X		  ; DD 00 80 | Compare with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	; Skipped 32 bytes of data
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	AND $C8			  ; 37 C8 | Logical AND with accumulator
	CPY #$3F			 ; C0 3F | Unknown operation
	BRK $FF			  ; 00 FF | Software interrupt
	BRK $3F			  ; 00 3F | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $80			  ; 00 80 | Software interrupt
	BRA $1F04			; 80 C0 | Unknown operation
	RTI				  ; 40 | Unknown operation
	CPX #$40			 ; E0 40 | Unknown operation
	CPX #$00			 ; E0 00 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRA $1ED3			; 80 80 | Unknown operation
	RTI				  ; 40 | Unknown operation
	RTI				  ; 40 | Unknown operation

	RTI				  ; 40
;==============================================================================
; Function Index (16 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_05
; GeneralPurpose_06
; GeneralPurpose_07
; GeneralPurpose_08
; GeneralPurpose_0A
; GeneralPurpose_0B
; GeneralPurpose_0E
; GeneralPurpose_12
; GeneralPurpose_13
; GeneralPurpose_14
; GeneralPurpose_16
; GeneralPurpose_18
; GeneralPurpose_1B
; GeneralPurpose_1E
; GeneralPurpose_1F
;==============================================================================