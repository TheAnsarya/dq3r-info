;==============================================================================
; Dragon Quest III - Field 04
;==============================================================================
; File: field_04.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Field System (Bank $04)
; Comprehensive code extraction


.segment "FIELD_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
	AND $00			  ; 23 00 | Logical AND with accumulator
	; Skipped 20 bytes of data
	BRK $00			  ; 00 00 | Software interrupt
	SBC $FFFFFF,X		; FF FF FF FF | Unknown operation
	ORA $000000		  ; 0F 00 00 00 | Logical OR with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $71			  ; 00 71 | Software interrupt
	ORA $01			  ; 01 01 | Logical OR with accumulator
	TSB $00			  ; 04 00 | Unknown operation
	COP $24			  ; 02 24 | Unknown operation
	BVC $006E			; 50 40 | Unknown operation
	CMP $B80004		  ; CF 04 00 B8 | Compare with accumulator
	AND $040201		  ; 2F 01 02 04 | Logical AND with accumulator
	


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
	PHP				  ; 08 | Push processor status to stack
	LDY #$26			 ; A0 26 | Load Y register
	BRA $FFD5			; 80 9A | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	WDM $42			  ; 42 42 | Unknown operation
	AND $30524F		  ; 2F 4F 52 30 | Logical AND with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	TSB $0843			; 0C 43 08 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	ADC $01			  ; 72 01 | Unknown operation
	ORA $06			  ; 01 06 | Logical OR with accumulator
	BRK $03			  ; 00 03 | Software interrupt
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from local function
	CPY #$C3			 ; C0 C3 | Unknown operation
	ASL $00			  ; 06 00 | Arithmetic shift left
	CLV				  ; B8 | Unknown operation
	ORA $040201,X		; 1F 01 02 04 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_002
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_002:
	PHP				  ; 08 | Push processor status to stack
	BPL $007E			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0061			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $10			  ; 00 10 | Software interrupt
	AND #$00			 ; 29 00 | Logical AND with accumulator
	BRK $0C			  ; 00 0C | Software interrupt
	STA $09			  ; 83 09 | Store accumulator to memory
	BRK $08			  ; 00 08 | Software interrupt
	ADC $01			  ; 73 01 | Unknown operation
	COP $08			  ; 02 08 | Unknown operation
	BRK $03			  ; 00 03 | Software interrupt
	BMI $FFF7			; 30 80 | Unknown operation
	RTI				  ; 40 | Unknown operation
	CMP $05			  ; D2 05 | Compare with accumulator
	BRK $B8			  ; 00 B8 | Software interrupt
	AND $01			  ; 33 01 | Logical AND with accumulator
	PEI $04			  ; D4 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
	PHP				  ; 08 | Push processor status to stack
	BPL $00C3			; 10 40 | Unknown operation
	EOR $0080			; 4D 80 00 | Unknown operation
	BRK $F0			  ; 00 F0 | Software interrupt
	BRK $F0			  ; 00 F0 | Software interrupt
	BRK $10			  ; 00 10 | Software interrupt
	BPL $008E			; 10 00 | Unknown operation
	BRK $0C			  ; 00 0C | Software interrupt
	STA $0A			  ; 83 0A | Store accumulator to memory
	BRK $08			  ; 00 08 | Software interrupt
	STZ $01,X			; 74 01 | Unknown operation
	ORA $0C			  ; 03 0C | Logical OR with accumulator
	BRK $04			  ; 00 04 | Software interrupt
	BIT $80,X			; 34 80 | Unknown operation
	BRK $B1			  ; 00 B1 | Software interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left
	ADC $0103,Y		  ; 79 03 01 | Unknown operation
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
	PHP				  ; 08 | Push processor status to stack
	BPL $00C8			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $00AB			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $50			  ; 00 50 | Software interrupt
	JSR $0000			; 20 00 00 | Call local function
	ORA $0D83			; 0D 83 0D | Logical OR with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	ADC $01,X			; 75 01 | Unknown operation
	ORA $09			  ; 03 09 | Logical OR with accumulator
	BRK $04			  ; 00 04 | Software interrupt
	BIT $4070			; 2C 70 40 | Unknown operation
	LDA $BB0508		  ; AF 08 05 BB | Load value into accumulator
	ORA $01			  ; 01 01 | Logical OR with accumulator
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
	PHP				  ; 08 | Push processor status to stack
	BMI $00F0			; 30 23 | Unknown operation
	CPY #$8C			 ; C0 8C | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	ORA $01			  ; 01 01 | Logical OR with accumulator
	RTS				  ; 60 | Return from local function
	AND $00			  ; 21 00 | Logical AND with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	EOR $0C			  ; 41 0C | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	ROR $01,X			; 76 01 | Unknown operation
	ORA $0C			  ; 03 0C | Logical OR with accumulator
	BRK $05			  ; 00 05 | Software interrupt
	SEC				  ; 38 | Set carry flag
	BRA $00E7			; 80 00 | Unknown operation
	LDA $B80007,X		; BF 07 00 B8 | Load value into accumulator
	INC				  ; 1A | Unknown operation
	ORA $02			  ; 01 02 | Logical OR with accumulator
	LDY #$09			 ; A0 09 | Load Y register
	BPL $0112			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $00F5			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $800000		  ; 0F 00 00 80 | Logical OR with accumulator
	ORA $00			  ; 11 00 | Logical OR with accumulator
	BRK $0C			  ; 00 0C | Software interrupt
	STA $0F			  ; 83 0F | Store accumulator to memory
	BRK $08			  ; 00 08 | Software interrupt
	ADC $01			  ; 77 01 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	RTI				  ; 40 | Unknown operation
	BCC $00CC			; 90 C0 | Branch if carry clear
	LDA $0C			  ; B1 0C | Load value into accumulator
	BRK $B9			  ; 00 B9 | Software interrupt
	TSB $6A			  ; 04 6A | Unknown operation
	COP $10			  ; 02 10 | Unknown operation
	


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
	PHP				  ; 08 | Push processor status to stack
	LDY #$86			 ; A0 86 | Load Y register
	RTI				  ; 40 | Unknown operation
	BRA $011A			; 80 00 | Unknown operation
	BRK $0F			  ; 00 0F | Software interrupt
	ORA $1F			  ; 01 1F | Logical OR with accumulator
	BRK $10			  ; 00 10 | Software interrupt
	


;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
	PHP				  ; 08 | Push processor status to stack
	BRK $00			  ; 00 00 | Software interrupt
	ASL $0A43			; 0E 43 0A | Arithmetic shift left
	BRK $0C			  ; 00 0C | Software interrupt
	SEI				  ; 78 | Unknown operation
	ORA $04			  ; 01 04 | Logical OR with accumulator
	TRB $00			  ; 14 00 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BIT $00F0,X		  ; 3C F0 00 | Unknown operation
	BCS $0140			; B0 0D | Branch if carry set
	TSB $BA			  ; 04 BA | Unknown operation
	COP $06			  ; 02 06 | Unknown operation
	COP $04			  ; 02 04 | Unknown operation
	BVC $019E			; 50 63 | Unknown operation
	JSR $0180			; 20 80 01 | Call local function
	ORA $D0			  ; 03 D0 | Logical OR with accumulator
	BPL $0133			; 10 F1 | Unknown operation
	BPL $0144			; 10 00 | Unknown operation
	ADC $20			  ; 61 20 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $C4			  ; 00 C4 | Software interrupt
	ORA $00			  ; 17 00 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
	PHP				  ; 08 | Push processor status to stack
	ADC $0401,Y		  ; 79 01 04 | Unknown operation
	ASL $0600			; 0E 00 06 | Arithmetic shift left
	PHA				  ; 48 | Push accumulator to stack
	BCS $0116			; B0 C0 | Branch if carry set
	TYX				  ; BB | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BRK $B5			  ; 00 B5 | Software interrupt
	ORA $01,X			; 15 01 | Logical OR with accumulator
	COP $04			  ; 02 04 | Unknown operation
	BRK $13			  ; 00 13 | Software interrupt
	BRK $4C			  ; 00 4C | Software interrupt
	BRK $30			  ; 00 30 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BMI $0198			; 30 30 | Unknown operation
	BMI $017A			; 30 10 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BRK $00			  ; 00 00 | Software interrupt
	TSB $0C43			; 0C 43 0C | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	PLY				  ; 7A | Pull Y register from stack
	ORA $04			  ; 01 04 | Logical OR with accumulator
	CLC				  ; 18 | Clear carry flag
	BRK $08			  ; 00 08 | Software interrupt
	SEC				  ; 38 | Set carry flag
	LDY #$40			 ; A0 40 | Load Y register
	LDA $FF0F,X		  ; BD 0F FF | Load value into accumulator
	LDA $17			  ; B2 17 | Load value into accumulator
	ORA $42			  ; 01 42 | Logical OR with accumulator
	STY $08			  ; 84 08 | Store Y register
	BPL $01A8			; 10 22 | Unknown operation
	MVP $1088			; 44 88 10 | Unknown operation
	BRK $01			  ; 00 01 | Software interrupt
	BPL $018D			; 10 00 | Unknown operation
	BRK $01			  ; 00 01 | Software interrupt
	PLP				  ; 28 | Pull processor status from stack
	LDY #$11			 ; A0 11 | Load Y register
	ASL $1EC6			; 0E C6 1E | Arithmetic shift left
	BRK $0A			  ; 00 0A | Software interrupt
	TDC				  ; 7B | Unknown operation
	ORA $04			  ; 01 04 | Logical OR with accumulator
	TSB $0700			; 0C 00 07 | Unknown operation
	BVC $012F			; 50 90 | Unknown operation
	RTI				  ; 40 | Unknown operation
	LDA $0A			  ; B1 0A | Load value into accumulator
	BRK $B8			  ; 00 B8 | Software interrupt
	ORA $01			  ; 03 01 | Logical OR with accumulator
	COP $04			  ; 02 04 | Unknown operation
	BVC $01BD			; 50 13 | Unknown operation

	BVC $01BD			; 50 13
	JSR $8040			; 20 40 80
	BRK $00			  ; 00 00
	BRK $F0			  ; 00 F0
	BRK $00			  ; 00 00
	BVC $01C5			; 50 10
	TSB $00			  ; 04 00
	ORA $1587,X		  ; 1D 87 15
	BRK $08			  ; 00 08
	JMP ($0401,X)		; 7C 01 04
	ASL $0800			; 0E 00 08
	MVN $80C0			; 54 C0 80
	CMP $09			  ; D2 09
	ASL $79			  ; 06 79
	AND $6A			  ; 33 6A
	COP $A8			  ; 02 A8
	ORA #$10			 ; 09 10
	BRK $46			  ; 00 46
	BRK $18			  ; 00 18
	LDY #$0F			 ; A0 0F
	ORA $601010		  ; 0F 10 10 60
	AND $00			  ; 21 00
	BRK $01			  ; 00 01
	STX $14,Y			; 96 14
	BRK $08			  ; 00 08
	ADC $0501,X		  ; 7D 01 05
	TRB $00			  ; 14 00
	ORA #$60			 ; 09 60
	CPY #$40			 ; C0 40
	LDA $B9000C,X		; BF 0C 00 B9
	INC				  ; 1A
	ROR				  ; 6A

;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
	PHP				  ; 08 | Push processor status to stack
	TSB $08			  ; 04 08 | Unknown operation
	RTI				  ; 40 | Unknown operation
	JSR $0040			; 20 40 00 | Call local function
	COP $90			  ; 02 90 | Unknown operation
	ORA $100100,X		; 1F 00 01 10 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	ORA $00			  ; 11 00 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
	BRK $4D			  ; 00 4D | Software interrupt
	STA $19			  ; 83 19 | Store accumulator to memory
	BRK $08			  ; 00 08 | Software interrupt
	ROR $0601,X		  ; 7E 01 06 | Unknown operation
	AND $00			  ; 23 00 | Logical AND with accumulator
	TSB $9084			; 0C 84 90 | Unknown operation
	CMP $C9			  ; C1 C9 | Compare with accumulator
	PHD				  ; 0B | Unknown operation
	ORA $B8			  ; 07 B8 | Logical OR with accumulator
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Unknown operation
	STZ $04,X			; 74 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
	PHP				  ; 08 | Push processor status to stack
	BPL $023A			; 10 20 | Unknown operation
	BRA $01AA			; 80 8E | Unknown operation
	BRK $43			  ; 00 43 | Software interrupt
	AND $00			  ; 33 00 | Logical AND with accumulator
	BRK $03			  ; 00 03 | Software interrupt
	JSR $0010			; 20 10 00 | Call local function
	BRK $00			  ; 00 00 | Software interrupt
	CMP $32			  ; C1 32 | Compare with accumulator
	BRK $04			  ; 00 04 | Software interrupt
	ADC $1D0601,X		; 7F 01 06 1D | Unknown operation
	BRK $12			  ; 00 12 | Software interrupt
	SEI				  ; 78 | Unknown operation
	BRA $01F5			; 80 C1 | Unknown operation
	LDA $0F			  ; B2 0F | Load value into accumulator
	ORA $04			  ; 05 04 | Logical OR with accumulator
	ASL $01			  ; 06 01 | Arithmetic shift left
	COP $C8			  ; 02 C8 | Unknown operation
	


;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
	PHP				  ; 08 | Push processor status to stack
	BPL $025F			; 10 20 | Unknown operation
	BRA $01CD			; 80 8C | Unknown operation
	BRK $44			  ; 00 44 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	JSR $0021			; 20 21 00 | Call local function
	BRK $55			  ; 00 55 | Software interrupt
	EOR $1C			  ; 41 1C | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	BRA $0253			; 80 01 | Unknown operation
	STA $1D			  ; 87 1D | Store accumulator to memory
	BRK $0F			  ; 00 0F | Software interrupt
	BVS $0298			; 70 40 | Unknown operation
	RTI				  ; 40 | Unknown operation
	LDA $0B,X			; B5 0B | Load value into accumulator
	ASL $0AB7,X		  ; 1E B7 0A | Arithmetic shift left
	ORA $02			  ; 01 02 | Logical OR with accumulator
	TSB $F0			  ; 04 F0 | Unknown operation
	BPL $0224			; 10 C0 | Unknown operation
	EOR $00			  ; 43 00 | Unknown operation
	ORA $100000		  ; 0F 00 00 10 | Logical OR with accumulator
	BPL $027C			; 10 10 | Unknown operation
	JSR $0028			; 20 28 00 | Call local function
	BRK $03			  ; 00 03 | Software interrupt
	EOR $32			  ; 41 32 | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	STA $01			  ; 81 01 | Store accumulator to memory
	ASL $1A			  ; 06 1A | Arithmetic shift left
	BRK $0D			  ; 00 0D | Software interrupt
	BRA $026D			; 80 F0 | Unknown operation
	BRK $BC			  ; 00 BC | Software interrupt
	ORA $BF00			; 0D 00 BF | Logical OR with accumulator
	ORA $6A,X			; 15 6A | Logical OR with accumulator
	COP $14			  ; 02 14 | Unknown operation
	


;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
	PHP				  ; 08 | Push processor status to stack
	BPL $02A9			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	STA $02			  ; 81 02 | Store accumulator to memory
	CPY $0F			  ; C4 0F | Unknown operation
	ORA $00			  ; 01 00 | Logical OR with accumulator
	ORA $10			  ; 11 10 | Logical OR with accumulator
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	BRK $0D			  ; 00 0D | Software interrupt
	CMP $19			  ; D3 19 | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	BRL $0A9E			; 82 01 08 | Unknown operation
	AND $00			  ; 23 00 | Logical AND with accumulator
	TSB $C080			; 0C 80 C0 | Unknown operation
	CMP $C2			  ; C3 C2 | Compare with accumulator
	TSB $4D00			; 0C 00 4D | Unknown operation
	ASL $C001,X		  ; 1E 01 C0 | Arithmetic shift left
	TSB $08			  ; 04 08 | Unknown operation
	BRK $26			  ; 00 26 | Software interrupt
	BRK $98			  ; 00 98 | Software interrupt
	BRK $50			  ; 00 50 | Software interrupt
	BMI $02B4			; 30 00 | Unknown operation
	ORA $03			  ; 03 03 | Logical OR with accumulator
	BCC $02D9			; 90 21 | Branch if carry clear
	BRK $00			  ; 00 00 | Software interrupt
	EOR $1CE7			; 4D E7 1C | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	STA $01			  ; 83 01 | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
	PHP				  ; 08 | Push processor status to stack
	AND $00			  ; 23 00 | Logical AND with accumulator
	ASL $E058			; 0E 58 E0 | Arithmetic shift left
	BRA $0281			; 80 B8 | Unknown operation
	TRB $B412			; 1C 12 B4 | Unknown operation
	BPL $02CF			; 10 01 | Unknown operation
	COP $18			  ; 02 18 | Unknown operation
	BMI $02E2			; 30 10 | Unknown operation
	CPY #$80			 ; C0 80 | Unknown operation
	ORA $03			  ; 01 03 | Logical OR with accumulator
	BRK $33			  ; 00 33 | Software interrupt
	MVP $4443			; 44 43 44 | Unknown operation
	PER $0029			; 62 29 00 | Unknown operation
	BRK $C3			  ; 00 C3 | Software interrupt
	BNE $02FB			; D0 19 | Branch if not equal (zero flag clear)
	BRK $0A			  ; 00 0A | Software interrupt
	STY $01			  ; 84 01 | Store Y register
	ORA #$27			 ; 09 27 | Logical OR with accumulator
	BRK $12			  ; 00 12 | Software interrupt
	SEI				  ; 78 | Unknown operation
	CPY #$00			 ; C0 00 | Unknown operation
	CMP $08			  ; C5 08 | Compare with accumulator
	BRK $BA			  ; 00 BA | Software interrupt
	AND $01			  ; 21 01 | Logical AND with accumulator
	PEI $04			  ; D4 04 | Unknown operation
	BEQ $0309			; F0 12 | Branch if equal (zero flag set)
	CPY #$4B			 ; C0 4B | Unknown operation
	BRA $02FB			; 80 00 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BEQ $031E			; F0 20 | Branch if equal (zero flag set)
	JSR $0000			; 20 00 00 | Call local function
	CLC				  ; 18 | Clear carry flag
	BRK $00			  ; 00 00 | Software interrupt
	STA $188F,X		  ; 9D 8F 18 | Store accumulator to memory
	BRK $0A			  ; 00 0A | Software interrupt
	STA $01			  ; 85 01 | Store accumulator to memory
	ORA #$2F			 ; 09 2F | Logical OR with accumulator
	BRK $14			  ; 00 14 | Software interrupt
	LDY #$00			 ; A0 00 | Load Y register
	ORA $CA			  ; 01 CA | Logical OR with accumulator
	ASL $B900			; 0E 00 B9 | Arithmetic shift left
	PLP				  ; 28 | Pull processor status from stack
	ROR				  ; 6A | Unknown operation
	COP $74			  ; 02 74 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	JSR $8040			; 20 40 80 | Call local function
	ROL $0F84			; 2E 84 0F | Unknown operation
	COP $00			  ; 02 00 | Unknown operation
	JSR $0810			; 20 10 08 | Call local function

	JSR $0810			; 20 10 08
	BPL $0329			; 10 00
	ORA $23C3			; 0D C3 23
	BRK $04			  ; 00 04
	STX $01			  ; 86 01
	ORA #$2D			 ; 09 2D
	BRK $16			  ; 00 16
	BCC $0356			; 90 20
	ORA $C4			  ; 01 C4
	ASL $B314			; 0E 14 B3
	ORA $04026A,X		; 1F 6A 02 04

;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
	PHP				  ; 08 | Push processor status to stack
	BPL $0362			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0345			; 80 00 | Unknown operation
	BRK $0F			  ; 00 0F | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $10			  ; 00 10 | Software interrupt
	


;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
	SEP #$00			 ; E2 00 | Set processor status bits
	BRK $41			  ; 00 41 | Software interrupt
	CMP $19			  ; D3 19 | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	STA $01			  ; 87 01 | Store accumulator to memory
	ASL				  ; 0A | Arithmetic shift left
	AND $00,X			; 35 00 | Logical AND with accumulator
	ASL $60A8			; 0E A8 60 | Arithmetic shift left
	STA $B5			  ; 81 B5 | Store accumulator to memory
	BPL $0363			; 10 04 | Unknown operation
	LDX $0A,Y			; B6 0A | Load X register
	ORA $02			  ; 01 02 | Logical OR with accumulator
	TSB $08			  ; 04 08 | Unknown operation
	BPL $0327			; 10 C0 | Unknown operation
	LSR $00			  ; 46 00 | Unknown operation
	TCS				  ; 1B | Unknown operation
	LDY #$00			 ; A0 00 | Load Y register
	BRK $10			  ; 00 10 | Software interrupt
	BPL $03D0			; 10 60 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BPL $0373			; 10 00 | Unknown operation
	EOR $53			  ; 52 53 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BRK $08			  ; 00 08 | Software interrupt
	DEY				  ; 88 | Unknown operation
	ORA $0A			  ; 01 0A | Logical OR with accumulator
	SEC				  ; 38 | Set carry flag
	BRK $14			  ; 00 14 | Software interrupt
	LDY $4190			; AC 90 41 | Load CustomStatus1
	CMP $0F			  ; C5 0F | Compare with accumulator
	BRK $BB			  ; 00 BB | Software interrupt
	AND $6A			  ; 21 6A | Logical AND with accumulator
	COP $0C			  ; 02 0C | Unknown operation
	BVC $03BE			; 50 33 | Unknown operation
	CPY #$4B			 ; C0 4B | Unknown operation
	BRK $2F			  ; 00 2F | Software interrupt
	LDY $0F,X			; B4 0F | Load Y register
	SBC $22			  ; F2 22 | Unknown operation
	JSR $1850			; 20 50 18 | Call local function
	BPL $0398			; 10 00 | Unknown operation
	EOR $1EC3,X		  ; 5D C3 1E | Unknown operation
	BRK $0A			  ; 00 0A | Software interrupt
	BIT #$01			 ; 89 01 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	AND $00			  ; 21 00 | Logical AND with accumulator
	TSB $C080			; 0C 80 C0 | Unknown operation
	CMP $BF			  ; C3 BF | Compare with accumulator
	TSB $4D00			; 0C 00 4D | Unknown operation
	TCS				  ; 1B | Unknown operation

	TCS				  ; 1B
	ORA $C0			  ; 01 C0
	TSB $08			  ; 04 08
	BRK $26			  ; 00 26
	BRK $98			  ; 00 98
	BRK $52			  ; 00 52
	AND $11			  ; 31 11
	ORA $13			  ; 13 13
	STA $23			  ; 91 23
	BRK $00			  ; 00 00
	EOR $1CE7			; 4D E7 1C
	BRK $08			  ; 00 08
	TXA				  ; 8A
	ORA $0A			  ; 01 0A
	AND $1900,X		  ; 3D 00 19
	CPY $01C0			; CC C0 01
	LDA $13			  ; B3 13
	ORA #$B5			 ; 09 B5
	ASL $0F			  ; 06 0F
	COP $04			  ; 02 04

;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
	PHP				  ; 08 | Push processor status to stack
	BPL $03B6			; 10 E0 | Unknown operation
	EOR $80			  ; 41 80 | Unknown operation
	ORA $A1			  ; 07 A1 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	BPL $03EE			; 10 10 | Unknown operation
	BPL $0401			; 10 21 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $D6			  ; 01 D6 | Logical OR with accumulator
	AND $00			  ; 23 00 | Logical AND with accumulator
	


;==============================================================================
; GeneralPurpose_012
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_012:
	PHP				  ; 08 | Push processor status to stack
	


;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
	PHB				  ; 8B | Push data bank register
	ORA $0A			  ; 01 0A | Logical OR with accumulator
	AND $00			  ; 37 00 | Logical AND with accumulator
	ORA $8230C4		  ; 0F C4 30 82 | Logical OR with accumulator
	LDA $090411		  ; AF 11 04 09 | Load value into accumulator
	ORA $6A			  ; 01 6A | Logical OR with accumulator
	COP $80			  ; 02 80 | Unknown operation
	AND $10			  ; 21 10 | Logical AND with accumulator
	RTS				  ; 60 | Return from local function
	LSR $80			  ; 46 80 | Unknown operation
	BRK $24			  ; 00 24 | Software interrupt
	ORA $001024		  ; 0F 24 10 00 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	ROL				  ; 2A | Unknown operation
	BPL $0407			; 10 00 | Unknown operation
	ORA $E1			  ; 01 E1 | Logical OR with accumulator
	INC				  ; 1A | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	STY $0B01			; 8C 01 0B | Store Y register
	MVP $1E00			; 44 00 1E | Unknown operation
	LDY $C320,X		  ; BC 20 C3 | Load Y register
	CMP $0A			  ; D2 0A | Compare with accumulator
	BRK $03			  ; 00 03 | Software interrupt
	BIT $02,X			; 34 02 | Unknown operation
	COP $84			  ; 02 84 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	JSR $9840			; 20 40 98 | Call local function
	BRK $44			  ; 00 44 | Software interrupt
	ORA $02			  ; 01 02 | Logical OR with accumulator
	BRK $02			  ; 00 02 | Software interrupt
	BVC $044A			; 50 20 | Unknown operation
	BPL $045C			; 10 30 | Unknown operation
	LSR $378F			; 4E 8F 37 | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	STA $0B01			; 8D 01 0B | Store accumulator to memory
	EOR $00			  ; 41 00 | Unknown operation
	TRB $C0			  ; 14 C0 | Unknown operation
	BPL $03FD			; 10 C3 | Unknown operation
	LDY $1C,X			; B4 1C | Load Y register
	TSB $47			  ; 04 47 | Unknown operation
	ORA #$01			 ; 09 01 | Logical OR with accumulator
	BNE $0446			; D0 04 | Branch if not equal (zero flag clear)
	


;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
	PHP				  ; 08 | Push processor status to stack
	BPL $0485			; 10 40 | Unknown operation
	BRA $0461			; 80 1A | Unknown operation
	ORA $F002,Y		  ; 19 02 F0 | Logical OR with accumulator
	BRK $10			  ; 00 10 | Software interrupt
	AND $1431A0		  ; 2F A0 31 14 | Logical AND with accumulator
	BPL $04A7			; 10 55 | Unknown operation
	CMP $28,X			; D5 28 | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	STX $0B01			; 8E 01 0B | Store X register
	LSR $00			  ; 46 00 | Unknown operation
	ORA $C4			  ; 17 C4 | Logical OR with accumulator
	BVC $03E1			; 50 82 | Unknown operation
	LDA $0B1E12,X		; BF 12 1E 0B | Load value into accumulator
	INC				  ; 1A | Unknown operation
	ORA $02			  ; 01 02 | Logical OR with accumulator
	CPY #$08			 ; C0 08 | Unknown operation
	BPL $048A			; 10 20 | Unknown operation
	BRK $8C			  ; 00 8C | Software interrupt
	BRK $44			  ; 00 44 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	BVC $0495			; 50 21 | Unknown operation
	BVC $0486			; 50 10 | Unknown operation
	EOR $C5			  ; 45 C5 | Unknown operation
	ROL $00			  ; 26 00 | Unknown operation
	


;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
	PHP				  ; 08 | Push processor status to stack
	STA $3C0B01		  ; 8F 01 0B 3C | Store accumulator to memory
	BRK $1E			  ; 00 1E | Software interrupt
	JMP $0280			; DC 80 02 | Unknown operation
	CMP $0015			; CD 15 00 | Compare with accumulator
	LDA $2C			  ; B2 2C | Load value into accumulator
	COP $C0			  ; 02 C0 | Unknown operation
	TSB $08			  ; 04 08 | Unknown operation
	BPL $04AF			; 10 20 | Unknown operation
	BRK $98			  ; 00 98 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	AND $00			  ; 21 00 | Logical AND with accumulator
	BRK $02			  ; 00 02 | Software interrupt
	BPL $04C1			; 10 28 | Unknown operation
	BRA $04AB			; 80 10 | Unknown operation
	STA $3CE7,X		  ; 9D E7 3C | Store accumulator to memory
	BRK $06			  ; 00 06 | Software interrupt
	BCC $04A3			; 90 01 | Branch if carry clear
	PHD				  ; 0B | Unknown operation
	ORA $00			  ; 05 00 | Logical OR with accumulator
	LSR $503D,X		  ; 5E 3D 50 | Unknown operation
	COP $B7			  ; 02 B7 | Unknown operation
	RTI				  ; 40 | Unknown operation
	SBC $660DB4,X		; FF B4 0D 66 | Unknown operation
	BIT $08F4,X		  ; 3C F4 08 | Unknown operation
	JSR $0663			; 20 63 06 | Call local function
	


;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
	PHP				  ; 08 | Push processor status to stack
	BPL $04EF			; 10 37 | Unknown operation
	ORA $01			  ; 12 01 | Logical OR with accumulator
	ORA $11			  ; 11 11 | Logical OR with accumulator
	LDY #$27			 ; A0 27 | Load Y register
	BEQ $04F3			; F0 33 | Branch if equal (zero flag set)
	ADC $2B			  ; 73 2B | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BRK $02			  ; 00 02 | Software interrupt
	STA $01			  ; 91 01 | Store accumulator to memory
	TSB $0049			; 0C 49 00 | Unknown operation
	ORA $10DC,Y		  ; 19 DC 10 | Logical OR with accumulator
	EOR $C9			  ; 43 C9 | Unknown operation
	ORA $00			  ; 13 00 | Logical OR with accumulator
	CPX $27			  ; E4 27 | Unknown operation
	ORA $02			  ; 01 02 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
	PHP				  ; 08 | Push processor status to stack
	


;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
	PHP				  ; 08 | Push processor status to stack
	BPL $04F9			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $04DC			; 80 00 | Unknown operation
	BRK $11			  ; 00 11 | Software interrupt
	BPL $04F1			; 10 11 | Unknown operation
	ORA $01			  ; 11 01 | Logical OR with accumulator
	BPL $04E8			; 10 04 | Unknown operation
	BMI $0543			; 30 5D | Unknown operation
	EOR $23			  ; 53 23 | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	STA $01			  ; 92 01 | Store accumulator to memory
	TSB $004E			; 0C 4E 00 | Unknown operation
	ORA $C8			  ; 17 C8 | Logical OR with accumulator
	CPX #$06			 ; E0 06 | Unknown operation
	CMP $13			  ; C3 13 | Compare with accumulator
	ASL $1E6A,X		  ; 1E 6A 1E | Arithmetic shift left
	ORA $02			  ; 01 02 | Logical OR with accumulator
	PEA $D008			; F4 08 D0 | Push effective address
	AND $40			  ; 23 40 | Logical AND with accumulator
	BRA $0501			; 80 00 | Unknown operation
	TRB $00			  ; 14 00 | Unknown operation
	COP $02			  ; 02 02 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	JSR $1010			; 20 10 10 | Call local function
	STA $D7			  ; 85 D7 | Store accumulator to memory
	PLP				  ; 28 | Pull processor status from stack
	BRK $08			  ; 00 08 | Software interrupt
	STA $01			  ; 93 01 | Store accumulator to memory
	ORA $0052			; 0D 52 00 | Logical OR with accumulator
	AND $DC			  ; 23 DC | Logical AND with accumulator
	BEQ $055A			; F0 42 | Branch if equal (zero flag set)
	LDX $1D,Y			; B6 1D | Load X register
	ASL				  ; 0A | Arithmetic shift left
	LDA $0C,X			; B5 0C | Load value into accumulator
	ORA $02			  ; 01 02 | Logical OR with accumulator
	JMP $1008			; 4C 08 10 | Unknown operation
	RTS				  ; 60 | Return from local function
	


;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
	REP #$84			 ; C2 84 | Clear processor status bits
	ORA #$E4			 ; 09 E4 | Logical OR with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	BPL $053C			; 10 11 | Unknown operation
	BVC $054D			; 50 20 | Unknown operation
	BVC $0540			; 50 11 | Unknown operation
	LSR $EA,X			; 56 EA | Unknown operation
	AND $00			  ; 23 00 | Logical AND with accumulator
	


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
	PHP				  ; 08 | Push processor status to stack
	STY $01,X			; 94 01 | Store Y register
	ORA $0048			; 0D 48 00 | Logical OR with accumulator
	AND $B4			  ; 23 B4 | Logical AND with accumulator
	BRA $057F			; 80 42 | Unknown operation
	DEX				  ; CA | Unknown operation
	TRB $00			  ; 14 00 | Unknown operation
	LDX $28,Y			; B6 28 | Load X register
	ORA $AE			  ; 01 AE | Logical OR with accumulator
	TSB $50			  ; 04 50 | Unknown operation
	ORA $E0			  ; 13 E0 | Logical OR with accumulator
	LSR				  ; 4A | Unknown operation
	BRA $0576			; 80 2B | Unknown operation
	LDX #$10			 ; A2 10 | Load X register
	BEQ $055F			; F0 10 | Branch if equal (zero flag set)
	BPL $05A1			; 10 50 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BMI $0564			; 30 10 | Unknown operation
	LSR $2DD7,X		  ; 5E D7 2D | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	STA $01,X			; 95 01 | Store accumulator to memory
	ORA $0052			; 0D 52 00 | Logical OR with accumulator
	BIT $F0			  ; 24 F0 | Unknown operation
	BMI $04E4			; 30 82 | Unknown operation
	CMP #$14			 ; C9 14 | Compare with accumulator
	ASL $27BA,X		  ; 1E BA 27 | Arithmetic shift left
	COP $02			  ; 02 02 | Unknown operation
	STY $1009			; 8C 09 10 | Store Y register
	RTS				  ; 60 | Return from local function
	CPY $0098			; CC 98 00 | Unknown operation
	STZ $10			  ; 64 10 | Unknown operation
	ORA $21			  ; 12 21 | Logical OR with accumulator
	ORA $11			  ; 12 11 | Logical OR with accumulator
	JSR $3200			; 20 00 32 | Call local function
	STX $64,Y			; 96 64 | Store X register
	AND $00			  ; 37 00 | Logical AND with accumulator
	


;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
	PHP				  ; 08 | Push processor status to stack
	STX $01,Y			; 96 01 | Store X register
	ASL $005C			; 0E 5C 00 | Arithmetic shift left
	PLP				  ; 28 | Pull processor status from stack
	LDY $8340			; AC 40 83 | Load Y register
	CMP $14			  ; C5 14 | Compare with accumulator
	ASL				  ; 0A | Arithmetic shift left
	TYX				  ; BB | Unknown operation
	AND $6A			  ; 21 6A | Logical AND with accumulator
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
	PHP				  ; 08 | Push processor status to stack
	BEQ $0572			; F0 E0 | Branch if equal (zero flag set)
	ORA $08			  ; 01 08 | Logical OR with accumulator
	BPL $05C6			; 10 30 | Unknown operation
	ORA $111100		  ; 0F 00 11 11 | Logical OR with accumulator
	BCC $05BC			; 90 20 | Branch if carry clear
	BCC $059E			; 90 00 | Branch if carry clear
	ORA $C5			  ; 05 C5 | Logical OR with accumulator
	PLP				  ; 28 | Pull processor status from stack
	BRK $0A			  ; 00 0A | Software interrupt
	STA $01			  ; 97 01 | Store accumulator to memory
	ASL $0062			; 0E 62 00 | Arithmetic shift left
	ORA $E0C8,Y		  ; 19 C8 E0 | Logical OR with accumulator
	EOR $BC			  ; 41 BC | Unknown operation
	ORA $0A			  ; 12 0A | Logical OR with accumulator
	MVP $6A15			; 44 15 6A | Unknown operation
	COP $04			  ; 02 04 | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	BCC $05D7			; 90 20 | Branch if carry clear
	RTI				  ; 40 | Unknown operation
	BRL $DDBF			; 82 04 D8 | Unknown operation
	ORA $220220		  ; 0F 20 02 22 | Logical OR with accumulator
	BPL $05EA			; 10 29 | Unknown operation
	BPL $05D3			; 10 10 | Unknown operation
	ASL $84			  ; 06 84 | Arithmetic shift left
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left
	TYA				  ; 98 | Unknown operation
	ORA $0E			  ; 01 0E | Logical OR with accumulator
	EOR $0C1400,X		; 5F 00 14 0C | Unknown operation
	CMP $C2			  ; D1 C2 | Compare with accumulator
	LDA $14,X			; B5 14 | Load value into accumulator
	ORA $B7			  ; 05 B7 | Logical OR with accumulator
	ASL				  ; 0A | Arithmetic shift left
	RTS				  ; 60 | Return from local function
	COP $04			  ; 02 04 | Unknown operation
	TYA				  ; 98 | Unknown operation
	ORA $20			  ; 11 20 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	BRA $05F8			; 80 19 | Unknown operation
	DEY				  ; 88 | Unknown operation
	ORA $10			  ; 01 10 | Logical OR with accumulator
	BRK $10			  ; 00 10 | Software interrupt
	JSR $0029			; 20 29 00 | Call local function
	BPL $062E			; 10 45 | Unknown operation
	EOR $2A			  ; 45 2A | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	STA $1001,Y		  ; 99 01 10 | Store accumulator to memory
	BRA $05F2			; 80 00 | Unknown operation
	AND $F0			  ; 37 F0 | Logical AND with accumulator

	AND $F0			  ; 37 F0
	CPX #$82			 ; E0 82
	LDX $19,Y			; B6 19
	ASL				  ; 0A
	CPX $0C			  ; E4 0C
	ORA $D4			  ; 01 D4
	CPY $11F8			; CC F8 11

;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
	JSR $8FC0			; 20 C0 8F | Call local function
	ORA $F0CC,Y		  ; 19 CC F0 | Logical OR with accumulator
	ORA $00			  ; 11 00 | Logical OR with accumulator
	ORA $60			  ; 11 60 | Logical OR with accumulator
	BPL $061C			; 10 10 | Unknown operation
	BPL $0667			; 10 59 | Unknown operation
	DEX				  ; CA | Unknown operation
	ROL				  ; 2A | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	TXS				  ; 9A | Unknown operation
	ORA $0F			  ; 01 0F | Logical OR with accumulator
	ADC #$00			 ; 69 00 | Unknown operation
	TRB $C0C8			; 1C C8 C0 | Unknown operation
	CMP $B8			  ; C3 B8 | Compare with accumulator
	CLC				  ; 18 | Clear carry flag
	BRK $B5			  ; 00 B5 | Software interrupt
	BPL $0678			; 10 57 | Unknown operation
	COP $5C			  ; 02 5C | Unknown operation
	LDA $E012,Y		  ; B9 12 E0 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	BRA $0654			; 80 2B | Unknown operation
	BRK $01			  ; 00 01 | Software interrupt
	ORA $10			  ; 11 10 | Logical OR with accumulator
	BPL $062F			; 10 00 | Unknown operation
	AND #$30			 ; 29 30 | Logical AND with accumulator
	BPL $0650			; 10 1D | Unknown operation
	CMP $25			  ; D7 25 | Compare with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TXY				  ; 9B | Unknown operation
	ORA $0F			  ; 01 0F | Logical OR with accumulator
	ROR $1900			; 6E 00 19 | Unknown operation
	BIT $82D1			; 2C D1 82 | Unknown operation
	LDA $0A			  ; B1 0A | Load value into accumulator
	BRK $05			  ; 00 05 | Software interrupt
	ORA $01			  ; 03 01 | Logical OR with accumulator
	PEI $04			  ; D4 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_01E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01E:
	PHP				  ; 08 | Push processor status to stack
	BPL $066B			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $064E			; 80 00 | Unknown operation
	BRK $F0			  ; 00 F0 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BMI $0666			; 30 10 | Unknown operation
	BPL $06B6			; 10 5E | Unknown operation
	CMP $32			  ; C7 32 | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	STZ $0E01			; 9C 01 0E | Unknown operation
	ASL $01,X			; 16 01 | Arithmetic shift left
	ROL $B4			  ; 26 B4 | Unknown operation
	JSR $BD83			; 20 83 BD | Call local function
	ORA $FF			  ; 12 FF | Logical OR with accumulator
	LDY $17,X			; B4 17 | Load Y register
	AND $02			  ; 27 02 | Logical AND with accumulator
	STZ $7008			; 9C 08 70 | Unknown operation
	JSL $0089C0		  ; 22 C0 89 00 | Call external function
	BRK $10			  ; 00 10 | Software interrupt
	BPL $0687			; 10 10 | Unknown operation
	BPL $067A			; 10 01 | Unknown operation
	AND #$50			 ; 29 50 | Logical AND with accumulator
	ORA $15			  ; 11 15 | Logical OR with accumulator
	CMP $32			  ; D7 32 | Compare with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	STA $1101,X		  ; 9D 01 11 | Store accumulator to memory
	LDX #$00			 ; A2 00 | Load X register
	AND $1104			; 2D 04 11 | Logical AND with accumulator
	STA $BC			  ; 83 BC | Store accumulator to memory
	TRB $650C			; 1C 0C 65 | Unknown operation
	ASL $6A,X			; 16 6A | Arithmetic shift left
	COP $A8			  ; 02 A8 | Unknown operation
	ORA #$90			 ; 09 90 | Logical OR with accumulator
	JSR $8240			; 20 40 82 | Call local function
	BRK $00			  ; 00 00 | Software interrupt
	ORA $02020F		  ; 0F 0F 02 02 | Logical OR with accumulator
	RTS				  ; 60 | Return from local function
	PLP				  ; 28 | Pull processor status from stack
	BRK $10			  ; 00 10 | Software interrupt
	EOR $C8,X			; 55 C8 | Unknown operation
	BIT $0800,X		  ; 3C 00 08 | Unknown operation
	STZ $1001,X		  ; 9E 01 10 | Unknown operation
	STA $00			  ; 87 00 | Store accumulator to memory
	AND $FC			  ; 23 FC | Logical AND with accumulator
	JSR $B503			; 20 03 B5 | Call local function
	TRB $00			  ; 14 00 | Unknown operation
	EOR $09			  ; 47 09 | Unknown operation

	EOR $09			  ; 47 09
	ROR				  ; 6A
	CPY $0004			; CC 04 00
	LDA $26			  ; A3 26
	BRK $18			  ; 00 18
	AND $82			  ; 33 82
	AND $220F20		  ; 2F 20 0F 22
	JSR $002B			; 20 2B 00
	BPL $0724			; 10 5D
	EOR $23			  ; 47 23
	BRK $08			  ; 00 08
	STA $721E01,X		; 9F 01 1E 72
	ASL $55			  ; 06 55
	STY $4551			; 8C 51 45
	BCS $0710			; B0 3A
	SBC $2602BC,X		; FF BC 02 26
	BCS $0724			; B0 48
	BCC $06DF			; 90 01
	SBC $C7			  ; E3 C7
	ORA $09			  ; 01 09
	INC $0000,X		  ; FE 00 00
	BRK $00			  ; 00 00
	AND $28			  ; 21 28
	LDY #$25			 ; A0 25
	INC				  ; 1A
	ADC $005F			; 6D 5F 00

;==============================================================================
; GeneralPurpose_01F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01F:
	PHP				  ; 08 | Push processor status to stack
	LDY #$01			 ; A0 01 | Load Y register
	ORA $AA			  ; 12 AA | Logical OR with accumulator
	BRK $2D			  ; 00 2D | Software interrupt
	RTI				  ; 40 | Unknown operation
	EOR $43			  ; 41 43 | Unknown operation
	CMP $061A			; CD 1A 06 | Compare with accumulator
	TYX				  ; BB | Unknown operation
	BIT $C001			; 2C 01 C0 | Unknown operation
	TSB $08			  ; 04 08 | Unknown operation
	BPL $0704			; 10 00 | Unknown operation
	JMP $0080			; 4C 80 00 | Unknown operation
	JSL $200020		  ; 22 20 00 20 | Call external function
	BRK $60			  ; 00 60 | Software interrupt
	JSR $1010			; 20 10 10 | Call local function
	STX $C2,Y			; 96 C2 | Store X register
	PLP				  ; 28 | Pull processor status from stack
	BRK $06			  ; 00 06 | Software interrupt
	LDA $01			  ; A1 01 | Load value into accumulator
	ORA $DC			  ; 13 DC | Logical OR with accumulator
	BRK $47			  ; 00 47 | Software interrupt
	TSB $C1			  ; 04 C1 | Unknown operation
	EOR $B9			  ; 43 B9 | Unknown operation
	ASL $E40C,X		  ; 1E 0C E4 | Arithmetic shift left
	ORA $01			  ; 11 01 | Logical OR with accumulator
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_020
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_020:
	PHP				  ; 08 | Push processor status to stack
	LDY #$20			 ; A0 20 | Load Y register
	BRA $06AD			; 80 82 | Unknown operation
	BRK $50			  ; 00 50 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	COP $02			  ; 02 02 | Unknown operation
	BVC $0743			; 50 10 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	STX $C0			  ; 86 C0 | Store X register
	BIT $0400,X		  ; 3C 00 04 | Unknown operation
	LDX #$01			 ; A2 01 | Load X register
	ORA $2C			  ; 17 2C | Logical OR with accumulator
	BPL $0745			; 10 05 | Unknown operation
	LDY #$F0			 ; A0 F0 | Load Y register
	LDA $0C2FCF,X		; BF CF 2F 0C | Load value into accumulator
	LDA $2F			  ; B3 2F | Load value into accumulator
	ORA $D4			  ; 01 D4 | Logical OR with accumulator
	CLC				  ; 18 | Clear carry flag
	BVC $0760			; 50 13 | Unknown operation
	CPY #$80			 ; C0 80 | Unknown operation
	INC				  ; 1A | Unknown operation
	ORA $00			  ; 03 00 | Logical OR with accumulator
	SBC $F1			  ; F3 F1 | Unknown operation
	TRB $1F			  ; 14 1F | Unknown operation
	ORA $18			  ; 03 18 | Logical OR with accumulator
	BEQ $0759			; F0 FF | Branch if equal (zero flag set)
	SBC $0004F7,X		; FF F7 04 00 | Unknown operation
	ORA $A3			  ; 11 A3 | Logical OR with accumulator
	ORA $15			  ; 01 15 | Logical OR with accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator
	AND $20			  ; 32 20 | Logical AND with accumulator
	CMP $C2			  ; D1 C2 | Compare with accumulator
	LDY $0319,X		  ; BC 19 03 | Load Y register
	LDA $16			  ; B2 16 | Load value into accumulator
	ORA $02			  ; 01 02 | Logical OR with accumulator
	TAY				  ; A8 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	JSR $0040			; 20 40 00 | Call local function
	ORA $0F0080		  ; 0F 80 00 0F | Logical OR with accumulator
	BRK $20			  ; 00 20 | Software interrupt
	RTS				  ; 60 | Return from local function
	JSR $1010			; 20 10 10 | Call local function
	EOR $D4			  ; 41 D4 | Unknown operation
	LSR $00			  ; 46 00 | Unknown operation
	


;==============================================================================
; GeneralPurpose_021
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_021:
	PHP				  ; 08 | Push processor status to stack
	LDY $01			  ; A4 01 | Load Y register
	ORA $96			  ; 11 96 | Logical OR with accumulator
	BRK $23			  ; 00 23 | Software interrupt
	BIT $71,X			; 34 71 | Unknown operation
	EOR $C1			  ; 43 C1 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	BRK $09			  ; 00 09 | Software interrupt
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator
	TSB $08			  ; 04 08 | Unknown operation
	JSR $4020			; 20 20 40 | Call local function
	BRA $079B			; 80 00 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	BRK $10			  ; 00 10 | Software interrupt
	JSR $1000			; 20 00 10 | Call local function
	EOR $2DC7,X		  ; 5D C7 2D | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	LDA $01			  ; A5 01 | Load value into accumulator
	ORA $64			  ; 13 64 | Logical OR with accumulator
	BRK $2D			  ; 00 2D | Software interrupt
	JMP $4210			; DC 10 42 | Unknown operation
	LDA $17			  ; B2 17 | Load value into accumulator
	BRK $85			  ; 00 85 | Software interrupt
	ORA $6A			  ; 05 6A | Logical OR with accumulator
	LDY $38,X			; B4 38 | Load Y register
	INY				  ; C8 | Unknown operation
	BCC $077E			; 90 C1 | Branch if carry clear
	STA $06			  ; 81 06 | Store accumulator to memory
	AND $1FFE			; 2D FE 1F | Logical AND with accumulator
	ORA $11			  ; 11 11 | Logical OR with accumulator
	ORA $00			  ; 11 00 | Logical OR with accumulator
	AND $21A0,Y		  ; 39 A0 21 | Logical AND with accumulator
	ORA $C3			  ; 03 C3 | Logical OR with accumulator
	LSR $00			  ; 46 00 | Unknown operation
	


;==============================================================================
; GeneralPurpose_022
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_022:
	PHP				  ; 08 | Push processor status to stack
	LDX $01			  ; A6 01 | Load X register
	ASL $57,X			; 16 57 | Arithmetic shift left
	ORA $30			  ; 01 30 | Logical OR with accumulator
	PEI $B0			  ; D4 B0 | Unknown operation
	


;==============================================================================
; GeneralPurpose_023
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_023:
	REP #$B6			 ; C2 B6 | Clear processor status bits
	SEC				  ; 38 | Set carry flag
	ASL $E4,X			; 16 E4 | Arithmetic shift left
	TSB $7E69			; 0C 69 7E | Unknown operation
	LDY $19			  ; A4 19 | Load Y register
	STA $E6			  ; 91 E6 | Store accumulator to memory
	EOR $9A			  ; 47 9A | Unknown operation
	BRK $22			  ; 00 22 | Software interrupt
	ORA $0F1F1F,X		; 1F 1F 1F 0F | Logical OR with accumulator
	BNE $07BD			; D0 D1 | Branch if not equal (zero flag clear)
	BVC $080F			; 50 21 | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	PHX				  ; DA | Push X register to stack
	BVC $07F2			; 50 00 | Unknown operation
	


;==============================================================================
; GeneralPurpose_024
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_024:
	PHP				  ; 08 | Push processor status to stack
	LDA $01			  ; A7 01 | Load value into accumulator
	ORA $0089,Y		  ; 19 89 00 | Logical OR with accumulator
	BIT $7320,X		  ; 3C 20 73 | Unknown operation
	ORA $BB			  ; 03 BB | Logical OR with accumulator
	EOR $00			  ; 43 00 | Unknown operation
	BRK $13			  ; 00 13 | Software interrupt
	COP $BC			  ; 02 BC | Unknown operation
	TSB $08			  ; 04 08 | Unknown operation
	BPL $0827			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRK $2F			  ; 00 2F | Software interrupt
	BRK $12			  ; 00 12 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BPL $0810			; 10 00 | Unknown operation
	DEC				  ; 3A | Unknown operation
	RTS				  ; 60 | Return from local function
	AND $9E			  ; 25 9E | Logical AND with accumulator
	CMP $78			  ; D7 78 | Compare with accumulator
	BRK $02			  ; 00 02 | Software interrupt
	TAY				  ; A8 | Unknown operation
	ORA $18			  ; 01 18 | Logical OR with accumulator
	SEI				  ; 78 | Unknown operation
	ORA $35			  ; 01 35 | Logical OR with accumulator
	JMP $8321			; 4C 21 83 | Unknown operation
	CMP $20			  ; C1 20 | Compare with accumulator
	ASL $0D			  ; 06 0D | Arithmetic shift left
	ORA $D432,X		  ; 1D 32 D4 | Logical OR with accumulator
	INY				  ; C8 | Unknown operation
	


;==============================================================================
; GeneralPurpose_025
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_025:
	PHP				  ; 08 | Push processor status to stack
	BPL $086C			; 10 40 | Unknown operation
	STX $80			  ; 86 80 | Store X register
	BRK $25			  ; 00 25 | Software interrupt
	SBC $03			  ; F3 03 | Unknown operation
	BMI $0835			; 30 01 | Unknown operation
	RTS				  ; 60 | Return from local function
	PLP				  ; 28 | Pull processor status from stack
	BVC $0848			; 50 10 | Unknown operation
	EOR $D5,X			; 55 D5 | Unknown operation
	SEI				  ; 78 | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	LDA #$01			 ; A9 01 | Load value into accumulator
	ORA $AF			  ; 12 AF | Logical OR with accumulator
	BRK $2C			  ; 00 2C | Software interrupt
	JMP $82B0			; DC B0 82 | Unknown operation
	DEC $18			  ; C6 18 | Unknown operation
	BRK $B6			  ; 00 B6 | Software interrupt
	AND $01			  ; 23 01 | Logical AND with accumulator
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_026
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_026:
	PHP				  ; 08 | Push processor status to stack
	BPL $0871			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0854			; 80 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	CPX #$00			 ; E0 00 | Unknown operation
	BPL $08BB			; 10 5D | Unknown operation
	CMP $2B			  ; D3 2B | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	ORA $13			  ; 01 13 | Logical OR with accumulator
	CMP $00			  ; D2 00 | Compare with accumulator
	TRB $805C			; 1C 5C 80 | Unknown operation
	CPY $23D1			; CC D1 23 | Unknown operation
	ORA $6A3201		  ; 0F 01 32 6A | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_027
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_027:
	REP #$3C			 ; C2 3C | Clear processor status bits
	


;==============================================================================
; GeneralPurpose_028
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_028:
	PHP				  ; 08 | Push processor status to stack
	SBC $20			  ; F3 20 | Unknown operation
	TSB $078C			; 0C 8C 07 | Unknown operation
	PEI $1F			  ; D4 1F | Unknown operation
	ORA $11			  ; 11 11 | Logical OR with accumulator
	ORA $50			  ; 11 50 | Logical OR with accumulator
	CLC				  ; 18 | Clear carry flag
	BEQ $08A1			; F0 1F | Branch if equal (zero flag set)
	AND $4F			  ; 27 4F | Logical AND with accumulator
	TRB $00			  ; 14 00 | Unknown operation
	ASL $01AB			; 0E AB 01 | Arithmetic shift left
	EOR $0320,Y		  ; 59 20 03 | Unknown operation
	LDY $40,X			; B4 40 | Load Y register
	CMP $03			  ; C1 03 | Compare with accumulator
	CPY $0028			; CC 28 00 | Unknown operation
	LDA $2B			  ; B7 2B | Load value into accumulator
	CLI				  ; 58 | Unknown operation
	COP $60			  ; 02 60 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	BRK $4B			  ; 00 4B | Software interrupt
	BRK $2C			  ; 00 2C | Software interrupt
	LDA $01			  ; A5 01 | Load value into accumulator
	ORA $10			  ; 01 10 | Logical OR with accumulator
	BPL $08A4			; 10 00 | Unknown operation
	JSR $1030			; 20 30 10 | Call local function
	LSR $500B,X		  ; 5E 0B 50 | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	LDY $1401			; AC 01 14 | Load Y register
	XBA				  ; EB | Exchange accumulator bytes
	BRK $34			  ; 00 34 | Software interrupt
	BIT $4431,X		  ; 3C 31 44 | Unknown operation
	LDA $1C			  ; B3 1C | Load value into accumulator
	TSB $064D			; 0C 4D 06 | Unknown operation
	ORA $64			  ; 01 64 | Logical OR with accumulator
	TSB $08			  ; 04 08 | Unknown operation
	BPL $0900			; 10 40 | Unknown operation
	LSR $80			  ; 46 80 | Unknown operation
	ORA $22			  ; 11 22 | Logical OR with accumulator
	BPL $08C6			; 10 00 | Unknown operation
	BPL $08D8			; 10 10 | Unknown operation
	LDY #$21			 ; A0 21 | Load Y register
	BPL $08DC			; 10 10 | Unknown operation
	TXS				  ; 9A | Unknown operation
	LSR $3A			  ; 46 3A | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	LDA $1501			; AD 01 15 | Load value into accumulator
	AND $01			  ; 31 01 | Logical AND with accumulator
	BIT $CC,X			; 34 CC | Unknown operation
	JSR $C803			; 20 03 C8 | Call local function

	JSR $C803			; 20 03 C8
	ASL $A918,X		  ; 1E 18 A9
	AND $01			  ; 25 01
	TRB $28			  ; 14 28
	CLC				  ; 18
	AND $22			  ; 31 22
	RTI				  ; 40
	BRK $05			  ; 00 05
	STX $10			  ; 86 10
	ORA $01			  ; 11 01
	BPL $08FE			; 10 10
	BMI $0910			; 30 20
	BPL $0948			; 10 56
	DEX				  ; CA
	ROL $00,X			; 36 00
	TSB $AE			  ; 04 AE
	ORA $14			  ; 01 14
	CPX $00			  ; E4 00
	AND $D0			  ; 25 D0
	LDY #$C3			 ; A0 C3
	DEC $1D			  ; C6 1D

;==============================================================================
; GeneralPurpose_029
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_029:
	PHP				  ; 08 | Push processor status to stack
	LDA $23			  ; B3 23 | Load value into accumulator
	ROL $02,X			; 36 02 | Unknown operation
	CLD				  ; D8 | Unknown operation
	


;==============================================================================
; GeneralPurpose_02A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02A:
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from local function
	AND $80			  ; 23 80 | Logical AND with accumulator
	STA $5400			; 8D 00 54 | Store accumulator to memory
	ORA $01			  ; 01 01 | Logical OR with accumulator
	ORA $01			  ; 01 01 | Logical OR with accumulator
	CPX #$D0			 ; E0 D0 | Unknown operation
	BPL $0926			; 10 10 | Unknown operation
	STA $C1,X			; 95 C1 | Store accumulator to memory
	AND $00			  ; 37 00 | Logical AND with accumulator
	


;==============================================================================
; GeneralPurpose_02B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02B:
	PHP				  ; 08 | Push processor status to stack
	LDA $3B1501		  ; AF 01 15 3B | Load value into accumulator
	ORA $39			  ; 01 39 | Logical OR with accumulator
	PLA				  ; 68 | Pull accumulator from stack
	EOR $06			  ; 41 06 | Unknown operation
	CMP $17			  ; D3 17 | Compare with accumulator
	BRK $41			  ; 00 41 | Software interrupt
	BIT $02,X			; 34 02 | Unknown operation
	COP $08			  ; 02 08 | Unknown operation
	


;==============================================================================
; GeneralPurpose_02C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02C:
	PHP				  ; 08 | Push processor status to stack
	BPL $094F			; 10 20 | Unknown operation
	BRA $08B1			; 80 80 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $01			  ; 01 01 | Logical OR with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	BRK $20			  ; 00 20 | Software interrupt
	JSR $5D10			; 20 10 5D | Call local function
	CMP $3C			  ; C7 3C | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	BCS $0943			; B0 01 | Branch if carry set
	ORA $C5			  ; 12 C5 | Logical OR with accumulator
	BRK $23			  ; 00 23 | Software interrupt
	LDY $0640,X		  ; BC 40 06 | Load Y register
	CMP $1C			  ; D2 1C | Compare with accumulator
	TSB $BB			  ; 04 BB | Unknown operation
	AND $3A			  ; 32 3A | Logical AND with accumulator
	COP $E8			  ; 02 E8 | Unknown operation
	


;==============================================================================
; GeneralPurpose_02D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02D:
	PHP				  ; 08 | Push processor status to stack
	LDY #$46			 ; A0 46 | Load Y register
	EOR $00			  ; 47 00 | Unknown operation
	ORA $01A4,X		  ; 1D A4 01 | Logical OR with accumulator
	ORA $1F			  ; 01 1F | Logical OR with accumulator
	BPL $097D			; 10 20 | Unknown operation
	JSR $1190			; 20 90 11 | Call local function
	EOR $D5,X			; 55 D5 | Unknown operation
	ROL $00			  ; 26 00 | Unknown operation
	ASL $01B1			; 0E B1 01 | Arithmetic shift left
	ORA $B4			  ; 12 B4 | Logical OR with accumulator
	BRK $26			  ; 00 26 | Software interrupt
	JMP $C320			; DC 20 C3 | Unknown operation
	LDA $0023,X		  ; BD 23 00 | Load value into accumulator
	LDA $026017,X		; BF 17 60 02 | Load value into accumulator
	TRB $08			  ; 14 08 | Unknown operation
	BRK $A6			  ; 00 A6 | Software interrupt
	RTI				  ; 40 | Unknown operation
	BRA $097E			; 80 02 | Unknown operation
	LDY $12			  ; A4 12 | Load Y register
	ORA $32			  ; 13 32 | Logical OR with accumulator
	AND $11			  ; 31 11 | Logical AND with accumulator
	AND $50			  ; 21 50 | Logical AND with accumulator
	ORA $4D,X			; 15 4D | Logical OR with accumulator
	STP				  ; DB | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	BRK $0A			  ; 00 0A | Software interrupt
	LDA $01			  ; B2 01 | Load value into accumulator
	TRB $F0			  ; 14 F0 | Unknown operation
	BRK $30			  ; 00 30 | Software interrupt
	TSB $D1			  ; 04 D1 | Unknown operation
	BRL $285D			; 82 C8 1E | Unknown operation
	ORA $B2			  ; 05 B2 | Logical OR with accumulator
	ROL $36			  ; 26 36 | Unknown operation
	JMP ($0804)		  ; 6C 04 08 | Unknown operation
	BPL $09BE			; 10 20 | Unknown operation
	BRA $092D			; 80 8D | Unknown operation
	BRK $42			  ; 00 42 | Software interrupt
	ORA $00			  ; 11 00 | Logical OR with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	BPL $09D0			; 10 28 | Unknown operation
	BCC $09CA			; 90 20 | Branch if carry clear
	LSR $C5,X			; 56 C5 | Unknown operation
	ROL $00,X			; 36 00 | Unknown operation
	ASL $B3			  ; 06 B3 | Arithmetic shift left
	ORA $16			  ; 01 16 | Logical OR with accumulator
	ADC $01			  ; 63 01 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	MVN $0281			; 54 81 02 | Unknown operation

	MVN $0281			; 54 81 02
	LDX $0020,Y		  ; BE 20 00
	LDA $18			  ; B7 18
	ORA $02			  ; 01 02
	TSB $08			  ; 04 08
	BPL $09E3			; 10 20
	RTI				  ; 40
	BRA $09C6			; 80 00
	BRK $11			  ; 00 11
	ORA $11			  ; 11 11
	ORA $01			  ; 11 01
	PLP				  ; 28
	BRA $09DF			; 80 10
	STA $87C7			; 8D C7 87
	BRK $06			  ; 00 06
	LDY $01,X			; B4 01
	ORA $22,X			; 15 22
	ORA $2D			  ; 01 2D
	BPL $0A3D			; 10 61
	EOR #$C3			 ; 49 C3
	ORA $5000,Y		  ; 19 00 50
	ASL $0202,X		  ; 1E 02 02
	TSB $08			  ; 04 08
	BPL $0A28			; 10 40
	RTI				  ; 40
	BRA $09EB			; 80 00
	BRK $01			  ; 00 01
	BRK $10			  ; 00 10
	BRK $00			  ; 00 00
	PLP				  ; 28
	RTI				  ; 40
	BPL $0A42			; 10 4D
	CMP $32			  ; C7 32
	BRK $08			  ; 00 08
	LDA $01,X			; B5 01
	ORA $07,X			; 15 07
	ORA $3A			  ; 01 3A
	JSR $C321			; 20 21 C3
	INY				  ; C8
	JSR $790C			; 20 0C 79
	ROL $0F			  ; 26 0F
	COP $04			  ; 02 04
	SEI				  ; 78
	BPL $09ED			; 10 E0
	EOR $80			  ; 41 80
	ORA $00			  ; 11 00
	ORA $10			  ; 01 10
	BPL $0A25			; 10 10
	BVC $0A48			; 50 31
	BCC $0A39			; 90 20
	LSR $C5,X			; 56 C5
	BIT $0600,X		  ; 3C 00 06
	LDX $01,Y			; B6 01
	ORA $6F			  ; 17 6F
	ORA $47			  ; 01 47
	TRB $C1			  ; 14 C1
	CMP $B9			  ; C3 B9
	AND $1C			  ; 21 1C
	CPX $11			  ; E4 11
	ORA $02			  ; 01 02
	BVS $0A38			; 70 08
	CPY #$21			 ; C0 21
	BRK $87			  ; 00 87
	BRK $54			  ; 00 54
	ORA $12			  ; 11 12
	ORA $12			  ; 12 12
	ORA $11			  ; 11 11
	BPL $0A4E			; 10 10
	EOR #$C5			 ; 49 C5
	STZ $00			  ; 64 00
	TSB $B7			  ; 04 B7
	ORA $17			  ; 01 17
	CLV				  ; B8
	ORA $37			  ; 01 37
	JMP ($C281,X)		; 7C 81 C2
	CMP $1E			  ; C5 1E
	BRK $B2			  ; 00 B2
	JSL $040201		  ; 22 01 02 04

;==============================================================================
; GeneralPurpose_02E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02E:
	PHP				  ; 08 | Push processor status to stack
	BPL $0A77			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0A5A			; 80 00 | Unknown operation
	BRK $11			  ; 00 11 | Software interrupt
	ORA $11			  ; 11 11 | Logical OR with accumulator
	ORA $00			  ; 11 00 | Logical OR with accumulator
	JSR $1000			; 20 00 10 | Call local function
	CMP $5ACB,X		  ; DD CB 5A | Compare with accumulator
	BRK $06			  ; 00 06 | Software interrupt
	CLV				  ; B8 | Unknown operation
	ORA $90			  ; 01 90 | Logical OR with accumulator
	SEI				  ; 78 | Unknown operation
	BRK $0F			  ; 00 0F | Software interrupt
	TSB $C101			; 0C 01 C1 | Unknown operation
	CMP $0014			; CD 14 00 | Compare with accumulator
	AND $692D,X		  ; 3D 2D 69 | Logical AND with accumulator
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_02F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02F:
	PHP				  ; 08 | Push processor status to stack
	BPL $0A7C			; 10 00 | Unknown operation
	EOR $0080			; 4D 80 00 | Unknown operation
	AND $0F			  ; 21 0F | Logical AND with accumulator
	BRK $F0			  ; 00 F0 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	JSR $1004			; 20 04 10 | Call local function
	CMP $00624F,X		; DF 4F 62 00 | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_030
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_030:
	PHP				  ; 08 | Push processor status to stack
	LDA $1701,Y		  ; B9 01 17 | Load value into accumulator
	ADC $01			  ; 61 01 | Unknown operation
	MVP $712C			; 44 2C 71 | Unknown operation
	ORA $BD			  ; 03 BD | Logical OR with accumulator
	CLC				  ; 18 | Clear carry flag
	BRK $BA			  ; 00 BA | Software interrupt
	ASL $01,X			; 16 01 | Arithmetic shift left
	COP $78			  ; 02 78 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	CPY #$8B			 ; C0 8B | Unknown operation
	STA $00			  ; 97 00 | Store accumulator to memory
	STZ $00			  ; 64 00 | Unknown operation
	ORA $10			  ; 01 10 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSR $1050			; 20 50 10 | Call local function
	EOR $4BC7			; 4D C7 4B | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	TSX				  ; BA | Unknown operation
	ORA $12			  ; 01 12 | Logical OR with accumulator
	LDA $00			  ; A5 00 | Load value into accumulator
	AND $F8			  ; 23 F8 | Logical AND with accumulator
	LDY #$C0			 ; A0 C0 | Load Y register
	LDA $BF001E		  ; AF 1E 00 BF | Load value into accumulator
	ORA $05			  ; 01 05 | Logical OR with accumulator
	COP $14			  ; 02 14 | Unknown operation
	


;==============================================================================
; GeneralPurpose_031
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_031:
	PHP				  ; 08 | Push processor status to stack
	BPL $0A66			; 10 A0 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0ACB			; 80 02 | Unknown operation
	LDY $03			  ; A4 03 | Load Y register
	ORA $30			  ; 03 30 | Logical OR with accumulator
	BMI $0ACF			; 30 00 | Unknown operation
	ORA $0010,Y		  ; 19 10 00 | Logical OR with accumulator
	EOR $28C3			; 4D C3 28 | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	TYX				  ; BB | Unknown operation
	ORA $97			  ; 01 97 | Logical OR with accumulator
	BVS $0ADD			; 70 01 | Unknown operation
	ORA $2104,Y		  ; 19 04 21 | Logical OR with accumulator
	ORA $CE			  ; 03 CE | Logical OR with accumulator
	ORA $00			  ; 17 00 | Logical OR with accumulator
	LDA $682D,Y		  ; B9 2D 68 | Load value into accumulator
	DEX				  ; CA | Unknown operation
	BPL $0AD1			; 10 E8 | Unknown operation
	WDM $A0			  ; 42 A0 | Unknown operation
	


;==============================================================================
; GeneralPurpose_032
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_032:
	PHK				  ; 4B | Unknown operation
	BRK $02			  ; 00 02 | Software interrupt
	LDY $214F,X		  ; BC 4F 21 | Load Y register
	AND $10			  ; 21 10 | Logical AND with accumulator
	BPL $0B15			; 10 20 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	EOR $00505B,X		; 5F 5B 50 00 | Unknown operation
	


;==============================================================================
; GeneralPurpose_033
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_033:
	PHP				  ; 08 | Push processor status to stack
	LDY $1701,X		  ; BC 01 17 | Load Y register
	STZ $01,X			; 74 01 | Unknown operation
	JSR $40F0			; 20 F0 40 | Call local function
	ORA $C7			  ; 03 C7 | Logical OR with accumulator
	AND $10			  ; 21 10 | Logical AND with accumulator
	BRK $23			  ; 00 23 | Software interrupt
	ORA $26			  ; 01 26 | Logical OR with accumulator
	TSB $08			  ; 04 08 | Unknown operation
	BMI $0B31			; 30 21 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0B1C			; 80 09 | Unknown operation
	STA $10			  ; 92 10 | Store accumulator to memory
	BRK $01			  ; 00 01 | Software interrupt
	BPL $0B29			; 10 10 | Unknown operation
	SEI				  ; 78 | Unknown operation
	BRK $11			  ; 00 11 | Software interrupt
	EOR $C0,X			; 55 C0 | Unknown operation
	BIT $0800,X		  ; 3C 00 08 | Unknown operation
	LDA $1901,X		  ; BD 01 19 | Load value into accumulator
	LDX #$01			 ; A2 01 | Load X register
	BVC $0B98			; 50 70 | Unknown operation
	ADC $49			  ; 61 49 | Unknown operation
	CMP $23			  ; D3 23 | Compare with accumulator
	ORA $42			  ; 05 42 | Logical OR with accumulator
	BIT $01,X			; 34 01 | Unknown operation
	JMP ($0804)		  ; 6C 04 08 | Unknown operation
	RTS				  ; 60 | Return from local function
	AND $80			  ; 23 80 | Logical AND with accumulator
	STA $5200			; 8D 00 52 | Store accumulator to memory
	JSR $0200			; 20 00 02 | Call local function
	COP $60			  ; 02 60 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	JSR $6611			; 20 11 66 | Call local function
	CMP $46,X			; D5 46 | Compare with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	LDX $2001,Y		  ; BE 01 20 | Load X register
	LDY $2A03			; AC 03 2A | Load Y register
	CPX #$71			 ; E0 71 | Unknown operation
	CMP $C1			  ; C3 C1 | Compare with accumulator
	DEC				  ; 3A | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	ORA $0401,X		  ; 1D 01 04 | Logical OR with accumulator
	BRA $0B61			; 80 09 | Unknown operation
	BPL $0B7A			; 10 20 | Unknown operation
	BRA $0ADC			; 80 80 | Unknown operation
	BRK $46			  ; 00 46 | Software interrupt
	BPL $0B62			; 10 02 | Unknown operation
	BRK $01			  ; 00 01 | Software interrupt

	BRK $01			  ; 00 01
	BPL $0B94			; 10 30
	BVC $0B77			; 50 11
	STX $73D7			; 8E D7 73
	BRK $06			  ; 00 06
	LDA $A11801,X		; BF 01 18 A1
	ORA $3D			  ; 01 3D
	MVP $4281			; 44 81 42
	TSX				  ; BA
	ORA $00			  ; 12 00
	LDY $0112,X		  ; BC 12 01
	BCS $0BDC			; B0 60
	ORA #$10			 ; 09 10
	JSR $95C0			; 20 C0 95
	BRK $06			  ; 00 06
	BPL $0B86			; 10 01
	BRK $01			  ; 00 01
	BRK $28			  ; 00 28
	BMI $0B9C			; 30 11
	EOR $3CD7			; 4D D7 3C
	BRK $06			  ; 00 06
	CPY #$01			 ; C0 01
	ASL $66,X			; 16 66
	ORA $32			  ; 01 32
	TSB $41			  ; 04 41
	ORA $D0			  ; 03 D0
	AND $12			  ; 25 12
	LDA $30,X			; B5 30
	ROR				  ; 6A
	COP $04			  ; 02 04

;==============================================================================
; GeneralPurpose_034
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_034:
	PHP				  ; 08 | Push processor status to stack
	BPL $0C04			; 10 60 | Unknown operation
	CPY $1218			; CC 18 12 | Unknown operation
	BRK $0F			  ; 00 0F | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	JSR $18A0			; 20 A0 18 | Call local function
	BVC $0BD1			; 50 21 | Unknown operation
	STA $D6,X			; 95 D6 | Store accumulator to memory
	EOR $0800,X		  ; 5D 00 08 | Unknown operation
	CMP $01			  ; C1 01 | Compare with accumulator
	TSB $01CF			; 0C CF 01 | Unknown operation
	AND $432104,X		; 3F 04 21 43 | Logical AND with accumulator
	INY				  ; C8 | Unknown operation
	EOR $64,X			; 55 64 | Unknown operation
	LDA #$25			 ; A9 25 | Load value into accumulator
	ASL				  ; 0A | Arithmetic shift left
	LSR $70			  ; 46 70 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	LDA $60			  ; A1 60 | Load value into accumulator
	TSB $07			  ; 04 07 | Unknown operation
	AND $44,X			; 35 44 | Logical AND with accumulator
	ORA $11			  ; 11 11 | Logical OR with accumulator
	ORA $F1			  ; 11 F1 | Logical OR with accumulator
	CPX #$21			 ; E0 21 | Unknown operation
	LDY #$20			 ; A0 20 | Load Y register
	EOR $D6,X			; 55 D6 | Unknown operation
	LSR $00			  ; 46 00 | Unknown operation
	TSB $C2			  ; 04 C2 | Unknown operation
	ORA $1E			  ; 01 1E | Logical OR with accumulator
	SBC $02			  ; E7 02 | Unknown operation
	ORA $0410FC,X		; 1F FC 10 04 | Logical OR with accumulator
	CPY #$32			 ; C0 32 | Unknown operation
	ORA $0B			  ; 12 0B | Logical OR with accumulator
	TCS				  ; 1B | Unknown operation
	ORA $20			  ; 01 20 | Logical OR with accumulator
	TSB $80			  ; 04 80 | Unknown operation
	BPL $0C0E			; 10 20 | Unknown operation
	BRK $84			  ; 00 84 | Software interrupt
	BRK $4A			  ; 00 4A | Software interrupt
	AND $21			  ; 21 21 | Logical AND with accumulator
	ORA $12			  ; 11 12 | Logical OR with accumulator
	ORA $2A			  ; 11 2A | Logical OR with accumulator
	BVC $0C1F			; 50 25 | Unknown operation
	STX $85,Y			; 96 85 | Store X register
	LSR $00			  ; 46 00 | Unknown operation
	


;==============================================================================
; GeneralPurpose_035
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_035:
	PHP				  ; 08 | Push processor status to stack
	CMP $01			  ; C3 01 | Compare with accumulator
	CLC				  ; 18 | Clear carry flag
	STA $01,X			; 95 01 | Store accumulator to memory
	LSR				  ; 4A | Unknown operation
	STZ $61,X			; 74 61 | Unknown operation
	STA $BA			  ; 83 BA | Store accumulator to memory
	ORA $00			  ; 17 00 | Logical OR with accumulator
	STZ $12,X			; 74 12 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	COP $68			  ; 02 68 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	


;==============================================================================
; GeneralPurpose_036
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_036:
	PHB				  ; 8B | Push data bank register
	ORA $2D			  ; 17 2D | Logical OR with accumulator
	CPX $01			  ; E4 01 | Unknown operation
	ORA $10			  ; 01 10 | Logical OR with accumulator
	ORA $00			  ; 12 00 | Logical OR with accumulator
	PLP				  ; 28 | Pull processor status from stack
	CPY #$21			 ; C0 21 | Unknown operation
	LSR $8CD7,X		  ; 5E D7 8C | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	CPY $01			  ; C4 01 | Unknown operation
	ROL $F4			  ; 26 F4 | Unknown operation
	ASL $4B			  ; 06 4B | Arithmetic shift left
	CPX #$61			 ; E0 61 | Unknown operation
	MVP $44C4			; 44 C4 44 | Unknown operation
	BRK $BB			  ; 00 BB | Software interrupt
	JSR $0202			; 20 02 02 | Call local function
	RTS				  ; 60 | Return from local function
	ORA #$80			 ; 09 80 | Logical OR with accumulator
	AND $C0			  ; 25 C0 | Logical AND with accumulator
	STA $00,X			; 95 00 | Store accumulator to memory
	MVN $3032			; 54 32 30 | Unknown operation
	BMI $0C70			; 30 30 | Unknown operation
	ORA $21			  ; 03 21 | Logical OR with accumulator
	BPL $0C64			; 10 20 | Unknown operation
	EOR $50D7,X		  ; 5D D7 50 | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	CMP $01			  ; C5 01 | Compare with accumulator
	ORA $01B0,Y		  ; 19 B0 01 | Logical OR with accumulator
	MVP $A1A4			; 44 A4 A1 | Unknown operation
	STA $CD			  ; 83 CD | Store accumulator to memory
	PLP				  ; 28 | Pull processor status from stack
	BRK $B7			  ; 00 B7 | Software interrupt
	BIT $0264			; 2C 64 02 | Unknown operation
	BCC $0C64			; 90 09 | Branch if carry clear
	BPL $0BDD			; 10 80 | Unknown operation
	JMP $0080			; 4C 80 00 | Unknown operation
	BRK $02			  ; 00 02 | Software interrupt
	COP $20			  ; 02 20 | Unknown operation
	BRK $50			  ; 00 50 | Software interrupt
	AND $50			  ; 21 50 | Logical AND with accumulator
	BPL $0CC7			; 10 5D | Unknown operation
	CMP $5F			  ; D7 5F | Compare with accumulator
	BRK $06			  ; 00 06 | Software interrupt
	DEC $01			  ; C6 01 | Unknown operation
	ORA $028C,X		  ; 1D 8C 02 | Logical OR with accumulator
	CLI				  ; 58 | Unknown operation
	STZ $81			  ; 64 81 | Unknown operation
	CPY $19C0			; CC C0 19 | Unknown operation
	BRK $73			  ; 00 73 | Software interrupt

	BRK $73			  ; 00 73
	TRB $0201			; 1C 01 02
	TSB $F0			  ; 04 F0

;==============================================================================
; GeneralPurpose_037
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_037:
	SEP #$25			 ; E2 25 | Set processor status bits
	BRA $0C1B			; 80 97 | Unknown operation
	BRK $58			  ; 00 58 | Software interrupt
	BRK $20			  ; 00 20 | Software interrupt
	COP $02			  ; 02 02 | Unknown operation
	BPL $0CAC			; 10 20 | Unknown operation
	LDY #$16			 ; A0 16 | Load Y register
	LDA $44DB			; AD DB 44 | Load value into accumulator
	BRK $04			  ; 00 04 | Software interrupt
	CMP $01			  ; C7 01 | Compare with accumulator
	JSR $03D4			; 20 D4 03 | Call local function
	EOR $60,X			; 55 60 | Unknown operation
	STA $82			  ; 81 82 | Store accumulator to memory
	LDA $143C,Y		  ; B9 3C 14 | Load value into accumulator
	CPX $11			  ; E4 11 | Unknown operation
	ROL				  ; 2A | Unknown operation
	PEI $A4			  ; D4 A4 | Unknown operation
	EOR $A1			  ; 51 A1 | Unknown operation
	ROL $8D			  ; 26 8D | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	AND $92,X			; 35 92 | Logical AND with accumulator
	SBC $3F			  ; F3 3F | Unknown operation
	SBC $D9C0F3,X		; FF F3 C0 D9 | Unknown operation
	BVC $0CD8			; 50 25 | Unknown operation
	ORA $C5			  ; 05 C5 | Logical OR with accumulator
	PHY				  ; 5A | Push Y register to stack
	BRK $04			  ; 00 04 | Software interrupt
	INY				  ; C8 | Unknown operation
	ORA $1A			  ; 01 1A | Logical OR with accumulator
	STY $02,X			; 94 02 | Store Y register
	ADC #$00			 ; 69 00 | Unknown operation
	BRK $80			  ; 00 80 | Software interrupt
	LDX $0400,Y		  ; BE 00 04 | Load X register
	TAY				  ; A8 | Unknown operation
	ORA $D269,Y		  ; 19 69 D2 | Logical OR with accumulator
	LDY $49			  ; A4 49 | Load Y register
	STA $46			  ; 93 46 | Store accumulator to memory
	STA $06			  ; 83 06 | Store accumulator to memory
	ORA $FF00			; 0D 00 FF | Logical OR with accumulator
	SBC $9FFFFF,X		; FF FF FF 9F | Unknown operation
	INX				  ; E8 | Unknown operation
	BRK $30			  ; 00 30 | Software interrupt
	ORA $01F4BF		  ; 0F BF F4 01 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_038
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_038:
	PHP				  ; 08 | Push processor status to stack
	CMP #$01			 ; C9 01 | Compare with accumulator
	TCS				  ; 1B | Unknown operation
	PHD				  ; 0B | Unknown operation
	COP $41			  ; 02 41 | Unknown operation
	BMI $0C87			; 30 A2 | Unknown operation
	ORA $C6			  ; 05 C6 | Logical OR with accumulator
	AND $00			  ; 21 00 | Logical AND with accumulator
	LDA $22			  ; B2 22 | Load value into accumulator
	ORA $02			  ; 01 02 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_039
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_039:
	PHP				  ; 08 | Push processor status to stack
	


;==============================================================================
; GeneralPurpose_03A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03A:
	PHP				  ; 08 | Push processor status to stack
	BPL $0D11			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0CF4			; 80 00 | Unknown operation
	BRK $11			  ; 00 11 | Software interrupt
	BPL $0D09			; 10 11 | Unknown operation
	ORA $00			  ; 11 00 | Logical OR with accumulator
	JSR $1090			; 20 90 10 | Call local function
	EOR $6ED7,X		  ; 5D D7 6E | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	DEX				  ; CA | Unknown operation
	ORA $9D			  ; 01 9D | Logical OR with accumulator
	LDA $02			  ; A1 02 | Load value into accumulator
	EOR $43C110,X		; 5F 10 C1 43 | Unknown operation
	BNE $0D50			; D0 43 | Branch if not equal (zero flag clear)
	TRB $BC			  ; 14 BC | Unknown operation
	BMI $0D7B			; 30 6A | Unknown operation
	DEC				  ; 3A | Unknown operation
	STY $D121			; 8C 21 D1 | Store Y register
	CMP $C5			  ; C1 C5 | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_03B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03B:
	PHP				  ; 08 | Push processor status to stack
	ORA $50			  ; 17 50 | Logical OR with accumulator
	AND $222220		  ; 2F 20 22 22 | Logical AND with accumulator
	BCC $0D51			; 90 31 | Branch if carry clear
	BCC $0D44			; 90 22 | Branch if carry clear
	INC				  ; 1A | Unknown operation
	STA $78,X			; 95 78 | Store accumulator to memory
	BRK $08			  ; 00 08 | Software interrupt
	WAI				  ; CB | Unknown operation
	ORA $24			  ; 01 24 | Logical OR with accumulator
	STY $7805			; 8C 05 78 | Store Y register
	CPY $81			  ; C4 81 | Unknown operation
	TSB $5AC1			; 0C C1 5A | Unknown operation
	ORA $011CB5		  ; 0F B5 1C 01 | Logical OR with accumulator
	COP $04			  ; 02 04 | Unknown operation
	CPY #$A2			 ; C0 A2 | Unknown operation
	ORA $4B			  ; 03 4B | Logical OR with accumulator
	BRA $0D5F			; 80 21 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BPL $0D55			; 10 13 | Unknown operation
	BMI $0CE4			; 30 A0 | Unknown operation
	JSR $6AA0			; 20 A0 6A | Call local function
	EOR #$DA			 ; 49 DA | Unknown operation
	SEI				  ; 78 | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	CPY $5901			; CC 01 59 | Unknown operation
	CLV				  ; B8 | Unknown operation
	ORA $5A			  ; 01 5A | Logical OR with accumulator
	STZ $C1,X			; 74 C1 | Unknown operation
	EOR $CC			  ; 43 CC | Unknown operation
	AND $00			  ; 32 00 | Logical AND with accumulator
	LDA $2B			  ; B7 2B | Load value into accumulator
	TCD				  ; 5B | Unknown operation
	COP $68			  ; 02 68 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	


;==============================================================================
; GeneralPurpose_03C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03C:
	PHK				  ; 4B | Unknown operation
	BRK $2D			  ; 00 2D | Software interrupt
	LDA $01			  ; A5 01 | Load value into accumulator
	ORA $10			  ; 01 10 | Logical OR with accumulator
	BPL $0D69			; 10 00 | Unknown operation
	ROR				  ; 6A | Unknown operation
	CPY #$20			 ; C0 20 | Unknown operation
	EOR $6ED7,X		  ; 5D D7 6E | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	CMP $2101			; CD 01 21 | Compare with PPUOAMConfiguration
	ASL $04			  ; 06 04 | Arithmetic shift left
	ADC #$6C			 ; 69 6C | Unknown operation
	COP $C2			  ; 02 C2 | Unknown operation
	BNE $0DA6			; D0 2A | Branch if not equal (zero flag clear)
	BRK $02			  ; 00 02 | Software interrupt
	AND $02			  ; 31 02 | Logical AND with accumulator
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_03D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03D:
	PHP				  ; 08 | Push processor status to stack
	BPL $0DA5			; 10 20 | Unknown operation
	BRA $0D07			; 80 80 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $00			  ; 01 00 | Logical OR with accumulator
	BRK $01			  ; 00 01 | Software interrupt
	BRK $20			  ; 00 20 | Software interrupt
	BRK $20			  ; 00 20 | Software interrupt
	EOR $FA87			; 4D 87 FA | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	DEC $2101			; CE 01 21 | Unknown operation
	ROL $4404			; 2E 04 44 | Unknown operation
	JSR $02F1			; 20 F1 02 | Call local function
	LDA $1233,Y		  ; B9 33 12 | Load value into accumulator
	CPX $10			  ; E4 10 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	COP $04			  ; 02 04 | Unknown operation
	BNE $0D4B			; D0 A2 | Branch if not equal (zero flag clear)
	ORA $02			  ; 05 02 | Logical OR with accumulator
	TSB $08			  ; 04 08 | Unknown operation
	CPX #$02			 ; E0 02 | Unknown operation
	JSR $4442			; 20 42 44 | Call local function
	BPL $0DCD			; 10 19 | Unknown operation
	CPY #$11			 ; C0 11 | Unknown operation
	ORA $50C5,Y		  ; 19 C5 50 | Logical OR with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	CMP $0A1001		  ; CF 01 10 0A | Compare with accumulator
	BRK $FF			  ; 00 FF | Software interrupt
	SBC $40			  ; E7 40 | Unknown operation
	LSR $B7			  ; 46 B7 | Unknown operation
	LSR $FF			  ; 46 FF | Unknown operation
	RTI				  ; 40 | Unknown operation
	ASL $0233			; 0E 33 02 | Arithmetic shift left
	CLD				  ; D8 | Unknown operation
	BEQ $0DBE			; F0 F0 | Branch if equal (zero flag set)
	CMP $4C			  ; C3 4C | Compare with accumulator
	INC				  ; 1A | Unknown operation
	AND $10,X			; 35 10 | Logical AND with accumulator
	COP $22			  ; 02 22 | Unknown operation
	ORA $FF			  ; 12 FF | Logical OR with accumulator
	CPX #$B7			 ; E0 B7 | Unknown operation
	BEQ $0DDA			; F0 FF | Branch if equal (zero flag set)
	SBC $0032FF,X		; FF FF 32 00 | Unknown operation
	COP $D0			  ; 02 D0 | Unknown operation
	ORA $1C			  ; 01 1C | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_03E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03E:
	PHK				  ; 4B | Unknown operation
	COP $59			  ; 02 59 | Unknown operation
	MVN $82D1			; 54 D1 82 | Unknown operation
	LDA $37			  ; B2 37 | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $05,X			; 75 05 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	ASL $3804			; 0E 04 38 | Arithmetic shift left
	LDY #$25			 ; A0 25 | Load Y register
	CPY #$81			 ; C0 81 | Unknown operation
	ORA $CA			  ; 03 CA | Logical OR with accumulator
	ORA $10			  ; 11 10 | Logical OR with accumulator
	ORA $11			  ; 01 11 | Logical OR with accumulator
	BVC $0E27			; 50 29 | Unknown operation
	BPL $0E20			; 10 20 | Unknown operation
	


;==============================================================================
; GeneralPurpose_03F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03F:
	PHY				  ; 5A | Push Y register to stack
	CMP $0050,Y		  ; D9 50 00 | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_040
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_040:
	PHP				  ; 08 | Push processor status to stack
	CMP $01			  ; D1 01 | Compare with accumulator
	AND $00			  ; 23 00 | Logical AND with accumulator
	ORA $78			  ; 05 78 | Logical OR with accumulator
	LDY $40F1			; AC F1 40 | Load Y register
	LDX $0024,Y		  ; BE 24 00 | Load X register
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ORA $02			  ; 01 02 | Logical OR with accumulator
	TSB $08			  ; 04 08 | Unknown operation
	BPL $0E39			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0E1C			; 80 00 | Unknown operation
	BRK $11			  ; 00 11 | Software interrupt
	ORA $11			  ; 11 11 | Logical OR with accumulator
	ORA $01			  ; 11 01 | Logical OR with accumulator
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Unknown operation
	BPL $0E73			; 10 4D | Unknown operation
	CMP $C8			  ; D7 C8 | Compare with accumulator
	BRK $06			  ; 00 06 | Software interrupt
	CMP $01			  ; D2 01 | Compare with accumulator
	ORA $44034B,X		; 1F 4B 03 44 | Logical OR with accumulator
	JMP ($83A1,X)		; 7C A1 83 | Unknown operation
	LDA $4B			  ; B7 4B | Load value into accumulator
	ORA $07			  ; 12 07 | Logical OR with accumulator
	ORA $D80236		  ; 0F 36 02 D8 | Logical OR with accumulator
	


;==============================================================================
; GeneralPurpose_041
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_041:
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from local function
	AND $80			  ; 23 80 | Logical AND with accumulator
	STA $5500			; 8D 00 55 | Store accumulator to memory
	BPL $0E54			; 10 10 | Unknown operation
	BPL $0E56			; 10 10 | Unknown operation
	BNE $0E30			; D0 E8 | Branch if not equal (zero flag clear)
	BVC $0E6F			; 50 25 | Unknown operation
	STA $4A,X			; 95 4A | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_042
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_042:
	PHK				  ; 4B | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	CMP $01			  ; D3 01 | Compare with accumulator
	JSL $6E02DF		  ; 22 DF 02 6E | Call external function
	SEI				  ; 78 | Unknown operation
	SBC $44			  ; E1 44 | Unknown operation
	TYX				  ; BB | Unknown operation
	STZ $0A			  ; 64 0A | Unknown operation
	BPL $0E70			; 10 13 | Unknown operation
	ORA $02			  ; 01 02 | Logical OR with accumulator
	STZ $E8,X			; 74 E8 | Unknown operation
	BNE $0E64			; D0 01 | Branch if not equal (zero flag clear)
	DEC $01			  ; C6 01 | Unknown operation
	TSB $0000			; 0C 00 00 | Unknown operation
	AND $33			  ; 33 33 | Logical AND with accumulator
	AND $90			  ; 33 90 | Logical AND with accumulator
	SBC $A0			  ; F3 A0 | Unknown operation
	AND $5E			  ; 21 5E | Logical AND with accumulator
	LDY $00F0			; AC F0 00 | Load Y register
	COP $D4			  ; 02 D4 | Unknown operation
	ORA $22			  ; 01 22 | Logical OR with accumulator
	LDX $04			  ; A6 04 | Load X register
	EOR #$CC			 ; 49 CC | Unknown operation
	SBC $C3			  ; F1 C3 | Unknown operation
	LDA $3A			  ; B7 3A | Load value into accumulator
	BRK $B3			  ; 00 B3 | Software interrupt
	ORA $7C0201		  ; 0F 01 02 7C | Logical OR with accumulator
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	CPX #$4B			 ; E0 4B | Unknown operation
	BRA $0E8B			; 80 00 | Unknown operation
	BIT $11			  ; 24 11 | Unknown operation
	ORA $31			  ; 13 31 | Logical OR with accumulator
	ORA $11			  ; 11 11 | Logical OR with accumulator
	BEQ $0EE3			; F0 50 | Branch if equal (zero flag set)
	AND $4E			  ; 25 4E | Logical AND with accumulator
	TCD				  ; 5B | Unknown operation
	BRL $1499			; 82 00 06 | Unknown operation
	CMP $01,X			; D5 01 | Compare with accumulator
	JSL $2A0410		  ; 22 10 04 2A | Call external function
	TSB $42F1			; 0C F1 42 | Unknown operation
	CPY #$3B			 ; C0 3B | Unknown operation
	TRB $E4			  ; 14 E4 | Unknown operation
	TCS				  ; 1B | Unknown operation
	ORA $30			  ; 01 30 | Logical OR with accumulator
	TSB $C8			  ; 04 C8 | Unknown operation
	BPL $0EAD			; 10 00 | Unknown operation
	EOR $80			  ; 43 80 | Unknown operation
	BRK $2A			  ; 00 2A | Software interrupt
	AND $21			  ; 21 21 | Logical AND with accumulator

	AND $21			  ; 21 21
	AND $11			  ; 21 11
	ORA $12			  ; 01 12
	CPX #$35			 ; E0 35
	LSR $55,X			; 56 55
	EOR $00,X			; 55 00

;==============================================================================
; GeneralPurpose_043
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_043:
	PHP				  ; 08 | Push processor status to stack
	DEC $01,X			; D6 01 | Unknown operation
	AND $000820,X		; 3F 20 08 00 | Logical AND with accumulator
	


;==============================================================================
; GeneralPurpose_044
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_044:
	PHP				  ; 08 | Push processor status to stack
	WDM $84			  ; 42 84 | Unknown operation
	DEX				  ; CA | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	TSB $291F			; 0C 1F 29 | Unknown operation
	CLI				  ; 58 | Unknown operation
	COP $60			  ; 02 60 | Unknown operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	BRK $4B			  ; 00 4B | Software interrupt
	BRA $0ED5			; 80 00 | Unknown operation
	AND $01			  ; 25 01 | Logical AND with accumulator
	ORA $10			  ; 01 10 | Logical OR with accumulator
	BRK $10			  ; 00 10 | Software interrupt
	RTI				  ; 40 | Unknown operation
	BMI $0ECE			; 30 F0 | Unknown operation
	LSR $08FF,X		  ; 5E FF 08 | Unknown operation
	ORA $02			  ; 07 02 | Logical OR with accumulator
	DEC $01,X			; D6 01 | Unknown operation
	AND $E81F68,X		; 3F 68 1F E8 | Logical AND with accumulator
	AND $42			  ; 33 42 | Logical AND with accumulator
	STY $CA			  ; 84 CA | Store Y register
	AND $0C			  ; 32 0C | Logical AND with accumulator
	BRK $29			  ; 00 29 | Software interrupt
	ORA $02			  ; 01 02 | Logical OR with accumulator
	RTS				  ; 60 | Return from local function
	ORA #$10			 ; 09 10 | Logical OR with accumulator
	CPX #$4A			 ; E0 4A | Unknown operation
	BRK $2C			  ; 00 2C | Software interrupt
	LDA $00			  ; A5 00 | Load value into accumulator
	ORA $10			  ; 01 10 | Logical OR with accumulator
	BPL $0F10			; 10 10 | Unknown operation
	CPY #$30			 ; C0 30 | Unknown operation
	BEQ $0F63			; F0 5F | Branch if equal (zero flag set)
	SBC $0207D0,X		; FF D0 07 02 | Unknown operation
	CMP $01			  ; D7 01 | Compare with accumulator
	AND $F4			  ; 25 F4 | Logical AND with accumulator
	ASL $52			  ; 06 52 | Arithmetic shift left
	BMI $0E92			; 30 82 | Unknown operation
	WDM $C7			  ; 42 C7 | Unknown operation
	ORA $5100,X		  ; 1D 00 51 | Logical OR with accumulator
	BIT $02			  ; 24 02 | Unknown operation
	COP $04			  ; 02 04 | Unknown operation
	


;==============================================================================
; GeneralPurpose_045
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_045:
	PHP				  ; 08 | Push processor status to stack
	BPL $0F3C			; 10 20 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BRA $0F1F			; 80 00 | Unknown operation
	BRK $01			  ; 00 01 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	PLP				  ; 28 | Pull processor status from stack
	PER $9D65			; 62 65 9D | Unknown operation
	WAI				  ; CB | Unknown operation
	CMP $00			  ; C3 00 | Compare with accumulator
	ASL $D8			  ; 06 D8 | Arithmetic shift left
	ORA $6A			  ; 01 6A | Logical OR with accumulator
	BVS $0F49			; 70 17 | Unknown operation
	LDY $58,X			; B4 58 | Load Y register
	LDA $83			  ; B2 83 | Load value into accumulator
	CPY $0046			; CC 46 00 | Unknown operation
	LDA $2B			  ; B2 2B | Load value into accumulator
	EOR $6402,Y		  ; 59 02 64 | Unknown operation
	ORA #$90			 ; 09 90 | Logical OR with accumulator
	AND $40			  ; 25 40 | Logical AND with accumulator
	BRA $0F70			; 80 2C | Unknown operation
	STA $01,X			; 95 01 | Store accumulator to memory
	ORA $01			  ; 01 01 | Logical OR with accumulator
	BPL $0F4A			; 10 00 | Unknown operation
	PLP				  ; 28 | Pull processor status from stack
	JSR $5E20			; 20 20 5E | Call local function
	STP				  ; DB | Unknown operation
	INY				  ; C8 | Unknown operation
	BRK $06			  ; 00 06 | Software interrupt
	CMP $3F01,Y		  ; D9 01 3F | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_046
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_046:
	PHP				  ; 08 | Push processor status to stack
	BRK $02			  ; 00 02 | Software interrupt
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from local function
	CPY #$CF			 ; C0 CF | Unknown operation
	ORA $00			  ; 07 00 | Logical OR with accumulator
	CLV				  ; B8 | Unknown operation
	AND $A80201		  ; 2F 01 02 A8 | Logical AND with accumulator
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator
	ROL $80			  ; 26 80 | Unknown operation
	TXS				  ; 9A | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	RTI				  ; 40 | Unknown operation
	ORA $000F4F		  ; 0F 4F 0F 00 | Logical OR with accumulator
	JSR $0000			; 20 00 00 | Call local function
	BRK $C0			  ; 00 C0 | Software interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left
	BPL $0F52			; 10 DA | Unknown operation
	ORA $23			  ; 01 23 | Logical OR with accumulator
	BNE $0F7E			; D0 02 | Branch if not equal (zero flag clear)
	LSR $B168			; 4E 68 B1 | Unknown operation
	STY $BB			  ; 84 BB | Store Y register
	TSC				  ; 3B | Unknown operation
	BRK $0A			  ; 00 0A | Software interrupt
	TRB $01			  ; 14 01 | Unknown operation
	CPY #$04			 ; C0 04 | Unknown operation
	BRK $13			  ; 00 13 | Software interrupt
	BRK $0C			  ; 00 0C | Software interrupt
	CLC				  ; 18 | Clear carry flag
	AND $00			  ; 31 00 | Logical AND with accumulator
	ORA $01			  ; 01 01 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	LDA $20			  ; A1 20 | Load value into accumulator
	MVP $5D11			; 44 11 5D | Unknown operation
	CMP $46			  ; D7 46 | Compare with accumulator
	BRK $0E			  ; 00 0E | Software interrupt
	STP				  ; DB | Unknown operation
	ORA $26			  ; 01 26 | Logical OR with accumulator
	LDX $4D06			; AE 06 4D | Load X register
	LDY $C1			  ; A4 C1 | Load Y register
	STA $C0			  ; 83 C0 | Store accumulator to memory
	BVC $0FC6			; 50 1E | Unknown operation
	TAY				  ; A8 | Unknown operation
	TCS				  ; 1B | Unknown operation
	ORA $02			  ; 01 02 | Logical OR with accumulator
	RTS				  ; 60 | Return from local function
	


;==============================================================================
; GeneralPurpose_047
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_047:
	PHP				  ; 08 | Push processor status to stack
	CPX #$C5			 ; E0 C5 | Unknown operation
	PHD				  ; 0B | Unknown operation
	ASL $0C			  ; 06 0C | Arithmetic shift left
	BEQ $0FC6			; F0 11 | Branch if equal (zero flag set)
	ORA $00			  ; 12 00 | Logical OR with accumulator
	JSL $D02111		  ; 22 11 21 D0 | Call external function
	AND $53			  ; 21 53 | Logical AND with accumulator
	LDX $0082			; AE 82 00 | Load X register
	


;==============================================================================
; GeneralPurpose_048
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_048:
	PHP				  ; 08 | Push processor status to stack
	JMP $2601			; DC 01 26 | Unknown operation
	TXA				  ; 8A | Transfer X to accumulator
	ORA $69			  ; 07 69 | Logical OR with accumulator
	RTI				  ; 40 | Unknown operation
	CMP $83			  ; C1 83 | Compare with accumulator
	BNE $1014			; D0 48 | Branch if not equal (zero flag clear)
	SBC $6A30C6,X		; FF C6 30 6A | Unknown operation
	COP $5C			  ; 02 5C | Unknown operation
	AND $D3			  ; 31 D3 | Logical AND with accumulator
	SBC $C0			  ; E3 C0 | Unknown operation
	CLC				  ; 18 | Clear carry flag
	ORA $18			  ; 13 18 | Logical OR with accumulator
	ORA $2F2201		  ; 0F 01 22 2F | Logical OR with accumulator
	BCC $0FFF			; 90 20 | Branch if carry clear
	RTS				  ; 60 | Return from local function
	AND $59			  ; 21 59 | Logical AND with accumulator
	DEC $96,X			; D6 96 | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	CMP $1801,X		  ; DD 01 18 | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_049
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_049:
	PHP				  ; 08 | Push processor status to stack
	STA $DC0A,X		  ; 9D 0A DC | Store accumulator to memory
	BEQ $102E			; F0 3F | Branch if equal (zero flag set)
	LDA $96			  ; B2 96 | Load value into accumulator
	SBC $6A0486,X		; FF 86 04 6A | Unknown operation
	COP $A8			  ; 02 A8 | Unknown operation
	EOR #$A0			 ; 49 A0 | Unknown operation
	LSR $4D			  ; 46 4D | Unknown operation
	COP $35			  ; 02 35 | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	ORA $F2FF2F		  ; 0F 2F FF F2 | Logical OR with accumulator
	BRK $22			  ; 00 22 | Software interrupt
	BEQ $1005			; F0 FF | Branch if equal (zero flag set)
	SBC $0006FF,X		; FF FF 06 00 | Unknown operation
	ORA $01DE			; 0D DE 01 | Logical OR with accumulator
	BIT $F6			  ; 24 F6 | Unknown operation
	TSB $30			  ; 04 30 | Unknown operation
	JMP ($40A1,X)		; 7C A1 40 | Unknown operation
	DEC $052D			; CE 2D 05 | Unknown operation
	MVP $012D			; 44 2D 01 | Unknown operation
	DEX				  ; CA | Unknown operation
	CPY $1008			; CC 08 10 | Unknown operation
	LDY #$CC			 ; A0 CC | Load Y register
	STY $6600			; 8C 00 66 | Store Y register
	RTI				  ; 40 | Unknown operation
	ORA $40			  ; 03 40 | Logical OR with accumulator
	ORA $10			  ; 03 10 | Logical OR with accumulator
	BMI $102A			; 30 00 | Unknown operation
	JSR $5BC7			; 20 C7 5B | Call local function
	TAX				  ; AA | Transfer accumulator to X

	TAX				  ; AA
;==============================================================================
; Function Index (74 functions)
;==============================================================================
; GeneralPurpose_000
; GeneralPurpose_001
; GeneralPurpose_002
; GeneralPurpose_003
; GeneralPurpose_004
; GeneralPurpose_005
; GeneralPurpose_006
; GeneralPurpose_007
; GeneralPurpose_008
; GeneralPurpose_009
; GeneralPurpose_00A
; GeneralPurpose_00B
; GeneralPurpose_00C
; GeneralPurpose_00D
; GeneralPurpose_00E
; GeneralPurpose_00F
; GeneralPurpose_010
; GeneralPurpose_011
; GeneralPurpose_012
; GeneralPurpose_013
; GeneralPurpose_014
; GeneralPurpose_015
; GeneralPurpose_016
; GeneralPurpose_017
; GeneralPurpose_018
; GeneralPurpose_019
; GeneralPurpose_01A
; GeneralPurpose_01B
; GeneralPurpose_01C
; GeneralPurpose_01D
; GeneralPurpose_01E
; GeneralPurpose_01F
; GeneralPurpose_020
; GeneralPurpose_021
; GeneralPurpose_022
; GeneralPurpose_023
; GeneralPurpose_024
; GeneralPurpose_025
; GeneralPurpose_026
; GeneralPurpose_027
; GeneralPurpose_028
; GeneralPurpose_029
; GeneralPurpose_02A
; GeneralPurpose_02B
; GeneralPurpose_02C
; GeneralPurpose_02D
; GeneralPurpose_02E
; GeneralPurpose_02F
; GeneralPurpose_030
; GeneralPurpose_031
; GeneralPurpose_032
; GeneralPurpose_033
; GeneralPurpose_034
; GeneralPurpose_035
; GeneralPurpose_036
; GeneralPurpose_037
; GeneralPurpose_038
; GeneralPurpose_039
; GeneralPurpose_03A
; GeneralPurpose_03B
; GeneralPurpose_03C
; GeneralPurpose_03D
; GeneralPurpose_03E
; GeneralPurpose_03F
; GeneralPurpose_040
; GeneralPurpose_041
; GeneralPurpose_042
; GeneralPurpose_043
; GeneralPurpose_044
; GeneralPurpose_045
; GeneralPurpose_046
; GeneralPurpose_047
; GeneralPurpose_048
; GeneralPurpose_049
;==============================================================================